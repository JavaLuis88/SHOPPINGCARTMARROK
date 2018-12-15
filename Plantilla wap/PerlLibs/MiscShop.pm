use strict;
use JSVarArchives;
use ValidatePrimitivesJavaScriptDatas;
package MiscShop;
#COMPLETAR
sub comprobarcfg {
  my @directorios;
  my @archivos;
  my $jsvaconfiguracion;
  my $cuenta=0;
  my $retval=0;
  my @retval2;
  my $permitielegirlenguaje=0;
  my $lenguajepordefecto;
  my @listalenguajes;
  my $nrepeticiones=0;
  my $i=0;

  $directorios[0]="Config";
  $directorios[1]="Language";
  $directorios[2]="PerlLibs";
  $archivos[0]="index.pl";
  $archivos[1]="Config/Config.js";
  $archivos[2]="PerlLibs/JSVarArchives.pm";
  $archivos[2]="PerlLibs/ValidatePrimitivesJavaScriptDatas.pm";
  $archivos[2]="PerlLibs/Cadenas.pm";
  $archivos[2]="PerlLibs/GenericWMLPaypalShopingCartButton.pm";
  $archivos[2]="PerlLibs/MiscShop.pm";
  $cuenta=@directorios;
  for ($i=0;$i<$cuenta;$i++) {

    if (!-d($directorios[$i])) {
      $retval=1;
    }

  }  
  $cuenta=@archivos;
  for ($i=0;$i<$cuenta;$i++) {

    if (!-e($archivos[$i])) {
      $retval=1;
    }

  }  
  if ($retval!=0) {
    return $retval;
  }  
  $jsvaconfiguracion=JSVarArchives->new('Config/Config.js');
  @retval2=$jsvaconfiguracion->GetJSVar("titulodelapagina",1);
  if ($retval2[1]==4) {
    return 2;
  }
  if ($retval2[1]==3) {
    return 3;
  }
  if (&ValidatePrimitivesJavaScriptDatas::typedata($retval2[0])!=5 || length($retval2[0])==2 || length($retval2[0])>14) {
    return 2;
  }
  @retval2=$jsvaconfiguracion->GetJSVar("permitirelegirlenguaje",1);
  if ($retval2[1]==4) {
    return 2;
  }
  if ($retval2[1]==3) {
    return 3;
  }
  if (&ValidatePrimitivesJavaScriptDatas::typedata($retval2[0])!=2) {
    return 2;
  }
  if ($retval2[0] eq "true") {
    $permitielegirlenguaje=1;
  }
  @retval2=$jsvaconfiguracion->GetJSVar("incluirbuscador",1);
  if ($retval2[1]==4) {
    return 2;
  }
  if ($retval2[1]==3) {
    return 3;
  }
  if (&ValidatePrimitivesJavaScriptDatas::typedata($retval2[0])!=2) {
    return 2;
  }
  @retval2=$jsvaconfiguracion->GetJSVar("lenguajepordefecto",1);
  if ($retval2[1]==4) {
    return 2;
  }
  if ($retval2[1]==3) {
    return 3;
  }
  if (&ValidatePrimitivesJavaScriptDatas::typedata($retval2[0])!=5 || length($retval2[0])==2) {
    return 2;
  }

  @retval2=$jsvaconfiguracion->GetJSVar("lenguajepordefecto",0);
  if ($retval2[1]==4) {
    return 2;
  }
  if ($retval2[1]==3) {
    return 3;
  }
  $lenguajepordefecto=$retval2[0];


  if ($permitielegirlenguaje) {
    @retval2=$jsvaconfiguracion->GetJSVar("lenguajesdisponibles",1);
    if ($retval2[1]==4) {
      return 2;
    }
    if ($retval2[1]==3) {
      return 3;
    }
    if (&ValidatePrimitivesJavaScriptDatas::typedata($retval2[0])!=5 || length($retval2[0])==2) {
      return 2;
    }   
    @retval2=$jsvaconfiguracion->GetJSVar("lenguajesdisponibles",0);
    if ($retval2[1]==4) {
      return 2;
    }
    if ($retval2[1]==3) {
      return 3;
    }
    @listalenguajes=split(/\|/,$retval2[0]);
    $cuenta=@listalenguajes;
    if ($cuenta<2) {
      return 55;
    }
    $retval=0;
    for ($i=0;$i<$cuenta;$i++) {
      if ($listalenguajes[$i] eq "") {
        $retval=1; 
      }
      if (uc($listalenguajes[$i]) eq uc($lenguajepordefecto)) {
        $nrepeticiones++;
      }
    }
    if ($retval!=0 || $nrepeticiones!=1) {
      return 4;
    }
    if (!&MiscShop::verificararchivosdelenguaje($lenguajepordefecto, @listalenguajes)) {
      return 4;
    }
  }
  else {
    if (!&MiscShop::verificararchivosdelenguaje($lenguajepordefecto)) {
      return 4;
    }
  }
  return 0;
}

sub verificararchivosdelenguaje {

  return 1;

}
#COMPLETAR

sub errorpag {

  print "Error numero: " . $_[0];


}

1;
