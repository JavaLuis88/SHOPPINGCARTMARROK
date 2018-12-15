function GenericPaypalShopingCartButton_SetCurrencyType(tipomoneda) {
  this.codigodeerror=0;
  if (tipomoneda==1) {
    this.tipodemoneda="AUD";
    this.cantidadlimite=12500;
  }
  else if (tipomoneda==2) {
    this.tipodemoneda="CAD";
    this.cantidadlimite=12500;
  }
  else if (tipomoneda==3) {
    this.tipodemoneda="GBP";
    this.cantidadlimite=5500;
  }
  else if (tipomoneda==4) {
    this.tipodemoneda="JPY";
    this.cantidadlimite=1000000;
  }
  else if (tipomoneda==5) {
    this.tipodemoneda="EUR";
    this.cantidadlimite=8000;

  }
  else {
    this.tipodemoneda="USD";
    this.cantidadlimite=10000;
  }

}

function GenericPaypalShopingCartButton_GetCurrencyType() {
  if (this.tipodemoneda=="AUD") {
    return 1;
  }
  else if (this.tipodemoneda=="CAD") {
    return 2;
  }
  else if (this.tipodemoneda=="GBP") {
    return 3;

  }
  else if (this.tipodemoneda=="JPY") {
    return 4;

  }
  else if (this.tipodemoneda=="EUR") {
    return 5;

  }
  else {
    return 6;

  }

}


function GenericPaypalShopingCartButton_SetOrderID(iddelpedido) {
  this.codigodeerror=0;
  if (typeof(iddelpedido)=="string" && iddelpedido.length>=1 && iddelpedido.length<=127) {
    this.iddelpedido=iddelpedido;
  }
  else {
    this.iddelpedido="";
  }

}

function GenericPaypalShopingCartButton_GetOrderID() {

  return this.iddelpedido;

}

function GenericPaypalShopingCartButton_SetCartAmount(preciodelcarro) {
  this.codigodeerror=0;
  if (typeof(preciodelcarro)=="number" && preciodelcarro>0 && preciodelcarro<=this.cantidadlimite) {
    this.preciodelcarro=preciodelcarro;
  }
  else {
    this.preciodelcarro=0;
  }  

}


function GenericPaypalShopingCartButton_GetCartAmount() {

  return this.preciodelcarro;

}


function GenericPaypalShopingCartButton_SetEmail(correonegocio) {
  this.codigodeerror=0;
  if (typeof(correonegocio)=="string") {
    this.correonegocio=correonegocio;
  }
  else {
    this.correonegocio="";
  }
 
}


function GenericPaypalShopingCartButton_GetEmail() {
  return this.correonegocio;  
}

function GenericPaypalShopingCartButton_SetFinishPage(paginadefinalizacion) {
  this.codigodeerror=0;
  if (typeof(paginadefinalizacion)=="string") {
    this.paginadefinalizacion=paginadefinalizacion;
  }
  else {
    this.paginadefinalizacion="";
  }
  

}

function GenericPaypalShopingCartButton_GetFinishPage() {
  return this.paginadefinalizacion;
}

function GenericPaypalShopingCartButton_SetCancelPage(paginadeerror) {
  this.codigodeerror=0;
  if (typeof(paginadeerror)=="string") {
    this.paginadeerror=paginadeerror;
  }
  else {
    this.paginadeerror="";
  }
  

}

function GenericPaypalShopingCartButton_GetCancelPage() {
  return this.paginadeerror;
}
function GenericPaypalShopingCartButton_SetButtonType(botonnormal) {
  this.codigodeerror=0;
  if (typeof(botonnormal)=="boolean") {
    this.botonnormal=botonnormal;  
  }
  else {
    this.botonnormal=true;
  }
}

function GenericPaypalShopingCartButton_GetButtonType() {

  return this.botonnormal;

}

function GenericPaypalShopingCartButton_SetLabel(etiquetaboton) {
  this.codigodeerror=0;
  if (typeof(etiquetaboton)=="string") {
    this.etiquetaboton=etiquetaboton;
  }
  else {
    this.etiquetaboton="";
  }
}
function GenericPaypalShopingCartButton_GetLabel() {

  return this.etiquetaboton;

}

