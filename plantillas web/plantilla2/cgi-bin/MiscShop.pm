use strict;
use Cadenas;
use Crypandcodificationfunctions;
use JSVarArchives;
use ValidateDatas;
use ValidatePrimitivesJavaScriptDatas;
use Digest::MD5;
use Digest::SHA1;
use Net::SMTP;

package MiscShop;
sub GetWebParams {
  my $cadena;
  my %parametros;
  my @partes;
  my $par;
  my $clave;
  my $valor;
  if (defined($main::cadenadeparametros)) {
    
    $cadena=$main::cadenadeparametros;

  }
  elsif ($ENV{'REQUEST_METHOD'} eq "GET") {
   $cadena=$ENV{'QUERY_STRING'}; 
  }
  elsif ($ENV{'REQUEST_METHOD'} eq "POST") {
    read (STDIN,$cadena,$ENV{'CONTENT_LENGTH'});
    $main::cadenadeparametros=$cadena;
  }  
  else {

    $cadena=$ARGV[0];
  }
  $cadena=~s/\+/ /gi;
  @partes=split(/\&/,$cadena);
  foreach $par (@partes) {
    ($clave,$valor)=split(/=/,$par);
    $clave=~s/%([A-Za-z0-9][A-Za-z0-9])/pack("C",hex($1))/ge; 
    $valor=~s/%([A-Za-z0-9][A-Za-z0-9])/pack("C",hex($1))/ge;
    $parametros{$clave}=$valor;
  }
  return $parametros{$_[0]};
}

sub verificardatos {


  my $jsvaconfiguracion;
  my $referenciapagina;
  my @lineasmensaje;
  my $mensaje;
  my $precio;
  my $cuenta;
  my @retval;
  my $retval2; 
  my $md5;
  my $sha1;
  my $digestor;
  my $i;

  $jsvaconfiguracion=JSVarArchives->new("configserv.pl");
  @retval=$jsvaconfiguracion->GetJSVar("direcciondesdelaquesereferencia");

  if ($retval[1]!=0) {
    &printinternalerror();
  }


  if (uc($ENV{'HTTP_REFERER'}) ne uc($retval[0])) {

    &printinternalerror2();


  }

  if (Cadenas::trim(&GetWebParams('MENSAJE')) eq "" || Cadenas::trim(&GetWebParams('IDPEDIDO')) eq "" || Cadenas::trim(&GetWebParams('PRECIOPEDIDO')) eq "") {

    &printinternalerror2();

  }

  if (&GetWebParams('FORMADEPAGO') ne "1" && &GetWebParams('FORMADEPAGO') ne "2" && &GetWebParams('FORMADEPAGO') ne "3") {

    &printinternalerror2();

  }
  $mensaje=&GetWebParams('MENSAJE');
  $mensaje=Crypandcodificationfunctions::HexDeEncoded($mensaje); 
  $mensaje=Crypandcodificationfunctions::DeCriptModifiedXor($mensaje);
  $mensaje=Crypandcodificationfunctions::DeCriptModifiedVigenere ($mensaje,"vrdk527");

  if (Cadenas::trim($mensaje) eq "") {

    &printinternalerror2();

  }

  if (&GetWebParams('PRECIOPEDIDO') ne ("" . (0+&GetWebParams('PRECIOPEDIDO')))) {

    &printinternalerror2();


  }
  $precio=&GetWebParams('PRECIOPEDIDO');
  $precio=0+$precio;

  if ($precio<=0) {

    &printinternalerror2();

  }

  @lineasmensaje=split(/\r\n/,$mensaje);
  if ($lineasmensaje[0] ne "ID Order:" . &GetWebParams('IDPEDIDO')) {


    &printinternalerror2();

  }

  $cuenta=@lineasmensaje;
  $retval2=0;

  for ($i=0;$i<$cuenta;$i++) {

    if ($lineasmensaje[$i]=~/^Total Price = $precio/) {

      $retval2=1;

    }
  }

  if (!$retval2) {

    &printinternalerror2();

  }
  $sha1=pop(@lineasmensaje);
  $md5=pop(@lineasmensaje);
  $mensaje=join("\r\n",@lineasmensaje);
  $digestor=Digest::MD5->new();
  $digestor->add($mensaje);
  if ("MD5:" . $digestor->hexdigest() ne $md5) {

  
    &printinternalerror2();

  }

  $digestor=Digest::SHA1->new();
  $digestor->add($mensaje);
  if ("SHA1:". $digestor->hexdigest() ne $sha1) {

  

    &printinternalerror2();


  }

  $jsvaconfiguracion=JSVarArchives->new("../Config/config.js");
  @retval=$jsvaconfiguracion->GetJSVar("formasdepago");
  if ($retval[1]!=0) {
    &printinternalerror();
  }
  if (&GetWebParams('FORMADEPAGO') eq "1" && substr($retval[0],0,1) ne "1") {

    &printinternalerror2();

  }
  elsif (&GetWebParams('FORMADEPAGO') eq "2" && substr($retval[0],1,1) ne "1") {

    &printinternalerror2();

  }
  elsif (&GetWebParams('FORMADEPAGO') eq "3" && substr($retval[0],2,1) ne "1") {

    &printinternalerror2();

  }

}


