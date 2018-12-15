/////////////////////////////////////////////
//Librerias JavaScript de las que depende:// 
//Version de JavaScript requerida: 1.2+  //
//////////////////////////////////////////

///////////////////////////////////////////
//Rutinas para la creacion de capas HTML//
/////////////////////////////////////////


//////////////////////////////////////////////
//Esta rutinas permiten la creacion del    //
//codigo HTML para crear una capa HTML    //
//segun las caractericticas que .        //
//especifiquemos sin embargo no permite //
//la modificacion dinamica de las capas// 
////////////////////////////////////////

///////////////////////////////////////////
//LayerCreator_SetName(nombre)          //
//Devuelve nada, solo procede ha       //
//asignar un nuevo nombre a la        //
//capa.                              //
//Los valores que admite son:       //
//nombre: el cual ha de ser una    //
//cadena de caracteres que        //
//especifica el nombre de la     //
//capa                          //
/////////////////////////////////

function LayerCreator_SetName(nombre) {


  this.nombre=nombre;
  
}

///////////////////////////////
//LayerCreator_GetName()    //
//Devuelve el nombre de la //
//capa HTML               //
///////////////////////////

function LayerCreator_GetName() {


  return this.nombre;

}

//////////////////////////////////////////////////////////////////////
//LayerCreator_SetAbsolutePosition(usarposicionabsoluta)           //
//Devuelve nada, solo establece si la capa usara una posicion     //
//absoluta (true) o relativa (false).                            //
//los valores que admitite son:                                 //
//usarposicionabsoluta: un valor booleano que indica si la     //
//capa usara un posicionamiento absoluto (true) o relativo    //
//(false)                                                    //
//////////////////////////////////////////////////////////////

function LayerCreator_SetAbsolutePosition(usarposicionabsoluta) {

  this.usarposicionabsoluta=usarposicionabsoluta;


}

///////////////////////////////////////////
//LayerCreator_GetAbsolutePosition()    //
//Devuelve el posicionamiento que usara//
//la capa                             //
///////////////////////////////////////

function LayerCreator_GetAbsolutePosition() {

  return this.usarposicionabsoluta;


}

/////////////////////////////////////////
//LayerCreator_SetTop(arriba)         //
//Devuelve nada, solo establece      //
//la posicion de la cordenada y     //
//de la capa.                      //
//Los valores que admite son:     //
//arriba: un numero entero que   //
//especifica la posicion de la  //
//cordenada y de la capa       //
////////////////////////////////

function LayerCreator_SetTop(arriba) {

  this.arriba=arriba;

}

/////////////////////////////
//LayerCreator_GetTop()   //
//Devuelve la posicion de//
//la cordenada y de la  //
//capa                 //
////////////////////////

function LayerCreator_GetTop() {

  return this.arriba;

}

///////////////////////////////////////////
//LayerCreator_SetLeft(izquierda)       //
//Devuelve nada, solo establece la     // 
//cordenada x de la capa.             //
//Los valores que admie son:         //
//izquierda: un numero entero que   //
//especifica la posicion de la     //
//cordenada x de la capa          //
///////////////////////////////////

function LayerCreator_SetLeft(izquierda) {

  this.izquierda=izquierda;

}

/////////////////////////////
//LayerCreator_GetLeft()  //
//Devuelve la posicion de//
//la cordenada x de la  //
//capa                 //
////////////////////////

function LayerCreator_GetLeft() {

  return this.izquieda;

}

////////////////////////////////////////////////
//LayerCreator_SetHeight(altura)             //
//Devuelve nada, solo estable la altura     //
//de la capa.                              //
//Los valores que admite son:             //
//altura un numero entero mayor o igual  //
//que cero especifica la altura de la   //
//capa                                 //
////////////////////////////////////////

function LayerCreator_SetHeight(altura) {

  this.altura=altura;

}

