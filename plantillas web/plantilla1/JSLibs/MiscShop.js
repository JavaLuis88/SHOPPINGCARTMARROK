function ProductRecord(productname,productid,category,subcategory,description) {

  this.productname=productname;
  this.productid=productid;
  this.category=category;
  this.subcategory=subcategory;
  this.description=description;

}

function ModelRecord(productid,model,price,price2,disccount,tax) {

  this.productid=productid;
  this.model=model;
  this.price=price;
  this.price2=price2;
  this.disccount=disccount;
  this.tax=tax;

}


function ImageRecord(imagename,imageid,archive,copyright,alternativetext,description) {


  this.imagename=imagename;   
  this,imageid=imageid;
  this.archive=archive;
  this.copyright=copyright;
  this.alternativetext=alternativetext;
  this.description=description;
}

function archivodelmarcoseleccionado(numerodemarco) {


  if (numerodemarco==1) {
    if (incluirenlacesen==2 || incluirenlacesen==4 || incluirenlacesen==6 || incluirenlacesen==7 || incluirbuscadoren==2 || incluirbuscadoren==4 || incluirbuscadoren==6 || incluirbuscadoren==7 || incluiropciondeelegirlenguajeen==2 || incluiropciondeelegirlenguajeen==4 || incluiropciondeelegirlenguajeen==6 || incluiropciondeelegirlenguajeen==7) {
      return "control.htm";
    }
    else if (trim(urlmarco1)=="") {
      return "control.htm";
    }
    else {
      return urlmarco1;
    }
  }
  else {
    if (incluirenlacesen==3 || incluirenlacesen==5 || incluirenlacesen==6 || incluirenlacesen==7 || incluirbuscadoren==3 || incluirbuscadoren==5 || incluirbuscadoren==6 || incluirbuscadoren==7 || incluiropciondeelegirlenguajeen==3 || incluiropciondeelegirlenguajeen==5 || incluiropciondeelegirlenguajeen==6 || incluiropciondeelegirlenguajeen==7) {
      return "control2.htm";
    }
    else if (trim(urlmarco2)=="") {
      return "control2.htm";
    }
    else {
      return urlmarco2;
    }

  }
}
function numerodemodelosdelproducto(indiceproducto) {

  var referenciaroducto;
  var cuenta=0;;

   
  referenciaproducto=product[indiceproducto].productid;
  for (var i=0;i<models.length && i<(NUMEROMAXDEPRODUCTOS*NUMEROMAXMODELOS);i++) {
    if (models[i].productid==referenciaproducto) {
      cuenta++;
    }
  }
  return cuenta;
}

function calcularpreciodelarticulo(cadenaarticulo) {

  var arpartes;
  var numeromodelo=0;
  var idproducto;
  var indicedelmodelo=0;
  var precioproducto=0;
  var tempo=0;

  arpartes=cadenaarticulo.split("=");
  idproducto=product[parseInt(arpartes[0])].productid;
  for (var i=0;i<models.length && i<(NUMEROMAXDEPRODUCTOS*NUMEROMAXMODELOS);i++) {
    if (models[i].productid==idproducto) {
      numeromodelo++;
    }
    if (numeromodelo==parseInt(arpartes[1])) {
      indicedelmodelo=i;
      break;
    }
  }
  precioproducto=models[indicedelmodelo].price*parseInt(arpartes[2]);
  if (models[indicedelmodelo].disccount>0) {
    tempo=precioproducto/100;
    tempo=tempo*models[indicedelmodelo].disccount;
    precioproducto=precioproducto-tempo;
  }
  if (models[indicedelmodelo].tax>0) {
    tempo=precioproducto/100;
    tempo=tempo*models[indicedelmodelo].tax;
    precioproducto=precioproducto+tempo;
  }
  precioproducto=redondearprecio(precioproducto); 
  return precioproducto;
}
function comprobararreglarcookiedeconfiguracion() {
  var cookieconfiguracion;
  var arpartes;
  var arpartes2;
  var arpartes3=new Array();
  var listaproductos=new HashArray(0);
  var listamodelos=new HashArray(0);
  var listaunidades=new HashArray(0);
  var listaproductosmodelos=new HashArray(0);
  var preciodelcarro=0;
  var botonpaypal;
  var z=0;
  for (var i=0;i<NUMEROMAXDEPRODUCTOS;i++) {
    listaproductos.add(""+i,"SI");
  }
  for (var i=1;i<=NUMEROMAXMODELOS;i++) {
    listamodelos.add(""+i,"SI");
  }
  for (var i=1;i<=NUMEROMAXUNIDADES;i++) {
    listaunidades.add(""+i,"SI");
  }
  cookieconfiguracion=GetCookie("configuracion");
  arpartes=cookieconfiguracion.split("|");
  if (cookieconfiguracion=="") {
    return;
  }
  if (arpartes.length<2) {
    return;   
  }
  if (arpartes.length>(NUMEROMAXDEPRODUCTOS*NUMEROMAXMODELOS)+1) {
    SetCookie("configuracion","");
    return;
  }
  arpartes3[0]=arpartes[0];
  z++;
  for (var i=1;i<arpartes.length;i++) {
    arpartes2=arpartes[i].split("=");
    if (arpartes2.length==3 && listaproductos.existskey(arpartes2[0])==true && listamodelos.existskey(arpartes2[1])==true && listaunidades.existskey(arpartes2[2])==true && parseInt(arpartes2[0])<product.length && numerodemodelosdelproducto(arpartes2[0])>=parseInt(arpartes2[1]) && listaproductosmodelos.existskey(arpartes2[0] + "=" + arpartes2[1])==false) {
      arpartes3[z]=arpartes[i];
      z++;
      listaproductosmodelos.add(arpartes2[0] + "=" + arpartes2[1],"SI");
    }
  }
  if (arpartes3.length<2) {
    cookieconfiguracion=arpartes3.join("|");
    SetCookie("configuracion",cookieconfiguracion);
    return;
  }
  for (var i=1;i<arpartes3.length;i++) {
    preciodelcarro=preciodelcarro+calcularpreciodelarticulo(arpartes3[i]);
  }
  if (preciodelcarro<=0) {
    SetCookie("configuracion",arpartes3[0]);
    return;
  }
  if (formasdepago.charAt(0)=="1") {
    botonpaypal=new GenericPaypalShopingCartButton(monedaprincipal);
    if (preciodelcarro>botonpaypal.GetMaximumQuantityOfMoney()) {
      SetCookie("configuracion",arpartes3[0]);
      return;   
    }
  }
  if (cookieconfiguracion!=arpartes3.join("|")) {
    cookieconfiguracion=arpartes3.join("|");
    SetCookie("configuracion",cookieconfiguracion);
  }
}


function SetFlag(numerodeflag,valorflag) {

  var arflags=new Array();
  for (var i=0;i<top.centralflags.length;i++) {
    arflags[i]=top.centralflags.charAt(i);
  }
  arflags[numerodeflag]=valorflag;
  top.centralflags="";
  for (var i=0;i<arflags.length;i++) {
    top.centralflags=top.centralflags + arflags[i];
  }  
  top.centralflags;
}

function GetLanguageNameStore() {
  var cookieconfiguracion;
  var arpartes;
  if (top.centralflags.charAt(2)=="0") {
    cookieconfiguracion=GetCookie("configuracion");
    arpartes=cookieconfiguracion.split("|");
    if (arpartes.length<1) {
      return "";
    }  
    else {
      
      return arpartes[0];
    }
  }
  else {
    
    return top.lenguajeelegido;
  }
}
function existslanguage(nombrelenguaje) {
  var arlenguajes;
  var retval=false;
  arlenguajes=lenguajesdisponibles.split("|");
  for (var i=0;i<arlenguajes.length;i++) {
    if (arlenguajes[i].toUpperCase()==nombrelenguaje.toUpperCase()) {
      return true;
    }
  }    
  return retval;
}
function StoreSelectedLanguage(nombrelenguaje) {
  var cookieconfiguracion;
  var arpartes;
  if (modelopagina!=0) {
    top.lenguajeelegido=nombrelenguaje;
  }
  else {
    cookieconfiguracion=GetCookie("configuracion");
    arpartes=cookieconfiguracion.split("|");
    if (arpartes[0].toUpperCase()!=nombrelenguaje.toUpperCase()) {
      arpartes[0]=nombrelenguaje;
      cookieconfiguracion=arpartes.join("|");
      SetCookie("configuracion",cookieconfiguracion);
    }
  }

}

