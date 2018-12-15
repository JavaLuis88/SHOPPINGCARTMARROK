/////////////////////////////////////////////
//Librerias JavaScript de las que depende:// 
//Version de JavaScript requerida: 1.0+  //
//////////////////////////////////////////

/////////////////////////////////////////////////////////
//Rutinas para el tratamiento de cadenas de caracteres//
///////////////////////////////////////////////////////

//////////////////////////////////////////////////////
//Estas rutinas añaden funcionalidades adicionales //
//para el tratamiento de cadenas de caracteres con//
//JavaScript 1.0+                                //
//////////////////////////////////////////////////

////////////////////////////////////////////////
//trim(cadena)                               //
//Devuelve el contenido                     //
//de cadena, habiendo                      //
//suprimido los                           //
//espacios en blanco                     //
//retornos de carro                     //
//retornos de linea y                  //
//caracteres nulos del                //
//principio y el final.              //
//Los valores que                   //
//admite son:                      //
//cadena: La cual ha de           //
//ser una cadena de              //
//caracteres o sino se          //
//convertira                   //
//automaticamente de la       // 
//cual se eliminaran         //
//los espacios en           //
//blanco retornos de       //
//carro retornos de       //
//linea y caracteres     //
//nulos del principio   // 
//y el final           //
////////////////////////

function trim(cadena) {
  var cadenatempo=""+cadena;
  var punto=-1;
  if (arguments.length<1 || cadena=="" || cadena==null) {

    return "";

  }
  for (var i=0;i<cadenatempo.length;i++) {


    if (cadenatempo.charAt(i)!=" " && cadenatempo.charAt(i)!="\r" && cadenatempo.charAt(i)!="\n" && cadenatempo.charAt(i)!="\0") {

      punto=i
      break;

    }


  }
  if (punto==-1) {
    return "";
  } 
  cadenatempo=cadenatempo.substring(punto);;
  for (var i=cadenatempo.length-1;i>=0;i--) {


    if (cadenatempo.charAt(i)!=" " && cadenatempo.charAt(i)!="\r" && cadenatempo.charAt(i)!="\n" && cadenatempo.charAt(i)!="\0") {
      cadenatempo=cadenatempo.substring(0,i+1);
      break;

    }


  }


  return cadenatempo;

}
function substrV10(cadena,inicio,finalizacion) {
 
  var cadenatempo;

  if (arguments.length<2) {
    return "";
  }
  cadenatempo="" + cadena;
  if (arguments.length==2) {
    return cadenatempo.substring(inicio);
  }
  else {
    return cadenatempo.substring(inicio,inicio+finalizacion)
  }
}

function splitV10(cadena,separador,maximo) {
  var cadenatempo;
  var separadortempo;
  var maximo2=0;
  var pos=-1;
  var pos2=-1;
  var palabras=new MakeArray();
  var z=0;
  var i=0;

  if (arguments.length<2) {
    return "";
  }
  cadenatempo="" + cadena;
  separadortempo=""+separador;
  if (arguments.length>=3 && maximo>=1) {
    maximo2=maximo;
  } 

  pos=pos2;
  pos++;
  pos2=cadenatempo.indexOf(separadortempo,pos);
  if (pos2!=-1) {
    palabras.add(i,substrV10(cadenatempo,pos,pos2-pos));
    i++;
  }  
  z++
  while ((pos2!=-1 && maximo2==0) ||(pos2!=-1 && maximo2!=0 && maximo2!=z)) {
    pos=pos2+separadortempo.length-1;
    pos++;
    pos2=cadenatempo.indexOf(separadortempo,pos);
    if (pos2!=-1) {
      palabras.add(i,substrV10(cadenatempo,pos,pos2-pos));
      i++;
      z++;
    }
  }
  if (pos!=cadenatempo.length && maximo2!=z) {
    palabras.add(i,substrV10(cadenatempo,pos));
 
  }
  else if (pos!=cadenatempo.length && maximo2==z) {
    palabras.add(i-1,substrV10(cadenatempo,pos));
  }
  return palabras;
}

function replaceV10(cadena,buscar,remplazar,maximo) {

  if (arguments.length<3) {
    return "";
  }
  if (arguments.length==3) {
    return splitV10(cadena,buscar).join(remplazar);
  }
  else {
    return splitV10(cadena,buscar,maximo).join(remplazar);
  } 
} 