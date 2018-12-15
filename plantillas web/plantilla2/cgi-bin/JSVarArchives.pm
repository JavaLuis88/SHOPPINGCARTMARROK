use strict;
use ValidatePrimitivesJavaScriptDatas;
use ValidateDatas;
use Cadenas;
package JSVarArchivesAPI;
sub verificarintegridad {

  my @arlineas=@_;
  my @arpartes;
  my $cuenta=@_;
  my $cuenta2;
  my $retval=1;
  my $i=0;

  for ($i=0;$i<$cuenta;$i++) {
    @arpartes=split(/ /,$arlineas[$i],4);
    $cuenta2=@arpartes;
    if ($cuenta2!=4) {
      $retval=0;
      last;  
    }
    if ($arpartes[0] ne "var" || !&ValidateDatas::isValidJSName($arpartes[1]) || $arpartes[2] ne "=") {
      $retval=0;
      last;
    }
    $arpartes[3]=&Cadenas::trim($arpartes[3]);
    if (substr($arpartes[3],length($arpartes[3])-1) eq ";") {
      $arpartes[3]=substr($arpartes[3],0,length($arpartes[3])-1);
      $arpartes[3]=&Cadenas::trim($arpartes[3]);
    }
    if (&ValidatePrimitivesJavaScriptDatas::typedata($arpartes[3])==0) {
      $retval=0;
      last;
    }
  }

  return $retval;
}
package JSVarArchives;
sub new {

  my $this=shift;
  my $class = ref($this) || $this;
  my $self={}; 
  my $nelementos=@_;
  
  if ($nelementos>=1) {
    $self->{'nombrearchivo'}="" . $_[0];
  }
  else {
    $self->{'nombrearchivo'}="";
  }

  bless $self, $class;
  return ($self); 
}

sub SetArchive {
  my $self=shift;
  my $nelementos=@_;
  
  if ($nelementos>=1) {
    $self->{'nombrearchivo'}="" . $_[0];
  }
   

}

sub GetArchive {
  
  my $self=shift;
  return $self->{'nombrearchivo'};

}

sub GetJSVar {
  
  my $self=shift;
  my $nelementos=@_;
  my $nombrevariable="".$_[0];
  my @arlineas;
  my @arpartes;
  my @retval;
  my $linea="";
  my $cuenta;
  my $posicion=-1;
  my $i=0;


  if ($nelementos<1) {
    $retval[0]="";
    $retval[1]=1;
    return @retval;
  }
  if (&Cadenas::trim($nombrevariable) eq "" || !&ValidateDatas::isValidJSName($nombrevariable)) {
    $retval[0]="";
    $retval[1]=1;
    return @retval;
  }
  if (!-e($self->{'nombrearchivo'}))  {
    $retval[0]="";
    $retval[1]=2;
    return @retval;
  }  
  if (!open (MANIPULADOR,"<$self->{'nombrearchivo'}")) {
    $retval[0]="";
    $retval[1]=3;
    return @retval;
  }
  if (!flock(MANIPULADOR,2)) {
    $retval[0]="";
    $retval[1]=3;
    return @retval;
  }
  while ($linea=<MANIPULADOR>) {
    if (&Cadenas::trim($linea) ne "") {
      $arlineas[$i]=$linea;
      $i++;
    }
  }
  if (!flock(MANIPULADOR,8)) {
    $retval[0]="";
    $retval[1]=3;
    return @retval;
  }
  if (!close(MANIPULADOR)) {
    $retval[0]="";
    $retval[1]=3;
    return @retval;
  } 
  if (!JSVarArchivesAPI::verificarintegridad(@arlineas)) {
    $retval[0]="";
    $retval[1]=4;
    return @retval;
  }
  $cuenta=@arlineas;
  for ($i=0;$i<$cuenta;$i++) {
    @arpartes=split(/ /,$arlineas[$i],4);
    if ($arpartes[1] eq $nombrevariable) {
      $posicion=$i;
      last;
    }
  }
  if ($posicion==-1) {
    $retval[0]="";
    $retval[1]=5;
    return @retval;
  }
  $arpartes[3]=&Cadenas::trim($arpartes[3]);
  if (substr($arpartes[3],length($arpartes[3])-1) eq ";") {
    $arpartes[3]=substr($arpartes[3],0,length($arpartes[3])-1);
    $arpartes[3]=&Cadenas::trim($arpartes[3]);
  }
  if (&ValidatePrimitivesJavaScriptDatas::typedata($arpartes[3])==5 && !$_[1]) {
    if ($arpartes[3] eq "\"\"" || $arpartes[3] eq "\'\'") {
      $retval[0]="";
      $retval[1]=0;
      return @retval;
    }
    else {
      $retval[0]=substr($arpartes[3],1,length($arpartes[3])-2);
      $retval[1]=0;
      return @retval;
    }
  }
  else {
    $retval[0]=$arpartes[3];
    $retval[1]=0;
    return @retval;

  }

}

sub SetJSVar {
  
  my $self=shift;
  my $nelementos=@_;
  my $nombrevariable="".$_[0];
  my $valorvariable="".$_[1];
  my @arlineas;
  my @arpartes;
  my $retval;
  my $linea="";
  my $cuenta;
  my $posicion=-1;
  my $i=0;


  if ($nelementos<2) {
    $retval=1;
    return $retval;
  }
  if (&Cadenas::trim($nombrevariable) eq "" || !&ValidateDatas::isValidJSName($nombrevariable)) {
    $retval=1;
    return $retval;
  }
  if (&ValidatePrimitivesJavaScriptDatas::typedata($valorvariable)==0) {
    $retval=1;
    return $retval;;
  }
  if (!-e($self->{'nombrearchivo'}))  {
    $retval=2;
    return $retval;
  }  
  if (!open (MANIPULADOR,"<$self->{'nombrearchivo'}")) {
    $retval=3;
    return $retval;
  }
  if (!flock(MANIPULADOR,2)) {
    $retval=3;
    return $retval;
  }
  while ($linea=<MANIPULADOR>) {
    if (&Cadenas::trim($linea) ne "") {
      $arlineas[$i]=$linea;
      $i++;
    }
  }
  if (!flock(MANIPULADOR,8)) {
    $retval=3;
    return $retval;
  }
  if (!close(MANIPULADOR)) {
    $retval=3;
    return $retval;
  } 
  if (!JSVarArchivesAPI::verificarintegridad(@arlineas)) {
    $retval=4;
    return $retval;
  }
  $cuenta=@arlineas;
  for ($i=0;$i<$cuenta;$i++) {
    @arpartes=split(/ /,$arlineas[$i],4);
    if ($arpartes[1] eq $nombrevariable) {
      $posicion=$i;
      last;
    }
  }
  if ($posicion==-1) {
    $arlineas[$cuenta]="var " . $nombrevariable . " = " . $valorvariable . ";\n";
    $cuenta++;
  }
  else {
    $arlineas[$posicion]="var " . $nombrevariable . " = " . $valorvariable . ";\n";

  } 

 if (!open (MANIPULADOR,">$self->{'nombrearchivo'}")) {
    $retval=3;
    return $retval;
  }
  if (!flock(MANIPULADOR,2)) {
    $retval=3;
    return $retval;
  }

  for ($i=0;$i<$cuenta;$i++) {
    print MANIPULADOR "$arlineas[$i]";
  } 

  if (!flock(MANIPULADOR,8)) {
    $retval=3;
    return $retval;
  }
  if (!close(MANIPULADOR)) {
    $retval=3;
    return $retval;
  }
  return 0; 
}
1;