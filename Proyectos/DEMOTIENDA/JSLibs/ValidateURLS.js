function isvalidProtocol(protocol) {

  var protocoltempo="" + protocol;
  var carpermitidos="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
  var retval=true;
  if (protocoltempo.length<2 || protocoltempo.charAt(protocoltempo.length-1)!=":") {
    return false; 
  }

  for (i=0;i<protocoltempo.length-1;i++) {
    if (carpermitidos.indexOf(protocoltempo.charAt(i))==-1) {
      retval=false;
      break;
    }
  }
  return retval; 
}
function isvalidPort(port) {

  var porttempo="" +port;
  var retval=true;
  if (porttempo=="0" || porttempo=="") {
    return true
  }
  if (porttempo.charAt(0)=="0") {
    return false;
  }
  for (var i=0;i<porttempo.length;i++) {
    if (porttempo.charAt(i)<"0" || porttempo.charAt(i)>"9") {
      retval=false;
      break;
    }
  }
  return retval;
  
}


function isValidLoginPassword(loginpassword) {
  var loginpasswordtempo=""+loginpassword;
  var carpermitidos="$%()-_.+!*~,abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  var hexacar="0123456789abcdefABCDEF";
  var pos=0;
  var caracter="";
  var retval=true
  for (var i=0;i<loginpasswordtempo.length;i++) {

    if (carpermitidos.indexOf(loginpasswordtempo.charAt(i))==-1) {

      retval=false;
      break;

      
    }

  }
  
  while (loginpasswordtempo.indexOf("%",pos)!=-1) {
    pos=loginpasswordtempo.indexOf("%",pos);
    caracter=loginpasswordtempo.charAt(pos+1);
    if (trim(caracter)=="") {
      retval=false;
    }
    if (hexacar.indexOf(caracter)==-1) {
      retval=false;
      break;
    }
    caracter=loginpasswordtempo.charAt(pos+2);
    if (trim(caracter)=="") {
      retval=false;
    }
    
    if (hexacar.indexOf(caracter)==-1) {
      retval=false;
      break;
    }
    pos++;
  }

  return retval;

}

function isValidDomain(domain) {

  var domaintempo="" + domain;
  var caralfabeticos="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
  var caralfanumericos="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  var retval=true;
  if (domaintempo.length<2 || domaintempo.length>4) {
    return false;
  }
 
  if (caralfabeticos.indexOf(domaintempo.charAt(0))==-1) {

    return false;

  }
  
  for (var i=1;i<domaintempo.length;i++) {
    if (caralfanumericos.indexOf(domaintempo.charAt(i))==-1) {
      retval=false;
      break;
    }
  }
  
  return retval;

}


