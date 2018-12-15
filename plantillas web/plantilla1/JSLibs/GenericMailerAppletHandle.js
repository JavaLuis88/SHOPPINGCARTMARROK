function GenericMailerAppletHandle_SetName(nombre) {

  if (typeof(nombre)=="string") {
    this.nombre=nombre;
  } 

}
function GenericMailerAppletHandle_GetName() {

  return this.nombre;

}

function GenericMailerAppletHandle_SetServer(servidor) {

  if (typeof(this.nombre)=="string" && this.nombre!="") {
    document.applets[this.nombre].setServer(servidor);
  } 

}

function GenericMailerAppletHandle_GetServer() {

  if (typeof(this.nombre)=="string" && this.nombre!="") {
    return document.applets[this.nombre].getServer();
  } 
  else {
   return null; 
  }
}

function GenericMailerAppletHandle_SetPort(puerto) {
  if (typeof(this.nombre)=="string" &&  this.nombre!="" && typeof(puerto)=="number" && parseInt(puerto)==puerto && puerto>=1) {
    document.applets[this.nombre].setPort(puerto);
  } 

}

function GenericMailerAppletHandle_GetPort() {

  if (typeof(this.nombre)=="string" || this.nombre!="") {
    return document.applets[this.nombre].getPort();
  } 
  else {
   return null; 
  }
}


function GenericMailerAppletHandle_SetFrom(from) {

  if (typeof(this.nombre)=="string" && this.nombre!="") {
    document.applets[this.nombre].setFrom(from);
  } 

}

function GenericMailerAppletHandle_GetFrom() {

  if (typeof(this.nombre)=="string" && this.nombre!="") {
    return document.applets[this.nombre].getFrom();
  } 
  else {
   return null; 
  }
}
function GenericMailerAppletHandle_SetTo(to) {

  if (typeof(this.nombre)=="string" && this.nombre!="") {
    document.applets[this.nombre].setTo(to);
  } 

}

function GenericMailerAppletHandle_GetTo() {

  if (typeof(this.nombre)=="string" && this.nombre!="") {
    return document.applets[this.nombre].getTo();
  } 
  else {
   return null; 
  }
}


function GenericMailerAppletHandle_SetLogin(login) {

  if (typeof(this.nombre)=="string" && this.nombre!="") {
    document.applets[this.nombre].setLogin(login);
  } 

}

function GenericMailerAppletHandle_GetLogin() {

  if (typeof(this.nombre)=="string" && this.nombre!="") {
    return document.applets[this.nombre].getLogin();
  } 
  else {
   return null; 
  }
}

function GenericMailerAppletHandle_SetPassword(password) {

  if (typeof(this.nombre)=="string" && this.nombre!="") {
    document.applets[this.nombre].setPassword(password);
  } 

}

function GenericMailerAppletHandle_GetPassword() {

  if (typeof(this.nombre)=="string" && this.nombre!="") {
    return document.applets[this.nombre].getPassword();
  } 
  else {
   return null; 
  }
}
function GenericMailerAppletHandle_SetSubject(asunto) {

  if (typeof(this.nombre)=="string" && this.nombre!="") {
    document.applets[this.nombre].setSubject(asunto);
  } 

}

function GenericMailerAppletHandle_GetSubject() {

  if (typeof(this.nombre)=="string" && this.nombre!="") {
    return document.applets[this.nombre].getSubject();
  } 
  else {
   return null; 
  }
}

function GenericMailerAppletHandle_SetMessenger(mensaje) {

  if (typeof(this.nombre)=="string" && this.nombre!="") {
    document.applets[this.nombre].setMessenger(mensaje);
  } 

}

function GenericMailerAppletHandle_GetMessenger() {

  if (typeof(this.nombre)=="string" && this.nombre!="") {
    return document.applets[this.nombre].getMessenger();
  } 
  else {
   return null; 
  }
}
function GenericMailerAppletHandle_Send() {

  if (typeof(this.nombre)=="string" && this.nombre!="") {
    return document.applets[this.nombre].Send();
  } 
  else {
   return null; 
  }
}
function GenericMailerAppletHandle() {


  if (arguments.length>=1 && typeof(arguments[0])=="string") {
    this.nombre=arguments[0];
  }
  else {
    this.nombre="";
  }
  this.SetName=GenericMailerAppletHandle_SetName;
  this.GetName=GenericMailerAppletHandle_GetName;
  this.SetServer=GenericMailerAppletHandle_SetServer;
  this.GetServer=GenericMailerAppletHandle_GetServer;
  this.SetPort=GenericMailerAppletHandle_SetPort;
  this.GetPort=GenericMailerAppletHandle_GetPort;
  this.SetFrom=GenericMailerAppletHandle_SetFrom;
  this.GetFrom=GenericMailerAppletHandle_GetFrom;
  this.SetTo=GenericMailerAppletHandle_SetTo;
  this.GetTo=GenericMailerAppletHandle_GetTo;
  this.SetLogin=GenericMailerAppletHandle_SetLogin;
  this.GetLogin=GenericMailerAppletHandle_GetLogin;
  this.SetPassword=GenericMailerAppletHandle_SetPassword;
  this.GetPassword=GenericMailerAppletHandle_GetPassword;
  this.SetSubject=GenericMailerAppletHandle_SetSubject;
  this.GetSubject=GenericMailerAppletHandle_GetSubject;
  this.SetMessenger=GenericMailerAppletHandle_SetMessenger;
  this.GetMessenger=GenericMailerAppletHandle_GetMessenger;
  this.Send=GenericMailerAppletHandle_Send;
}
