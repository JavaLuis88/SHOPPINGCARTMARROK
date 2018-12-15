function SplitURL(url) {

  this.protocol="";
  this.havegotloginpasword=false;
  this.login="";
  this.password="";
  this.address="";
  this.havegotport=false;
  this.port="";
  this.path="";
  this.file="";
  this.havegotquerystring=false;
  this.querystring="";
  this.havegothash=false;
  this.hash="";  

  var tempo="";


  if (arguments.length<1 || trim(url)=="" || url==null) {
    return this;
  }
  var urltempo="" +url;
  urltempo=splitV10(urltempo,"//",2);
  this.protocol=urltempo.getvalue(0);
  if (urltempo.length()!=2) {
    return this;
  }
  urltempo=urltempo.getvalue(1);
  if (this.protocol.toUpperCase()=="FTP:" || this.protocol.toUpperCase()=="TELNET:") {
    
    urltempo=splitV10(urltempo,"@",2);
    if (urltempo.length()!=2) {
      urltempo=urltempo.getvalue(0);
    }
    else {
      this.havegotloginpasword=true;
      tempo=splitV10(urltempo.getvalue(0),":",2);
      if (tempo.length()==2) {
        this.login=tempo.getvalue(0);
        this.password=tempo.getvalue(1);

      }
      else {
        this.login=tempo.getvalue(0);

      }
      urltempo=urltempo.getvalue(1);
    }
    
  }
  if (this.protocol.toUpperCase()=="TELNET:") {

    tempo=urltempo;
    urltempo=new MakeArray();
    urltempo.add(0,tempo);

  }
  else {
    urltempo=splitV10(urltempo,"/");
  }
  


  tempo=splitV10(urltempo.getvalue(0),":",2);   
  this.address=tempo.getvalue(0);

  if (tempo.length()==2) {
    this.havegotport=true;
    this.port=tempo.getvalue(1);    
  }
  if (urltempo.length()<2) {
    return this;
  }
  if (urltempo.length()==2) {
    if ((this.protocol.toUpperCase()=="HTTP:" || this.protocol.toUpperCase()=="HTTPS:") && urltempo.getvalue(1).indexOf("?")!=-1 && urltempo.getvalue(1).indexOf("#")==-1) {
      tempo=splitV10(urltempo.getvalue(1),"?",2);
      this.file=tempo.getvalue(0);
      this.havegotquerystring=true;
      this.querystring=tempo.getvalue(1);
      return this;

    } 
    else if ((this.protocol.toUpperCase()=="HTTP:" || this.protocol.toUpperCase()=="HTTPS:") && urltempo.getvalue(1).indexOf("?")==-1 && urltempo.getvalue(1).indexOf("#")!=-1) {
      tempo=splitV10(urltempo.getvalue(1),"#",2);
      this.file=tempo.getvalue(0);
      this.havegothash=true;
      this.hash=tempo.getvalue(1);
      return this;

    }
    else if ((this.protocol.toUpperCase()=="HTTP:" || this.protocol.toUpperCase()=="HTTPS:") && urltempo.getvalue(1).indexOf("?")!=-1 && urltempo.getvalue(1).indexOf("#")!=-1) {
      
      this.havegotquerystring=true;
      this.havegothash=true;
      if (urltempo.getvalue(1).indexOf("?")<urltempo.getvalue(1).indexOf("#")) {
        tempo=splitV10(urltempo.getvalue(1),"?",2);
        this.file=tempo.getvalue(0);
        tempo=tempo.getvalue(1);
        tempo=splitV10(tempo,"#",2);
        this.querystring=tempo.getvalue(0);
        this.hash=tempo.getvalue(1);

      }
      else {
        tempo=splitV10(urltempo.getvalue(1),"#",2);
        this.file=tempo.getvalue(0);
        tempo=tempo.getvalue(1);
        tempo=splitV10(tempo,"?",2);
        this.hash=tempo.getvalue(0);
        this.querystring=tempo.getvalue(1);
      } 


      return this;

    }
    else {
      this.file=urltempo.getvalue(1);
      return this;
    } 
  }
  else {
    tempo="";
    for (var i=1;i<urltempo.length()-1;i++) {
      tempo=tempo+urltempo.getvalue(i) + "/"; 
    }
    tempo=tempo.substring(0,tempo.length-1);
    this.path=tempo;
    if ((this.protocol.toUpperCase()=="HTTP:" || this.protocol.toUpperCase()=="HTTPS:") && urltempo.getvalue(urltempo.length()-1).indexOf("?")!=-1 && urltempo.getvalue(urltempo.length()-1).indexOf("#")==-1) {
      tempo=splitV10(urltempo.getvalue(urltempo.length()-1),"?",2);
      this.file=tempo.getvalue(0);
      this.havegotquerystring=true;
      this.querystring=tempo.getvalue(1);
      return this;

    } 
    else if ((this.protocol.toUpperCase()=="HTTP:" || this.protocol.toUpperCase()=="HTTPS:") && urltempo.getvalue(urltempo.length()-1).indexOf("?")==-1 && urltempo.getvalue(urltempo.length()-1).indexOf("#")!=-1) {
      tempo=splitV10(urltempo.getvalue(urltempo.length()-1),"#",2);
      this.file=tempo.getvalue(0);
      this.havegothash=true;
      this.hash=tempo.getvalue(1);
      return this;

    }
    else if ((this.protocol.toUpperCase()=="HTTP:" || this.protocol.toUpperCase()=="HTTPS:") && urltempo.getvalue(urltempo.length()-1).indexOf("?")!=-1 && urltempo.getvalue(urltempo.length()-1).indexOf("#")!=-1) {
      
      this.havegotquerystring=true;
      this.havegothash=true;
      if (urltempo.getvalue(urltempo.length()-1).indexOf("?")<urltempo.getvalue(urltempo.length()-1).indexOf("#")) {
        tempo=splitV10(urltempo.getvalue(urltempo.length()-1),"?",2);
        this.file=tempo.getvalue(0);
        tempo=tempo.getvalue(1);
        tempo=splitV10(tempo,"#",2);
        this.querystring=tempo.getvalue(0);
        this.hash=tempo.getvalue(1);

      }
      else {
        tempo=splitV10(urltempo.getvalue(urltempo.length()-1),"#",2);
        this.file=tempo.getvalue(0);
        tempo=tempo.getvalue(1);
        tempo=splitV10(tempo,"?",2);
        this.hash=tempo.getvalue(0);
        this.querystring=tempo.getvalue(1);
      } 


     
    }
  }


  return this;
}