//////////////////////////////////
//LayerCreator_GetHeight()     //
//Devuelve a altura de la capa//
///////////////////////////////

function LayerCreator_GetHeight() {

  return this.altura;

}

///////////////////////////////////////////
//LayerCreator_SetWidth(anchura)        //
//Devuelve nada, solo establece la     //
//amchura de la capa.                 //
//Los valores que admite son:        //
//anchura: un numero entero mayor   //
//o igual que 0 que especifica la  //
//anchura de la capa              // 
///////////////////////////////////

function LayerCreator_SetWidth(anchura) {

  this.anchura=anchura;

}

///////////////////////////////
//LayerCreator_GetWidth()   //
//Devuelve la anchura de la// 
//capa                    //
///////////////////////////

function LayerCreator_GetWidth() {

  return this.anchura;

}

/////////////////////////////////////////////
//LayerCreator_SetClass(classid)          //
//Devuelve nada, solo establece el       //
//nombre de clase de la hoja de         //
//estilos que afectara a la capa.      //
//Los volores que admite son:         //
//classid: una cadena de             //
//caracteres que especifica el      //
//nombre de la clase de la hoja de //
//estilos que afectara a la capa  // 
///////////////////////////////////

function LayerCreator_SetClass(classid) {

  this.classid=classid;

}

///////////////////////////////////
//LayerCreator_GetClass()       //
//Devuelve el nombre de clase  //
//de la hoja de estilos que   //
//afectara a la capa         //
//////////////////////////////

function LayerCreator_GetClass() {

  return this.classid;

}

/////////////////////////////////////////
//LayerCreator_SetZindex(zindex)      //
//Devuelve nada, solo establece la   //
//cordenada z de la capa.           //
//los valores que admite son:      //
//zindex: un numero entero mayor o//
//igual que 0 que establece la   //
//cordenada z de la capa        //
/////////////////////////////////

function LayerCreator_SetZindex(zindex) {

  this.zindex=zindex;

}

////////////////////////////////
//LayerCreator_GetZindex()   //
//Devuelve la cordenada z de// 
//la capa                  //
////////////////////////////

function LayerCreator_GetZindex() {

  return this.zindex;

}

//////////////////////////////////////////////////
//LayerCreator_SetVisibility(visible)          //
//Devuelve nada, solo establece si la capa    //
//sera visible (true) o no (false).          //
//Los valores que admite son:               //
//visible: un valor booleano que indica si //
//la capa sera visible (true) o no (false)//
///////////////////////////////////////////

function LayerCreator_SetVisibility(visible) {

  this.visible=visible;

}

//////////////////////////////////////
//LayerCreator_GetVisibility()     //
//Devuelve si la capa sera visible// 
//(true) o no (false)            //
//////////////////////////////////

function LayerCreator_GetVisibility() {

  return this.visible

}

////////////////////////////////////////////////////////////////////////
//LayerCreator_GetErrorCode()                                        //
//Devuelve un numero entero que                                     //
//sera 0 si no se produjo un                                       //
//error al ejecutar el metodo                                     //
//CreateOpenTag o                                                //
//CreateCloseTag, 1 si el                                       //
//navegador no soporta el DOM                                  //
//del W3C, IE4+ o NN4+, 2 si no                               //
//se introdujo un nombre de                                  //
//capa valido, 3 si no se                                   //
//introdujo un valor valido                                //
//para indicar si el                                      //
//posicionamiento de la capa                             //
//sera absoluto o relativo, 4                           //
//si no se introdujo un valor                          //
//valido para la posicion de la                       //
//cordenada y, 5 si no se                            //
//introdujo un valor valido                         //
//para la cordenada x, 6 si no                     //
//se introdujo un valor valido                    //
//para la altura de la capa, 7                   //
//si no se introdujo un valor                   //
//valido para la anchura de la                 //
//pagina, 8 si no se introdujo                //
//un valor valido para el                    //
//nombre de la clase de estilos             //
//que afectara a la capa, 9 si             //
//no se introdujo un valor                //
//valido para la cordenada z de          //
//la , 10 si no se introdujo un         //
//valor valido para indicar si         //
//la capa sera visible, o no,         //
//11 si no se introdujo un           //
//valor  valido en el metodo        //
//SetAdditionalStyles, 12 si no    //
//se introdujo un valor valido    //
//en el metodo                   //
//SetAdditionalCommands         //   
/////////////////////////////////