sub printinternalerror {

  print ("Content-type:text/plain\n\n");
  print ("Internal error nº1"); 
  exit(0);

}

sub printinternalerror2 {

  print ("Content-type:text/plain\n\n");
  print ("Internal error nº2"); 
  exit(0);


}

sub enviarmensajedecorreo {

  my $jsvaconfiguracion;
  my @lineasmensaje;
  my $mensaje;
  my $md5;
  my $sha1;
  my $digestor;
  my $clavedeencriptacion;
  my $numeroaleatorio;
  my $servidorsmtp;
  my $direccionsmtp;
  my $puertosmtp;
  my $loginsmtp;
  my $passwordsmtp;
  my $asuntomensaje;
  my $sender;

  my @retval;

  $mensaje=&GetWebParams('MENSAJE');
  $mensaje=Crypandcodificationfunctions::HexDeEncoded($mensaje); 
  $mensaje=Crypandcodificationfunctions::DeCriptModifiedXor($mensaje);
  $mensaje=Crypandcodificationfunctions::DeCriptModifiedVigenere ($mensaje,"vrdk527");

  @lineasmensaje=split(/\r\n/,$mensaje);
  $sha1=pop(@lineasmensaje);
  $md5=pop(@lineasmensaje);
  push(@lineasmensaje,"IP:" .RemoteIp());
  

  $digestor=Digest::MD5->new();
  $digestor->add($mensaje);
  $md5=$digestor->hexdigest();
  $md5="MD5:" . $md5;

  $digestor=Digest::SHA1->new();
  $digestor->add($mensaje);
  $sha1=$digestor->hexdigest();
  $sha1="SHA1:" . $sha1;

  push(@lineasmensaje,$md5);
  push(@lineasmensaje,$sha1);
  $mensaje=join("\r\n",@lineasmensaje);

  $jsvaconfiguracion=JSVarArchives->new("configserv.pl");
  @retval=$jsvaconfiguracion->GetJSVar("encriptationpassword");

  if ($retval[1]!=0) {
    &printinternalerror();
  }

  $clavedeencriptacion=$retval[0];
  $clavedeencriptacion=Crypandcodificationfunctions::HexDeEncoded($clavedeencriptacion); 
  $clavedeencriptacion=Crypandcodificationfunctions::DeCriptModifiedXor($clavedeencriptacion);
  $clavedeencriptacion=Crypandcodificationfunctions::DeCriptModifiedVigenere ($clavedeencriptacion,"hiaydf");

  srand time;
  $numeroaleatorio=int(rand(5))+1;
  $mensaje=Crypandcodificationfunctions::CriptModifiedVigenere ($mensaje,$clavedeencriptacion);  
  $mensaje=Crypandcodificationfunctions::CriptModifiedXor($mensaje,$numeroaleatorio);  
  $mensaje=Crypandcodificationfunctions::HexEncoded($mensaje);  
  

  @retval=$jsvaconfiguracion->GetJSVar("smtpserver");

  if ($retval[1]!=0) {
    &printinternalerror();
  }

  $servidorsmtp=$retval[0];
  $servidorsmtp=Crypandcodificationfunctions::HexDeEncoded($servidorsmtp); 
  $servidorsmtp=Crypandcodificationfunctions::DeCriptModifiedXor($servidorsmtp);
  $servidorsmtp=Crypandcodificationfunctions::DeCriptModifiedVigenere ($servidorsmtp,$clavedeencriptacion);


  @retval=$jsvaconfiguracion->GetJSVar("emailaddress");

  if ($retval[1]!=0) {
    &printinternalerror();
  }

  $direccionsmtp=$retval[0];
  $direccionsmtp=Crypandcodificationfunctions::HexDeEncoded($direccionsmtp); 
  $direccionsmtp=Crypandcodificationfunctions::DeCriptModifiedXor($direccionsmtp);
  $direccionsmtp=Crypandcodificationfunctions::DeCriptModifiedVigenere ($direccionsmtp,$clavedeencriptacion);




  @retval=$jsvaconfiguracion->GetJSVar("emailserverport");

  if ($retval[1]!=0) {
    &printinternalerror();
  }

  $puertosmtp=$retval[0];
  $puertosmtp=Crypandcodificationfunctions::HexDeEncoded($puertosmtp); 
  $puertosmtp=Crypandcodificationfunctions::DeCriptModifiedXor($puertosmtp);
  $puertosmtp=Crypandcodificationfunctions::DeCriptModifiedVigenere ($puertosmtp,$clavedeencriptacion);


  @retval=$jsvaconfiguracion->GetJSVar("emaillogin");

  if ($retval[1]!=0) {
    &printinternalerror();
  }

  $loginsmtp=$retval[0];
  $loginsmtp=Crypandcodificationfunctions::HexDeEncoded($loginsmtp); 
  $loginsmtp=Crypandcodificationfunctions::DeCriptModifiedXor($loginsmtp);
  $loginsmtp=Crypandcodificationfunctions::DeCriptModifiedVigenere ($loginsmtp,$clavedeencriptacion);


  @retval=$jsvaconfiguracion->GetJSVar("emailpassword");

  if ($retval[1]!=0) {
    &printinternalerror();
  }

  $passwordsmtp=$retval[0];
  $passwordsmtp=Crypandcodificationfunctions::HexDeEncoded($passwordsmtp); 
  $passwordsmtp=Crypandcodificationfunctions::DeCriptModifiedXor($passwordsmtp);
  $passwordsmtp=Crypandcodificationfunctions::DeCriptModifiedVigenere ($passwordsmtp,$clavedeencriptacion);


  @retval=$jsvaconfiguracion->GetJSVar("emailsubject");

  if ($retval[1]!=0) {
    &printinternalerror();
  }

  $asuntomensaje=$retval[0];
  $asuntomensaje=Crypandcodificationfunctions::HexDeEncoded($asuntomensaje); 
  $asuntomensaje=Crypandcodificationfunctions::DeCriptModifiedXor($asuntomensaje);
  $asuntomensaje=Crypandcodificationfunctions::DeCriptModifiedVigenere ($asuntomensaje,$clavedeencriptacion);



  $sender=Net::SMTP->new($servidorsmtp,Hello=>$ENV{'HTTP_HOST'},port=>$puertosmtp,debug=>1);
  if ($! ne "") {
    return 0;
  }

  if ($loginsmtp ne "" && $passwordsmtp ne "") {

    if (!$sender->auth($loginsmtp,$passwordsmtp)) {
      return 0;
    }


  }

  


  if (!$sender->mail($direccionsmtp)) {
    return 0;
  }
  if (!$sender->to($direccionsmtp)) {
    return 0;
  }
  if (!$sender->data()) {
    return 0;
  }
  if (!$sender->datasend("To: $direccionsmtp\n")) {
    return 0;
  }
  if (!$sender->datasend("From: $direccionsmtp\n")) {
    return 0;
  }
  if (!$sender->datasend("Subject: $asuntomensaje\n")) {
    return 0;
  }

  if (!$sender->datasend("\n")) {
    return 0;
  }
  if (!$sender->datasend("$mensaje\n")) {#
    return 0;
  }
  if (!$sender->dataend()) {
    return 0;
  }
  if (!$sender->quit()) {
    return 0;
  }
  return 1;

}

