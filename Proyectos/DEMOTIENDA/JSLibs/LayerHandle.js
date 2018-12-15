/////////////////////////////////////////////
//Librerias JavaScript de las que depende:// 
//Version de JavaScript requerida: 1.2+  //
//////////////////////////////////////////

////////////////////////////////////////////////////////
//Rutinas para la manipulacion dinamica de capas html//
//////////////////////////////////////////////////////

/////////////////////////////////////////////
//Estas rutinas permiten la manipulacion  //
//dinamica de capas HTML una vez que han //
//sido creadas a mano, o con la libreria//
//LayerCreator                         //
////////////////////////////////////////

//////////////////////////////////////////////////////////////
//LayerHandle_GetErrorCode()                               //
//Devuelve un numero entero que                           //
//sera 0 si no se produjo                                //
//ningun error al ejecutar los                          //
//metodos de la clase (ya que                          //
//todos los metodos salvo                             //
//SetName y GetName generan                          //
//errores), 1 si el navegador                       //
//no soporta el DOM del W3C ni                     //
//el de IE4+ ni el de NN4+, 2                     //
//si no se especifico ningun                     //
//nombre de capa valido, 3 si                   //
//no se especifico un valor                    //
//valido para la cordenada y, 4               //
//si no se especifico un valor               //
//valido para la cordenada x, 5             //                 
//si no se especifico un valor             //
//valido para la altura de la             //
//capa, 6 si no se especifico            //
//un valor valido para la               //
//anchura de la capa, 7 si no          //
//se introdujo un valor valido        //
//para la cordenada z, 8 si no       //
//se introdujo un valor valido      //
//para indicar la visibilidad      //
//de la capa, y 9 si no se        //
//introdujo un valor valido      //
//para los comandos que se      //
//desean ejecutar en la capa   //  
////////////////////////////////

function LayerHandle_GetErrorCode() {

  return this.errorcode;

}

///////////////////////////////////////
//LayerHandle_GetDOMType()          //
//Devuelve un numero entero        //
//que sera 1 si el                //
//navegador soporta el DOM       //
//del W3C, 2 si el              //
//navegador soporta el DOM     //
//de IE4+, 3 si el            //
//navegador soporta el DOM   //
//de NN4+, y 0 en cualquier //
//otro caso                // 
////////////////////////////

function LayerHandle_GetDOMType() {

  if (document.getElementById) {

    return 1;

  }
  else if (document.all) {

    return 2;

  }
  else if (document.layers) {
  
    return 3;

  }
  else {

    return 0;

  }
 
}

//////////////////////////////////////////
//LayerHandle_SetName(nombre)          //
//Devuelve nada, solo establece       //
//el nombre de la capa que se        //
//desea manipular.                  //
//Los valores que admite son:      //
//nombre: una cadena de           //
//caractereres que especifica    // 
//el nombre de la capa que se   //
//desea manipular              //
////////////////////////////////

function LayerHandle_SetName(nombre) {

  this.nombre=nombre;

}

//////////////////////////////
//LayerHandle_GetName()    //
//Devuelve el nombre de la// 
//capa que se desea      //
//manipular             //
/////////////////////////

function LayerHandle_GetName() {

  return this.nombre;

}

/////////////////////////////////////////
//LayerHandle_SetTop(arriba)          //
//Devuelve nada, solo establece      //
//la posicion de la cordenada y     //
//de la capa.                      //
//Los valores que admite son:     //
//arriba: un numero entero que   //
//especifica la posicion de la  //
//cordenada y de la capa       //
////////////////////////////////

function LayerHandle_SetTop(arriba) {

  this.errorcode=0;
  if (this.GetDOMType()==0) {

    this.errorcode=1;
    return;
  } 

  if (typeof(this.nombre)!="string" || this.nombre=="") {

    this.errorcode=2;
    return;
 }

  if (typeof(arriba)!="number" || parseInt(arriba)!=arriba) {
    this.errorcode=3;
    return;
  }

  if (this.GetDOMType()==1) {
    document.getElementById(this.nombre).style.top=arriba;    
  }
  else if (this.GetDOMType()==2) {
    document.all(this.nombre).style.top=arriba;
  }
  else {
    document.layers[this.nombre].top=arriba;
  }

  return;  

}

