use strict;
package Cadenas;
sub trim {

  my $cuenta=@_;
  my $cadenatempo;
  my $posicion=-1;
  my $i=0;

  if ($cuenta<1) {
    return;
  }
  
  $cadenatempo="" . $_[0];
  if ($cadenatempo eq "") {
    return "";
  }
  $posicion=length($cadenatempo);
  for ($i=0;$i<length($cadenatempo);$i++) {

    if (substr($cadenatempo,$i,1) ne " " && substr($cadenatempo,$i,1) ne "\t" && substr($cadenatempo,$i,1)ne"\n" && substr($cadenatempo,$i,1)ne"\r" && substr($cadenatempo,$i,1)ne"\0") {
      $posicion=$i;
      last;
    }

  }  
  if ($posicion==-1) {
    return "";
  }
  $cadenatempo=substr($cadenatempo,$posicion);
  $posicion=length($cadenatempo);
  for ($i=length($cadenatempo)-1;$i>=0;$i--) {

   if (substr($cadenatempo,$i,1) ne " " && substr($cadenatempo,$i,1) ne "\t" && substr($cadenatempo,$i,1)ne"\n" && substr($cadenatempo,$i,1)ne"\r" && substr($cadenatempo,$i,1)ne"\0") {
      $posicion=$i+1;
      last;
    } 

  }
  $cadenatempo=substr($cadenatempo,0,$posicion);
  return $cadenatempo;
}
1;