function isValidHost(host,protocol) {

  var hosttempo="" + host
  var protocoltempo=""+protocol;
  var carpermitidos="%-_.+abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  var hexacar="0123456789abcdefABCDEF";
  var caralfanumericos="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  var arpartes;
  var pos=0;
  var caracter="";
  var retval=true

  if (hosttempo=="") {
    return false;
  }

  for (var i=0;i<hosttempo.length;i++) {

    if (carpermitidos.indexOf(hosttempo.charAt(i))==-1) {

      retval=false;
      break;

      
    }

  }
  
  while (hosttempo.indexOf("%",pos)!=-1) {
    pos=hosttempo.indexOf("%",pos);
    caracter=hosttempo.charAt(pos+1);
    if (trim(caracter)=="") {
      retval=false;
    }
    if (hexacar.indexOf(caracter)==-1) {
      retval=false;
      break;
    }
    caracter=hosttempo.charAt(pos+2);
    if (trim(caracter)=="") {
      retval=false;
    }
    
    if (hexacar.indexOf(caracter)==-1) {
      retval=false;
      break;
    }
    pos++;
  }

  if (retval==false) {
    return false;
  }

  arpartes=splitV10(hosttempo,".");
  if (protocoltempo.toUpperCase()!="TELNET:" && arpartes.length()<2) {
    return false;
  } 

  if (protocoltempo.toUpperCase()!="TELNET:") { 

    var retval=true;
    for (var i=0;i<arpartes.length()-1;i++) {

      if (arpartes.getvalue(i)=="" || caralfanumericos.indexOf(arpartes.getvalue(i).charAt(0))==-1 || caralfanumericos.indexOf(arpartes.getvalue(i).charAt(arpartes.getvalue(i).length-1))==-1) {
        
        retval=false;
        break;

      }
      if (i==arpartes.length()-2 && arpartes.getvalue(i).length<2) {
        retval=false;
        
      }
     

    
    }  

    if (isValidDomain(arpartes.getvalue(arpartes.length()-1))==false) {
      retval=false;
    } 

  }
  else {

    

    for (var i=0;i<arpartes.length();i++) {
      if (arpartes.getvalue(i)=="" || caralfanumericos.indexOf(arpartes.getvalue(i).charAt(0))==-1 || caralfanumericos.indexOf(arpartes.getvalue(i).charAt(arpartes.getvalue(i).length-1))==-1) {
        
        retval=false;
        break;

      }  

      if (i==arpartes.length()-1 && arpartes.getvalue(i).length<2) {
        retval=false;
        
      }
    }

   
 

  }

  return retval;
  
}


function isValidIp(ip) {

  var iptempo="" + ip;
  var arpartes=splitV10(iptempo,".");
  var retval=true;

  if (arpartes.length()!=4) {
    return false;
  }

  for (var i=0;i<arpartes.length();i++) {
    if (isvalidPort(arpartes.getvalue(i))==false || parseInt(arpartes.getvalue(i))>255) {
      retval=false;
      break; 
    }
    
  }
  return retval;

}


function isValidPath(path) {

  var pathtempo="" + path;
  var carpermitidos="$%()-_.+!*~/,abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  var hexacar="0123456789abcdefABCDEF";
  var pos=0;
  var caracter="";
  var retval=true;

  if (pathtempo=="") {
    return true;
  }

  if (pathtempo.indexOf("//")!=-1) {
    return false;
  }





  for (var i=0;i<pathtempo.length;i++) {

    if (carpermitidos.indexOf(pathtempo.charAt(i))==-1) {

      retval=false;
      break;

      
    }

  }
  
  while (pathtempo.indexOf("%",pos)!=-1) {
    pos=pathtempo.indexOf("%",pos);
    caracter=pathtempo.charAt(pos+1);
    if (trim(caracter)=="") {
      retval=false;
    }
    if (hexacar.indexOf(caracter)==-1) {
      retval=false;
      break;
    }
    caracter=pathtempo.charAt(pos+2);
    if (trim(caracter)=="") {
      retval=false;
    }
    
    if (hexacar.indexOf(caracter)==-1) {
      retval=false;
      break;
    }
    pos++;
  }
  return retval
}


function isValidFile(file) {

  var filetempo="" + file;
  var carpermitidos="$%()-_.+!*~,abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  var hexacar="0123456789abcdefABCDEF";
  var pos=0;
  var caracter="";
  var retval=true;

  if (filetempo=="") {
    return true;
  }







  for (var i=0;i<filetempo.length;i++) {

    if (carpermitidos.indexOf(filetempo.charAt(i))==-1) {

      retval=false;
      break;

      
    }

  }
  
  while (filetempo.indexOf("%",pos)!=-1) {
    pos=filetempo.indexOf("%",pos);
    caracter=filetempo.charAt(pos+1);
    if (trim(caracter)=="") {
      retval=false;
    }
    if (hexacar.indexOf(caracter)==-1) {
      retval=false;
      break;
    }
    caracter=filetempo.charAt(pos+2);
    if (trim(caracter)=="") {
      retval=false;
    }
    
    if (hexacar.indexOf(caracter)==-1) {
      retval=false;
      break;
    }
    pos++;
  }
  return retval
}