function LayerCreator_GetErrorCode() {

  return this.errorcode;

}

///////////////////////////////////////////////////////////////////
//LayerCreator_SetAdditionalStyles(estilosadicionales)          //
//Devuelve nada, solo establece los estilos adicionales        //
//que se desean añadir a la capa.                             //
//Los valores que admite son:                                //
//estilosadicionales: Un array de cadenas de caracteres     // 
//de tres dimensiones, en el que en la dimension 0         //
//estaran los estilos para los navegadores con el DOM     //
//del W3C, en la dimension 1 los etilos para los         //
//navegadores con el DOM del IE4+, y en la dimension 2  //
//los estilos para los navegadores con el DOM de NN4+  //
////////////////////////////////////////////////////////

function LayerCreator_SetAdditionalStyles(estilosadicionales) {

  this.estilosadicionales=estilosadicionales;

}

//////////////////////////////////////////
//LayerCreator_GetAdditionalStyles()   //
//Devuelve los estilos adicionales que// 
//se desean añadir a la capa         //
//////////////////////////////////////

function LayerCreator_GetAdditionalStyles() {

  return this.estilosadicionales;

}

////////////////////////////////////////////////////////////////////////
//LayerCreator_SetAdditionalCommands(comandosadicionales)            //
//Devuelve nada, solo establece los comandos adicionales que        //
//se desean añadir a la capa.                                      //
//Los valores que admite son:                                     //
//estilosadicionales: Un array de cadenas de caracteres de       //
//tres dimensiones, en el que en la dimension 0 estaran los     //
//comandos para los navegadores con el DOM del W3C, en la      //
//dimension 1 los comandos para los navegadores con el DOM    //
//del IE4+, y en la dimension 2 los comandos para los        //
//navegadores con el DOM de NN4+                            //
/////////////////////////////////////////////////////////////

function LayerCreator_SetAdditionalCommands(comandosadicionales) {

  this.comandosadicionales=comandosadicionales;

}

///////////////////////////////////////////
//LayerCreator_GetAdditionalCommands()  //
//Devuelve los comandos adicionales que//
//se desean añadir a la capa          //
///////////////////////////////////////

function LayerCreator_GetAdditionalCommands() {

  return this.comandosadicionales;

}

////////////////////////////////////////
//LayerCreator_GetDOMType()          //
//Devuelve 1 si el navegador soporta//
//el DOM del W3C, 2 si soporta el  //
//DOM de IE4+, 3 si soporta el DOM//
//de NN4+, y 0 si no soporta     //
//ninguno de estos DOM          //
/////////////////////////////////