///////////////////////////////////
//LayerHandle_GetTop()          //
//Devuelve a posicion de       //
//la cordenada y de la        //
//capa, o un 0 si se         //
//produce un error en,      //
//tal caso hay que         //
//consultar el metodo     //
//GetErrorCode para mas  //
//informacion           //
/////////////////////////

function LayerHandle_GetTop() {

  this.errorcode=0;
  if (this.GetDOMType()==0) {

    this.errorcode=1;
    return 0;
  } 

  if (typeof(this.nombre)!="string" || this.nombre=="") {

    this.errorcode=2;
    return 0;
  }

  if (this.GetDOMType()==1) {
    return parseInt(document.getElementById(this.nombre).style.top);   
  }
  else if (this.GetDOMType()==2) {
    return parseInt(document.all(this.nombre).style.top);
  }
  else {
    return parseInt(document.layers[this.nombre].top);
  }

   

}

/////////////////////////////////////////
//LayerHandle_SetLeft(izquierda)      //
//Devuelve nada, solo establece la   //
//posicion de la cordenada x de la  //
//capa.                            //
//Los valores que admite son:     //
//izquierda: un numero entero que//
//especifica la posicion de la  //
//cordenada x de la capa       //
////////////////////////////////

function LayerHandle_SetLeft(izquierda) {

  this.errorcode=0;
  if (this.GetDOMType()==0) {

    this.errorcode=1;
    return;
  } 

  if (typeof(this.nombre)!="string" || this.nombre=="") {

    this.errorcode=2;
    return;
 }

  if (typeof(izquierda)!="number" || parseInt(izquierda)!=izquierda) {
    this.errorcode=4;
    return;
  }

  if (this.GetDOMType()==1) {
    document.getElementById(this.nombre).style.left=izquierda;    
  }
  else if (this.GetDOMType()==2) {
    document.all(this.nombre).style.left=izquierda;
  }
  else {
    document.layers[this.nombre].left=izquierda;
  }

  return;  

}

///////////////////////////////////
//LayerHandle_GetLeft()         //
//Devuelve a posicion de       //
//la cordenada x de la        //
//capa, o un 0 si se         //
//produce un error en,      //
//tal caso hay que         //
//consultar el metodo     //
//GetErrorCode para mas  //
//informacion           //
/////////////////////////

function LayerHandle_GetLeft() {

  this.errorcode=0;
  if (this.GetDOMType()==0) {

    this.errorcode=1;
    return 0;
  } 

  if (typeof(this.nombre)!="string" || this.nombre=="") {

    this.errorcode=2;
    return 0;
  }

  if (this.GetDOMType()==1) {
    return parseInt(document.getElementById(this.nombre).style.left);   
  }
  else if (this.GetDOMType()==2) {
    return parseInt(document.all(this.nombre).style.left);
  }
  else {
    return parseInt(document.layers[this.nombre].left);
  }

   

}

///////////////////////////////////////////
//LayerHandle_SetHeight(altura)         //
//Devuelve nada, solo establece la     //
//altura de la capa.                  //
//Los valores que admite son:        //
//altura :un numero entero mayor o  //
//igual que 0 que especifica la    //
//altura de la capa               //
///////////////////////////////////

function LayerHandle_SetHeight(altura) {

  this.errorcode=0;
  if (this.GetDOMType()==0) {

    this.errorcode=1;
    return;
  } 

  if (typeof(this.nombre)!="string" || this.nombre=="") {

    this.errorcode=2;
    return;
 }

  if (typeof(altura)!="number" || parseInt(altura)!=altura || altura<0) {
    this.errorcode=5;
    return;
  }

  if (this.GetDOMType()==1) {
    document.getElementById(this.nombre).style.height=altura;    
  }
  else if (this.GetDOMType()==2) {
    document.all(this.nombre).style.height=altura;
  }
  else {
    document.layers[this.nombre].clip.height=altura;
  }

  return;  

}

///////////////////////////////////
//LayerHandle_GetHeight()       //
//Devuelve la altura de la     //
//capa, o un 0 si se          //
//produce un error en, tal   //
//caso hay que consultar    //
//el metodo GetErrorCode   //
//para mas informacion    //
///////////////////////////

