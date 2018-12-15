function MakeArray_length() {

  return this.longitud;

}
function MakeArray_add(indice,elemento) {
       
  if (arguments.length<2) {
    return "";
  }

  if (indice<0) {
    return "";
  }
     
  if (indice>this.longitud-1) {
       
    for (var i=this.longitud;i<=indice;i++) {
      this[this.corrimiento+i]=null
    }
    this[this.corrimiento+indice]=elemento;
    this.longitud=indice+1;
  }
  else {
    this[this.corrimiento+indice]=elemento;
  }

  return "";
}

function MakeArray_getvalue(indice) {

  if (arguments.length<1) {
    return null;
  }

  if (indice<0) {
    return null;
  }
  if (indice>this.longitud-1) {
    return null;
  }
  else {
    return this[this.corrimiento+indice] 
  }
}
function MakeArray_reverse() {
  var z=0;
  var artempo=new MakeArray();
  for (var i=this.longitud-1;i>=0;i--) {
    artempo.add(z,this[this.corrimiento+i]);
    z++;
  }
  return artempo;

}

function MakeArray_join(token,numerodeuniones) {

  var token2=",";
  var cadenatempo="";  
  var z=0;
  if (arguments.length>=1 && token!="") {

    token2="" + token;                
    
  }

  if (arguments.length<2 || numerodeuniones<=0) {

    cadenatempo=this[0+this.corrimiento];
    for (var i=1;i<this.longitud;i++) {
      cadenatempo=cadenatempo+token2+this[i+this.corrimiento]; 
    }     

  }
  else {
    cadenatempo=this[0+this.corrimiento];
    for (var i=1;i<this.longitud;i++) {
      cadenatempo=cadenatempo+token2+this[i+this.corrimiento];
      z++;
      if (z==numerodeuniones) {
        
        break;
      } 
    }
  }

  return cadenatempo

} 

function MakeArray_sort(funcion) {

  var artempo=new MakeArray();
  var ordenado=true;
  var valortempo;

  for (var i=0;i<this.longitud;i++) {
    artempo.add(i,this[i+this.corrimiento]);

  }
  if (arguments.length>=1 && funcion!=null && funcion!="" && ("" +funcion).indexOf("(")==-1 && ("" +funcion).indexOf(")")==-1) {
    ordenado=false;
    while (ordenado==false) {
      ordenado=true
      for (var i=0;i<artempo.length()-1;i++) {
        if (eval(funcion + "(artempo.getvalue(i),artempo.getvalue(i+1))")==-1) {
          ordenado=false;
          valortempo=artempo.getvalue(i);
          artempo.add(i,artempo.getvalue(i+1));
          artempo.add(i+1,valortempo);
        }
      }
    }
  }
  else {


    ordenado=false;
    while (ordenado==false) {
      ordenado=true
      for (var i=0;i<artempo.length()-1;i++) {
        if (artempo.getvalue(i)>artempo.getvalue(i+1)) {
          ordenado=false;
          valortempo=artempo.getvalue(i);
          artempo.add(i,artempo.getvalue(i+1));
          artempo.add(i+1,valortempo);
        }
      }
    }
  }
  return artempo;
}

function MakeArray() {
  
  this.longitud=0;
  this.add=MakeArray_add;
  this.getvalue=MakeArray_getvalue;
  this.length=MakeArray_length;
  this.reverse=MakeArray_reverse;
  this.join=MakeArray_join;
  this.sort=MakeArray_sort;
  this.corrimiento=8;
  if (arguments.length>=1 && arguments[0]>=1) {
    for (var i=0;i<arguments[0];i++) {
      this[i+this.corrimiento]=null;
    }
    this.longitud=arguments[0];
  }

  return this;
  

}
