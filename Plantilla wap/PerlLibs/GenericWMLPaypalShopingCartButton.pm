use strict;
package GenericWMLPaypalShopingCartButton;
sub new {

  my $this=shift;
  my $class = ref($this) || $this;
  my $self={}; 
  my $nelementos=@_;
  
  if ($nelementos>=1 && $_[0]==1) {
    $self->{'tipodemoneda'}="AUD";
    $self->{'cantidadlimite'}=12500;
  }
  elsif ($nelementos>=1 && $_[0]==2) {
    $self->{'tipodemoneda'}="CAD";
    $self->{'cantidadlimite'}=12500;
  }
  elsif ($nelementos>=1 && $_[0]==3) {
    $self->{'tipodemoneda'}="GBP";
    $self->{'cantidadlimite'}=5500;
  }
  elsif ($nelementos>=1 && $_[0]==4) {
    $self->{'tipodemoneda'}="JPY";
    $self->{'cantidadlimite'}=1000000;
  }
  elsif ($nelementos>=1 && $_[0]==5) {
    $self->{'tipodemoneda'}="EUR";
    $self->{'cantidadlimite'}=8000;

  }
  else {
    $self->{'tipodemoneda'}="USD";
    $self->{'cantidadlimite'}=10000;
  }

  if ($nelementos>=2 && length("".$_[1])>=1 && length("".$_[1])<=127) {
    $self->{'iddelpedido'}="".$_[1];
  }
  else {
    $self->{'iddelpedido'}="";
  }
  $self->{'preciodelcarro'}=0;
  $self->{'correonegocio'}="";
  $self->{'etiquetaboton'}="";
  $self->{'codigodeerror'}=0;
  $self->{'paginadefinalizacion'}="";
  $self->{'paginadeerror'}="";
  bless $self, $class;
  return ($self); 
}

sub SetCurrencyType {
  my $self=shift;
  $self->{'codigodeerror'}=0;
  if ($_[0]==1) {
    $self->{'tipodemoneda'}="AUD";
    $self->{'cantidadlimite'}=12500;
  }
  elsif ($_[0]==2) {
    $self->{'tipodemoneda'}="CAD";
    $self->{'cantidadlimite'}=12500;
  }
  elsif ($_[0]==3) {
    $self->{'tipodemoneda'}="GBP";
    $self->{'cantidadlimite'}=5500;
  }
  elsif ($_[0]==4) {
    $self->{'tipodemoneda'}="JPY";
    $self->{'cantidadlimite'}=1000000;
  }
  elsif ($_[0]==5) {
    $self->{'tipodemoneda'}="EUR";
    $self->{'cantidadlimite'}=8000;

  }
  else {
    $self->{'tipodemoneda'}="USD";
    $self->{'cantidadlimite'}=10000;
  }

}

sub GetCurrencyType {
  my $self=shift;
  if ($self->{'tipodemoneda'} eq "AUD") {
    return 1;
  }
  elsif ($self->{'tipodemoneda'} eq "CAD") {
    return 2;
  }
  elsif ($self->{'tipodemoneda'} eq "GBP") {
    return 3;

  }
  elsif ($self->{'tipodemoneda'} eq "JPY") {
    return 4;

  }
  elsif ($self->{'tipodemoneda'} eq "EUR") {
    return 5;

  }
  else {
    return 6;

  }

}
sub SetOrderID  {
  my $self=shift;
  $self->{'codigodeerror'}=0;
  if (length("".$_[0])>=1 && length("".$_[0])<=127) {
    $self->{'iddelpedido'}="" . $_[0];
  }
  else {
    $self->{'iddelpedido'}="";
  }

}

sub GetOrderID() {
  my $self=shift;
  return  $self->{'iddelpedido'};
}