function LayerHandle_GetHeight() {

  this.errorcode=0;
  if (this.GetDOMType()==0) {

    this.errorcode=1;
    return 0;
  } 

  if (typeof(this.nombre)!="string" || this.nombre=="") {

    this.errorcode=2;
    return 0;
  }

  if (this.GetDOMType()==1) {
    return parseInt(document.getElementById(this.nombre).style.height);   
  }
  else if (this.GetDOMType()==2) {
    return parseInt(document.all(this.nombre).style.height);
  }
  else {
    return parseInt(document.layers[this.nombre].clip.height);
  }

   

}

///////////////////////////////////////////
//LayerHandle_SetWidth(anchura)         //
//Devuelve nada, solo establece la     //
//anchura de la capa.                 //
//Los valores que admite son:        //
//anchura: un numero entero mayor   //
//o igual que 0 que especifica la  //
//anchura de la capa              //
///////////////////////////////////

function LayerHandle_SetWidth(anchura) {

  this.errorcode=0;
  if (this.GetDOMType()==0) {

    this.errorcode=1;
    return;
  } 

  if (typeof(this.nombre)!="string" || this.nombre=="") {

    this.errorcode=2;
    return;
 }

  if (typeof(anchura)!="number" || parseInt(anchura)!=anchura || anchura<0) {
    this.errorcode=6;
    return;
  }

  if (this.GetDOMType()==1) {
    document.getElementById(this.nombre).style.width=anchura;    
  }
  else if (this.GetDOMType()==2) {
    document.all(this.nombre).style.width=anchura;
  }
  else {
    document.layers[this.nombre].clip.width=anchura;
  }

  return;  

}

///////////////////////////////////
//LayerHandle_GetWidth()        //
//Devuelve la anchura de la    //
//capa, o un 0 si se          //
//produce un error en, tal   //
//caso hay que consultar el // 
//metodo GetErrorCode para //
//mas informacion         //
///////////////////////////

function LayerHandle_GetWidth() {

  this.errorcode=0;
  if (this.GetDOMType()==0) {

    this.errorcode=1;
    return 0;
  } 

  if (typeof(this.nombre)!="string" || this.nombre=="") {

    this.errorcode=2;
    return 0;
  }

  if (this.GetDOMType()==1) {
    return parseInt(document.getElementById(this.nombre).style.width);   
  }
  else if (this.GetDOMType()==2) {
    return parseInt(document.all(this.nombre).style.width);
  }
  else {
    return parseInt(document.layers[this.nombre].clip.width);
  }

   

}

///////////////////////////////////////////
//LayerHandle_SetZindex(zindex)         //
//Devuelve nada, solo establece la     //
//cordenada z de la capa.             //
//Los valores que admite son:        //
//zindex: un numero entero mayor o  //
//igual que 0 que especifica la    //
//codenada z de capa              //
///////////////////////////////////

function LayerHandle_SetZindex(zindex) {

  this.errorcode=0;
  if (this.GetDOMType()==0) {

    this.errorcode=1;
    return;
  } 

  if (typeof(this.nombre)!="string" || this.nombre=="") {

    this.errorcode=2;
    return;
 }

  if (typeof(zindex)!="number" || parseInt(zindex)!=zindex || zindex<0) {
    this.errorcode=7;
    return;
  }

  if (this.GetDOMType()==1) {
    document.getElementById(this.nombre).style.zIndex=zindex;    
  }
  else if (this.GetDOMType()==2) {
    document.all(this.nombre).style.zIndex=zindex;
  }
  else {
    document.layers[this.nombre].zIndex=zindex;
  }

  return;  

}

///////////////////////////////////
//LayerHandle_GetZindex()       //
//Devuelve la cordenada z de   //
//la capa, o un 0 si se       //
//produce un error en, tal   //
//caso hay que consultar el // 
//metodo GetErrorCode para //
//mas informacion         //
///////////////////////////