sub RemoteIp() {

  return $ENV{'REMOTE_ADDR'};

}

sub enviarpaginadeerror {
  my @arlineas;
  my $linea;
  my $cuenta;
  my $i=0;

  if (!open (MANIPULADOR,"<final.htm")) {
    &printinternalerror();
  }  

  while($linea=<MANIPULADOR>) {
    push(@arlineas,$linea); 
  }

  if (!close (MANIPULADOR)) {
    &printinternalerror();
  }  
 

  print "Content-type:text/html\n\n";
  $cuenta=@arlineas;
  for ($i=0;$i<$cuenta;$i++) {
    print ("$arlineas[$i]\n");
  }
}

sub enviarpaginadepago() {
  my @arlineas;
  my $linea;
  my $cuenta;
  my $jsvaconfiguracion;
  my $clavedeencriptacion;
  my $correopaypal;
  my $cuentabancaria;
  my @retval;
  my $i=0;


  $jsvaconfiguracion=JSVarArchives->new("configserv.pl");
  @retval=$jsvaconfiguracion->GetJSVar("encriptationpassword");

  if ($retval[1]!=0) {
    &printinternalerror();
  }

  $clavedeencriptacion=$retval[0];
  $clavedeencriptacion=Crypandcodificationfunctions::HexDeEncoded($clavedeencriptacion); 
  $clavedeencriptacion=Crypandcodificationfunctions::DeCriptModifiedXor($clavedeencriptacion);
  $clavedeencriptacion=Crypandcodificationfunctions::DeCriptModifiedVigenere ($clavedeencriptacion,"hiaydf");


  @retval=$jsvaconfiguracion->GetJSVar("emailpaypal");

  if ($retval[1]!=0) {
    &printinternalerror();
  }

  
  $correopaypal=$retval[0];
  $correopaypal=Crypandcodificationfunctions::HexDeEncoded($correopaypal); 
  $correopaypal=Crypandcodificationfunctions::DeCriptModifiedXor($correopaypal);
  $correopaypal=Crypandcodificationfunctions::DeCriptModifiedVigenere ($correopaypal,$clavedeencriptacion);


  @retval=$jsvaconfiguracion->GetJSVar("cuentabancaria");

  if ($retval[1]!=0) {
    &printinternalerror();
  }

  
  $cuentabancaria=$retval[0];
  $cuentabancaria=Crypandcodificationfunctions::HexDeEncoded($cuentabancaria); 
  $cuentabancaria=Crypandcodificationfunctions::DeCriptModifiedXor($cuentabancaria);
  $cuentabancaria=Crypandcodificationfunctions::DeCriptModifiedVigenere ($cuentabancaria,$clavedeencriptacion);

  push(@arlineas,"<SCRIPT LANGUAGE=\"JavaScript1.2\">\n");
  push(@arlineas,"<!--\n");
  push(@arlineas,"var correopaypal=\"$correopaypal\";\n");
  push(@arlineas,"var cuentabancaria=\"$cuentabancaria\";\n");
  push(@arlineas,"//-->\n");
  push(@arlineas,"</SCRIPT>\n");

 if (!open (MANIPULADOR,"<final2.htm")) {
    &printinternalerror();
  }  

  while($linea=<MANIPULADOR>) {
    push(@arlineas,$linea); 
  }

  if (!close (MANIPULADOR)) {
    &printinternalerror();
  }  
 

  print "Content-type:text/html\n\n";
  $cuenta=@arlineas;
  for ($i=0;$i<$cuenta;$i++) {
    print ("$arlineas[$i]\n");
  }
}
1;