function cargarpedido() {
  var cookieconfiguracion;
  var arpartes;
  if (qshurlpagina.getvalue("inframe")=="1" && top.centralflags.charAt(3)=="0") {
    cookieconfiguracion=GetCookie("configuracion");
    arpartes=cookieconfiguracion.split("|");
    for (var i=1;i<arpartes.length;i++) {
      top.productosalmacenados[top.numeroproductos]=arpartes[i];
      top.numeroproductos++;

    }
    SetFlag(3,"1");
  }   
 
}
function marcarpaginacomocargadayactualizarmarcos(pagina) {
  SetFlag(0,"1");
  SetFlag(1,pagina);
  if (top.hayqueactualizar==true) {
    if ((modelopagina==1 || modelopagina==2) && archivodelmarcoseleccionado(1).toUpperCase()=="CONTROL.HTM") {
      top.frames.marco.location.reload();

    }
    else if ((modelopagina==3 || modelopagina==4) && archivodelmarcoseleccionado(2).toUpperCase()=="CONTROL2.HTM") {
      top.frames.marco2.location.reload();

    }
    else if (modelopagina!=0) {
      if (archivodelmarcoseleccionado(1).toUpperCase()=="CONTROL.HTM") {
        top.frames.marco.location.reload();
      }
      if (archivodelmarcoseleccionado(2).toUpperCase()=="CONTROL2.HTM") {
        top.frames.marco2.location.reload();
      }
    }
    top.hayqueactualizar=false;
  }  

}

function marcarpaginacomodescargadaycerrarventanas() {
  SetFlag(0,"0");
  SetFlag(1,"0");
  
  if (top.handleventana!=null && typeof(top.handleventana)=="object" && top.handleventana.closed==false) {
    top.handleventana.close();
  }
  top.handleventana=null;
}

function sepuedeusarmodocompacto() {

  var hascategorias=new HashArray(0);
  var hassubcategorias=new HashArray(0);
  var arcategorias;
  var arsubcategorias;

  for (var i=0;i<product.length && i<NUMEROMAXDEPRODUCTOS;i++) {
    hascategorias.add(product[i].category,"SI");
    hassubcategorias.add(product[i].subcategory,"SI");
  }
  arcategorias=hascategorias.keys();
  arsubcategorias=hassubcategorias.keys();
  if (arcategorias.length<=1 && arsubcategorias.length<=1) {
    return true;
  }
  else {
    return false;
  }
}
function numerodeproductos() {
  var cookieconfiguracion;
  var arpartes;
  if (modelopagina==0 || top.centralflags.charAt(3)=="0") {
    cookieconfiguracion=GetCookie("configuracion");
    arpartes=cookieconfiguracion.split("|");
    if (arpartes.length<2) {
      return 0;
    }
    else {
      return arpartes.length-1;
    }
  }
  else {
    return top.numeroproductos;
  }    
}
function numerodelenguajes() {

  var arpartes=lenguajesdisponibles.split("|");
  return arpartes.length;

}

function elegirlenguaje() {
  if (top.centralflags.charAt(0)=="1") { 
    cerrarventanas();
    top.handleventana=window.open("chooselanguage.htm","VENTALENGUAJE","height=50,width=400,resizable=no");
  }
}

function scrollvertical() {

  if (window.pageYOffset!=null) {
    return window.pageYOffset;
  }
  else if (document.body.scrollWidth!=null) {
    return document.body.scrollTop;
  }
  else {
    return true;
  }

}
function movercapas() {

  var lyhcapa=new LayerHandle("capabuscador");
  lyhcapa.SetTop(scrollvertical());
  lyhcapa.SetName("capadisclaimer");
  lyhcapa.SetTop(scrollvertical());
  if (top.centralflags.charAt(1)=="7") {
    lyhcapa.SetName("capalicencia");
    lyhcapa.SetTop(scrollvertical());
  }
  lyhcapa=null;
}

function mostrarbuscador() {
  var lyhcapabuscador=new LayerHandle("capabuscador");
  if (top.centralflags.charAt(0)=="1") {
    ocultardisclaimer(); 
    ocultarlicencia();
    lyhcapabuscador.SetVisibility(true);
  }
  lyhcapabuscador=null;
}
function obtenercategorias() {

  var hascategorias=new HashArray(false);
  var arcategorias;

  for (var i=0;i<product.length && i<NUMEROMAXDEPRODUCTOS;i++) {
    hascategorias.add(product[i].category.toUpperCase(),"SI");
  }
  arcategorias=hascategorias.keys();
  return arcategorias;
}

function obtenersubcategorias(categoria) {

  var hassubcategorias=new HashArray(false);
  var arsubcategorias;
  var cadenasubcategoria;
  for (var i=0;i<product.length && i<NUMEROMAXDEPRODUCTOS;i++) {
    if (product[i].category.toUpperCase()==categoria.toUpperCase()) {
      cadenasubcategoria=product[i].subcategory.charAt(0).toUpperCase();
      cadenasubcategoria=cadenasubcategoria+product[i].subcategory.substring(1).toLowerCase();

      hassubcategorias.add(cadenasubcategoria,"SI");
    }
  }
  arsubcategorias=hassubcategorias.keys();
  return arsubcategorias;
}
function ocultarbuscador() {
  var lyhcapabuscador=new LayerHandle("capabuscador");
  if (top.centralflags.charAt(0)=="1") { 
    lyhcapabuscador.SetVisibility(false);
  }
  lyhcapabuscador=null;
}

function iniciarbusqueda() {
  var cadenatempo;
  var arpartesbusqueda=new Array();
  arpartesbusqueda[0]="";
  arpartesbusqueda[1]="3";
  arpartesbusqueda[2]="0";
  arpartesbusqueda[3]="1";
  arpartesbusqueda[4]="-1@-1";
  if (camposdelbuscador=="0100" || camposdelbuscador=="0010" || camposdelbuscador=="0110") {
    cadenatempo=document.FRMBUSCADOR.txtprecio.value
    if (trim(cadenatempo)=="" || isNaN(cadenatempo)==true || parseFloat(cadenatempo)<=0) {
      alert(texto23);
      return;
    }
    arpartesbusqueda[0]="";
    arpartesbusqueda[1]=document.FRMBUSCADOR.slbprecio.options[document.FRMBUSCADOR.slbprecio.selectedIndex].value;
    arpartesbusqueda[2]=cadenatempo;
    if (camposdelbuscador=="0100") {
      arpartesbusqueda[3]="1";
    }
    else if (camposdelbuscador=="0010" && ponerprecioendosmonedas==false) {
      arpartesbusqueda[3]="1";
    }
    else if (camposdelbuscador=="0010" && ponerprecioendosmonedas==true) {
      arpartesbusqueda[3]="2";
    }
    else {
      arpartesbusqueda[3]=document.FRMBUSCADOR.slbmonedas.options[document.FRMBUSCADOR.slbmonedas.selectedIndex].value;
    } 
    arpartesbusqueda[4]="-1@-1";
  } 
  else {

    if (camposdelbuscador.charAt(0)=="1") {
      cadenatempo=document.FRMBUSCADOR.txtcadenabusaqueda.value
      if (trim(cadenatempo)=="") {
        alert(texto24);
        return;
      }
      if (cadenatempo.indexOf("|")!=-1) {
        alert(texto25);
        return;
      }
      arpartesbusqueda[0]=cadenatempo;
    }

    if (camposdelbuscador.charAt(1)=="1" || camposdelbuscador.charAt(2)=="1") {
      cadenatempo=document.FRMBUSCADOR.txtprecio.value
      if (trim(cadenatempo)=="" || isNaN(cadenatempo)==true || parseFloat(cadenatempo)<=0) {
        arpartesbusqueda[2]="0";
      }
      else {
        arpartesbusqueda[2]=cadenatempo;
      }
      if (arpartesbusqueda[2]=="0") {
        arpartesbusqueda[1]="3";
      }
      else {
        arpartesbusqueda[1]=document.FRMBUSCADOR.slbprecio.options[document.FRMBUSCADOR.slbprecio.selectedIndex].value;
      }
    }
    if (camposdelbuscador.charAt(1)=="1" && camposdelbuscador.charAt(2)=="0") {
      arpartesbusqueda[3]="1";
    }
    else if (camposdelbuscador.charAt(1)=="0" && camposdelbuscador.charAt(2)=="1" && ponerprecioendosmonedas==false) {
      arpartesbusqueda[3]="1";
    }
    else if (camposdelbuscador.charAt(1)=="0" && camposdelbuscador.charAt(2)=="1" && ponerprecioendosmonedas==true) {
      arpartesbusqueda[3]="2";
    }
    else if (camposdelbuscador.charAt(1)=="1" && camposdelbuscador.charAt(2)=="1" && ponerprecioendosmonedas==true) {
 
      arpartesbusqueda[3]=document.FRMBUSCADOR.slbmonedas.options[document.FRMBUSCADOR.slbmonedas.selectedIndex].value;

    } 
    if (camposdelbuscador.charAt(3)=="1") {
      arpartesbusqueda[4]=document.FRMBUSCADOR.slbcategorias.options[document.FRMBUSCADOR.slbcategorias.selectedIndex].value;
    }
  }
  top.numeropagina=0;
  top.hayqueactualizar=true;
  if (modelopagina==0) {
    location.href="search.htm?b=" + escape(arpartesbusqueda.join("|")) + "&p=1";
  }
  else {
    location.href="search.htm?inframe=1&b=" + escape(arpartesbusqueda.join("|")) + "&p=1";
  }
}