function LayerCreator_GetDOMType() {

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

///////////////////////////////////////////
//LayerCreator_CreateOpenTag()          //
//Devuelve una cadena de caracteres    //
//con la etiqueta de apertura de la   //
//capa, o una cadena vacia si se     //
//produce un error, en este ultimo  //
//caso se puede consultar el metodo//
//GetErrorCode() para mas         //
//informacion                    //
//////////////////////////////////

function LayerCreator_CreateOpenTag() {

  var cadenacapa;

  this.errorcode=0;
  if (this.GetDOMType()==0) {
  
    this.errorcode=1;
    return "";

  }
  else if (typeof(this.nombre)!="string" || this.nombre=="") {

    this.errorcode=2;
    return "";

  }
  else if (typeof(this.usarposicionabsoluta)!="boolean") {

    this.errorcode=3;
    return "";

  }
  else if (typeof(this.arriba)!="number" || parseInt(this.arriba)!=this.arriba) {

    this.errorcode=4;
    return "";

  }

  else if (typeof(this.izquierda)!="number" || parseInt(this.izquierda)!=this.izquierda) {

    this.errorcode=5;
    return "";

  }

  else if (typeof(this.altura)!="number" || parseInt(this.altura)!=this.altura || this.altura<0) {

    this.errorcode=6;
    return "";

  }

  else if (typeof(this.anchura)!="number" || parseInt(this.anchura)!=this.anchura || this.anchura<0) {

    this.errorcode=7;
    return "";

  }

  else if (typeof(this.classid)!="string") {

    this.errorcode=8;
    return "";

  }

  else if (typeof(this.zindex)!="number" || parseInt(this.zindex)!=this.zindex || this.zindex<0) {

    this.errorcode=9;
    return "";

  }
  else if (typeof(this.visible)!="boolean") {

    this.errorcode=10;
    return ""

  }
  else if (typeof(this.estilosadicionales)!="object" || this.estilosadicionales.length!=3 || typeof(this.estilosadicionales[0])!="string" || typeof(this.estilosadicionales[1])!="string" || typeof(this.estilosadicionales[2])!="string") {

    
    this.errorcode=11;
    return ""; 

  }
  else if (typeof(this.comandosadicionales)!="object" || this.comandosadicionales.length!=3 || typeof(this.comandosadicionales[0])!="string" || typeof(this.comandosadicionales[1])!="string" || typeof(this.comandosadicionales[2])!="string") {

    
    this.errorcode=12;
    return ""; 

  }

  if (this.GetDOMType()==1) {

    cadenacapa="<DIV ID=\""+ this.nombre  +"\"" 
    if (this.classid!="") {
      cadenacapa=cadenacapa + " CLASS=\"" + this.classid + "\"";
    }

    cadenacapa=cadenacapa+" STYLE=\"position:";

    if (this.usarposicionabsoluta==true) {

      cadenacapa=cadenacapa+"absolute;";

    }
    else {
      cadenacapa=cadenacapa+"relative;";
    }
    cadenacapa=cadenacapa+"top:" + this.arriba  +"px;";
    cadenacapa=cadenacapa+"left:" + this.izquierda  +"px;";
    cadenacapa=cadenacapa+"height:" + this.altura  +"px;";
    cadenacapa=cadenacapa+"width:" + this.anchura  +"px;";
    cadenacapa=cadenacapa+"z-index:" + this.zindex  +";";
    if (this.visible==true) {
      cadenacapa=cadenacapa+"visibility:visible;"
    }
    else {
      cadenacapa=cadenacapa+"visibility:hidden;"

    }
    cadenacapa=cadenacapa+this.estilosadicionales[0];
    cadenacapa=cadenacapa+"\"";
    if (this.comandosadicionales[0]!="") {
      cadenacapa=cadenacapa+ " " + this.comandosadicionales[0];
    }
    cadenacapa=cadenacapa+">";
    
  }
  else if (this.GetDOMType()==2) {

    cadenacapa="<DIV ID=\""+ this.nombre  +"\"" 
    if (this.classid!="") {
      cadenacapa=cadenacapa + " CLASS=\"" + this.classid + "\"";
    }

    cadenacapa=cadenacapa+" STYLE=\"position:";

    if (this.usarposicionabsoluta==true) {

      cadenacapa=cadenacapa+"absolute;";

    }
    else {
      cadenacapa=cadenacapa+"relative;";
    }
    cadenacapa=cadenacapa+"top:" + this.arriba  +"px;";
    cadenacapa=cadenacapa+"left:" + this.izquierda  +"px;";
    cadenacapa=cadenacapa+"height:" + this.altura  +"px;";
    cadenacapa=cadenacapa+"width:" + this.anchura  +"px;";
    cadenacapa=cadenacapa+"z-index:" + this.zindex  +";";
    if (this.visible==true) {
      cadenacapa=cadenacapa+"visibility:visible;"
    }
    else {
      cadenacapa=cadenacapa+"visibility:hidden;"

    }
    cadenacapa=cadenacapa+this.estilosadicionales[1];
    cadenacapa=cadenacapa+"\"";
    if (this.comandosadicionales[1]!="") {
      cadenacapa=cadenacapa+ " " + this.comandosadicionales[1];
    }
    cadenacapa=cadenacapa+">";

  }
  else {

    if (this.usarposicionabsoluta==true) {

      cadenacapa="<LAYER";


    }
    else {

      cadenacapa="<ILAYER";

    }


    cadenacapa=cadenacapa+" ID=\""+ this.nombre +"\"";
    if (this.classid!="") {
      cadenacapa=cadenacapa+" CLASS=\""+ this.classid +"\"";
    }
    cadenacapa=cadenacapa+" TOP="+ this.arriba +"px";
    cadenacapa=cadenacapa+" LEFT="+ this.izquierda +"px";
    cadenacapa=cadenacapa+" HEIGHT="+ this.altura +"px";
    cadenacapa=cadenacapa+" WIDTH="+ this.anchura +"px";
    cadenacapa=cadenacapa+" Z-INDEX="+ this.zindex;
    if (this.visible==true) {
      cadenacapa=cadenacapa+" VISIBILITY=SHOW"
    }
    else {
      cadenacapa=cadenacapa+" VISIBILITY=HIDE"

    }

    if (this.estilosadicionales[2]!="") {

      cadenacapa=cadenacapa+" STYLE=\"" + this.estilosadicionales[2]  + "\"";

    }

    if (this.comandosadicionales[2]!="") {
      cadenacapa=cadenacapa+ " " + this.comandosadicionales[2];
    }
    cadenacapa=cadenacapa+">";

  }
  return cadenacapa;
}

///////////////////////////////////////////
//LayerCreator_CreateCloseTag()         //
//Devuelve una cadena de caracteres    //
//con la etiqueta de cierre de la     //
//capa, o una cadena vacia si se     //
//produce un error, en este ultimo  //
//caso se puede consultar el metodo//
//GetErrorCode() para mas         //
//informacion                    //
//////////////////////////////////

function LayerCreator_CreateCloseTag() {

  this.errorcode=0;
  if (this.GetDOMType()==0) {
  
    this.errorcode=1;
    return "";

  }
  else if (typeof(this.nombre)!="string" || this.nombre=="") {

    this.errorcode=2;
    return ""

  }
  else if (typeof(this.usarposicionabsoluta)!="boolean") {

    this.errorcode=3;
    return ""

  }
  else if (typeof(this.arriba)!="number" || parseInt(this.arriba)!=this.arriba) {

    this.errorcode=4;
    return ""

  }

  else if (typeof(this.izquierda)!="number" || parseInt(this.izquierda)!=this.izquierda) {

    this.errorcode=5;
    return ""

  }

  else if (typeof(this.altura)!="number" || parseInt(this.altura)!=this.altura || this.altura<0) {

    this.errorcode=6;
    return ""

  }

  else if (typeof(this.anchura)!="number" || parseInt(this.anchura)!=this.anchura || this.anchura<0) {

    this.errorcode=7;
    return ""

  }

  else if (typeof(this.classid)!="string") {

    this.errorcode=8;
    return ""

  }

  else if (typeof(this.zindex)!="number" || parseInt(this.zindex)!=this.zindex || this.zindex<0) {

    this.errorcode=9;
    return ""

  }
  else if (typeof(this.visible)!="boolean") {

    this.errorcode=10;
    return ""

  }
  else if (typeof(this.estilosadicionales)!="object" || this.estilosadicionales.length!=3 || typeof(this.estilosadicionales[0])!="string" || typeof(this.estilosadicionales[1])!="string" || typeof(this.estilosadicionales[2])!="string") {

    
    this.errorcode=11;
    return ""; 

  }
  else if (typeof(this.comandosadicionales)!="object" || this.comandosadicionales.length!=3 || typeof(this.comandosadicionales[0])!="string" || typeof(this.comandosadicionales[1])!="string" || typeof(this.comandosadicionales[2])!="string") {

    
    this.errorcode=12;
    return ""; 

  }

  if (this.GetDOMType()==1) {

    return "</DIV>";

  }
  else if (this.GetDOMType()==2) {

    return "</DIV>";

  }
  else if (this.GetDOMType()==3 && this.usarposicionabsoluta==true) {

    return "</LAYER>";
     
  }
  else {

    return "</ILAYER>";


  }

 

}

/////////////////////////////////////////////////////////////
//LayerCreator([nombre],[usarposicionabsoluta])           //
//Devuelve una referencia a un objeto LayerCreator       //
//valido.                                               //
//Los valores que admite son:                          //
//nombre: una cadena de caracteres que especifica     //
//el nombre de la capa HTML                          //
//usarposicionabsoluta: un valor booleano que       //
//indica si la posicion de la capa sera absoluta   //
//(true) o relativa (false)                       //
///////////////////////////////////////////////////

function LayerCreator() {
  if (arguments.length>=1) {


    this.nombre=arguments[0];

  }
  else {
  
    this.nombre="";

  }

  if (arguments.length>=2) {

    this.usarposicionabsoluta=arguments[1];

  }
  else {

    this.usarposicionabsoluta=true;

  }

  this.arriba=0;
  this.izquierda=0;
  this.altura=0;
  this.anchura=0; 
  this.classid="";
  this.zindex=0;
  this.visible=true;
  this.errorcode=0;
  this.estilosadicionales=new Array(3);
  this.comandosadicionales=new Array(3);
  this.estilosadicionales[0]="";
  this.estilosadicionales[1]="";
  this.estilosadicionales[2]="";
  this.comandosadicionales[0]="";
  this.comandosadicionales[1]="";
  this.comandosadicionales[2]="";

  this.SetName=LayerCreator_SetName;
  this.GetName=LayerCreator_GetName;
  this.SetAbsolutePosition=LayerCreator_SetAbsolutePosition;
  this.GetAbsolutePosition=LayerCreator_GetAbsolutePosition;
  this.SetTop=LayerCreator_SetTop;
  this.GetTop=LayerCreator_GetTop;
  this.SetLeft=LayerCreator_SetLeft;
  this.GetLeft=LayerCreator_GetLeft;
  this.SetHeight=LayerCreator_SetHeight;
  this.GetHeight=LayerCreator_GetHeight;
  this.SetWidth=LayerCreator_SetWidth;
  this.GetWidth=LayerCreator_GetWidth;
  this.SetClass=LayerCreator_SetClass;
  this.GetClass=LayerCreator_GetClass;
  this.SetZindex=LayerCreator_SetZindex;
  this.GetZindex=LayerCreator_GetZindex;
  this.SetVisibility=LayerCreator_SetVisibility;
  this.GetVisibility=LayerCreator_GetVisibility;
  this.GetErrorCode=LayerCreator_GetErrorCode;
  this.SetAdditionalStyles=LayerCreator_SetAdditionalStyles;
  this.GetAdditionalStyles=LayerCreator_GetAdditionalStyles;
  this.SetAdditionalCommands=LayerCreator_SetAdditionalCommands;
  this.GetAdditionalCommands=LayerCreator_GetAdditionalCommands;
  this.GetDOMType=LayerCreator_GetDOMType;
  this.CreateOpenTag=LayerCreator_CreateOpenTag;
  this.CreateCloseTag=LayerCreator_CreateCloseTag;

}
