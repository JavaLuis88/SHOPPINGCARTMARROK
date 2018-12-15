use strict;
package ValidateDatas;
sub isValidJSName {
  my $nelementos=@_;
  my $cadena="" . $_[0];
  my $caralfabeticos="ABCDEFGHIJKMNLOPQRSTUVWXYZabcdefghijkmnlopqrstuvwxyz";
  my $caralfanumericos="ABCDEFGHIJKMNLOPQRSTUVWXYZabcdefghijkmnlopqrstuvwxyz0123456789";
  my $retval=1;
  my $i=0;

  if ($nelementos<1) {
    return 0;
  }

  if ($cadena eq "") {
    return 0;
  }
  for ($i=0;$i<length($cadena);$i++) {
    $_=substr($cadena,$i,1);
    $_="\Q$_";
     


    if ($i==0 && $caralfabeticos!~/$_/) {
      $retval=0;
      last;
    }
    elsif ($i!=0 && $caralfanumericos!~/$_/) {
      $retval=0;
      last;
    }
 
  }
  return $retval;
}
1;