function LayerHandle_GetZindex() {

  this.errorcode=0;
  if (this.GetDOMType()==0) {

    this.errorcode=1;
    return 0;
  } 

  if (typeof(this.nombre)!="string" || this.nombre=="") {

    this.errorcode=2;
    return 0;
  }

  if (this.GetDOMType()==1) {
    return parseInt(document.getElementById(this.nombre).style.zIndex);   
  }
  else if (this.GetDOMType()==2) {
    return parseInt(document.all(this.nombre).style.zIndex);
  }
  else {
    return parseInt(document.layers[this.nombre].zIndex);
  }

   

}

///////////////////////////////////////////////////
//LayerHandle_SetVisibility(visibilidad)        //
//Devuelve nada, solo establece si la capa     //
//sera visible (true) o no (false).           //
//los valores que admite son:                //
//visibilidad: un valor booleano que        //
//especifica si la capa sera visible       //
//(true) o no (false)                     //
///////////////////////////////////////////

function LayerHandle_SetVisibility(visibilidad) {
  this.errorcode=0;
  if (this.GetDOMType()==0) {

    this.errorcode=1;
    return;
  } 

  if (typeof(this.nombre)!="string" || this.nombre=="") {

    this.errorcode=2;
    return;
 }

  if (typeof(visibilidad)!="boolean") {
    this.errorcode=8;
    return;
  }

  if (this.GetDOMType()==1) {
    if (visibilidad==true) {
      document.getElementById(this.nombre).style.visibility="visible";    
    }
    else {
      document.getElementById(this.nombre).style.visibility="hidden";
    }
  }
  else if (this.GetDOMType()==2) {
    if (visibilidad==true) {
      document.all(this.nombre).style.visibility="visible";    
    }
    else {
      document.all(this.nombre).style.visibility="hidden";
    }
  }
  else {
    if (visibilidad==true) {
      document.layers[this.nombre].visibility="show";    
    }
    else {
      document.layers[this.nombre].visibility="hide";
    }

    
  }

  return;  

}

////////////////////////////////////////////
//LayerHandle_GetVisibility()            //
//Devuelve el estado de visibilidad     //
//de la capa, el cual depende del      //
//navegador sobre el que esta la      //
//capa, o unas cadenas vacias si se  //
//produce un error, en tal caso hay //
//que consultar el metodo          // 
//GetErrorCode                    //
///////////////////////////////////

function LayerHandle_GetVisibility() {

  this.errorcode=0;
  if (this.GetDOMType()==0) {

    this.errorcode=1;
    return "";
  } 

  if (typeof(this.nombre)!="string" || this.nombre=="") {

    this.errorcode=2;
    return "";
  }

  if (this.GetDOMType()==1) {
    return document.getElementById(this.nombre).style.visibility;   
  }
  else if (this.GetDOMType()==2) {
    return document.all(this.nombre).style.visibility;
  }
  else {
    return document.layers[this.nombre].visibility;
  }

   

}

//////////////////////////////////
//LayerHandle_clear()          //
//Devuelve nada, solo procede //
//a borrar el contenido de la// 
//capa                      //
/////////////////////////////

function LayerHandle_clear() {

  this.errorcode=0;
  if (this.GetDOMType()==0) {

    this.errorcode=1;
    return;
  } 

  if (typeof(this.nombre)!="string" || this.nombre=="") {

    this.errorcode=2;
    return;
  }

  if (this.GetDOMType()==1) {
    document.getElementById(this.nombre).innerHTML="";   
  }
  else if (this.GetDOMType()==2) {
    document.all(this.nombre).innerHTML="";
  }
  else {
    document.layers[this.nombre].document.open();
    document.layers[this.nombre].document.write("");
    document.layers[this.nombre].document.close();

  }
  return;
}

////////////////////////////////////////////
//LayerHandle_writeHTML(contenido)       //
//Devuelve nada, solo procede a escribir//
//lo que haya en contenido en la capa  //
////////////////////////////////////////

