/////////////////////////////////////////////
//Librerias JavaScript de las que depende:// 
//Version de JavaScript requerida: 1.1+  //
//////////////////////////////////////////

//////////////////////////////////////////
//Rutinas para implementar un HashArray//
////////////////////////////////////////

//////////////////////////////////////////////
//Estas rutinas proceden a implementar     // 
//arrays de tipo Hash. Aunque el          //
//lenguaje JavaScript tiene su forma     //
//de implementar arrays de tipo Hash    //
//esta implementacion es mas facil y   //
//completa                            //
///////////////////////////////////////

////////////////////////////////////////////////
//HashArray_add(clave,valor)                 //
//Devuelve nada, solo procede               //
//a añadir o modificar el                  //
//elemento clave con el                   //
//contenido de valor.                    //
//Los valores que admite son:           //
//clave: la cual ha de ser             // 
//una cadena de caracteres, o         // 
//sino se convertira                 //
//automaticamente, la cual          //
//indica la clave del              //
//HashArray que se añadira o      //
//modificara.                    //
//valor: el cual pude ser       //
//cualquier valor JavaScript   //
//valido que se almacenara    //
//bajo clave                 //
//////////////////////////////

function HashArray_add(clave,valor) {
  var clavetempo="" + clave;
  var valortempo=valor;
  var punto=0;
 
  if (arguments.length<2) {

    return;

  }


  for (var z=0;z<=this.i;z++) {

    if (this.cs==true && this.claves[z]==clavetempo) {

      
      punto=z;
      break;



    }
    else if (this.cs!=true && this.claves[z].toUpperCase()==clavetempo.toUpperCase()) {


      punto=z;
      break;

    }  
    else {
      
      punto=this.i+1;

    }

  }  
  
  this.claves[punto]=clavetempo;
  this.valores[punto]=valortempo;
  if (punto==this.i+1) {
    this.i++;
  }
  return;

} 

/////////////////////////////////////////////////
//HashArray_getvalue(clave)                   //
//Devuelve el valor de la clave,             //
//o una cadena de caracteres                //
//vacia si la clave no existe              //
//(para tener mayor seguridad de          //
//si una clave existe o no es            //
//mejor usar el metodo                  //
//existskey). Los valores que          //
//admite son:                         //
//clave: la cual ha de ser una       //
//cadena de caracteres, o sino      //
//se convertira automaticamente,   // 
//la cual indica la clave del     //           
//HashArray cuyo valor se desea  //
//consultar                     //
/////////////////////////////////

function HashArray_getvalue(clave) {

  var clavetempo="" + clave;
  var punto=-1;
 
  if (arguments.length<1) {
   
    return "";

  }

  
  for (var z=0;z<=this.i;z++) {
    
    if (this.cs==true && this.claves[z]==clavetempo) {

      
      punto=z;
      break;



    }
    else if (this.cs!=true && this.claves[z].toUpperCase()==clavetempo.toUpperCase()) {


      punto=z;
      break;

    }  


  }  

  if (punto==-1) {

    return ""; 


  }
  else {
  
    return this.valores[punto];

  }


}

///////////////////////////////////////////////
//HashArray_existskey(clave)                //
//Devuelve true si existe la clave         //
//especificada y false en caso            // 
//contrario. Los valores que             //
//admite son:                           //
//clave: la cual ha de ser una         // 
//cadena de caracteres, o sino        // 
//se convertira automaticamente,     //
//la cual indica la clave del       //          
//HashArray que se quiere          // 
//comprobar su existencia         //
///////////////////////////////////

function HashArray_existskey(clave) {

  var clavetempo="" + clave;
  var encontrada=false;
 
  if (arguments.length<1) {

    return false;

  }

  
  for (var z=0;z<=this.i;z++) {
    
    if (this.cs==true && this.claves[z]==clavetempo) {

      
      encontrada=true;
      break;



    }
    else if (this.cs!=true && this.claves[z].toUpperCase()==clavetempo.toUpperCase()) {


      encontrada=true;
      break;

    }  


  }  

  return encontrada;


}

///////////////////////////////////////////
//HashArray_deletekey(clave)            //
//Devuelve nada, solo procede          // 
//a borrar el elememento              //
//clave y su valor del               //
//HashArray. Los valores que        //
//admite son:                      //
//clave: la cual ha de ser        //
//una cadena de caracteres, o    //
//sino se convertira            // 
//automaticamente, la cual     //
//indica la clave del         //
//HashArray que se quiere    //
//borrar                    // 
/////////////////////////////

function HashArray_deletekey(clave) {

  var clavetempo="" + clave;
  var punto=-1;
 
  if (arguments.length<1) {

    return;

  }

  
  for (var z=0;z<=this.i;z++) {
    
    if (this.cs==true && this.claves[z]==clavetempo) {

      
      punto=z;
      break;



    }
    else if (this.cs!=true && this.claves[z].toUpperCase()==clavetempo.toUpperCase()) {


      punto=z;
      break;

    }  


  }  

  if (punto==-1) {
    return;
  }

  for (var z=punto+1;z<=this.i;z++) {
   
    this.claves[z-1]=this.claves[z];
    this.valores[z-1]=this.valores[z];
    

  }

  this.i--;
  return;

}

//////////////////////////
//HashArray_keys()     //
//Devueve un array con//
//las claves del     //
//HashArray         //
/////////////////////

function HashArray_keys() {
  var arclaves=new Array();
  
  for (var z=0;z<=this.i;z++) {


    arclaves[z]=this.claves[z]

  }
  
  return arclaves;

}

////////////////////////////////////////
//HashArray(cs)                      //              
//Devuelve una referencia           // 
//a un objeto HashArray            //
//Valido.                         //   
//Los valores que admite         //
//son:                          // 
//cs: un valor booleano        //
//que indica                  //
//si las claves del          //
//HashArray diferenciaran   //
//mayusculas de            //
//minusculas (true) o no  //
//(false)                //
//////////////////////////
     
function HashArray(cs) {

  this.cs=cs;
  this.claves=new Array();
  this.valores=new Array();
  this.i=-1;
  this.add=HashArray_add;
  this.getvalue=HashArray_getvalue;
  this.existskey=HashArray_existskey;
  this.deletekey=HashArray_deletekey;
  this.keys=HashArray_keys;

}