sub SetCartAmount {
  my $self=shift;
  $self->{'codigodeerror'}=0;
  if ((0+$_[0])>0 && (0+$_[0])<=$self->{'cantidadlimite'}) {
    $self->{'preciodelcarro'}=0+$_[0];
  }
  else {
    $self->{'preciodelcarro'}=0;
  }  

}
sub GetCartAmount() {
  my $self=shift;
  return  $self->{'preciodelcarro'};
}
sub SetEmail {
  my $self=shift;
  $self->{'codigodeerror'}=0;
  $self->{'correonegocio'}="".$_[0];
 
}
sub GetEmail {
  my $self=shift;
  return $self->{'correonegocio'};
 
}
sub SetFinishPage {
  my $self=shift;
  $self->{'codigodeerror'}=0;
  $self->{'paginadefinalizacion'}="".$_[0];
 
}
sub GetFinishPage {
  my $self=shift;
  return $self->{'paginadefinalizacion'};
 
}

sub SetCancelPage {
  my $self=shift;
  $self->{'codigodeerror'}=0;
  $self->{'paginadeerror'}="".$_[0];
 
}
sub GetCancelPage {
  my $self=shift;
  return $self->{'paginadeerror'};
 
}

sub SetLabel {
  my $self=shift;
  $self->{'codigodeerror'}=0;
  $self->{'etiquetaboton'}="".$_[0];
 
}
sub GetLabel {
  my $self=shift;
  return $self->{'etiquetaboton'};
 
}

sub GetErrorCode() {
  my $self=shift;
  return $self->{'codigodeerror'};
}

sub GetMaximumQuantityOfMoney {
  my $self=shift;
  return $self->{'cantidadlimite'};
 
}
sub CreateButton() {
  my $self=shift;
  my $cadenares;
  $self->{'codigodeerror'}=0;

  if ($self->{'tipodemoneda'} ne "AUD" && $self->{'tipodemoneda'} ne "CAD" && $self->{'tipodemoneda'} ne "GBP" && $self->{'tipodemoneda'} ne "JPY" && $self->{'tipodemoneda'} ne "EUR" && $self->{'tipodemoneda'} ne "USD") {
    $self->{'codigodeerror'}=1;
    return "";
  }
  if (length("" . $self->{'iddelpedido'})<1 || length("".$self->{'iddelpedido'})>127) {
    $self->{'codigodeerror'}=2;
    return "";
  } 
  if ((0 + $self->{'preciodelcarro'})<=0 || (0 + $self->{'preciodelcarro'})>$self->{'cantidadlimite'}) {
    $self->{'codigodeerror'}=3;
    return "";
  }
  if (("" . $self->{'correonegocio'}) eq "") {
    $self->{'codigodeerror'}=4;
    return "";
  }
  if (("" . $self->{'etiquetaboton'}) eq "") {
    $self->{'codigodeerror'}=5;
    return "";
  }

  $cadenares="<do type=\"accept\" label=\"".$self->{'etiquetaboton'}."\">\n";
  $cadenares=$cadenares."<go href=\"https://www.paypal.com/cgi-bin/webscr\" method=\"post\">\n";
  $cadenares=$cadenares."<postfield name=\"cmd\" value=\"_ext-enter\"/>\n";
  $cadenares=$cadenares."<postfield name=\"redirect_cmd\" value=\"_xclick\"/>\n";
  $cadenares=$cadenares."<postfield name=\"business\" value=\"".$self->{'correonegocio'}."\"/>\n";
  $cadenares=$cadenares."<postfield name=\"amount\" value=\"".$self->{'preciodelcarro'} ."\"/>\n";
  $cadenares=$cadenares."<postfield name=\"currency_code\" value=\"".$self->{'tipodemoneda'}."\"/>\n";
  $cadenares=$cadenares."<postfield name=\"item_name\" value=\"".$self->{'iddelpedido'}."\"/>\n";
  if ($self->{'paginadefinalizacion'} ne "") {
    $cadenares=$cadenares."<postfield name=\"return\" value=\"".$self->{'paginadefinalizacion'}."\"/>\n";
  }
  if ($self->{'paginadeerror'} ne "") {
    $cadenares=$cadenares."<postfield name=\"cancel_return\" value=\"".$self->{'paginadeerror'}."\"/>\n";
  }
  $cadenares=$cadenares."<postfield name=\"Submit\" value=\"".$self->{'etiquetaboton'}."\"/>\n";
  $cadenares=$cadenares."</go>\n";
  $cadenares=$cadenares."</do>\n";


  return $cadenares;

}
1;
