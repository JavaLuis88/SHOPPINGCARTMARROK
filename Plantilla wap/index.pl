use strict;
use lib("./PerlLibs");
use MiscShop;

my $retval;

$retval=&MiscShop::comprobarcfg();

if ($retval!=0) {

  &MiscShop::errorpag($retval);

}