function ocultardisclaimer() {
  var lyhcapadisclaimer=new LayerHandle("capadisclaimer");
  if (top.centralflags.charAt(0)=="1") { 
    lyhcapadisclaimer.SetVisibility(false);
    lyhcapadisclaimer=new LayerHandle("capadisclaimerinterna");
    lyhcapadisclaimer.SetVisibility(false);
    lyhcapadisclaimer=new LayerHandle("capadisclaimerinterna2");
    lyhcapadisclaimer.SetVisibility(false);

  }
  lyhcapadisclaimer=null;
}

function iradisclaimer() {
  var lyhcapadisclaimer=new LayerHandle("capadisclaimer");
  if (top.centralflags.charAt(0)=="1") { 
    if (ponerdisclaimerenunacapa==true) {
      ocultarbuscador();
      ocultarlicencia();
      lyhcapadisclaimer.SetVisibility(true);
      lyhcapadisclaimer=new LayerHandle("capadisclaimerinterna");
      lyhcapadisclaimer.SetVisibility(true);
      lyhcapadisclaimer=new LayerHandle("capadisclaimerinterna2");
      lyhcapadisclaimer.SetVisibility(true);
    }
    else {

      cerrarventanas();
      top.handleventana=window.open("disclaimer.htm","VENTALENGUAJE","height=500,width=500,resizable=no,scrollbars=yes");
    
    }
  }
  lyhcapadisclaimer=null;
}
function cerrarventanas() {
   
    if (top.handleventana!=null && typeof(top.handleventana)=="object" && top.handleventana.closed==false) {
      top.handleventana.close();
    }
    top.handleventana=null;

}

function iracategorias() {
  top.hayqueactualizar=true;
  if (modelopagina==0) {
    location.href="categories.htm?p=1";

  }
  else {
    location.href="categories.htm?inframe=1&p=1";
  }
}

function iraproductos() {
  
  if (top.centralflags.charAt(1)=="3" ||top.centralflags.charAt(1)=="6" || top.centralflags.charAt(1)=="7") {
    top.hayqueactualizar=true;
  }
  

  if (modelopagina==0) {
    location.href="products.htm?c=0&s=0&p=1";

  }
  else {
    location.href="products.htm?c=0&s=0&p=1&inframe=1";
  }

}

function iravercambiarproductos() {
  top.hayqueactualizar=true;
  if (modelopagina==0) {
    location.href="viewchangeorder.htm";

  }
  else {
    location.href="viewchangeorder.htm?inframe=1";
  }
}

function numeropaginasdecategorias(numeroderegistros) {

  var cuenta=0;
  var cuenta=parseInt(numeroderegistros/numerodecategoriasporpagina);
  if (numeroderegistros%numerodecategoriasporpagina!=0) {
    cuenta++;
  }
  return cuenta;
}


function obtenercategoriaspagina(npagina) {
  var arcategorias=obtenercategorias;
  var arcategorias2=new Array();
  var j=0;
  var z=0;
  var c=0;
  arcategorias=obtenercategorias();
  if (npagina>parseInt(arcategorias.length/numerodecategoriasporpagina)) {
    j=(npagina-1)*numerodecategoriasporpagina;
    for (var i=j;i<arcategorias.length;i++) {
      arcategorias2[z]=new Array();
      arcategorias2[z][0]=arcategorias[i];
      arcategorias2[z][1]=i;
      z++;


    }
  }
  else {
    c=(npagina-1)*numerodecategoriasporpagina;
    for (var i=c;i<(c+numerodecategoriasporpagina);i++) {
      
      arcategorias2[z]=new Array()
      arcategorias2[z][0]=arcategorias[i];
      arcategorias2[z][1]=i;
      z++;

    }
  }
  return arcategorias2;
}

function creararbolcategorias(arcategorias) {
  var arcategorias2;
  var arsubcategorias;
  var cadenatempo;
  var cadenares;
  var cadenares2;
  
  cadenatempo = "<B><FONT";
  if (trim(tipofuente1)!="") {
    cadenatempo=cadenatempo + " FACE=\""+ tipofuente1  +"\""
  }
  cadenatempo=cadenatempo + " COLOR=\""+ colorfuente1  +"\""
  cadenatempo=cadenatempo + " SIZE="+ tamanofuente1  +">";
  arcategorias2=obtenercategorias();
  cadenares2="<FONT"
  if (trim(tipofuente8)!="") {
      cadenares2=cadenares2 + " FACE=\""+ tipofuente8  +"\""
  }
  cadenares2=cadenares2 + " COLOR=\""+ colorfuente8  +"\""
  cadenares2=cadenares2 + " SIZE="+ tamanofuente8  +">";
 
  cadenares ="<TABLE BORDER=0 CELLPADDING=10 CELLSPACING=10 WIDTH=" + porcentajeanchotablacategorias + "%>";
  for (var i=0;i<arcategorias.length;i++) {
    if (i%2==0) {
      cadenares=cadenares+"<TR><TD BGCOLOR=\""+colorfondocategoria2+"\">";
    }
    else {
      cadenares=cadenares+"<TR><TD BGCOLOR=\""+colorfondocategoria1+"\">";
    }
    cadenares=cadenares+"<DIV STYLE=\"position:relative;top:0px;left:"+ pocentajedeposiciondecategorias +"%\"><B><FONT";
    if (trim(tipofuente6)!="") {
      cadenares=cadenares + " FACE=\""+ tipofuente6  +"\""
    }
    cadenares=cadenares + " COLOR=\""+ colorfuente6  +"\""
    cadenares=cadenares + " SIZE="+ tamanofuente6  +">";  
    cadenares=cadenares + "<NOBR>"+arcategorias[i][0] + "</NOBR><BR></FONT></B>";
    arsubcategorias=obtenersubcategorias(arcategorias[i][0]);
    for (var z=0;z<arsubcategorias.length;z++) {

      if (modelopagina==0) {
        cadenares=cadenares+cadenares2 + " <NOBR>|_____<B><A HREF=\"products.htm?c=" + escape(arcategorias[i][1]) + "&s=" + escape(z) + "&p=1\" ONCLICK=\"top.hayqueactualizar=true;\">" + arsubcategorias[z] + "</A></B></FONT></NOBR><BR>"; 
      }
      else {
        cadenares=cadenares+cadenares2 + " <NOBR>|_____<B><A HREF=\"products.htm?c=" + escape(arcategorias[i][1]) + "&s=" + escape(z) + "&p=1&inframe=1\" ONCLICK=\"top.hayqueactualizar=true;\">" + arsubcategorias[z] + "</A></B></FONT></NOBR><BR>"; 

      }
    }
    cadenares=cadenares+"</FONT></B></DIV></TD></TR>";
    
  }

  cadenares=cadenares+"</TABLE>";
  cadenares=cadenares+"<TABLE BORDER=0 WIDTH="+ (porcentajeanchotablacategorias-2) + "%><TR>" 
 if (parseInt(qshurlpagina.getvalue("p"))>1) {
  
    cadenares=cadenares+"<TD ALIGN=\"LEFT\">" + cadenatempo + "  <A HREF=\"\" ONCLICK=\"irapaginacategorias("+ (parseInt(qshurlpagina.getvalue("p"))-1) +");return false;\">"+texto26+"</A></FONT></B></TD>";
  }
  if (parseInt(qshurlpagina.getvalue("p"))<numeropaginasdecategorias(arcategorias2.length)) {
        
     cadenares=cadenares+ "<TD ALIGN=\"RIGHT\">" + cadenatempo + "  <A HREF=\"\" ONCLICK=\"irapaginacategorias("+ (parseInt(qshurlpagina.getvalue("p"))+1) +");return false;\">"+texto27+"</A></FONT></B></TD>";

  }          
  cadenares=cadenares+"</TR></TABLE>"
  return cadenares;
}

function irapaginacategorias(npagina) {

  if (modelopagina==0) {
    location.href="categories.htm?p=" + escape(npagina);

  }
  else {
    location.href="categories.htm?inframe=1&p=" + escape(npagina);
  }


}

function iraprincipal() {

  top.hayqueactualizar=true;
  if (modelopagina==0) {
    location.href="index.htm";

  }
  else {
    location.href="index.htm?inframe=1";
  }


}

