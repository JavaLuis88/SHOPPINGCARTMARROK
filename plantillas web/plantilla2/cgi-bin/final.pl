use strict;
use MiscShop;


&MiscShop::verificardatos();

if (!&MiscShop::enviarmensajedecorreo()) {


  &MiscShop::enviarpaginadeerror();

}
else {

  &MiscShop::enviarpaginadepago();

}