function GenericPaypalShopingCartButton_SetImage(rutaimagen) {
  this.codigodeerror=0;
  if (typeof(rutaimagen)=="string") {
    this.rutaimagen=rutaimagen;
  }
  else {
    this.rutaimagen="";
  }

}


function GenericPaypalShopingCartButton_GetImage() {
 
  return this.rutaimagen;

}


function GenericPaypalShopingCartButton_GetErrorCode() {
  return this.codigodeerror;
}

function GenericPaypalShopingCartButton_GetMaximumQuantityOfMoney() {

  return this.cantidadlimite;

}
function GenericPaypalShopingCartButton_SetTarget(destino) {
  this.codigodeerror=0;
  if (typeof(destino)=="string") {
    this.destino=destino;
  }
  else {
    this.destino="";
  }

}

function GenericPaypalShopingCartButton_GetTarget() {
  return this.destino;
}

function GenericPaypalShopingCartButton_CreateButton() {
  var cadenares;
  this.codigodeerror=0;

  if (this.tipodemoneda!="AUD" && this.tipodemoneda!="CAD" && this.tipodemoneda!="GBP" && this.tipodemoneda!="JPY" && this.tipodemoneda!="EUR" && this.tipodemoneda!="USD") {
    this.codigodeerror=1;
    return "";
  }
  if (typeof(this.iddelpedido)!="string" || this.iddelpedido.length<1 || this.iddelpedido.length>127) {
    this.codigodeerror=2;
    return "";
  } 
  if (typeof(this.preciodelcarro)!="number" || this.preciodelcarro<=0 || this.preciodelcarro>this.cantidadlimite) {
    this.codigodeerror=3;
    return "";
  }
  if (typeof(this.correonegocio)!="string" || this.correonegocio=="") {
    this.codigodeerror=4;
    return "";
  }
  if (typeof(this.botonnormal)!="boolean") {
    this.codigodeerror=5;
    return "";
  }
  if (this.botonnormal==true && (typeof(this.etiquetaboton)!="string" || this.etiquetaboton=="")) {
    this.codigodeerror=6;
    return "";
  }
  if (this.botonnormal==false && (typeof(this.rutaimagen)!="string" || this.rutaimagen=="")) {
    this.codigodeerror=7;
    return "";
  }
  if (typeof(this.destino)!="string") {
    this.codigodeerror=8;
    return "";
  } 
  cadenares="<FORM ACTION=\"https://www.paypal.com/cgi-bin/webscr\" METHOD=\"POST\"";
  if (this.destino!="") {
    cadenares=cadenares + " TARGET=\"" + this.destino + "\">\n";
  }
  else {
    cadenares=cadenares + ">\n";

  }
  cadenares=cadenares + "<INPUT TYPE=\"hidden\" NAME=\"cmd\" VALUE=\"_ext-enter\">\n";
  cadenares=cadenares + "<INPUT TYPE=\"hidden\" NAME=\"redirect_cmd\" VALUE=\"_xclick\">\n";
  cadenares=cadenares + "<INPUT TYPE=\"hidden\" NAME=\"business\" VALUE=\"" + this.correonegocio +"\">\n";
  cadenares=cadenares + "<INPUT TYPE=\"hidden\" NAME=\"amount\" VALUE=\""+ this.preciodelcarro +"\">\n";
  cadenares=cadenares + "<INPUT TYPE=\"hidden\" NAME=\"currency_code\" VALUE=\""+this.tipodemoneda+"\">\n";
  cadenares=cadenares + "<INPUT TYPE=\"hidden\" NAME=\"item_name\" VALUE=\""+this.iddelpedido+"\">\n";
  if (typeof(this.paginadefinalizacion)=="string" && this.paginadefinalizacion!="") {
    cadenares=cadenares + "<INPUT TYPE=\"hidden\" NAME=\"return\" VALUE=\""+this.paginadefinalizacion+"\">\n";
  }
  if (typeof(this.paginadeerror)=="string" && this.paginadeerror!="") {
    cadenares=cadenares + "<INPUT TYPE=\"hidden\" NAME=\"cancel_return\" VALUE=\""+this.paginadeerror+"\">\n";
  }
  if (this.botonnormal==true) {
    cadenares=cadenares + "<INPUT NAME=\"Submit\" TYPE=\"SUBMIT\" VALUE=\""+ this.etiquetaboton +"\">\n";
  }
  else {
    cadenares=cadenares + "<INPUT NAME=\"Submit\" TYPE=\"IMAGE\" SRC=\""+ this.rutaimagen +"\">\n";

  }
  cadenares=cadenares+"</FORM>\n";
  return cadenares;
}

