/////////////////////////////////////////////
//Librerias JavaScript de las que depende:// 
//Version de JavaScript requerida: 1.0+  //
//////////////////////////////////////////

////////////////////////////////////////
//Rutinas para el tratamiento Cookies//
//////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
//SetCookie(clave,valor,[diasdevida],[dominio],[ruta],[seguro])                        //
//Devuelve ,nada solo procede a almacenar un cookie con el nombre                     // 
//que haya almacendo en clave y con el valor que haya almcenado                      //
//en valor.                                                                         //
//Los valores que admite son:                                                      //
//clave: la cual ha de ser una cadena de caracteres o sino se                     //
//convertira automaticamente y especifa el nombre del cookie                     //
//valor: el cual ha de ser una cadena de caracteres o sino se                   //
//convertira automaticamente y especifica el valor del cookie                  //
//diasdevida: un valor opcional, el cual ha de ser un numero                  //
//entero mayor o igual que uno el cual especifica el numero de               //
//dias de vida del cookie,en caso de no especificarse, o                    // 
//espeficarse un valor erroneo el cookie se borrara al terminar            //
//la sesion                                                               //
//dominio un valor opcional el cual ha de ser una cadena de              //
//caracteres o sino se convertira automaticamente el cual               //
//especifica el dominio desde el que se podra ver el cookie            //
//ruta valor opcional el cual ha de ser una cadena de caracteres      //
//o sino se convertira automaticamente el cual especifica la ruta    // 
//desde la que se podra ver el cookie                               //
//seguro un valor opcional, el cual es un valor boleano que        // 
//indica si el cookie se podra ver desde servidores seguros https //
//(true) o no (false), el valor por defecto es false             //                                              
//////////////////////////////////////////////////////////////////

function SetCookie(clave,valor) {

  var cadenacookie="";
  var clavetempo="" + clave;
  var valortempo=""+valor;
  var fecha=new Date();
  
  if (arguments.length<2) {

    return;

  }

  cadenacookie=escape(clavetempo) + "=" + escape(valortempo);
  if (arguments.length>=3 && parseInt(arguments[2])==arguments[2] && parseInt(arguments[2])>=1) {


    fecha.setTime(fecha.getTime()+(1000*60*60*24*parseInt(arguments[2])));
    cadenacookie=cadenacookie+";expires=" + fecha.toGMTString(); 
   
    

  }


  if (arguments.length>=4 && arguments[3]!="") {

    cadenacookie=cadenacookie+";domain=" + arguments[3]; 


  }  

  if (arguments.length>=5 && arguments[4]!="") {

    cadenacookie=cadenacookie+";path=" + arguments[3]; 


  }  
  if (arguments.length>=6 && arguments[5]==true) {
    
    cadenacookie=cadenacookie+";secure=true"; 



  }  
 
  document.cookie=cadenacookie;

  return;

}

///////////////////////////////////////
//GetCookie(clave)                  //
//Devuelve el valor                //
//del cookie clave,               //
//o en caso de no                //
//existir una                   //
//cadena vacia.                //
//los valores que             //
//admite son:                //
//clave la cual ha          //
//de ser una cadena        //
//de caracteres o         //
//sino se                //
//convertira            //
//automaticamente y    //
//especifica el       //
//nombre del cookie  //
//que se desea      //
//consultar        // 
////////////////////

function GetCookie(clave) {
   
  var cadenacookies;
  var posicion;
  var posicion2;

  if (arguments.length<1) {

    return "";

  }


  cadenacookies=document.cookie;

  posicion=cadenacookies.indexOf(clave + "=");
  if (posicion==-1) {

    return "";

  } 
  else {

    posicion=posicion + (clave + "=").length;

  }
  posicion2=cadenacookies.indexOf(";",posicion);   
  if (posicion2==-1) {

    cadenacookies=cadenacookies.substring(posicion);

  }
  else {
   
    cadenacookies=cadenacookies.substring(posicion,posicion2);
   
  }
  return unescape(cadenacookies);
}

///////////////////////////////////////////
//DeleteCookie(clave)                   //
//Devuelve nada, solo procede          //
//a borrar el cookie cuyo             //
//nombre haya almacenado en          //
//clave.                            //
//Los valores que admite son:      //
//clave: cuyo valor ha de ser     //
//una cadena o sino se           //
//transformara                  //
//automaticamente el cual      //
//especifica el nombre del    //
//cookie que se desea borrar //
//////////////////////////////

function DeleteCookie(clave) {
  
  var fecha=new Date();

  if (arguments.length<1) {

    return; 

  }


  fecha.setTime(fecha.getTime()-1);
  document.cookie=clave + "=NULL;expires=" + fecha.toGMTString();

  return;

}