function comprobarcadenabusqueda(cadenabusqueda) {
  var arpartes;
  var arpartes2;
  var arcategorias;
  var arsubcategorias;


  arpartes=cadenabusqueda.split("|");
  if (arpartes.length!=5) {
   
    return false;
  }
  if (camposdelbuscador=="0110" || camposdelbuscador=="0100" || camposdelbuscador=="0010") {

    if (camposdelbuscador=="0110" && ponerprecioendosmonedas==false) {
      return false;
    }
    if (arpartes[0]!="") {
      return false;
    }
    if (isNaN(arpartes[2])==true || parseFloat(arpartes[2])<=0) {
      return false; 
    }
    if (arpartes[1]!="1" && arpartes[1]!="2" && arpartes[1]!="3") {
      return false; 
    }
    if (camposdelbuscador=="0100" && arpartes[3]!="1") {
      return false;
      
    }
    if (camposdelbuscador=="0010" && ponerprecioendosmonedas==false && arpartes[1]!="1") {
      return false;
      
    }
    if (camposdelbuscador=="0010" && ponerprecioendosmonedas==true && arpartes[3]!="2") {
      return false;
      
    }
    if (camposdelbuscador=="0110" && arpartes[3]!="1" && arpartes[3]!="2") {
      return false;
    }
    if (arpartes[4]!="-1@-1") {
      return false;
    }
    return true;
  }
  else {
    if(camposdelbuscador.charAt(0)=="1" && trim(arpartes[0])=="") {
      return false;
    }

    if(camposdelbuscador.charAt(0)=="0" && arpartes[0]!="") {
      return false;
    }
    if (camposdelbuscador.charAt(1)=="0" && camposdelbuscador.charAt(2)=="0" && (arpartes[1]!="3" || arpartes[2]!="0" || arpartes[3]!="1")) {
      return false;  
    }
    if (camposdelbuscador.charAt(1)=="1" || camposdelbuscador.charAt(2)=="1") {
      if (camposdelbuscador.charAt(1)=="1" && camposdelbuscador.charAt(2)=="1" && ponerprecioendosmonedas==false && arpartes[3]!="1") {
        return false;  
      }
      if (isNaN(arpartes[2])==true || parseFloat(arpartes[2])<0) {
        return false;
      }
      if (parseFloat(arpartes[2])==0 && arpartes[1]!="3") {
        return false;
      }
      if (parseFloat(arpartes[2])>0 && arpartes[1]!="1" && arpartes[1]!="2" && arpartes[1]!="3") {
        return false;
      }
      if (camposdelbuscador.charAt(1)=="1" && camposdelbuscador.charAt(2)=="0" && arpartes[3]!="1") {
        return false;
      }
      if (camposdelbuscador.charAt(1)=="0" && camposdelbuscador.charAt(2)=="1" && ponerprecioendosmonedas==false && arpartes[3]!="1") {
        return false;
      }

      if (camposdelbuscador.charAt(1)=="0" && camposdelbuscador.charAt(2)=="1" && ponerprecioendosmonedas==true && arpartes[3]!="2") {
        return false;
      }

      if (camposdelbuscador.charAt(1)=="1" && camposdelbuscador.charAt(2)=="1" && arpartes[3]!="1" && arpartes[3]!="2") {
        return false;
      }

    }
    if (camposdelbuscador.charAt(3)=="0" && arpartes[4]!="-1@-1") {
      return false;
    }
    if (camposdelbuscador.charAt(3)=="1") {
      arpartes2=arpartes[4].split("@");
      if (arpartes2[0]=="-1" && arpartes2[1]!="-1") {
        return false;
      }    
      if (arpartes2[0]=="-1" && arpartes2[1]=="-1") {
        return true;
      }     
      if (isNaN(arpartes2[0])==true || parseInt(arpartes2[0])!=parseFloat(arpartes2[0]) || parseInt(arpartes2[0])<-1) {
        return false;
      }
      if (isNaN(arpartes2[1])==true || parseInt(arpartes2[1])!=parseFloat(arpartes2[1]) || parseInt(arpartes2[1])<-1) {
        return false;
      }
      arcategorias=obtenercategorias();
      if (parseInt(arpartes2[0])>(arcategorias.length-1)) {
        return false;
      }
      arsubcategorias=obtenersubcategorias(arcategorias[parseInt(arpartes2[0])]);
      if (parseInt(arpartes2[1])>(arsubcategorias.length-1)) {
        return false;
      }
    }

    return true;    
  }
}

function obtnermodelos(numeroproducto) {
  
  var idproducto;
  var arresultados = new Array();
  var cuenta=0;
   
  idproducto=product[numeroproducto].productid;
  for (var i=0;i<models.length && i<(NUMEROMAXDEPRODUCTOS*NUMEROMAXMODELOS);i++) {    
    if (models[i].productid==idproducto) {
      arresultados[cuenta]=models[i];
      cuenta++;
      if (cuenta>=NUMEROMAXMODELOS) {
        break;
      }
    }
  }
  return arresultados;
}

function buscarproductos(cadenabusqueda) {

  var arpartes;
  var arpartes2;
  var nproducto;
  var nmodelo;
  var cadenatempo;
  var cadenatempo2;
  var arresultado=new Array();
  var cuenta=0;
  var arcategorias;
  var arsubcategorias
  var armodelos;
  
  arcategorias=obtenercategorias();
  arpartes=cadenabusqueda.split("|")
  arpartes[0]=arpartes[0].toUpperCase();
  for (var i=0;i<product.length && i<NUMEROMAXDEPRODUCTOS;i++) {
    cadenatempo=product[i].productname;
    cadenatempo=cadenatempo.toUpperCase();
    cadenatempo2=product[i].description;
    cadenatempo2=cadenatempo2.toUpperCase();
    if (cadenatempo.indexOf(arpartes[0])==-1 && cadenatempo2.indexOf(arpartes[0])==-1) {
      continue; 
    }
    arpartes2=arpartes[4];
    if (arpartes2!="-1@-1") {
      arpartes2=arpartes2.split("@");
      if (product[i].category.toUpperCase()!=arcategorias[parseFloat(arpartes2[0])].toUpperCase()) {
        continue;
      }
      if (arpartes2[1]!=-1) {
        arsubcategorias=obtenersubcategorias(arcategorias[parseFloat(arpartes2[0])]);
        if (product[i].subcategory.toUpperCase()!=arsubcategorias[parseFloat(arpartes2[1])].toUpperCase()) {
          continue;
        }
      }
    }
    armodelos=obtnermodelos(i)

    
    for (var z=0;z<armodelos.length;z++) {
      if (arpartes[3]=="1") {
        cadenatempo=armodelos[z].price;
      }
      else {
        cadenatempo=armodelos[z].price2;
      }
      if ((arpartes[1]=="1" && parseFloat(arpartes[2])==cadenatempo) || (arpartes[1]=="2" && cadenatempo<=parseFloat(arpartes[2])) || (arpartes[1]=="3" && cadenatempo>=parseFloat(arpartes[2]))) {
        arresultado[cuenta]=i + "|" + z;
        cuenta++;
      }
    }
  }  
  return arresultado;
}


function numeropaginasproductos(numeroderegistros) {

  var cuenta=0;
  var cuenta=parseInt(numeroderegistros/numerodeproductosporpagina);
  if (numeroderegistros%numerodeproductosporpagina!=0) {
    cuenta++;
  }
  return cuenta;
}