function LayerHandle_writeHTML(contenido) {

  this.errorcode=0;
  if (this.GetDOMType()==0) {

    this.errorcode=1;
    return;
  } 

  if (typeof(this.nombre)!="string" || this.nombre=="") {

    this.errorcode=2;
    return;
  }

  this.clear();

  if (this.GetDOMType()==1) {
    document.getElementById(this.nombre).innerHTML=contenido;   
  }
  else if (this.GetDOMType()==2) {
    document.all(this.nombre).innerHTML=contenido;
  }
  else {
    document.layers[this.nombre].document.open();
    document.layers[this.nombre].document.write(contenido);
    document.layers[this.nombre].document.close();

  }
  return;
}

//////////////////////////////////////////////////////////
//LayerHandle_ExecCommand(comandos)                    //
//Devuelve el resultado de ejecutar los               //
//comandos contendos en comandos, o                  //
//unas cadenas vacias si se produce un              //
//error, en tal caso hay que consultar             //
//el metodo GetErrorCode para mas                 // 
//informacion.                                   //
//Los valores que admite son:                   //
//comandos: un array de cadenas de             //
//caracteres de tres dimensiones en el        //
//que en la dimension 0 estaran los          //
//comandos para los navegadores con el      //
//DOM del W3C, en la dimension 1 los       //
//comandos para los navegadores con el    //
//DOM del IE4+, y en la dimension 2 los  //
//comandos para los navegadores con el  //
//DOM del NN4+                         //
////////////////////////////////////////

function LayerHandle_ExecCommand(comandos) {

  var cadenacomando; 
  this.errorcode=0;
 
  if (this.GetDOMType()==0) {

    this.errorcode=1;
    return "";
  } 

  if (typeof(this.nombre)!="string" || this.nombre=="") {

    this.errorcode=2;
    return "";
  }

  if (typeof(comandos)!="object" || comandos.length!=3 || typeof(comandos[0])!="string" || typeof(comandos[1])!="string" || typeof(comandos[2])!="string") {

    
    this.errorcode=2;
    return "";

  }

  if (this.GetDOMType()==1 && comandos[0]!="") {
    cadenacomando="document.getElementById(\"" + this.nombre + "\")";
    cadenacomando=cadenacomando+"." + comandos[0] + ";";
    return eval(cadenacomando);
  }
  else if (this.GetDOMType()==2 && comandos[1]!="") {

    cadenacomando="document.all(\"" + this.nombre + "\")";
    cadenacomando=cadenacomando+"." + comandos[1] + ";";
    return eval(cadenacomando);

  }
  else if (comandos[2]!="") {

    cadenacomando="document.layers[\"" + this.nombre + "\"]";
    cadenacomando=cadenacomando+"." + comandos[2] + ";";
    return eval(cadenacomando);

  }
  else {
  

    return "";

  }

}

////////////////////////////////////////
//LayerHandle([nombre])              //
//Devuelve una referencia           //
//a un objeto LayerHandle          //
//Valido.                         //
//Los valores que admite         //
//son:                          //
//nombre: un valor             //
//opcional, que ha de ser     //
//una cadena de              //
//caracteres, que           //
//especifica el nombre de  //
//la capa que se desea    //
//manipular              // 
//////////////////////////

function LayerHandle() {

  if (arguments.length>=1) {

    this.nombre=arguments[0];

  }
  else {

    this.nombre="";

  }

  this.errorcode=0;


  this.GetErrorCode=LayerHandle_GetErrorCode;
  this.GetDOMType=LayerHandle_GetDOMType;
  this.SetName=LayerHandle_SetName;
  this.GetName=LayerHandle_GetName;
  this.SetTop=LayerHandle_SetTop;
  this.GetTop=LayerHandle_GetTop;
  this.SetLeft=LayerHandle_SetLeft;
  this.GetLeft=LayerHandle_GetLeft;
  this.SetHeight=LayerHandle_SetHeight;
  this.GetHeight=LayerHandle_GetHeight;
  this.SetWidth=LayerHandle_SetWidth;
  this.GetWidth=LayerHandle_GetWidth;
  this.SetZindex=LayerHandle_SetZindex;
  this.GetZindex=LayerHandle_GetZindex;
  this.SetVisibility=LayerHandle_SetVisibility;
  this.GetVisibility=LayerHandle_GetVisibility;
  this.clear=LayerHandle_clear;
  this.writeHTML=LayerHandle_writeHTML;
  this.ExecCommand=LayerHandle_ExecCommand;

}