function isValidHash(hash) {

  var hashtempo="" + hash;
  var carpermitidos="$%()-_.+!*~:,abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  var hexacar="0123456789abcdefABCDEF";
  var pos=0;
  var caracter="";
  var retval=true;

  if (hashtempo=="") {
    return true;
  }







  for (var i=0;i<hashtempo.length;i++) {

    if (carpermitidos.indexOf(hashtempo.charAt(i))==-1) {

      retval=false;
      break;

      
    }

  }
  
  while (hashtempo.indexOf("%",pos)!=-1) {
    pos=hashtempo.indexOf("%",pos);
    caracter=hashtempo.charAt(pos+1);
    if (trim(caracter)=="") {
      retval=false;
    }
    if (hexacar.indexOf(caracter)==-1) {
      retval=false;
      break;
    }
    caracter=hashtempo.charAt(pos+2);
    if (trim(caracter)=="") {
      retval=false;
    }
    
    if (hexacar.indexOf(caracter)==-1) {
      retval=false;
      break;
    }
    pos++;
  }
  return retval
}
function isValidQueryString(querystring) {

  var querystringtempo="" + querystring;
  var carpermitidos="$%()-_.+!*~:,&=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  var hexacar="0123456789abcdefABCDEF";
  var arpartes;
  var arpartes2;
  var pos=0;
  var caracter="";
  var retval=true;

  if (querystringtempo=="") {
    return true;
  }







  for (var i=0;i<querystringtempo.length;i++) {

    if (carpermitidos.indexOf(querystringtempo.charAt(i))==-1) {
      retval=false;
      break;

      
    }

  }
  
  while (querystringtempo.indexOf("%",pos)!=-1) {
    pos=querystringtempo.indexOf("%",pos);
    caracter=querystringtempo.charAt(pos+1);
    if (trim(caracter)=="") {
      retval=false;
    }
    if (hexacar.indexOf(caracter)==-1) {
      retval=false;
      break;
    }
    caracter=querystringtempo.charAt(pos+2);
    if (trim(caracter)=="") {
      retval=false;
    }
    
    if (hexacar.indexOf(caracter)==-1) {
      retval=false;
      break;
    }
    pos++;
  }
  if (retval==false) {
    return false;
  }
  if (querystringtempo.indexOf("=")==-1) {
    return true;
  }
  arpartes=splitV10(querystringtempo,"&");
  for (var i=0;i<arpartes.length();i++) {
    arpartes2=splitV10(arpartes.getvalue(i),"=");
    if (arpartes2.length()!=2 || arpartes2.getvalue(0)=="") {
      retval=false;
      break;
    }
  }
  return retval;
}


function isValidHTTPURL(url) {

  var urltempo="" + url;
  var spturl;
  if (urltempo=="") {
    return false;
  }
  if (urltempo.toUpperCase().indexOf("HTTP://")!=0 && urltempo.toUpperCase().indexOf("HTTPS://")!=0) {
    urltempo="http://" + urltempo;
  }
  
  spturl=new SplitURL(urltempo);
  
  if (spturl.protocol.toUpperCase()!="HTTP:" && spturl.protocol.toUperCase()!="HTTPS:") {
    return false; 
  } 
 
  if (isValidIp(spturl.address)==false && isValidHost(spturl.address,"HTTP:")==false) {

    return false;

  }


  if (spturl.havegotport==true && isvalidPort(spturl.port)==false) {
    return false;
  }

  if (isValidPath(spturl.path)==false) {
    return false;
  } 

  if (isValidFile(spturl.file)==false) {
    return false;
  } 

  if (spturl.havegotquerystring==true && isValidQueryString(spturl.querystring)==false) {
    return false;
  }
  if (spturl.havegothash==true && isValidHash(spturl.hash)==false) {
    return false;
  }
  return true;
}
