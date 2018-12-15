use strict;

package Crypandcodificationfunctions;


sub CriptModifiedVigenere {

  my $textotempo="" . $_[0];
  my $clavetempo="" . $_[1];
  my $caracterleido;
  my $caracterleido2;
  my $cadenaencriptada="";
  my $rangominimo;
  my $rangomaximo;
  my $i;
  my $z;

  $rangominimo=0;
  $rangomaximo=hex("FFFF"); 
  if (length($textotempo)<1 || length($clavetempo)<1) {
    return "";
  }
  
  while(length($clavetempo)<length($textotempo)) {
    $clavetempo=$clavetempo.$clavetempo;
  }
  

  for ($i=0;$i<length($textotempo);$i++) {
    $caracterleido=substr($textotempo,$i,1);
    $caracterleido2=substr($clavetempo,$i,1);
    $caracterleido=ord($caracterleido);
    $caracterleido2=ord($caracterleido2);
    for ($z=1;$z<=$caracterleido2;$z++) {
      $caracterleido++;
      if ($caracterleido>$rangomaximo) {
        $caracterleido=$rangominimo;
      }
    }
    $cadenaencriptada=$cadenaencriptada.chr($caracterleido);


  }

  return $cadenaencriptada;


}


sub DeCriptModifiedVigenere  {

  my $textotempo="" .$_[0];
  my $clavetempo="" .$_[1];
  my $caracterleido;
  my $caracterleido2;
  my $cadenadesencriptada="";
  my $rangominimo;
  my $rangomaximo;
  my $i;
  my $z;

  $rangominimo=0;
  $rangomaximo=hex("FFFF"); 
  if (length($textotempo)<1 || length($clavetempo)<1) {
    return "";
  }
  
  while(length($clavetempo)<length($textotempo)) {
    $clavetempo=$clavetempo.$clavetempo;
  }

  for ($i=0;$i<length($textotempo);$i++) {
    $caracterleido=substr($textotempo,$i,1);
    $caracterleido2=substr($clavetempo,$i,1);
    $caracterleido=ord($caracterleido);
    $caracterleido2=ord($caracterleido2);
    for ($z=1;$z<=$caracterleido2;$z++) {
      $caracterleido--;
      if ($caracterleido<$rangominimo) {
        $caracterleido=$rangomaximo;
      }
    }
    $cadenadesencriptada=$cadenadesencriptada.chr($caracterleido);


  }
  
  return $cadenadesencriptada;
}

sub CriptModifiedXor {

  my $textotempo="" .$_[0];
  my $clavetempo=$_[1];
  my $caracterleido;
  my $cadenares="";
  my @arcaracteres;
  my $cuenta=0;
  my $posicion=-1;
  my $i;

  
  if (length($textotempo)<1 || ($clavetempo!=1 && $clavetempo!=2 && $clavetempo!=3 && $clavetempo!=4 && $clavetempo!=5)) {
    return "";
  }
  for ($i=0;$i<length($textotempo);$i++) {
    $caracterleido=substr($textotempo,$i,1);
    $caracterleido=ord($caracterleido);
    $caracterleido=$caracterleido^$clavetempo;
    $cadenares=$cadenares.chr($caracterleido);

  }
  for ($i=0;$i<length($cadenares);$i++) {
    $cuenta++;
    $posicion++;
   
    if ($cuenta==int(length($cadenares)/2)) {
      $arcaracteres[$posicion]=$clavetempo;
      $posicion++;
    }
    $arcaracteres[$posicion]=substr($cadenares,$i,1);
  }
  $cadenares=join("",@arcaracteres);
  return $cadenares;
}

sub DeCriptModifiedXor {

  my $textotempo="" . $_[0];
  my $clavetempo;
  my $caracterleido;
  my $cadenares="";
  my @arcaracteres;
  my $cuenta=0;
  my $posicion=-1;
  my $tempo;
  my $i;
  
  if (length($textotempo)<2) {
    return "";
  }

  for ($i=0;$i<length($textotempo);$i++) {
    $arcaracteres[$i]=substr($textotempo,$i,1);
  }
  $tempo=@arcaracteres;
  $tempo--;
  $posicion=int($tempo/2)-1;
  $clavetempo=$arcaracteres[$posicion];
  $arcaracteres[$posicion]="";
  $textotempo=join("",@arcaracteres);
  for ($i=0;$i<length($textotempo);$i++) {
    $arcaracteres[$i]=substr($textotempo,$i,1);
  }

  for ($i=0;$i<length($textotempo);$i++) {
    $caracterleido=substr($textotempo,$i,1);
    $caracterleido=ord($caracterleido);
    $caracterleido=$caracterleido^$clavetempo;
    $cadenares=$cadenares.chr($caracterleido);

  }

  return $cadenares;
}

sub HexEncoded {
  my $textotempo="" . $_[0];
  my @arcaracteres;
  my $cadenares="";
  my $tempo=0;
  my $tempo2=0;
  my $codigoshexa="0123456789ABCDEF";
  my $i=0;
  
  for ($i=0;$i<length($textotempo);$i++) {
    $arcaracteres[$i]=ord(substr($textotempo,$i,1));
  }

  $tempo2=@arcaracteres;
  for ($i=0;$i<$tempo2;$i++) {
    while (int($arcaracteres[$i]/16)!=0) {

      $cadenares=substr($codigoshexa,$arcaracteres[$i]%16,1).$cadenares;
      $arcaracteres[$i]=int($arcaracteres[$i]/16);        

    }
    $cadenares=substr($codigoshexa,$arcaracteres[$i],1).$cadenares;
    $arcaracteres[$i]=$cadenares;
    while (length($arcaracteres[$i])<4) {
      $arcaracteres[$i]="0" . $arcaracteres[$i];
    } 
    $cadenares="";
  }

  return join("",@arcaracteres);

}


sub HexDeEncoded  {

  my $textotempo="" . $_[0];
  my $codigoshexa="0123456789ABCDEF";
  my $inicio=0;
  my $cadenares="";
  my $codigocaracter;
  my $tempo;
  my $i;

  if (length($textotempo)<4 || length($textotempo)%4!=0) {
    return "";
  }
  for ($i=0;$i<length($textotempo);$i++) {
    $tempo=substr($textotempo,$i,1);

   if ($codigoshexa!~/$tempo/) {
      return "";
    }
  }
  while ($inicio<length($textotempo)) {
    $codigocaracter=hex(substr($textotempo,$inicio,4));
    $inicio=$inicio+4;
    $cadenares=$cadenares.chr($codigocaracter); 
    
  }
  return $cadenares;
}

1;