function GenericPaypalShopingCartButton() {
  if (arguments.length>=1 && arguments[0]==1) {
    this.tipodemoneda="AUD";
    this.cantidadlimite=12500;
  }
  else if (arguments.length>=1 && arguments[0]==2) {
    this.tipodemoneda="CAD";
    this.cantidadlimite=12500;
  }
  else if (arguments.length>=1 && arguments[0]==3) {
    this.tipodemoneda="GBP";
    this.cantidadlimite=5500;
  }
  else if (arguments.length>=1 && arguments[0]==4) {
    this.tipodemoneda="JPY";
    this.cantidadlimite=1000000;
  }
  else if (arguments.length>=1 && arguments[0]==5) {
    this.tipodemoneda="EUR";
    this.cantidadlimite=8000;

  }
  else {
    this.tipodemoneda="USD";
    this.cantidadlimite=10000;
  }

  if (arguments.length>=2 && typeof(arguments[1])=="string" && arguments[1].length>=1 && arguments[1].length<=127) {
    this.iddelpedido=arguments[1];
  }
  else {
    this.iddelpedido="";
  }
  this.preciodelcarro=0;
  this.correonegocio="";
  this.botonnormal=true;
  this.rutaimagen="";
  this.etiquetaboton="";
  this.codigodeerror=0;
  this.destino="";
  this.paginadefinalizacion="";
  this.paginadeerror="";
  this.SetCurrencyType=GenericPaypalShopingCartButton_SetCurrencyType;
  this.GetCurrencyType=GenericPaypalShopingCartButton_GetCurrencyType;
  this.SetOrderID=GenericPaypalShopingCartButton_SetOrderID;
  this.GetOrderID=GenericPaypalShopingCartButton_GetOrderID;
  this.SetCartAmount=GenericPaypalShopingCartButton_SetCartAmount;
  this.GetCartAmount=GenericPaypalShopingCartButton_GetCartAmount;
  this.SetEmail=GenericPaypalShopingCartButton_SetEmail;
  this.GetEmail=GenericPaypalShopingCartButton_GetEmail;
  this.SetFinishPage=GenericPaypalShopingCartButton_SetFinishPage;
  this.GetFinishPage=GenericPaypalShopingCartButton_GetFinishPage;
  this.SetCancelPage=GenericPaypalShopingCartButton_SetCancelPage;
  this.GetCancelPage=GenericPaypalShopingCartButton_GetCancelPage;
  this.SetButtonType=GenericPaypalShopingCartButton_SetButtonType;
  this.GetButtonType=GenericPaypalShopingCartButton_GetButtonType;
  this.SetLabel=GenericPaypalShopingCartButton_SetLabel;
  this.GetLabel=GenericPaypalShopingCartButton_GetLabel;
  this.SetImage=GenericPaypalShopingCartButton_SetImage;
  this.GetImage=GenericPaypalShopingCartButton_GetImage;
  this.GetErrorCode=GenericPaypalShopingCartButton_GetErrorCode;
  this.GetMaximumQuantityOfMoney=GenericPaypalShopingCartButton_GetMaximumQuantityOfMoney; 
  this.SetTarget=GenericPaypalShopingCartButton_SetTarget;
  this.GetTarget=GenericPaypalShopingCartButton_GetTarget;
  this.CreateButton=GenericPaypalShopingCartButton_CreateButton;
}