use strict;
package ValidatePrimitivesJavaScriptDatas;
sub isboolean {

  my $nelementos=@_;
  my $valor=$_[0];

  if ($nelementos<1) {
    return 0;
  }
  if ($valor eq "true" || $valor eq "false") {
    return 1;
  }
  else {
    return 0;
  }
}

sub isnull {

  my $nelementos=@_;
  my $valor=$_[0];

  if ($nelementos<1) {
    return 0;
  }
  if ($valor eq "null") {
    return 1;
  }
  else {
    return 0;
  }
}

sub isinteger {

  my $nelementos=@_;
  my $valor=$_[0];
  my $valortempo="". $valor;
  my $retval=1;
  my $i=0;

  if ($nelementos<1) {
    return 0;
  }
  if ($valortempo eq "-") {

    return 0;

  } 
  if (substr($valortempo,0,1) eq "-") {
    $valortempo=substr($valortempo,1);
  }
  if ($valortempo eq "0") {

    return 1;

  }    

  if (substr($valortempo,0,1) eq "0") {


    return 0;

  }


  for ($i=0;$i<length($valortempo);$i++) {

    if (substr($valortempo,$i,1) lt "0" || substr($valortempo,$i,1) gt "9") {

      $retval=0;
      last;

    }

  }

  return $retval;
}

sub isfloat {
  my $nelementos=@_;
  my $valor=$_[0];
  my $valortempo="". $valor;  
  my $valortempo2="";
  my $posicion=0;
  my $posicion2=0;
  my $retval=1;
  my $i=0;

  if ($nelementos<1) {
    return 0;
  }

  if (&ValidatePrimitivesJavaScriptDatas::isinteger($valortempo)) {

    return 1;
      


  }
  elsif (index($valortempo,'.')==-1) {

    return 0;

  }
  if ($valortempo eq "-") {
  
    return 0;

  }

  if (substr($valortempo,0,1) eq "-") {

    $valortempo=substr($valortempo,1);
       

  }

  $posicion=index($valortempo,'.');  
  if ($posicion==0 || $posicion==length($valortempo)-1) {
     
    return 0;

  }
  if (index($valortempo,'.',$posicion+1)!=-1) {
    
    return 0;

  }

  $posicion2=index($valortempo,'00'); 
  if ($posicion2!=-1 && $posicion2<$posicion) {
   
    return 0;

  }

  $valortempo2=0+$valortempo;
  
  if ($valortempo2==0) {

    return 0;

  }
   
  for ($i=0;$i<length($valortempo);$i++) {

     
    if ((substr($valortempo,$i,1) lt "0" || substr($valortempo,$i,1) gt "9") && substr($valortempo,$i,1) ne ".") {

      $retval=0;
      last;

    } 

  }

  return $retval;

    
}

sub isstring {
  my $nelementos=@_;
  my $valor=$_[0];
  my $valortempo="" . $valor;

  if ($nelementos<1) {
    return 0;
  }


  if (length($valortempo)<2) {

    return 0;

  }
  if ((substr($valortempo,0,1) eq '"' && substr($valortempo,length($valortempo)-1,1) eq '"') || (substr($valortempo,0,1) eq "'" && substr($valortempo,length($valortempo)-1,1) eq "'")) {

    return 1;

  }   
  else {

    return 0;

  }

}

sub typedata {

  my $nelementos=@_;
  my $valor=$_[0];

  if ($nelementos<1) {
    return 0;
  }

  if (ValidatePrimitivesJavaScriptDatas::isnull($valor)) {

    return 1;

  }
  elsif (ValidatePrimitivesJavaScriptDatas::isboolean($valor)) {

    return 2;

  }
  elsif (ValidatePrimitivesJavaScriptDatas::isinteger($valor)) {

    return 3;

  }
  elsif (ValidatePrimitivesJavaScriptDatas::isfloat($valor)) {

    return 4;

  }
  elsif (ValidatePrimitivesJavaScriptDatas::isstring($valor)) {

    return 5;

  }
  else {

    return 0;

  }


}  


1;