function obtenerproductospagina(npagina,arproductos) {
  var arproductos2=new Array();
  var j=0;
  var z=0;
  var c=0;
  if (npagina>parseInt(arproductos.length/numerodeproductosporpagina)) {
    j=(npagina-1)*numerodeproductosporpagina;
    for (var i=j;i<arproductos.length;i++) {
      arproductos2[z]=arproductos[i];
      z++;


    }
  }
  else {
    c=(npagina-1)*numerodeproductosporpagina;
    for (var i=c;i<(c+numerodeproductosporpagina);i++) {
      
      arproductos2[z]=arproductos[i];
      z++;

    }
  }
  return arproductos2
}
function crearfichasproductos(arfichas) {

  var objmodelo;
  var arpartes;
  var cadenares="";
  var cadenares2;
  var arpartes2;

  cadenares2="<FONT"
  if (trim(tipofuente9)!="") {
      cadenares2=cadenares2 + " FACE=\""+ tipofuente9  +"\""
  }
  cadenares2=cadenares2 + " COLOR=\""+ colorfuente9  +"\""
  cadenares2=cadenares2 + " SIZE="+ tamanofuente9  +">";
  cadenares ="<TABLE BORDER=0 CELLPADDING=10 CELLSPACING=10 WIDTH=" +porcentajeanchotablaproductos + "%>";
  for (var i=0;i<arfichas.length;i++) {
    arpartes=arfichas[i].split("|");
    arpartes[0]=parseInt(arpartes[0]);
    arpartes[1]=parseInt(arpartes[1]);

    if (i%2==0) {
      cadenares=cadenares+"<TR><TD BGCOLOR=\""+colorfondominificha2+"\">";
    }
    else {
      cadenares=cadenares+"<TR><TD BGCOLOR=\""+colorfondominificha1+"\">";
    }
    cadenares=cadenares + "<TABLE BORDER=0><TR><TD>"
    if (imagesdb[arpartes[0]]==null) {
      cadenares=cadenares+"<DIV NAME=\"capa" + i +"\" STYLE=\"position:relative;height:"+alturaminiimagen+"px;width:"+anchuraminiimagen+"px;\"></DIV></TD>";
    }
    else {
      cadenares=cadenares+"<A HREF=\"\" ONCLICK=\"irafichagrande("+arpartes[0]+","+ arpartes[1] +");return false;\"><IMG SRC=\"Images/"+ imagesdb[arpartes[0]].archive +"\" ALT=\""+ imagesdb[arpartes[0]].alternativetext +"\" HEIGHT="+alturaminiimagen  + " WIDTH=" + anchuraminiimagen + "></A></TD>";
    } 
    cadenares=cadenares+"<TD>";
    cadenares=cadenares+"<TABLE BORDER=0 CELLSPACING=2 CELLPADDING=5><TR>";
    //FILA1
    
    if (i%2==0) {
      cadenares=cadenares+"<TR><TH BGCOLOR=\""+colorfondominificha1+"\" ALIGN=\"LEFT\">" +cadenares2;
    }
    else {
      cadenares=cadenares+"<TR><TH BGCOLOR=\""+colorfondominificha2+"\" ALIGN=\"LEFT\">" + cadenares2;
    }
    
    cadenares=cadenares+"<A HREF=\"\" ONCLICK=\"irafichagrande("+arpartes[0]+","+ arpartes[1] +");return false;\">" + product[arpartes[0]].productname + "</A>";
    cadenares=cadenares+"</FONT></TH>";
    objmodelo=obtenermodeloproducto(arpartes[0],arpartes[1]);
    if (i%2==0) {
      cadenares=cadenares+"<TH BGCOLOR=\""+colorfondominificha1+"\" ALIGN=\"LEFT\">" + cadenares2 +texto32;
    }
    else {
      cadenares=cadenares+"<TH BGCOLOR=\""+colorfondominificha2+"\" ALIGN=\"LEFT\">"  +cadenares2+ texto32;
    }
    cadenares=cadenares+ " " +objmodelo.model;
    cadenares=cadenares+"</FONT></TH>"

    cadenares=cadenares+"</TR><TR>";
    //FILA2    
    if (i%2==0) {
      cadenares=cadenares+"<TR><TH BGCOLOR=\""+colorfondominificha1+"\" ALIGN=\"LEFT\">" +cadenares2;
    }
    else {
      cadenares=cadenares+"<TR><TH BGCOLOR=\""+colorfondominificha2+"\" ALIGN=\"LEFT\">" + cadenares2;
    }
    
    arpartes2=obtenernumerocategoriasubcategoria(arpartes[0]);

    if (modelopagina==0) {
      cadenares=cadenares+texto31 + "<A HREF=\"products.htm?c=" + escape(arpartes2[0]) + "&s=" + escape(arpartes2[1]) + "&p=1\">" + product[arpartes[0]].category + "/" + product[arpartes[0]].subcategory + "</A>";
    }
    else {
      cadenares=cadenares+texto31 + "<A HREF=\"products.htm?c=" + escape(arpartes2[0]) + "&s=" + escape(arpartes2[1]) + "&p=1&inframe=1\">" + product[arpartes[0]].category + "/" + product[arpartes[0]].subcategory + "</A>";

    }
    cadenares=cadenares+"</FONT></TH>";
    if (i%2==0) {
      cadenares=cadenares+"<TH BGCOLOR=\""+colorfondominificha1+"\" ALIGN=\"LEFT\">" +cadenares2 +texto8 + " ";
    }
    else {
      cadenares=cadenares+"<TH BGCOLOR=\""+colorfondominificha2+"\" ALIGN=\"LEFT\">" + cadenares2 + texto8 + " ";
    }
    
    if (monedaprincipal==1) {
      cadenares=cadenares+calcularpreciodelarticulo(arpartes[0] + "=" + (arpartes[1]+1) + "=1")+ " " + texto15;

    }        
    else if (monedaprincipal==2) {
      cadenares=cadenares+calcularpreciodelarticulo(arpartes[0] + "=" + (arpartes[1]+1) + "=1")+ " " + texto16;

    }        
    else if (monedaprincipal==3) {
      cadenares=cadenares+calcularpreciodelarticulo(arpartes[0] + "=" + (arpartes[1]+1) + "=1")+ " " + texto17;
    }        
    else if (monedaprincipal==4) {
      cadenares=cadenares+calcularpreciodelarticulo(arpartes[0] + "=" + (arpartes[1]+1) + "=1")+ " " + texto18;
     
    }        
    else if (monedaprincipal==5) {
      cadenares=cadenares+calcularpreciodelarticulo(arpartes[0] + "=" + (arpartes[1]+1) + "=1")+ " " + texto19;
    }
    else  {
      cadenares=cadenares+calcularpreciodelarticulo(arpartes[0] + "=" + (arpartes[1]+1) + "=1")+ " " + texto20;

    }
    if (ponerprecioendosmonedas==true) {
       cadenares=cadenares+"/" + calcularpreciodelarticulo2(arpartes[0] + "=" + (arpartes[1]+1) + "=1") + " " + nombredelamonedasecundaria;

    }
    cadenares=cadenares+"</FONT></TH>";


    cadenares=cadenares+"</TR>";

    /////////////////
    cadenares=cadenares+"</TR></TABLE>";

    cadenares=cadenares+"</TD></TR></TABLE>";
  }

 
  cadenares=cadenares+"</TD></TR></TABLE>";
  if (usarmododetiendacompacta==false || sepuedeusarmodocompacto()==false) {
    cadenares=cadenares+"<TABLE BORDER=0 WIDTH=" + (porcentajeanchotablaproductos-2) + "%><TR><TD ALIGN=\"LEFT\">";
    cadenares2="<FONT"
    if (trim(tipofuente1)!="") {
      cadenares2=cadenares2 + " FACE=\""+ tipofuente1  +"\""
    }
    cadenares2=cadenares2 + " COLOR=\""+ colorfuente1  +"\""
    cadenares2=cadenares2 + " SIZE="+ tamanofuente1  +">";
    if (parseInt(qshurlpagina.getvalue("p"))>1) {
  
      cadenares=cadenares+cadenares2+"  <A HREF=\"\" ONCLICK=\"irapaginabusquedas("+ (parseInt(qshurlpagina.getvalue("p"))-1) +");return false;\"><B>"+texto26+"</B></A></FONT></B>";
    }
    cadenares=cadenares+ "</TD>";

    cadenares=cadenares+"<TD ALIGN=\"RIGHT\">";
    if (parseInt(qshurlpagina.getvalue("p"))<numeropaginasproductos(arresultadosbusqueda.length)) {
        
      cadenares=cadenares+cadenares2+ "  <A HREF=\"\" ONCLICK=\"irapaginabusquedas("+ (parseInt(qshurlpagina.getvalue("p"))+1) +");return false;\"><B>"+texto27+"</B></A></FONT></B>";

    }  
      cadenares=cadenares+"</TD></TR></TABLE>"
  }
  return cadenares;

}

function obtenermodeloproducto(numeroproducto,numeromodelo) {

  var idproducto;
  var arresultados = new Array();
  var cuenta=0;
   
  idproducto=product[numeroproducto].productid;
  for (var i=0;i<models.length && i<(NUMEROMAXDEPRODUCTOS*NUMEROMAXMODELOS);i++) {    
    if (models[i].productid==idproducto) {
      arresultados[cuenta]=models[i];
      cuenta++;
      if (cuenta>=NUMEROMAXMODELOS) {
        break;
      }
    }
  }
  return arresultados[numeromodelo];
}

