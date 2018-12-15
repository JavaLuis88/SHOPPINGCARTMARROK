function CriptModifiedVigenere(texto,clave) {

  var textotempo="" + texto;
  var clavetempo="" + clave;
  var caracterleido;
  var caracterleido2;
  var cadenaencriptada="";
  var rangominimo;
  var rangomaximo;

  rangominimo=0;
  rangomaximo=parseInt("FFFF",16); 
  if (textotempo.length<1 || clavetempo.length<1) {
    return "";
  }
  
  while(clavetempo.length<textotempo.length) {
    clavetempo=clavetempo+clavetempo;
  }

  for (var i=0;i<textotempo.length;i++) {
    caracterleido=textotempo.charAt(i);
    caracterleido2=clavetempo.charAt(i);
    caracterleido=caracterleido.charCodeAt();
    caracterleido2=caracterleido2.charCodeAt();
    for (var z=1;z<=caracterleido2;z++) {
      caracterleido++;
      if (caracterleido>rangomaximo) {
        caracterleido=rangominimo;
      }
    }
    cadenaencriptada=cadenaencriptada+String.fromCharCode(caracterleido);


  }
  
  return cadenaencriptada;
}

function DeCriptModifiedVigenere(texto,clave) {

  var textotempo="" + texto;
  var clavetempo="" + clave;
  var caracterleido;
  var caracterleido2;
  var cadenadesencriptada="";
  var rangominimo;
  var rangomaximo;

  rangominimo=0;
  rangomaximo=parseInt("FFFF",16); 
  if (textotempo.length<1 || clavetempo.length<1) {
    return "";
  }
  
  while(clavetempo.length<textotempo.length) {
    clavetempo=clavetempo+clavetempo;
  }

  for (var i=0;i<textotempo.length;i++) {
    caracterleido=textotempo.charAt(i);
    caracterleido2=clavetempo.charAt(i);
    caracterleido=caracterleido.charCodeAt();
    caracterleido2=caracterleido2.charCodeAt();
    for (var z=1;z<=caracterleido2;z++) {
      caracterleido--;
      if (caracterleido<rangominimo) {
        caracterleido=rangomaximo;
      }
    }
    cadenadesencriptada=cadenadesencriptada+String.fromCharCode(caracterleido);


  }
  
  return cadenadesencriptada;
}
function CriptModifiedXor(texto,clave) {

  var textotempo="" + texto;
  var clavetempo=clave;
  var caracterleido;
  var cadenares="";
  var arcaracteres= new Array();
  var cuenta=0;
  var posicion=-1;
  
  if (textotempo.length<1 || (clavetempo!=1 && clavetempo!=2 && clavetempo!=3 && clavetempo!=4 && clavetempo!=5)) {
    return "";
  }
  for (var i=0;i<textotempo.length;i++) {
    caracterleido=textotempo.charAt(i);
    caracterleido=caracterleido.charCodeAt();
    caracterleido=caracterleido^clavetempo;
    cadenares=cadenares+String.fromCharCode(caracterleido);

  }
  for (var i=0;i<cadenares.length;i++) {
    cuenta++;
    posicion++;
   
    if (cuenta==parseInt(cadenares.length/2)) {
      arcaracteres[posicion]=clave;
      posicion++;
    }
    arcaracteres[posicion]=cadenares.charAt(i);
  }
  cadenares=arcaracteres.join("");
  return cadenares;
}


function DeCriptModifiedXor(texto) {

  var textotempo="" + texto;
  var clavetempo;
  var caracterleido;
  var cadenares="";
  var arcaracteres= new Array();
  var cuenta=0;
  var posicion=-1;
  
  if (textotempo.length<2) {
    return "";
  }

  for (var i=0;i<textotempo.length;i++) {
    arcaracteres[i]=textotempo.charAt(i);
  }
  posicion=parseInt((arcaracteres.length-1)/2)-1;
  clavetempo=arcaracteres[posicion];
  arcaracteres[posicion]="";
  textotempo=arcaracteres.join("");
  for (var i=0;i<textotempo.length;i++) {
    arcaracteres[i]=textotempo.charAt(i);
  }

  for (var i=0;i<textotempo.length;i++) {
    caracterleido=textotempo.charAt(i);
    caracterleido=caracterleido.charCodeAt();
    caracterleido=caracterleido^clavetempo;
    cadenares=cadenares+String.fromCharCode(caracterleido);

  }

  return cadenares;
}

function HexEncoded(texto) {
  var textotempo="" + texto;
  var arcaracteres= new Array();
  var cadenares="";
  var tempo=0;
  var codigoshexa="0123456789ABCDEF";
  var i=0;

  for (var i=0;i<textotempo.length;i++) {
    arcaracteres[i]=textotempo.charAt(i).charCodeAt();
  }
  for (var i=0;i<arcaracteres.length;i++) {
    while (parseInt(arcaracteres[i]/16)!=0) {

      cadenares=codigoshexa.charAt(arcaracteres[i]%16) +  cadenares;
      arcaracteres[i]=parseInt(arcaracteres[i]/16);        

    }
    cadenares=codigoshexa.charAt(arcaracteres[i])  +cadenares;
    arcaracteres[i]=cadenares;
    while (arcaracteres[i].length<4) {
      arcaracteres[i]="0" + arcaracteres[i];
    } 
    cadenares="";
  }


  return arcaracteres.join("");

}

function HexDeEncoded(texto) {

  var textotempo="" + texto;
  var codigoshexa="0123456789ABCDEF";
  var inicio=0;
  var cadenares=""
  var codigocaracter;
  if (textotempo.length<4 || textotempo.length%4!=0) {
    return "";
  }
  for (var i=0;i<textotempo.length;i++) {
    if (codigoshexa.indexOf(textotempo.charAt(i))==-1) {
      return "";
    }
  }
  while (inicio<textotempo.length) {
    codigocaracter=parseInt(textotempo.substr(inicio,4),16);
    inicio=inicio+4;
    cadenares=cadenares+String.fromCharCode(codigocaracter); 
  }
  return cadenares;
}