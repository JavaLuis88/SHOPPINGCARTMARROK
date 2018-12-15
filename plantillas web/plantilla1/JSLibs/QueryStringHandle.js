//////////////////////////////////////////////////////////////////////
//Librerias JavaScript de las que depende: HashArray.js, cadenas.js// 
//Version de JavaScript requerida: 1.1+                           //
///////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////
//Rutinas para el tratamiento de los QUERYSTRING de la url//
///////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////
//Estas rutinas permiten manejar comodamente los QUERYSTRING//   
//de la url, tratandolos como un HashArray                 //
////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
//QueryStringHandle_add(clave,valor)                   //                
//Devuelve nada, solo procede a añadir                // 
//o modificar el elemento clave con el               //                   
//contenido de valor. Esta version                  //
//sobreescrita no admite que clave                 //
//este compuesta solo de espacios en              //
//blanco retornos de carro retornos de           //
//lineas o espacios en blanco.                  //            
//Los valores que admite son:                  //  
//clave: la cual ha de ser una cadena         // 
//de caracteres, o sino se convertira        //                 
//automaticamente, la cual indica la        //
//clave del QUERYSTRING que se añadira     // 
//o modificara.                           //
//valor: el cual ha de ser una cadena    //
//caracteres o sino se convertira       //
//automaticame, el cual se almacenara  // 
//bajo clave                          //
///////////////////////////////////////

function QueryStringHandle_add(clave,valor) {

  var clavetempo="" + clave;
  var valortempo="" + valor;

  if (arguments.length<2) {
    
    return;

  }
 
  if(trim(clavetempo)=="") {
 
    return;

  } 
  this.hsarray.add(clavetempo,valortempo);
  return; 

}

/////////////////////////////////////////////////////
//QueryStringHandle_getvalue(clave)               //                
//Devuelve el valor de la clave, o una           //
//cadena de caracteres vacia si la              //
//clave no existe (para tener mayor            //
//seguridad de si una clave existe o          //
//no es mejor usar el metodo                 //
//existskey). Los valores que admite        //
//son:                                     //
//clave: la cual ha de ser una cadena     //
//de caracteres, o sino se convertira    //
//automaticamente, la cual indica la    //
//clave del QUERYSTRING cuyo valor se  //
//desea consultar                     //
///////////////////////////////////////

function QueryStringHandle_getvalue(clave) {

  if (arguments.length<1) {
    
    return "";

  }

  return this.hsarray.getvalue(clave);

}

////////////////////////////////////////////////////////////
//QueryStringHandle_existskey(clave)                     //
//Devuelve true si existe la clave especificada         //
//y false en caso contrario. Los valores que           //
//admite son:                                         //
//clave: la cual ha de ser una cadena de             //
//caracteres, o sino se convertira                  //
//automaticamente, la cual indica la clave del     //              
//QUERYSTRING que se quiere comprobar su          //
//existencia                                     //
//////////////////////////////////////////////////

function QueryStringHandle_existskey(clave) {

  if (arguments.length<1) {
    
    return false;

  }

  return this.hsarray.existskey(clave);

}

//////////////////////////////////////////////
//QueryStringHandle_deletekey(clave)       //
//Devuelve nada, solo procede a borrar    //
//el elememento clave y su valor. Los    // 
//valores que admite son:               //         
//clave: la cual ha de ser una cadena  //
//de caracteres, o sino se convertira //             
//automaticamente, la cual indica la //
//clave del que se quiere borrar    //                 
/////////////////////////////////////

function QueryStringHandle_deletekey(clave) {

  if (arguments.length<1) {
    
    return;

  }
  this.hsarray.deletekey(clave);
  return;

}

/////////////////////////////////////
//QueryStringHandle_keys()        //
//Devueve un array con las claves// 
//QUERYSTRING                   //
/////////////////////////////////

function QueryStringHandle_keys() {

  return this.hsarray.keys();

}

////////////////////////////////////////////////////////////////////////////
//QueryStringHandle_addQueryString(cadenaquerystring)                    //
//Devuelve nada, solo procede a trocear la cadena cadenaquerystring     //
//y almacenar cada uno de los pares nombre=valor.                      //
//Los Valores que admite son:                                         //
//cadenaquerystring: la cual ha de ser una cadena de caracteres o    //
//sino se convertira automaticamente la cual se troceara y se       //
//almacerara cada par de nombre=valor                              // 
////////////////////////////////////////////////////////////////////

function QueryStringHandle_addQueryString(cadenaquerystring) {

  var cadenatempo="" + cadenaquerystring
  var artempo;
  var artempo2;

  if (arguments.length<1) {
    
    return;

  }

  if (cadenatempo.charAt(0)=="?") {

    cadenatempo=cadenatempo.substring(1);
   

  }
  cadenatempo=cadenatempo.replace("+"," ");
  artempo=cadenatempo.split("&");
    
  for (var i=0;i<artempo.length;i++) {
    
    artempo2=artempo[i].split("=");
    artempo2[0]=unescape(artempo2[0]);     
    artempo2[1]=unescape(artempo2[1]);     
    this.add(artempo2[0],artempo2[1]);

  }

  return;

}

///////////////////////////////////
//QueryStringHandle_toString()  //
//Devuelve los pares de nombres// 
//y valores almacenados       // 
//formando una cadena        // 
//QUERYSTRING valida        //
/////////////////////////////

function QueryStringHandle_toString() {
 
  var cadenatempo="";
  var arclaves;
  
  arclaves=this.hsarray.keys();
  for (var i=0;i<arclaves.length;i++) {

    cadenatempo=cadenatempo + escape(arclaves[i]) + "=" + escape(this.hsarray.getvalue(arclaves[i])) + "&"

  }
  cadenatempo=cadenatempo.substring(0,cadenatempo.length-1);
  cadenatempo=cadenatempo.replace("%20","+");
  if (cadenatempo!="") {

    cadenatempo="?" + cadenatempo;
  
  }

  return cadenatempo;

}

/////////////////////////////////////////////////////////////////
//QueryStringHandle([cadenaquerystring])                      //
//Devuelve una referencia a un objeto QueryStringHandle      //
//validos.                                                  //
//Los valores que admite son:                              //
//cadenaquerystring: el cual es opcional y ha de ser      //
//una cadena de caracteres o sino se convertira          //
//automaticamente la cual se trozeara y almacenara      //
//cada uno de los pares nombre=valor que contenga      //
////////////////////////////////////////////////////////

function QueryStringHandle()  {

  this.hsarray=new HashArray(true);
  this.add=QueryStringHandle_add;
  this.getvalue=QueryStringHandle_getvalue;
  this.existskey=QueryStringHandle_existskey;
  this.deletekey=QueryStringHandle_deletekey;
  this.keys=QueryStringHandle_keys;
  this.addQueryString=QueryStringHandle_addQueryString;
  this.toString=QueryStringHandle_toString;
 
  var cadenatempo;
  var artempo;
  var artempo2;
  
  if (arguments.length>=1) {

    cadenatempo="" + arguments[0];
    
    if (cadenatempo.charAt(0)=="?") {

      cadenatempo=cadenatempo.substring(1);
   

    }
    cadenatempo=cadenatempo.replace("+"," ");
    artempo=cadenatempo.split("&");
    
    for (var i=0;i<artempo.length;i++) {

      artempo2=artempo[i].split("=");
      artempo2[0]=unescape(artempo2[0]);     
      artempo2[1]=unescape(artempo2[1]);     
      this.add(artempo2[0],artempo2[1]);

    }


  }


}