function calcularpreciodelarticulo2(cadenaarticulo) {

  var arpartes;
  var numeromodelo=0;
  var idproducto;
  var indicedelmodelo=0;
  var precioproducto=0;
  var tempo=0;

  arpartes=cadenaarticulo.split("=");
  idproducto=product[parseInt(arpartes[0])].productid;
  for (var i=0;i<models.length && i<(NUMEROMAXDEPRODUCTOS*NUMEROMAXMODELOS);i++) {
    if (models[i].productid==idproducto) {
      numeromodelo++;
    }
    if (numeromodelo==parseInt(arpartes[1])) {
      indicedelmodelo=i;
      break;
    }
  }
  precioproducto=models[indicedelmodelo].price2*parseInt(arpartes[2]);
  if (models[indicedelmodelo].disccount>0) {
    tempo=precioproducto/100;
    tempo=tempo*models[indicedelmodelo].disccount;
    precioproducto=precioproducto-tempo;
  }
  if (models[indicedelmodelo].tax>0) {
    tempo=precioproducto/100;
    tempo=tempo*models[indicedelmodelo].tax;
    precioproducto=precioproducto+tempo;
  }
  precioproducto=redondearprecio(precioproducto);
  return precioproducto;
}
function irapaginabusquedas(npagina) {
  qshurlpagina.add("p",npagina);
  location.href="search.htm" + qshurlpagina.toString();



}

function redondearprecio(precio) {

  var preciotempo="" + precio;
  var preciotempo2;
  var preciotempo3;
  var cadtempo="";
  var posicion=0;
  if (parseInt(precio)==precio) {
    return precio
  }
  posicion=preciotempo.indexOf(".");
  preciotempo2=preciotempo.substring(0,posicion+1);
  preciotempo3=preciotempo.substring(posicion+1);
  if (preciotempo3.length<=2) {
    preciotempo=preciotempo2  + preciotempo3; 
    return parseFloat(preciotempo);
  }
  preciotempo3=preciotempo3.substring(0,3)
  if (parseInt(preciotempo3.charAt(2))>=5) {
    preciotempo3=parseInt(preciotempo3.substring(0,2));
    preciotempo3++;
    
  }
  else {
    preciotempo3=parseInt(preciotempo3.substring(0,2));

  }
  preciotempo=preciotempo2 + preciotempo3; 
  return parseFloat(preciotempo);
}

function obtenernumerocategoriasubcategoria(numeroproducto) {

  var arresultados = new Array();
  var arcategorias;
  var arsubcategorias;

  arcategorias=obtenercategorias();
  for (var i=0;i<arcategorias.length;i++) {
    if (arcategorias[i].toUpperCase()==product[numeroproducto].category.toUpperCase()) {
      arresultados[0]=i;
    }
  }
  arsubcategorias=obtenersubcategorias(product[numeroproducto].category);
  for (var i=0;i<arsubcategorias.length;i++) {
    if (arsubcategorias[i].toUpperCase()==product[numeroproducto].subcategory.toUpperCase()) {
      arresultados[1]=i;
    }
  }
  return arresultados;
}

function obternerproductos(categoria,subcategoria) {

  var arresultados=new Array()
  var cuenta=0;
  for (var i=0;i<product.length && i<NUMEROMAXDEPRODUCTOS;i++) {
    if (product[i].category.toUpperCase()==categoria.toUpperCase() && product[i].subcategory.toUpperCase()==subcategoria.toUpperCase()) {
      arresultados[cuenta]=i;
      cuenta++;
    }

  }
  return arresultados;
}


function crearfichasproductos2(arfichas) {


  var arpartes=new Array();
  var cadenares="";
  var cadenares2;
  var arpartes2;
  var arpalabras;
  cadenares2="<FONT"
  if (trim(tipofuente9)!="") {
      cadenares2=cadenares2 + " FACE=\""+ tipofuente9  +"\""
  }
  cadenares2=cadenares2 + " COLOR=\""+ colorfuente9  +"\""
  cadenares2=cadenares2 + " SIZE="+ tamanofuente9  +">";
  cadenares ="<TABLE BORDER=0 CELLPADDING=10 CELLSPACING=10 WIDTH=" +porcentajeanchotablaproductos2 + "%>";
  for (var i=0;i<arfichas.length;i++) {
   
    arpartes[0]=parseInt(arfichas[i]);
    arpartes[1]=0;


    if (i%2==0) {
      cadenares=cadenares+"<TR><TD BGCOLOR=\""+colorfondominificha2+"\">";
    }
    else {
      cadenares=cadenares+"<TR><TD BGCOLOR=\""+colorfondominificha1+"\">";
    }
    cadenares=cadenares + "<TABLE BORDER=0><TR><TD>"
    if (imagesdb[arpartes[0]]==null) {
      cadenares=cadenares+"<DIV NAME=\"capa" + i +"\" STYLE=\"position:relative;height:"+alturaminiimagen+"px;width:"+anchuraminiimagen+"px;\"></DIV></TD>";
    }
    else {
      cadenares=cadenares+"<A HREF=\"\" ONCLICK=\"irafichagrande("+arpartes[0]+","+ arpartes[1] +");return false;\"><IMG SRC=\"Images/"+ imagesdb[arpartes[0]].archive +"\" ALT=\""+ imagesdb[arpartes[0]].alternativetext +"\" HEIGHT="+alturaminiimagen  + " WIDTH=" + anchuraminiimagen + "></A></TD>";
    } 
    cadenares=cadenares+"<TD>";
    cadenares=cadenares+"<TABLE BORDER=0 CELLSPACING=2  CELLPADDING=5><TR>";
    //FILA1
    
    if (i%2==0) {
      cadenares=cadenares+"<TR><TH BGCOLOR=\""+colorfondominificha1+"\" ALIGN=\"LEFT\">" +cadenares2;
    }
    else {
      cadenares=cadenares+"<TR><TH BGCOLOR=\""+colorfondominificha2+"\" ALIGN=\"LEFT\">" + cadenares2;
    }
    
    cadenares=cadenares+"<A HREF=\"\" ONCLICK=\"irafichagrande("+arpartes[0]+","+ arpartes[1] +");return false;\">" + product[arpartes[0]].productname + "</A>";
    cadenares=cadenares+"</FONT></TH>";
    arpartes2=obtenernumerocategoriasubcategoria(arpartes[0]);
    if (i%2==0) {
      cadenares=cadenares+"<TH BGCOLOR=\""+colorfondominificha1+"\" ALIGN=\"LEFT\">"  +cadenares2;
    }
    else {
      cadenares=cadenares+"<TH BGCOLOR=\""+colorfondominificha2+"\" ALIGN=\"LEFT\">"  +cadenares2;
    }
  
   

    if (modelopagina==0) {
      cadenares=cadenares+texto31 + "<A HREF=\"products.htm?c=" + escape(arpartes2[0]) + "&s=" + escape(arpartes2[1]) + "&p=1\">" + product[arpartes[0]].category + "/" + product[arpartes[0]].subcategory + "</A>";
    }
    else {
      cadenares=cadenares+texto31 + "<A HREF=\"products.htm?c=" + escape(arpartes2[0]) + "&s=" + escape(arpartes2[1]) + "&p=1&inframe=1\">" + product[arpartes[0]].category + "/" + product[arpartes[0]].subcategory + "</A>";

    }
    cadenares=cadenares+"</FONT></TH>";


    cadenares=cadenares+"</TR>";
    cadenares=cadenares+"</TR>";
    if (i%2==0) {
      cadenares=cadenares+"<TH BGCOLOR=\""+colorfondominificha1+"\" COLSPAN=2 ALIGN=\"LEFT\">"  +cadenares2;
    }
    else {
      cadenares=cadenares+"<TH BGCOLOR=\""+colorfondominificha2+"\" COLSPAN=2 ALIGN=\"LEFT\">"  +cadenares2;
    }    
    if (trim(product[arpartes[0]].description)!="") {
      arpalabras=null;
      arpalabras=product[arpartes[0]].description.split(" ");
      for (var z=0;z<arpalabras.length && z<12;z++) {
        cadenares=cadenares+ arpalabras[z] + " ";
      }
      cadenares=cadenares + "...";
    }
    else {
      cadenares=cadenares+"<PRE>                                                      </PRE>";                   
    }
    cadenares=cadenares+"</FONT></TH></TR>";

    /////////////////
    cadenares=cadenares+"</TR></TABLE>";

    cadenares=cadenares+"</TD></TR></TABLE>";
  }

 
  cadenares=cadenares+"</TD></TR></TABLE>";
  if (usarmododetiendacompacta==false || sepuedeusarmodocompacto()==false) {
    cadenares=cadenares+"<TABLE BORDER=0 WIDTH=" + (porcentajeanchotablaproductos-2) + "%><TR><TD ALIGN=\"LEFT\">";
    cadenares2="<FONT"
    if (trim(tipofuente1)!="") {
      cadenares2=cadenares2 + " FACE=\""+ tipofuente1  +"\""
    }
    cadenares2=cadenares2 + " COLOR=\""+ colorfuente1  +"\""
    cadenares2=cadenares2 + " SIZE="+ tamanofuente1  +">";
    if (parseInt(qshurlpagina.getvalue("p"))>1) {
  
      cadenares=cadenares+cadenares2+"  <A HREF=\"\" ONCLICK=\"iranumeropaginasproductos("+ (parseInt(qshurlpagina.getvalue("p"))-1) +");return false;\"><B>"+texto26+"</B></A></FONT></B>";
    }
    cadenares=cadenares+ "</TD>";

    cadenares=cadenares+"<TD ALIGN=\"RIGHT\">";
    if (parseInt(qshurlpagina.getvalue("p"))<numeropaginasproductos(arproductoscategoria.length)) {
        
      cadenares=cadenares+cadenares2+ "  <A HREF=\"\" ONCLICK=\"iranumeropaginasproductos("+ (parseInt(qshurlpagina.getvalue("p"))+1) +");return false;\"><B>"+texto27+"</B></A></FONT></B>";

    }  
      cadenares=cadenares+"</TD></TR></TABLE>"
  }
  return cadenares

}

