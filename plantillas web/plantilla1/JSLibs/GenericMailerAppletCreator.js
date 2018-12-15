function GenericMailerAppletCreator_SetName(nombre) {

  if (typeof(nombre)=="string") {
    this.nombre=nombre;
  } 

}
function GenericMailerAppletCreator_GetName() {

  return this.nombre;

}

function GenericMailerAppletCreator_SetServer(servidor) {

  if (typeof(servidor)=="string") {
    this.servidor=servidor;
  } 

}
function GenericMailerAppletCreator_GetServer() {

  return this.servidor;

}

function GenericMailerAppletCreator_SetPort(puerto) {

  if (typeof(puerto)=="number" && parseInt(puerto)==puerto && puerto>=1) {
    this.puerto=puerto;
  }

}

function GenericMailerAppletCreator_GetPort() {

  return this.puerto;

}

function GenericMailerAppletCreator_SetFrom(from) {

  if (typeof(from)=="string") {
    this.from=from;
  } 

}
function GenericMailerAppletCreator_GetFrom() {

  return this.from;

}

function GenericMailerAppletCreator_SetTo(to) {

  if (typeof(to)=="string") {
    this.to=to;
  } 

}
function GenericMailerAppletCreator_GetTo() {

  return this.to;

}

function GenericMailerAppletCreator_SetLogin(login) {

  if (typeof(login)=="string") {
    this.login=login;
  } 

}
function GenericMailerAppletCreator_GetLogin() {

  return this.login;

}

function GenericMailerAppletCreator_SetPassword(password) {

  if (typeof(password)=="string") {
    this.password=password;
  } 

}
function GenericMailerAppletCreator_GetPassword() {

  return this.password;

}

function GenericMailerAppletCreator_SetSubject(asunto) {

  if (typeof(asunto)=="string") {
    this.asunto=asunto;
  } 

}
function GenericMailerAppletCreator_GetSubject() {

  return this.asunto;

}

function GenericMailerAppletCreator_SetMessenger(mensaje) {

  if (typeof(mensaje)=="string") {
    this.mensaje=mensaje;
  } 

}
function GenericMailerAppletCreator_GetMessenger() {

  return this.mensaje;

}

function GenericMailerAppletCreator_SetCodeBase(directoriobase) {

  this.directoriobase=directoriobase;

}

function GenericMailerAppletCreator_GetCodeBase() {

  return this.directoriobase;

}

function GenericMailerAppletCreator_SetArchive(archivo) {

  if (typeof(archivo)=="string") {
    this.archivo=archivo;
  } 

}
function GenericMailerAppletCreator_GetArchive() {

  return this.archivo;

}

function GenericMailerAppletCreator_CreateTag() {
  var cadenares="";
  if (this.nombre=="") {
    return "";
  }
  cadenares="<APPLET CODE=\"GenericMailerApplet.class\" HEIGHT=0 WIDTH=0 NAME=\"" + this.nombre + "\"";
  
  if (this.directoriobase!="") {
    cadenares=cadenares+" CODEBASE=\"" + this.directoriobase + "\"";
  }

  if (this.archivo!="") {
    cadenares=cadenares+" ARCHIVE=\"" + this.archivo + "\"";
  }
  cadenares=cadenares+">\n";
  if (this.servidor!="") {
    cadenares=cadenares+"<PARAM NAME=\"SERVER\" VALUE=\"" + this.servidor + "\">\n";
  }
  if (this.puerto!=25) {
    cadenares=cadenares+"<PARAM NAME=\"PORT\" VALUE=\"" + this.puerto + "\">\n";
  }
  if (this.from!="") {
    cadenares=cadenares+"<PARAM NAME=\"FROM\" VALUE=\"" + this.from + "\">\n";
  }
  if (this.to!="") {
    cadenares=cadenares+"<PARAM NAME=\"TO\" VALUE=\"" + this.to + "\">\n";
  }
  if (this.login!="") {
    cadenares=cadenares+"<PARAM NAME=\"LOGIN\" VALUE=\"" + this.login + "\">\n";
  }
  if (this.password!="") {
    cadenares=cadenares+"<PARAM NAME=\"PASSWORD\" VALUE=\"" + this.password + "\">\n";
  }
  if (this.asunto!="") {
    cadenares=cadenares+"<PARAM NAME=\"SUBJECT\" VALUE=\"" + this.asunto + "\">\n";
  }
  if (this.mensaje!="") {
    cadenares=cadenares+"<PARAM NAME=\"MESSENGER\" VALUE=\"" + this.mensaje + "\">\n";
  }
  cadenares=cadenares+"</APPLET>\n";
  return cadenares;
}

function GenericMailerAppletCreator() {

  if (arguments.length>=1 && typeof(arguments[0])=="string") {
    this.nombre=arguments[0];
  }
  else {
    this.nombre="";
  }
  this.servidor="";
  this.puerto=25;
  this.from="";
  this.to="";
  this.login=""
  this.password=""
  this.asunto="";
  this.mensaje="";
  this.directoriobase="";
  this.archivo="";
  this.SetName=GenericMailerAppletCreator_SetName;
  this.GetName=GenericMailerAppletCreator_GetName;
  this.SetServer=GenericMailerAppletCreator_SetServer;
  this.GetServer=GenericMailerAppletCreator_GetServer;
  this.SetPort=GenericMailerAppletCreator_SetPort;
  this.GetPort=GenericMailerAppletCreator_GetPort;
  this.SetFrom=GenericMailerAppletCreator_SetFrom;
  this.GetFrom=GenericMailerAppletCreator_GetFrom;
  this.SetTo=GenericMailerAppletCreator_SetTo;
  this.GetTo=GenericMailerAppletCreator_GetTo;
  this.SetLogin=GenericMailerAppletCreator_SetLogin;
  this.GetLogin=GenericMailerAppletCreator_GetLogin;
  this.SetPassword=GenericMailerAppletCreator_SetPassword;
  this.GetPassword=GenericMailerAppletCreator_GetPassword;
  this.SetSubject=GenericMailerAppletCreator_SetSubject;
  this.GetSubject=GenericMailerAppletCreator_GetSubject;
  this.SetMessenger=GenericMailerAppletCreator_SetMessenger;
  this.GetMessenger=GenericMailerAppletCreator_GetMessenger;
  this.SetCodeBase=GenericMailerAppletCreator_SetCodeBase;
  this.GetCodeBase=GenericMailerAppletCreator_GetCodeBase;
  this.SetArchive=GenericMailerAppletCreator_SetArchive;
  this.GetArchive=GenericMailerAppletCreator_GetArchive;
  this.CreateTag=GenericMailerAppletCreator_CreateTag;
}