function iranumeropaginasproductos(npagina) {
  qshurlpagina.add("p",npagina);
  location.href="products.htm" + qshurlpagina.toString();

}

function irafichagrande(nproducto,nmodelo) {

    
  if (modelopagina==0) {
    location.href="addtocart.htm?p=" + escape(nproducto) + "&m="+escape(nmodelo) + "&u=1";

  }
  else {
    location.href="addtocart.htm?inframe=1&p=" + escape(nproducto) + "&m="+escape(nmodelo) + "&u=1";

  }

}

function elegirmodelo() {
  qshurlpagina.add("m",document.FRMMODELOS.SLBMODELOS.selectedIndex);
  location.href="addtocart.htm" + qshurlpagina.toString(); 

}

function recalcularprecio() {
  qshurlpagina.add("u",document.FRMUNIDADES.SLBUNIDADES.selectedIndex+1);
  location.href="addtocart.htm" + qshurlpagina.toString(); 

 
}

function anadiralcarro() {
  var cadenaarticulo;
  var posicion=-1;
  var ararticulos;

  if (formasdepago.charAt(0)=="1" && sesobrepasadedinero()==true) {
    alert(texto39);
  }

  if (modelopagina==0) {
    ararticulos=GetCookie("configuracion");
    ararticulos=ararticulos.split("|");

    cadenaarticulo=qshurlpagina.getvalue("p") + "=" + (parseInt(qshurlpagina.getvalue("m"))+1);
    for (var i=1;i<ararticulos.length;i++) {
      if (ararticulos[i].indexOf(cadenaarticulo)==0) {
        posicion=i;
      }
    }
    cadenaarticulo=cadenaarticulo+"=" + qshurlpagina.getvalue("u");
    if (posicion==-1) {
      posicion=ararticulos.length;
    } 
    ararticulos[posicion]=cadenaarticulo;
    SetCookie("configuracion",ararticulos.join("|"));
  }
  else {
    cadenaarticulo=qshurlpagina.getvalue("p") + "=" + (parseInt(qshurlpagina.getvalue("m"))+1);
    for (var i=0;i<numerodeproductos();i++) {
      if (top.productosalmacenados[i].indexOf(cadenaarticulo)==0) {
        posicion=i;
      }
    }
    if (posicion==-1) {
      posicion=numerodeproductos()
      top.numeroproductos++;
    } 
    cadenaarticulo=cadenaarticulo+"=" + qshurlpagina.getvalue("u");
    top.productosalmacenados[posicion]=cadenaarticulo;
  }
  alert(texto41)
  top.hayqueactualizar=true;
  location.reload()
}

function sesobrepasadedinero() {

  var preciocarritocompra=0;
  var cadenaarticulo;
  var botonpaypal;
  var ararticulos;
  
  if (modelopagina==0) {
    ararticulos=GetCookie("configuracion");
    ararticulos=ararticulos.split("|");
    for (var i=1;i<ararticulos.length;i++) {
      preciocarritocompra=preciocarritocompra+calcularpreciodelarticulo(ararticulos[i]);

    }
    cadenaarticulo=qshurlpagina.getvalue("p") + "=" + (parseInt(qshurlpagina.getvalue("m"))+1);
    for (var i=1;i<ararticulos.length;i++) {
      if (ararticulos[i].indexOf(cadenaarticulo)==0) {
        preciocarritocompra=preciocarritocompra-calcularpreciodelarticulo(ararticulos[i]);
      }
    }
  }
  else {
    for (var i=0;i<numerodeproductos();i++) {
      preciocarritocompra=preciocarritocompra+calcularpreciodelarticulo(top.productosalmacenados[i]);
    }  
    cadenaarticulo=qshurlpagina.getvalue("p") + "=" + (parseInt(qshurlpagina.getvalue("m"))+1);
    for (var i=0;i<numerodeproductos();i++) {
      if (top.productosalmacenados[i].indexOf(cadenaarticulo)==0) {
        preciocarritocompra=preciocarritocompra-calcularpreciodelarticulo(top.productosalmacenados[i]);
      }
    } 
  }
  cadenaarticulo=cadenaarticulo+"=" + qshurlpagina.getvalue("u");
  preciocarritocompra=preciocarritocompra+calcularpreciodelarticulo(cadenaarticulo);
  botonpaypal=new GenericPaypalShopingCartButton(monedaprincipal);
  if (preciocarritocompra>botonpaypal.GetMaximumQuantityOfMoney()) {
    return true;
  }
  else {
    return false;
  }
}

function obtenerregistroproducto(numeroproducto) {

  var arpartes;
  if (modelopagina==0) {
    arpartes=GetCookie("configuracion");
    arpartes=arpartes.split("|");
    return arpartes[numeroproducto+1];
  }
  else {
    return top.productosalmacenados[numeroproducto];
  }
}

function borrararticulo(numeroregistro) {
  var arpartes;  
  var arpartes2=new Array();
  var z=0;
  if (confirm(texto44)==false) {
    return;
  }
  if (modelopagina==0) {
    arpartes=GetCookie("configuracion");
    arpartes=arpartes.split("|");
    for (var i=0;i<arpartes.length;i++) {
      if (i!=(numeroregistro+1)) {
        arpartes2[z]=arpartes[i];
        z++;
      } 
    }
    SetCookie("configuracion",arpartes2.join("|"));
  }
  else {
    for (var i=(numeroregistro+1);i<numerodeproductos();i++) {
      top.productosalmacenados[i-1]=top.productosalmacenados[i];
    }
    top.numeroproductos--;
  }
  if (numerodeproductos()>=1) {
    location.reload(); 
  }
  else {
    iraprincipal();
  }
}

function borrartodoelcarrito() {
  var arpartes; 
  if (confirm(texto45)==false) {
    return;
  }
  if (modelopagina==0) {
    arpartes=GetCookie("configuracion");
    arpartes=arpartes.split("|");
    SetCookie("configuracion",arpartes[0]);
  }
  else {
    top.numeroproductos=0;
  }
  iraprincipal();
}

function actualizarunidades(numeroproducto) {
  var ararticulos;
  var arpartes;
  var refobj;
  if (formasdepago.charAt(0)=="1" && sesobrepasadedinero2(numeroproducto)==true) {
    alert(texto39);
  }
  cadenaarticulo=obtenerregistroproducto(numeroproducto)
  arpartes=cadenaarticulo.split("=");

  refobj=eval("document.FRMPEDIDO.SLBUNIDADES" + numeroproducto);
  arpartes[2]=refobj.options[refobj.selectedIndex].value;
  cadenaarticulo=arpartes.join("=");
  if (modelopagina==0) {

    ararticulos=GetCookie("configuracion");
    ararticulos=ararticulos.split("|");
    ararticulos[(numeroproducto+1)]=cadenaarticulo;
    SetCookie("configuracion",ararticulos.join("|"));
  
  }
  else {
    top.productosalmacenados[numeroproducto]=cadenaarticulo;
  }
  location.reload();
}


function sesobrepasadedinero2(numeroproducto) {

  var preciocarritocompra=0;
  var cadenaarticulo;
  var botonpaypal;
  var ararticulos;
  var arpartes;
  var refobj;


  if (modelopagina==0) {
    ararticulos=GetCookie("configuracion");
    ararticulos=ararticulos.split("|");
    for (var i=1;i<ararticulos.length;i++) {
      preciocarritocompra=preciocarritocompra+calcularpreciodelarticulo(ararticulos[i]);

    }

    preciocarritocompra=preciocarritocompra-calcularpreciodelarticulo(ararticulos[(numeroproducto+1)]);
      
    
  }
  else {
    for (var i=0;i<numerodeproductos();i++) {
      preciocarritocompra=preciocarritocompra+calcularpreciodelarticulo(top.productosalmacenados[i]);
    }  

    preciocarritocompra=preciocarritocompra-calcularpreciodelarticulo(top.productosalmacenados[numeroproducto]);
  }
  cadenaarticulo=obtenerregistroproducto(numeroproducto)
  arpartes=cadenaarticulo.split("=");

  refobj=eval("document.FRMPEDIDO.SLBUNIDADES" + numeroproducto);
  arpartes[2]=refobj.options[refobj.selectedIndex].value;
  cadenaarticulo=arpartes.join("=");
  preciocarritocompra=preciocarritocompra+calcularpreciodelarticulo(cadenaarticulo);
  botonpaypal=new GenericPaypalShopingCartButton(monedaprincipal);
  if (preciocarritocompra>botonpaypal.GetMaximumQuantityOfMoney()) {
    return true;
  }
  else {
    return false;
  }
}

function iracomprarpedido() {
  top.hayqueactualizar=true;
  if (modelopagina==0) {
    location.href="buycart.htm";

  }
  else {
    location.href="buycart.htm?inframe=1";
  }

}

function mostrarlicencia() {
  var lyhcapalicencia=new LayerHandle("capalicencia");
  if (top.centralflags.charAt(0)=="1") { 
    if (ponerlicenciaenunacapa==true) {
      ocultarbuscador();
      ocultardisclaimer();
      lyhcapalicencia.SetVisibility(true);
      lyhcapalicencia=new LayerHandle("capalicenciainterna");
      lyhcapalicencia.SetVisibility(true);
      lyhcapalicencia=new LayerHandle("capalicenciainterna2");
      lyhcapalicencia.SetVisibility(true);
    }
    else {

      cerrarventanas();
      top.handleventana=window.open("license.htm","VENTALENGUAJE","height=500,width=500,resizable=no,scrollbars=yes");
    
    }
  }
  lyhcapalicencia=null;
}

function ocultarlicencia() {
  var lyhcapalicencia=new LayerHandle("capalicencia");
  if (top.centralflags.charAt(1)!="7") { 
    return;
  }
  if (top.centralflags.charAt(0)=="1") { 
    lyhcapalicencia.SetVisibility(false);
    lyhcapalicencia=new LayerHandle("capalicenciainterna");
    lyhcapalicencia.SetVisibility(false);
    lyhcapalicencia=new LayerHandle("capalicenciainterna2");
    lyhcapalicencia.SetVisibility(false);

  }
  lyhcapalicencia=null;
}

function verfactura() {
  var datosfactura;
  var textofactura;
  var nombremoneda;
  var iddelpedido; 
  var tipodetransaccion=0;
  var arpartes;
  var armodelos;
  var modeloelegido;
  var preciototal=0;
  var precioparcial=0;
  if (monedaprincipal==1) {
    nombremoneda=texto15;

  }        
  else if (monedaprincipal==2) {
    nombremoneda=texto16;
  }        
  else if (monedaprincipal==3) {
    nombremoneda=texto17;
  }        
  else if (monedaprincipal==4) {
    nombremoneda=texto18;
     
  }        
  else if (monedaprincipal==5) {
    nombremoneda=texto19;
  }
  else  {
    nombremoneda=texto20;

  }

  if (modelopagina==0) {
    datosfactura=GetCookie("idpedido")
    datosfactura=datosfactura.split("|");
    iddelpedido=datosfactura[0]; 
    tipodetransaccion=datosfactura[1];
    datosfactura=datosfactura[2].split("=");
    
  }
  else {
    iddelpedido=top.idpedido;
    tipodetransaccion=top.tipotransaccion;
    datosfactura=top.datosusuario.split("=");
  }
  for (var i=0;i<datosfactura.length;i++) {
    datosfactura[i]=HexDeEncoded(datosfactura[i]);
  }
  textofactura="<HTML><HEAD><TITLE>" + texto90 + "</TITLE></HEAD><BODY BGCOLOR=\"WHITE\">";
  if (trim(logotipoempresa)!="") {
    textofactura=textofactura+"<IMG SRC=\"Images/"+logotipoempresa+"\" ALT=\""+texto91+"\" HEIGHT=55 WIDTH=500>";
  }
  textofactura=textofactura+"<FONT FACE=\"COURIER\">";
  textofactura=textofactura+"<BR><B>" + datosempresa + "</B><P>";
  textofactura=textofactura+texto85+ ": <B>" + iddelpedido + "</B><BR>";
  textofactura=textofactura+texto46.substring(1) + "<B>"+ datosfactura[0] + "</B><BR>";
  textofactura=textofactura+texto47.substring(1) + "<B>"+ datosfactura[1] + "</B><BR>";
  textofactura=textofactura+texto48.substring(1) + "<B>"+ datosfactura[2] + "</B><BR>";
  textofactura=textofactura+texto49.substring(1) + "<B>"+ datosfactura[3] + "</B><BR>";
  textofactura=textofactura+texto50.substring(1) + "<B>"+ datosfactura[4] + "</B><BR>";
  textofactura=textofactura+texto51.substring(1) + "<B>"+datosfactura[5] + "</B><BR>";
  textofactura=textofactura+texto58.substring(1) + "<B>"+ datosfactura[6] + "</B><BR>";
  textofactura=textofactura+texto53.substring(1) + "<B>"+ datosfactura[8] + "</B><BR>";
  if (tipodetransaccion==0) {
    textofactura=textofactura+texto60.substring(1)+":<B>" + texto61+"</B><P>";

  }
  else if (tipodetransaccion==1) {
    textofactura=textofactura+texto60.substring(1)+":<B>" + texto62+"</B><P>";


  }
  else  {
    textofactura=textofactura+texto60.substring(1)+"<B>:" + texto63+"</B><P>";


  }
    

  textofactura=textofactura+"<B>"+texto88+"</B><BR>";

  textofactura=textofactura + "<TABLE BORDER=1><TR><TH>"+texto2+"</TH><TH>"+texto32.substring(0,texto32.length-1)+"</TH><TH>"+texto96+"</TH><TH>" +texto8.substring(0,texto8.length-1)+"</TH><TH>"+texto35+"</TH><TH>"+texto94+"</TH><TH>"+texto36+"</TH><TH>"+texto95+"</TH><TH>"+texto93+"</TH></TR>";
  
  for (var i=0;i<numerodeproductos();i++) {
    textofactura=textofactura + "<TR>";
    arpartes=null;
    arpartes=obtenerregistroproducto(i);
    arpartes=arpartes.split("=");
    armodelos=obtnermodelos(parseInt(arpartes[0]))
    modeloelegido=armodelos[parseInt(arpartes[1])-1];
    preciototal=preciototal+calcularpreciodelarticulo(obtenerregistroproducto(i));
    textofactura=textofactura + "<TH>" + product[parseInt(arpartes[0])].productname + "</TH><TH>" + modeloelegido.model + "</TH><TH>"+arpartes[2]+"</TH><TH>" +modeloelegido.price + "</TH><TH>" +modeloelegido.disccount +"%</TH>";
    if (modeloelegido.disccount>0) {
      precioparcial=modeloelegido.price*parseInt(arpartes[2]);
      precioparcial=precioparcial/100;
      precioparcial=precioparcial * modeloelegido.disccount;
      precioparcial=redondearprecio(precioparcial);
      textofactura=textofactura+"<TH>" + precioparcial + "</TH>";
      precioparcial=modeloelegido.price*parseInt(arpartes[2])-precioparcial;

    }
    else {
      textofactura=textofactura + "<TH>0</TH>";
      precioparcial=modeloelegido.price*parseInt(arpartes[2]);
    }
    textofactura=textofactura+"<TH>"+modeloelegido.tax+"%</TH>";
    if (modeloelegido.tax>0) {
      precioparcial=precioparcial/100;
      precioparcial=precioparcial * modeloelegido.tax;
      precioparcial=redondearprecio(precioparcial);
      textofactura=textofactura+"<TH>" + precioparcial +"</TH>";
    }
    else {
      textofactura=textofactura + "<TH>0</TH>";
    }
   
    
   textofactura=textofactura+"<TH>" + calcularpreciodelarticulo(obtenerregistroproducto(i)) + "</TH>" 
   textofactura=textofactura + "</TR>";
  }
  textofactura=textofactura+"<TR><TH COLSPAN=9 ALIGN=\"RIGHT\">"+texto33 + preciototal + " " + nombremoneda+"</TH></TR>";
  //textofactura=textofactura+texto33 + preciototal + " " + nombremoneda + "<BR>";
  textofactura=textofactura + "</TABLE>";
  textofactura=textofactura+"</BODY></HTML>";
  textofactura=textofactura+"</FONT>";
  top.handleventana=window.open("","VENTAFACTURA","height=500,width=700,resizable=no,scrollbars=yes,menubar=yes");
  top.handleventana.document.open("text/html");
  top.handleventana.document.write(textofactura);
  top.handleventana.document.close();



}