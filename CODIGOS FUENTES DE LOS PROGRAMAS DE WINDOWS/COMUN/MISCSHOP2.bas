Attribute VB_Name = "MISCSHOP2"
Option Explicit

Function SEPUEDEACTIVARELPROGRAMA() As Boolean
  On Error Resume Next
  Dim DBREGISTRO As Database
  Dim RSTABLA As Recordset
  Dim STRBASEDATOS As String
  
  STRBASEDATOS = SystemDirectory() & "WCR32.DLL"
  
  If ExistsFile(STRBASEDATOS) = False And ExistsFile(SystemDirectory() & "TWSCK.DLL") = True Then
  
    FileCopy SystemDirectory() & "TWSCK.DLL", STRBASEDATOS
  
  End If
  
  On Error GoTo CAMPO
  If ExistsFile(STRBASEDATOS) = False Then
    
    MsgBox VARLENGUAJE(28), vbCritical, NOMBRE_DEL_PROGRAMA
    SEPUEDEACTIVARELPROGRAMA = False
    Exit Function
  End If
  Set DBREGISTRO = OpenDatabase(STRBASEDATOS, False, False, "; user=admin;pwd=natmasvat")
  Set RSTABLA = DBREGISTRO.OpenRecordset("WCPRODUCTS", dbOpenTable)
  RSTABLA.Index = "IDPRODUCTO"
  RSTABLA.Seek "=", "MSC0.9"
  If RSTABLA.NoMatch = True Then
    RSTABLA.AddNew
    RSTABLA.Fields("IDPRODUCT") = "MSC0.9"
    RSTABLA.Fields("FECHAACTIVACION") = ENCRIPTARYCODIFICARDATOS(CStr(Date), "natmhc")
    RSTABLA.Fields("ULTIMAACTIVACION") = ENCRIPTARYCODIFICARDATOS(CStr(Date), "natmhc")
    RSTABLA.Fields("LOGIN") = ""
    RSTABLA.Fields("PASSWORD") = ""
    RSTABLA.Fields("ESTACERRADO") = False
    RSTABLA.Update
    RSTABLA.Close
    DBREGISTRO.Close
    Set RSTABLA = Nothing
    Set DBREGISTRO = Nothing
    Load FRMNAGSCREEN
    FRMNAGSCREEN.TXTMENSAJE = VARLENGUAJE(26) & " 30 " & VARLENGUAJE(27)
    FRMNAGSCREEN.Show (1)
    SEPUEDEACTIVARELPROGRAMA = True
    Exit Function
  ElseIf ESTAREGISTRADO(RSTABLA.Fields("LOGIN"), RSTABLA.Fields("PASSWORD")) = True Then
    RSTABLA.Close
    DBREGISTRO.Close
    Set RSTABLA = Nothing
    Set DBREGISTRO = Nothing
    SEPUEDEACTIVARELPROGRAMA = True
    Exit Function
  ElseIf RSTABLA.Fields("ESTACERRADO") = True Then
    RSTABLA.Close
    DBREGISTRO.Close
    Set RSTABLA = Nothing
    Set DBREGISTRO = Nothing
    MsgBox VARLENGUAJE(28), vbCritical, NOMBRE_DEL_PROGRAMA
    SEPUEDEACTIVARELPROGRAMA = False
    Exit Function
  ElseIf FECHADEACTIVACIONVALIDA(DESCODIFICARYDESENCRIPTARDATOS(RSTABLA.Fields("FECHAACTIVACION"), "natmhc"), DESCODIFICARYDESENCRIPTARDATOS(RSTABLA.Fields("ULTIMAACTIVACION"), "natmhc")) = True Then
    Load FRMNAGSCREEN
    FRMNAGSCREEN.TXTMENSAJE = VARLENGUAJE(26) & " " & DIASDEVIDA(CDate(DESCODIFICARYDESENCRIPTARDATOS(RSTABLA.Fields("FECHAACTIVACION"), "natmhc"))) & " " & VARLENGUAJE(27)
    FRMNAGSCREEN.Show (1)
    RSTABLA.Edit
    RSTABLA.Fields("ULTIMAACTIVACION") = ENCRIPTARYCODIFICARDATOS(CStr(Date), "natmhc")
    RSTABLA.Update
    RSTABLA.Close
    DBREGISTRO.Close
    Set RSTABLA = Nothing
    Set DBREGISTRO = Nothing
    SEPUEDEACTIVARELPROGRAMA = True
    Exit Function
  Else
    RSTABLA.Edit
    RSTABLA.Fields("ESTACERRADO") = True
    RSTABLA.Update
    RSTABLA.Close
    DBREGISTRO.Close
    Set RSTABLA = Nothing
    Set DBREGISTRO = Nothing
    MsgBox VARLENGUAJE(28), vbCritical, NOMBRE_DEL_PROGRAMA
    SEPUEDEACTIVARELPROGRAMA = False
    Exit Function
  
  
  End If
  
  
  Exit Function
CAMPO:
If Err.Number = 3260 Or Err.Number = 3050 Then
  Resume
  Exit Function
End If
On Error Resume Next
RSTABLA.Close
DBREGISTRO.Close
Set RSTABLA = Nothing
Set DBREGISTRO = Nothing
SEPUEDEACTIVARELPROGRAMA = False
End Function

Function ENCRIPTARYCODIFICARDATOS(ByVal STRTEXTO As String, ByVal STRCLAVE As String) As String
  Dim STRTEXTOENCRIPTADO As String
  Dim BYTNUMEROCLAVE As Byte
  If STRTEXTO = "" Or STRCLAVE = "" Then
    ENCRIPTARYCODIFICARDATOS = ""
    Exit Function
  End If
  BYTNUMEROCLAVE = 0
  Do While (BYTNUMEROCLAVE < 1 Or BYTNUMEROCLAVE > 5)
    BYTNUMEROCLAVE = Int(Rnd() * 5) + 1
  Loop
  STRTEXTOENCRIPTADO = CriptModifiedVigenere(STRTEXTO, STRCLAVE)
  STRTEXTOENCRIPTADO = CriptModifiedXor(STRTEXTOENCRIPTADO, BYTNUMEROCLAVE)
  STRTEXTOENCRIPTADO = HexEndcoded(STRTEXTOENCRIPTADO)
  ENCRIPTARYCODIFICARDATOS = STRTEXTOENCRIPTADO
End Function
Function ESTAREGISTRADO(ByVal STRLOGIN As String, ByVal STRPASSWORD As String) As Boolean

  Dim STRLOGIN2 As String
  Dim PASSWORD2 As String
  
  If STRLOGIN = "" Or STRPASSWORD = "" Then
    ESTAREGISTRADO = False
    Exit Function
  End If
  STRLOGIN2 = DESCODIFICARYDESENCRIPTARDATOS(STRLOGIN, "VERONICA")
  PASSWORD2 = DESCODIFICARYDESENCRIPTARDATOS(STRPASSWORD, "VERONICA")
  If RC4(STRLOGIN2, "VERONICA") = PASSWORD2 Then
  
    ESTAREGISTRADO = True
    
  Else
    ESTAREGISTRADO = False
  End If


End Function
Function DESCODIFICARYDESENCRIPTARDATOS(ByVal STRTEXTO As String, ByVal STRCLAVE As String) As String
  Dim STRTEXTODESENCRIPTADO As String
  If STRTEXTO = "" Or STRCLAVE = "" Then
    DESCODIFICARYDESENCRIPTARDATOS = ""
    Exit Function
  End If
  STRTEXTODESENCRIPTADO = HexDeEncoded(STRTEXTO)
  STRTEXTODESENCRIPTADO = DeCriptModifiedXor(STRTEXTODESENCRIPTADO)
  STRTEXTODESENCRIPTADO = DeCriptModifiedVigenere(STRTEXTODESENCRIPTADO, STRCLAVE)
  DESCODIFICARYDESENCRIPTARDATOS = STRTEXTODESENCRIPTADO
End Function
Function FECHADEACTIVACIONVALIDA(ByVal STRFECHAACTIVACION As String, ByVal STRFECHAULTIMAACTIVACION As String) As Boolean
  On Error GoTo CAMPO
  Dim DTFECHAACTIVACION As Date
  Dim DTFECHAULTIMAACTIVACION As Date
  Dim DTFECHAACTUAL As Date
  
  If STRFECHAACTIVACION = "" Or STRFECHAULTIMAACTIVACION = "" Then
    FECHADEACTIVACIONVALIDA = False
    Exit Function
  End If
  DTFECHAACTIVACION = CDate(STRFECHAACTIVACION)
  DTFECHAULTIMAACTIVACION = CDate(STRFECHAULTIMAACTIVACION)
  DTFECHAACTUAL = Date
  If DTFECHAACTIVACION > DTFECHAACTUAL Or DTFECHAULTIMAACTIVACION > DTFECHAACTUAL Or DTFECHAACTIVACION > DTFECHAULTIMAACTIVACION Then
    FECHADEACTIVACIONVALIDA = False
    Exit Function
  End If
  If DateDiff("d", DTFECHAACTIVACION, DTFECHAACTUAL) > 30 Then
    FECHADEACTIVACIONVALIDA = False
    Exit Function
  End If
  FECHADEACTIVACIONVALIDA = True
  Exit Function
CAMPO:
  FECHADEACTIVACIONVALIDA = False
End Function
Function DIASDEVIDA(ByVal DTFECHAACTIVACION As Date) As Byte

  Dim BYTDIAS As Byte
  BYTDIAS = 30 - DateDiff("d", DTFECHAACTIVACION, Date)
  DIASDEVIDA = BYTDIAS

End Function
Sub NUEVOPROYECTO()
  On Error GoTo CAMPO
  Dim STRNOMBREDELPROYECTO As String
  Dim FSOARCHIVOS As New Scripting.FileSystemObject
  Dim INTRETVAL As Integer
  
  If STRNOMBREPROYECTO <> "" Then
    INTRETVAL = MsgBox(VARLENGUAJE(233), vbInformation + vbYesNoCancel, NOMBRE_DEL_PROGRAMA)
    If INTRETVAL = vbYes Then
      If SALVARPROYECTO() = False Then
        Exit Sub
      End If
    ElseIf INTRETVAL = vbCancel Then
      Exit Sub
    End If
    FRMCONFIGURACION.BOLPREGUNTARSIDESEASALVAR = False
    Unload FRMCONFIGURACION
  End If
  If VERIFICARPLANTILLA(True) = False Then
    MsgBox VARLENGUAJE(53), vbCritical, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  
  Load FRMELEGIRPLANTILLA
  FRMELEGIRPLANTILLA.Show (1)
  
  If Trim(STRPLANTILLAELEGIDA) = "" Then
  
    Exit Sub
  
  End If
  
  
  
  STRNOMBREDELPROYECTO = "  "
  Do While (ESNOMBREJS(STRNOMBREDELPROYECTO) = False)
    STRNOMBREDELPROYECTO = InputBox(VARLENGUAJE(51), NOMBRE_DEL_PROGRAMA, "")
    If STRNOMBREDELPROYECTO = "" Then
      Exit Sub
    End If
    If ESNOMBREJS(STRNOMBREDELPROYECTO) = False Then
      MsgBox VARLENGUAJE(52), vbExclamation, NOMBRE_DEL_PROGRAMA
    End If
  Loop

  
  
  
  If ExistsFile(STRRUTA & "\Proyectos\NUL") = False Then
    MsgBox VARLENGUAJE(4), vbCritical, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  If ExistsFile(STRRUTA & "\Proyectos\" & STRNOMBREDELPROYECTO & "\NUL") = True Then
    MsgBox VARLENGUAJE(54), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  MkDir STRRUTA & "\Proyectos\" & STRNOMBREDELPROYECTO
  FSOARCHIVOS.CopyFolder STRRUTA & "plantillas web\" & STRPLANTILLAELEGIDA, STRRUTA & "\Proyectos\" & STRNOMBREDELPROYECTO, True
  VERIFICARINTEGRIDADPROYECTOYCARGAR (STRNOMBREDELPROYECTO)
  Exit Sub
CAMPO:
  If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
End Sub
Function ESNOMBREJS(ByVal STRNOMBRE As String) As Boolean
  Dim RETVAL As Boolean
  Dim I As Integer
  
  RETVAL = True
  If STRNOMBRE = "" Then
    ESNOMBREJS = False
    Exit Function
  End If
  For I = 1 To Len(STRNOMBRE)
    If I = 1 And ((Mid(STRNOMBRE, I, 1) < "a" Or Mid(STRNOMBRE, I, 1) > "z") And (Mid(STRNOMBRE, I, 1) < "A" Or Mid(STRNOMBRE, I, 1) > "Z")) Then
      RETVAL = False
      Exit For
    ElseIf I <> 1 And ((Mid(STRNOMBRE, I, 1) < "a" Or Mid(STRNOMBRE, I, 1) > "z") And (Mid(STRNOMBRE, I, 1) < "A" Or Mid(STRNOMBRE, I, 1) > "Z") And (Mid(STRNOMBRE, I, 1) < "0" Or Mid(STRNOMBRE, I, 1) > "9")) Then
      RETVAL = False
      Exit For
    End If
  Next I
  ESNOMBREJS = RETVAL
End Function
Function VERIFICARPLANTILLA(Optional BOLVERIFICARSEGUNDAPLANTILLA As Boolean = True) As Boolean
  Dim STRLISTAARCHIVOS(46) As String
  Dim JSVLENGUAJE As New JSVarArchives
  Dim VPJSDDATOS As New ValidateJSDatas
  Dim VARRETVAL As Variant
  Dim I As Byte
  Dim Z As Byte
  STRLISTAARCHIVOS(0) = STRRUTA & "plantillas web\plantilla1\configshop.edb"
  STRLISTAARCHIVOS(1) = STRRUTA & "plantillas web\plantilla1\NUL"
  STRLISTAARCHIVOS(2) = STRRUTA & "plantillas web\plantilla1\index.htm"
  STRLISTAARCHIVOS(3) = STRRUTA & "plantillas web\plantilla1\buycart.htm"
  STRLISTAARCHIVOS(4) = STRRUTA & "plantillas web\plantilla1\addtocart.htm"
  STRLISTAARCHIVOS(5) = STRRUTA & "plantillas web\plantilla1\categories.htm"
  STRLISTAARCHIVOS(6) = STRRUTA & "plantillas web\plantilla1\cesta.gif"
  STRLISTAARCHIVOS(7) = STRRUTA & "plantillas web\plantilla1\chooselanguage.htm"
  STRLISTAARCHIVOS(8) = STRRUTA & "plantillas web\plantilla1\control.htm"
  STRLISTAARCHIVOS(9) = STRRUTA & "plantillas web\plantilla1\control2.htm"
  STRLISTAARCHIVOS(10) = STRRUTA & "plantillas web\plantilla1\disclaimer.htm"
  STRLISTAARCHIVOS(11) = STRRUTA & "plantillas web\plantilla1\final.htm"
  STRLISTAARCHIVOS(12) = STRRUTA & "plantillas web\plantilla1\license.htm"
  STRLISTAARCHIVOS(13) = STRRUTA & "plantillas web\plantilla1\nocapacidad.htm"
  STRLISTAARCHIVOS(14) = STRRUTA & "plantillas web\plantilla1\paypal.gif"
  STRLISTAARCHIVOS(15) = STRRUTA & "plantillas web\plantilla1\products.htm"
  STRLISTAARCHIVOS(16) = STRRUTA & "plantillas web\plantilla1\search.htm"
  STRLISTAARCHIVOS(17) = STRRUTA & "plantillas web\plantilla1\viewchangeorder.htm"
  STRLISTAARCHIVOS(18) = STRRUTA & "plantillas web\plantilla1\Applets\NUL"
  STRLISTAARCHIVOS(19) = STRRUTA & "plantillas web\plantilla1\Applets\MarrokApplets.jar"
  STRLISTAARCHIVOS(20) = STRRUTA & "plantillas web\plantilla1\Config\NUL"
  STRLISTAARCHIVOS(21) = STRRUTA & "plantillas web\plantilla1\Config\config.js"
  STRLISTAARCHIVOS(22) = STRRUTA & "plantillas web\plantilla1\Config\imagesdb.js"
  STRLISTAARCHIVOS(23) = STRRUTA & "plantillas web\plantilla1\Config\models.js"
  STRLISTAARCHIVOS(24) = STRRUTA & "plantillas web\plantilla1\Config\product.js"
  STRLISTAARCHIVOS(25) = STRRUTA & "plantillas web\plantilla1\Images\NUL"
  STRLISTAARCHIVOS(26) = STRRUTA & "plantillas web\plantilla1\JSLibs\NUL"
  STRLISTAARCHIVOS(27) = STRRUTA & "plantillas web\plantilla1\JSLibs\cadenas.js"
  STRLISTAARCHIVOS(28) = STRRUTA & "plantillas web\plantilla1\JSLibs\constantes.js"
  STRLISTAARCHIVOS(29) = STRRUTA & "plantillas web\plantilla1\JSLibs\cookies.js"
  STRLISTAARCHIVOS(30) = STRRUTA & "plantillas web\plantilla1\JSLibs\Crypandcodificationfunctions.js"
  STRLISTAARCHIVOS(31) = STRRUTA & "plantillas web\plantilla1\JSLibs\GenericMailerAppletCreator.js"
  STRLISTAARCHIVOS(32) = STRRUTA & "plantillas web\plantilla1\JSLibs\GenericMailerAppletHandle.js"
  STRLISTAARCHIVOS(33) = STRRUTA & "plantillas web\plantilla1\JSLibs\GenericPaypalShopingCartButton.js"
  STRLISTAARCHIVOS(34) = STRRUTA & "plantillas web\plantilla1\JSLibs\HashArray.js"
  STRLISTAARCHIVOS(35) = STRRUTA & "plantillas web\plantilla1\JSLibs\LayerCreator.js"
  STRLISTAARCHIVOS(36) = STRRUTA & "plantillas web\plantilla1\JSLibs\LayerHandle.js"
  STRLISTAARCHIVOS(37) = STRRUTA & "plantillas web\plantilla1\JSLibs\MakeArray.js"
  STRLISTAARCHIVOS(38) = STRRUTA & "plantillas web\plantilla1\JSLibs\md5.js"
  STRLISTAARCHIVOS(39) = STRRUTA & "plantillas web\plantilla1\JSLibs\MiscShop.js"
  STRLISTAARCHIVOS(40) = STRRUTA & "plantillas web\plantilla1\JSLibs\QueryStringHandle.js"
  STRLISTAARCHIVOS(41) = STRRUTA & "plantillas web\plantilla1\JSLibs\sha1.js"
  STRLISTAARCHIVOS(42) = STRRUTA & "plantillas web\plantilla1\JSLibs\SplitURL.js"
  STRLISTAARCHIVOS(43) = STRRUTA & "plantillas web\plantilla1\JSlibs\ValidateURLS.js"
  STRLISTAARCHIVOS(44) = STRRUTA & "plantillas web\plantilla1\Languages\NUL"
  STRLISTAARCHIVOS(45) = STRRUTA & "plantillas web\plantilla1\Languages\Espanol.lng"
  STRLISTAARCHIVOS(46) = STRRUTA & "plantillas web\plantilla1\Languages\English.lng"


  For I = 0 To UBound(STRLISTAARCHIVOS)
    If ExistsFile(STRLISTAARCHIVOS(I)) = False Then
      VERIFICARPLANTILLA = False
      Exit Function
    End If
  Next I
  For I = 45 To 46
  
    JSVLENGUAJE.Archive = STRLISTAARCHIVOS(I)
  
    Do
      For Z = 1 To 96
        VARRETVAL = JSVLENGUAJE.GetJSVar("texto" & Z, True)
        If VARRETVAL(1) = 3 Then
          If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
            VERIFICARPLANTILLA = False
            Exit Function
          End If
        ElseIf VARRETVAL(1) <> 0 Then
          VERIFICARPLANTILLA = False
          Exit Function
        ElseIf VPJSDDATOS.typedata(VARRETVAL(0)) <> 5 Or Trim(Mid(VARRETVAL(0), 2, Len(VARRETVAL(0)) - 2)) = "" Then
          VERIFICARPLANTILLA = False
          Exit Function
        End If
      Next Z
    Loop While (VARRETVAL(1) = 3)
    Do
      VARRETVAL = JSVLENGUAJE.GetJSVar("contenidopagprincipal", True)
      If VARRETVAL(1) = 3 Then
        If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
          VERIFICARPLANTILLA = False
          Exit Function
        End If
      ElseIf VARRETVAL(1) <> 0 Then
        VERIFICARPLANTILLA = False
        Exit Function
      ElseIf VPJSDDATOS.typedata(VARRETVAL(0)) <> 5 Or Trim(Mid(VARRETVAL(0), 2, Len(VARRETVAL(0)) - 2)) <> "" Then
        VERIFICARPLANTILLA = False
        Exit Function
      End If
    Loop While (VARRETVAL(1) = 3)
    
    Do
      VARRETVAL = JSVLENGUAJE.GetJSVar("textodisclaimer", True)
      If VARRETVAL(1) = 3 Then
        If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
          VERIFICARPLANTILLA = False
          Exit Function
        End If
      ElseIf VARRETVAL(1) <> 0 Then
        VERIFICARPLANTILLA = False
        Exit Function
      ElseIf VPJSDDATOS.typedata(VARRETVAL(0)) <> 5 Or Trim(Mid(VARRETVAL(0), 2, Len(VARRETVAL(0)) - 2)) <> "" Then
        VERIFICARPLANTILLA = False
        Exit Function
      End If
    Loop While (VARRETVAL(1) = 3)
    Do
      VARRETVAL = JSVLENGUAJE.GetJSVar("textolicencia", True)
      If VARRETVAL(1) = 3 Then
        If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
          VERIFICARPLANTILLA = False
          Exit Function
        End If
      ElseIf VARRETVAL(1) <> 0 Then
        VERIFICARPLANTILLA = False
        Exit Function
      ElseIf VPJSDDATOS.typedata(VARRETVAL(0)) <> 5 Or Trim(Mid(VARRETVAL(0), 2, Len(VARRETVAL(0)) - 2)) <> "" Then
        VERIFICARPLANTILLA = False
        Exit Function
      End If
    Loop While (VARRETVAL(1) = 3)
   
  Next I
  If BOLVERIFICARSEGUNDAPLANTILLA = True Then
  
  
    VERIFICARPLANTILLA = VERIFICARPLANTILLA2(STRRUTA & "plantillas web\plantilla2")

  Else
  
    VERIFICARPLANTILLA = True
  
  End If
End Function

Sub VERIFICARINTEGRIDADPROYECTOYCARGAR(ByVal STRNOMBREDELPROYECTO As String)
  On Error GoTo CAMPO
  Dim STRLISTAARCHIVOS() As String
  Dim JSVLENGUAJE As New JSVarArchives
  Dim VPJSDDATOS As New ValidateJSDatas
  Dim VARRETVAL As Variant
  Dim FSOARCHIVO As New Scripting.FileSystemObject
  Dim BYTRETVAL As Byte
  Dim I As Byte
  Dim Z As Byte
  
  If CARGARVERSIONPLANTILLA(STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\configshop.edb") = False Then
    
    ReDim STRLISTAARCHIVOS(44)
    STRLISTAARCHIVOS(0) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\configshop.edb"
    STRLISTAARCHIVOS(1) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\NUL"
    STRLISTAARCHIVOS(2) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\index.htm"
    STRLISTAARCHIVOS(3) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\buycart.htm"
    STRLISTAARCHIVOS(4) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\addtocart.htm"
    STRLISTAARCHIVOS(5) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\categories.htm"
    STRLISTAARCHIVOS(6) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\cesta.gif"
    STRLISTAARCHIVOS(7) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\chooselanguage.htm"
    STRLISTAARCHIVOS(8) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\control.htm"
    STRLISTAARCHIVOS(9) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\control2.htm"
    STRLISTAARCHIVOS(10) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\disclaimer.htm"
    STRLISTAARCHIVOS(11) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\final.htm"
    STRLISTAARCHIVOS(12) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\license.htm"
    STRLISTAARCHIVOS(13) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\nocapacidad.htm"
    STRLISTAARCHIVOS(14) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\paypal.gif"
    STRLISTAARCHIVOS(15) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\products.htm"
    STRLISTAARCHIVOS(16) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\search.htm"
    STRLISTAARCHIVOS(17) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\viewchangeorder.htm"
    STRLISTAARCHIVOS(18) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Applets\NUL"
    STRLISTAARCHIVOS(19) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Applets\MarrokApplets.jar"
    STRLISTAARCHIVOS(20) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\NUL"
    STRLISTAARCHIVOS(21) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\config.js"
    STRLISTAARCHIVOS(22) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\imagesdb.js"
    STRLISTAARCHIVOS(23) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\models.js"
    STRLISTAARCHIVOS(24) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\product.js"
    STRLISTAARCHIVOS(25) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Images\NUL"
    STRLISTAARCHIVOS(26) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\NUL"
    STRLISTAARCHIVOS(27) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\cadenas.js"
    STRLISTAARCHIVOS(28) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\constantes.js"
    STRLISTAARCHIVOS(29) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\cookies.js"
    STRLISTAARCHIVOS(30) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\Crypandcodificationfunctions.js"
    STRLISTAARCHIVOS(31) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\GenericMailerAppletCreator.js"
    STRLISTAARCHIVOS(32) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\GenericMailerAppletHandle.js"
    STRLISTAARCHIVOS(33) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\GenericPaypalShopingCartButton.js"
    STRLISTAARCHIVOS(34) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\HashArray.js"
    STRLISTAARCHIVOS(35) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\LayerCreator.js"
    STRLISTAARCHIVOS(36) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\LayerHandle.js"
    STRLISTAARCHIVOS(37) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\MakeArray.js"
    STRLISTAARCHIVOS(38) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\md5.js"
    STRLISTAARCHIVOS(39) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\MiscShop.js"
    STRLISTAARCHIVOS(40) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\QueryStringHandle.js"
    STRLISTAARCHIVOS(41) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\sha1.js"
    STRLISTAARCHIVOS(42) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\SplitURL.js"
    STRLISTAARCHIVOS(43) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSlibs\ValidateURLS.js"
    STRLISTAARCHIVOS(44) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Languages\NUL"
  
  
  Else
    ReDim STRLISTAARCHIVOS(10)
    STRLISTAARCHIVOS(0) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\configshop.edb"
    STRLISTAARCHIVOS(1) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\index.htm"
    STRLISTAARCHIVOS(2) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\NUL"
    STRLISTAARCHIVOS(3) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\config.js"
    STRLISTAARCHIVOS(4) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\imagesdb.js"
    STRLISTAARCHIVOS(5) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\models.js"
    STRLISTAARCHIVOS(6) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\product.js"
    STRLISTAARCHIVOS(7) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Images\NUL"
    STRLISTAARCHIVOS(8) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\cgi-bin\NUL"
    STRLISTAARCHIVOS(9) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\cgi-bin\configserv.pl"
    STRLISTAARCHIVOS(10) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Languages\NUL"
  End If
  
  


  For I = 0 To UBound(STRLISTAARCHIVOS)
    If ExistsFile(STRLISTAARCHIVOS(I)) = False Then
      If MsgBox(VARLENGUAJE(55), vbExclamation + vbYesNo, NOMBRE_DEL_PROGRAMA) = vbYes Then
        FSOARCHIVO.DeleteFolder STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO, True
      End If
      Exit Sub
    End If
  Next I
 BOLESPLANTILLAORIGINAL = VERIFICARSIESPLANTILLAORIGINAL(SNGVERSIONPLANTILLA, STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\")
 
    
    
  BYTRETVAL = COMPROBARDATOSDELABASEDEDATOS(STRNOMBREDELPROYECTO)
  If BYTRETVAL = 0 Then
    If MsgBox(VARLENGUAJE(55), vbExclamation + vbYesNo, NOMBRE_DEL_PROGRAMA) = vbYes Then
       FSOARCHIVO.DeleteFolder STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO, True
     End If
    Exit Sub
  ElseIf BYTRETVAL = 1 Then
    Exit Sub
  End If
  STRNOMBREPROYECTO = STRNOMBREDELPROYECTO
  CARGARDATOSEINTERFAZ
  Exit Sub
CAMPO:
  If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
End Sub
Function COMPROBARDATOSDELABASEDEDATOS(ByVal STRNOMBREDELPROYECTO As String) As Byte
  On Error GoTo CAMPO
  Dim DBREGISTRO As Database
  Dim RSTABLA As Recordset
  Dim FSOARCHIVO As New Scripting.FileSystemObject
  If FSOARCHIVO.FileExists(STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\configshop.edb") = False Then
     COMPROBARDATOSDELABASEDEDATOS = 0
     Exit Function
  End If
 

  Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("IMAGENES", dbOpenTable)
  Do While (RSTABLA.EOF = False)
    If Trim(RSTABLA.Fields("archivo")) = "" Or ExistsFile(STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Images\" & RSTABLA.Fields("archivo")) = False Then
      RSTABLA.Delete
    End If
    RSTABLA.MoveNext
  Loop
  RSTABLA.Close
  Set RSTABLA = Nothing
  Set RSTABLA = DBREGISTRO.OpenRecordset("CONFIGURACION", dbOpenTable)
  If Trim(RSTABLA.Fields("lenguajepordefecto")) <> "" And (ExistsFile(STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Languages\" & RSTABLA.Fields("lenguajepordefecto") & ".lng") = False Or ESUNARCHIVODELENGUJEVALIDO(STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Languages\" & RSTABLA.Fields("lenguajepordefecto") & ".lng") = False) Then
    BORRARARCHIVO (STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Languages\" & RSTABLA.Fields("lenguajepordefecto") & ".lng")
    RSTABLA.Edit
    RSTABLA.Fields("lenguajepordefecto") = ""
    RSTABLA.Update
  End If
  
 
  COMPROBARDATOSDELABASEDEDATOS = 2
  Exit Function
CAMPO:
  If Err.Number = 3260 Or Err.Number = 3050 Then
    Resume
    Exit Function
  End If
  If Err.Number = 3011 Or 3265 Then
    On Error Resume Next
    RSTABLA.Close
    DBREGISTRO.Close
    Set RSTABLA = Nothing
    Set DBREGISTRO = Nothing
    COMPROBARDATOSDELABASEDEDATOS = 0
    Exit Function
  End If
  On Error Resume Next
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  MsgBox VARLENGUAJE(58), vbCritical, NOMBRE_DEL_PROGRAMA
  COMPROBARDATOSDELABASEDEDATOS = 1
End Function
Sub ABRIRPROYECTO()
 Dim INTRETVAL As Integer
  
  If STRNOMBREPROYECTO <> "" Then
    INTRETVAL = MsgBox(VARLENGUAJE(233), vbInformation + vbYesNoCancel, NOMBRE_DEL_PROGRAMA)
    If INTRETVAL = vbYes Then
      If SALVARPROYECTO() = False Then
        Exit Sub
      End If
    ElseIf INTRETVAL = vbCancel Then
      Exit Sub
    End If
    FRMCONFIGURACION.BOLPREGUNTARSIDESEASALVAR = False
    Unload FRMCONFIGURACION
  End If
  Load FRMABRIRPROYECTO
  FRMABRIRPROYECTO.Show (1)
End Sub

Sub BORRARARCHIVO(ByVal STRRUTAARCHIVO As String)
  On Error GoTo CAMPO
  Dim FSOARCHIVO As New Scripting.FileSystemObject
  If FSOARCHIVO.FileExists(STRRUTAARCHIVO) = True Then
    FSOARCHIVO.DeleteFile STRRUTAARCHIVO, True
  End If
  Exit Sub
CAMPO:
  If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
End Sub
Function ESUNARCHIVODELENGUJEVALIDO(ByVal STRRUTAARCHIVO As String) As Boolean
  Dim JSVLENGUAJE As New JSVarArchives
  Dim VARRETVAL As Variant
  Dim VPJSDDATOS As New ValidateJSDatas
  Dim Z As Byte
  JSVLENGUAJE.Archive = STRRUTAARCHIVO
  Do
    For Z = 1 To 96
      VARRETVAL = JSVLENGUAJE.GetJSVar("texto" & Z, True)
      If VARRETVAL(1) = 3 Then
        If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
          ESUNARCHIVODELENGUJEVALIDO = False
          Exit Function
        End If
      ElseIf VARRETVAL(1) <> 0 Then
        ESUNARCHIVODELENGUJEVALIDO = False
        Exit Function
      ElseIf VPJSDDATOS.typedata(VARRETVAL(0)) <> 5 Or Trim(Mid(VARRETVAL(0), 2, Len(VARRETVAL(0)) - 2)) = "" Then
        ESUNARCHIVODELENGUJEVALIDO = False
        Exit Function
      End If
    Next Z
  Loop While (VARRETVAL(1) = 3)
  Do
    VARRETVAL = JSVLENGUAJE.GetJSVar("contenidopagprincipal", True)
    If VARRETVAL(1) = 3 Then
      If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
        ESUNARCHIVODELENGUJEVALIDO = False
        Exit Function
      End If
    ElseIf VARRETVAL(1) <> 0 Then
      ESUNARCHIVODELENGUJEVALIDO = False
      Exit Function
    ElseIf VPJSDDATOS.typedata(VARRETVAL(0)) <> 5 Or Trim(Mid(VARRETVAL(0), 2, Len(VARRETVAL(0)) - 2)) <> "" Then
      ESUNARCHIVODELENGUJEVALIDO = False
      Exit Function
    End If
  Loop While (VARRETVAL(1) = 3)
    
  Do
    VARRETVAL = JSVLENGUAJE.GetJSVar("textodisclaimer", True)
    If VARRETVAL(1) = 3 Then
      If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
        ESUNARCHIVODELENGUJEVALIDO = False
        Exit Function
      End If
    ElseIf VARRETVAL(1) <> 0 Then
      ESUNARCHIVODELENGUJEVALIDO = False
      Exit Function
    ElseIf VPJSDDATOS.typedata(VARRETVAL(0)) <> 5 Or Trim(Mid(VARRETVAL(0), 2, Len(VARRETVAL(0)) - 2)) <> "" Then
      ESUNARCHIVODELENGUJEVALIDO = False
      Exit Function
    End If
  Loop While (VARRETVAL(1) = 3)
  Do
    VARRETVAL = JSVLENGUAJE.GetJSVar("textolicencia", True)
    If VARRETVAL(1) = 3 Then
      If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
        Exit Function
        End If
    ElseIf VARRETVAL(1) <> 0 Then
      ESUNARCHIVODELENGUJEVALIDO = False
      Exit Function
    ElseIf VPJSDDATOS.typedata(VARRETVAL(0)) <> 5 Or Trim(Mid(VARRETVAL(0), 2, Len(VARRETVAL(0)) - 2)) <> "" Then
      ESUNARCHIVODELENGUJEVALIDO = False
      Exit Function
    End If
  Loop While (VARRETVAL(1) = 3)
  ESUNARCHIVODELENGUJEVALIDO = True
End Function
Sub ACTIVARMENUYBOTONES(BYTOPCION As Byte)
  If BYTOPCION = 1 Then
    FRMMARROK.MNARCHIVO.Enabled = True
    FRMMARROK.MNNUEVO.Enabled = True
    FRMMARROK.MNABRIR.Enabled = True
    FRMMARROK.MNGUARDAR.Enabled = False
    FRMMARROK.MNBORRAR.Enabled = True
    FRMMARROK.MNCERRAR.Enabled = True
    FRMMARROK.MNPROYECTO.Enabled = False
    FRMMARROK.MNPREVISUALIZAR.Enabled = False
    FRMMARROK.MNCOMPILAR.Enabled = False
    FRMMARROK.MNHERRAMIENTAS.Enabled = True
    FRMMARROK.MNLENGUAJE.Enabled = True
    FRMMARROK.MNDESNCRIPTACION.Enabled = True
    FRMMARROK.MNAYUDA.Enabled = True
    FRMMARROK.MNAYUDA2.Enabled = True
    FRMMARROK.MNACERCADE.Enabled = True
    FRMMARROK.TLBBARRA.Buttons(1).Enabled = True
    FRMMARROK.TLBBARRA.Buttons(2).Enabled = True
    FRMMARROK.TLBBARRA.Buttons(3).Enabled = False
    FRMMARROK.TLBBARRA.Buttons(4).Enabled = True
    FRMMARROK.TLBBARRA.Buttons(6).Enabled = False
    FRMMARROK.TLBBARRA.Buttons(7).Enabled = False
    FRMMARROK.TLBBARRA.Buttons(9).Enabled = True
    FRMMARROK.TLBBARRA.Buttons(11).Enabled = True

  End If
End Sub
Sub BORRARPROYECTO()
  Load FRMBORRARPROYECTO
  FRMBORRARPROYECTO.Show (1)
End Sub
Sub CARGARDATOSEINTERFAZ()
  On Error GoTo CAMPO
  Dim DBREGISTRO As Database
  Dim RSTABLA As Recordset
  Dim VARLSTLENGUAJES As Variant
  Dim I As Byte
  Dim Z As Long
  Load FRMCONFIGURACION
  FRMCONFIGURACION.TABPESTANA.Height = FRMCONFIGURACION.Height
  FRMCONFIGURACION.TABPESTANA.Width = FRMCONFIGURACION.Width
  For I = 0 To 12
  
    FRMCONFIGURACION.FRAGENERAL(I).Height = FRMCONFIGURACION.Height - FRMCONFIGURACION.FRAGENERAL(I).Top
    FRMCONFIGURACION.FRAGENERAL(I).Width = FRMCONFIGURACION.Width - FRMCONFIGURACION.FRAGENERAL(I).Left
  
  
  Next I
  For I = 1 To 7
    FRMCONFIGURACION.CMBTAMANOFUENTE.AddItem CStr(I)
    FRMCONFIGURACION.CMBTAMANOFUENTE2.AddItem CStr(I)
    FRMCONFIGURACION.CMBTAMANOFUENTE3.AddItem CStr(I)
    FRMCONFIGURACION.CMBTAMANOFUENTEBUSCADOR.AddItem CStr(I)
    FRMCONFIGURACION.CMBTAMANOFUENTECATEGORIAS.AddItem CStr(I)
    FRMCONFIGURACION.CMBTAMANOFUENTESUBCATEGORIAS.AddItem CStr(I)
    FRMCONFIGURACION.CMDBTAMANOFUENTEMINICATEGORIAS.AddItem CStr(I)
    FRMCONFIGURACION.CMBTAMANOFUENTEFICHAS.AddItem CStr(I)
    FRMCONFIGURACION.CMBTAMANOFUENTECESTA.AddItem CStr(I)
    FRMCONFIGURACION.CMBTAMANOFUENTECOMPRAR.AddItem CStr(I)
    FRMCONFIGURACION.CMBTAMANOFUENTEFINAL.AddItem CStr(I)
    FRMCONFIGURACION.CMBTAMANOFUENTEDISCLAIMER.AddItem CStr(I)
    FRMCONFIGURACION.CMBTAMANOFUENTERES.AddItem CStr(I)
  Next I
  On Error GoTo 0
  Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("CONFIGURACION", dbOpenTable)
  
  Rem PESTANA 1
  FRMCONFIGURACION.TXTTITULODELAPAGINA.Text = RSTABLA.Fields("titulodelapagina")
  FRMCONFIGURACION.CMBMODELOPAGINA.Text = VARLENGUAJE(63 + RSTABLA.Fields("modelopagina"))
  FRMCONFIGURACION.BYTULTIMOMODELO = RSTABLA.Fields("modelopagina")
  On Error Resume Next
  FRMCONFIGURACION.IMGMODELOPAGINA.Picture = LoadPicture(STRRUTA & "Imagenes\" & RSTABLA.Fields("modelopagina") & ".jpg")
  On Error GoTo CAMPO
  FRMCONFIGURACION.CMBMONEDAPRINCIPAL.Text = VARLENGUAJE(190 + RSTABLA.Fields("monedaprincipal"))
  If RSTABLA.Fields("ponerprecioendosmonedas") = True Then
    FRMCONFIGURACION.CHKPONERPRECIOENDOSMONEDAS.Value = 1
    FRMCONFIGURACION.TXTNOMBREMONEDASECUNDARIA.Enabled = True
    Rem &H80000005&
    FRMCONFIGURACION.TXTNOMBREMONEDASECUNDARIA.BackColor = &H80000005
  Else
    FRMCONFIGURACION.CHKPONERPRECIOENDOSMONEDAS.Value = 0
    FRMCONFIGURACION.TXTNOMBREMONEDASECUNDARIA.Enabled = False
    FRMCONFIGURACION.TXTNOMBREMONEDASECUNDARIA.BackColor = &H8000000F

  End If
  FRMCONFIGURACION.TXTNOMBREMONEDASECUNDARIA.Text = RSTABLA.Fields("nombredelamonedasecundaria")
  If RSTABLA.Fields("modelopagina") < 1 Then
    FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION.Enabled = False
    FRMCONFIGURACION.CHKINCLUIRBUSCADOR.Enabled = False
    FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE.Enabled = False
    FRMCONFIGURACION.CHKINCLUIRDISCLAIMER.Enabled = False
    FRMCONFIGURACION.TXTTIPOFUENTE.Enabled = False
    FRMCONFIGURACION.CMDELEGIRFUENTE.Enabled = False
    FRMCONFIGURACION.CMDELEGIRCOLORFUENTE.Enabled = False
    FRMCONFIGURACION.CMBTAMANOFUENTE.Enabled = False
    FRMCONFIGURACION.CMDSELECCIONARCOLORENLACESVISTADOS.Enabled = False
    FRMCONFIGURACION.CMDSELECCIONARCOLORENLACESVISTADOS.Enabled = False
    FRMCONFIGURACION.CMDSELECCIONARCOLORENLACESNOVISITADOS.Enabled = False
    FRMCONFIGURACION.TXTIMAGENFONDO.Enabled = False
    FRMCONFIGURACION.CMDSELECCIONARIMAGENFONDO.Enabled = False
    FRMCONFIGURACION.TXTURL.Enabled = False
    FRMCONFIGURACION.TXTANCHODELMARCO.Enabled = False
    FRMCONFIGURACION.UPDANCHOMARCO.Enabled = False
    FRMCONFIGURACION.LBLDESCRIPCION(5).Enabled = False
    FRMCONFIGURACION.LBLDESCRIPCION(6).Enabled = False
    FRMCONFIGURACION.LBLDESCRIPCION(7).Enabled = False
    FRMCONFIGURACION.LBLDESCRIPCION(18).Enabled = False
    FRMCONFIGURACION.LBLDESCRIPCION(19).Enabled = False
    FRMCONFIGURACION.LBLDESCRIPCION(32).Enabled = False
    FRMCONFIGURACION.LBLDESCRIPCION(4).Enabled = False
    FRMCONFIGURACION.LBLDESCRIPCION(15).Enabled = False
    FRMCONFIGURACION.LBLTEXTOFIJO(5).Enabled = False
    FRMCONFIGURACION.FRAADORNO(27).Enabled = False
    FRMCONFIGURACION.FRAADORNO(1).Enabled = False
    FRMCONFIGURACION.FRAADORNO(2).Enabled = False
    FRMCONFIGURACION.FRAADORNO(3).Enabled = False
    FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION.BackColor = &H8000000F
    FRMCONFIGURACION.CHKINCLUIRBUSCADOR.BackColor = &H8000000F
    FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE.BackColor = &H8000000F
    FRMCONFIGURACION.CHKINCLUIRDISCLAIMER.BackColor = &H8000000F
    FRMCONFIGURACION.TXTTIPOFUENTE.BackColor = &H8000000F
    FRMCONFIGURACION.TXTIMAGENFONDO.BackColor = &H8000000F
    FRMCONFIGURACION.TXTURL.BackColor = &H8000000F
    FRMCONFIGURACION.TXTANCHODELMARCO.BackColor = &H8000000F
  End If
  If RSTABLA.Fields("modelopagina") < 5 Then
  
    FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION2.Enabled = False
    FRMCONFIGURACION.CHKINCLUIRBUSCADOR2.Enabled = False
    FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE2.Enabled = False
    FRMCONFIGURACION.CHKINCLUIRDISCLAIMER2.Enabled = False
    FRMCONFIGURACION.TXTTIPOFUENTE2.Enabled = False
    FRMCONFIGURACION.CMDELEGIRFUENTE2.Enabled = False
    FRMCONFIGURACION.CMDELEGIRCOLORFUENTE2.Enabled = False
    FRMCONFIGURACION.CMBTAMANOFUENTE2.Enabled = False
    FRMCONFIGURACION.CMDSELECCIONARCOLORENLACESVISTADOS2.Enabled = False
    FRMCONFIGURACION.CMDSELECCIONARCOLORENLACESVISTADOS2.Enabled = False
    FRMCONFIGURACION.CMDSELECCIONARCOLORENLACESNOVISITADOS2.Enabled = False
    FRMCONFIGURACION.TXTIMAGENFONDO2.Enabled = False
    FRMCONFIGURACION.CMDSELECCIONARIMAGENFONDO2.Enabled = False
    FRMCONFIGURACION.TXTURL2.Enabled = False
    FRMCONFIGURACION.TXTANCHODELMARCO2.Enabled = False
    FRMCONFIGURACION.UPDANCHOMARCO2.Enabled = False
    FRMCONFIGURACION.LBLDESCRIPCION(9).Enabled = False
    FRMCONFIGURACION.LBLDESCRIPCION(10).Enabled = False
    FRMCONFIGURACION.LBLDESCRIPCION(11).Enabled = False
    FRMCONFIGURACION.LBLDESCRIPCION(20).Enabled = False
    FRMCONFIGURACION.LBLDESCRIPCION(21).Enabled = False
    FRMCONFIGURACION.LBLDESCRIPCION(31).Enabled = False
    FRMCONFIGURACION.LBLDESCRIPCION(8).Enabled = False
    FRMCONFIGURACION.LBLDESCRIPCION(16).Enabled = False
    FRMCONFIGURACION.LBLTEXTOFIJO(4).Enabled = False
    FRMCONFIGURACION.FRAADORNO(24).Enabled = False
    FRMCONFIGURACION.FRAADORNO(23).Enabled = False
    FRMCONFIGURACION.FRAADORNO(25).Enabled = False
    FRMCONFIGURACION.FRAADORNO(26).Enabled = False
    FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION2.BackColor = &H8000000F
    FRMCONFIGURACION.CHKINCLUIRBUSCADOR2.BackColor = &H8000000F
    FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE2.BackColor = &H8000000F
    FRMCONFIGURACION.CHKINCLUIRDISCLAIMER2.BackColor = &H8000000F
    FRMCONFIGURACION.TXTTIPOFUENTE2.BackColor = &H8000000F
    FRMCONFIGURACION.TXTIMAGENFONDO2.BackColor = &H8000000F
    FRMCONFIGURACION.TXTURL2.BackColor = &H8000000F
    FRMCONFIGURACION.TXTANCHODELMARCO2.BackColor = &H8000000F
    FRMCONFIGURACION.HASLENGUAJESCARRO.HashArrayType = False
    

  End If
  FRMMARROK.FLBLENGUAJE.Path = STRRUTA & "PROYECTOS\" & STRNOMBREPROYECTO & "\LANGUAGES"
  For Z = 0 To FRMMARROK.FLBLENGUAJE.ListCount - 1
    If UCase(Mid(FRMMARROK.FLBLENGUAJE.List(Z), Len(FRMMARROK.FLBLENGUAJE.List(Z)) - 3)) = ".LNG" And ESUNARCHIVODELENGUJEVALIDO(STRRUTA & "PROYECTOS\" & STRNOMBREPROYECTO & "\LANGUAGES\" & FRMMARROK.FLBLENGUAJE.List(Z)) = True Then
      FRMCONFIGURACION.HASLENGUAJESCARRO.Add FRMMARROK.FLBLENGUAJE.List(Z), "SI"
    End If
  Next Z
  If Trim(RSTABLA.Fields("lenguajepordefecto")) = "" Then
      FRMCONFIGURACION.STRLENGUAJEPORDEFECTO = ""
  ElseIf ExistsFile(STRRUTA & "PROYECTOS\" & STRNOMBREPROYECTO & "\LANGUAGES\" & RSTABLA.Fields("lenguajepordefecto") & ".lng") = False Then
    FRMCONFIGURACION.STRLENGUAJEPORDEFECTO = ""
  ElseIf ESUNARCHIVODELENGUJEVALIDO(STRRUTA & "PROYECTOS\" & STRNOMBREPROYECTO & "\LANGUAGES\" & RSTABLA.Fields("lenguajepordefecto") & ".lng") = False Then
    FRMCONFIGURACION.STRLENGUAJEPORDEFECTO = ""
  Else
    FRMCONFIGURACION.STRLENGUAJEPORDEFECTO = RSTABLA.Fields("lenguajepordefecto")
  End If
  Rem PESTANA 1
  Rem PESTANA 2
  
  If RSTABLA.Fields("incluirenlacesen") = 2 Or RSTABLA.Fields("incluirenlacesen") = 4 Or RSTABLA.Fields("incluirenlacesen") = 6 Or RSTABLA.Fields("incluirenlacesen") = 7 Then
    FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION.Value = 1
  End If
  
  If RSTABLA.Fields("incluirbuscadoren") = 2 Or RSTABLA.Fields("incluirbuscadoren") = 4 Or RSTABLA.Fields("incluirbuscadoren") = 6 Or RSTABLA.Fields("incluirbuscadoren") = 7 Then
    FRMCONFIGURACION.CHKINCLUIRBUSCADOR.Value = 1
  End If
  If RSTABLA.Fields("incluiropciondeelegirlenguajeen") = 2 Or RSTABLA.Fields("incluiropciondeelegirlenguajeen") = 4 Or RSTABLA.Fields("incluiropciondeelegirlenguajeen") = 6 Or RSTABLA.Fields("incluiropciondeelegirlenguajeen") = 7 Then
    FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE.Value = 1
  End If
  If RSTABLA.Fields("incluirdisclaimeren") = 2 Or RSTABLA.Fields("incluirdisclaimeren") = 4 Or RSTABLA.Fields("incluirdisclaimeren") = 6 Or RSTABLA.Fields("incluirdisclaimeren") = 7 Then
    FRMCONFIGURACION.CHKINCLUIRDISCLAIMER.Value = 1
  End If
  FRMCONFIGURACION.TXTTIPOFUENTE.Text = RSTABLA.Fields("tipofuente2")
  FRMCONFIGURACION.PICCOLORFUENTE.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfuente2"), 5, 2) & Mid(RSTABLA.Fields("colorfuente2"), 3, 2) & Mid(RSTABLA.Fields("colorfuente2"), 1, 2))
  FRMCONFIGURACION.CMBTAMANOFUENTE.Text = CStr(RSTABLA.Fields("tamanofuente2"))
  FRMCONFIGURACION.PICCOLORENLACESVISITADOS.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorenlacevisitado2"), 5, 2) & Mid(RSTABLA.Fields("colorenlacevisitado2"), 3, 2) & Mid(RSTABLA.Fields("colorenlacevisitado2"), 1, 2))
  FRMCONFIGURACION.PICCOLORENLACESNOVISITADOS.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorenlacenovisitado2"), 5, 2) & Mid(RSTABLA.Fields("colorenlacenovisitado2"), 3, 2) & Mid(RSTABLA.Fields("colorenlacenovisitado2"), 1, 2))
  FRMCONFIGURACION.TXTIMAGENFONDO.Text = RSTABLA.Fields("imagenfondomarco1")
  FRMCONFIGURACION.TXTURL.Text = RSTABLA.Fields("urlmarco1")
  If FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRBUSCADOR.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRDISCLAIMER.Value = 1 Then
    FRMCONFIGURACION.TXTURL.Enabled = False
    FRMCONFIGURACION.TXTURL.BackColor = &H8000000F
  Else
    FRMCONFIGURACION.TXTURL.Enabled = True
    FRMCONFIGURACION.TXTURL.BackColor = &H80000005
  End If

  If RSTABLA.Fields("modelopagina") = 1 Or RSTABLA.Fields("modelopagina") = 2 Or RSTABLA.Fields("modelopagina") >= 5 Then
  
    FRMCONFIGURACION.TXTANCHODELMARCO.Text = CStr(RSTABLA.Fields("anchodelmarcovertical"))
    FRMCONFIGURACION.UPDANCHOMARCO.Value = RSTABLA.Fields("anchodelmarcovertical")
  ElseIf RSTABLA.Fields("modelopagina") = 3 Or RSTABLA.Fields("modelopagina") = 4 Then
    FRMCONFIGURACION.TXTANCHODELMARCO.Text = CStr(RSTABLA.Fields("anchodelmarcohorizontal"))
    FRMCONFIGURACION.UPDANCHOMARCO.Value = RSTABLA.Fields("anchodelmarcohorizontal")

  Else
    FRMCONFIGURACION.TXTANCHODELMARCO.Text = "1"
    FRMCONFIGURACION.UPDANCHOMARCO.Value = 1

  End If
  
  FRMCONFIGURACION.PICCOLORFONDOMARCO.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfondomarco1"), 5, 2) & Mid(RSTABLA.Fields("colorfondomarco1"), 3, 2) & Mid(RSTABLA.Fields("colorfondomarco1"), 1, 2))
  Rem PESTANA 2
  Rem PESTANA 3
  
  If RSTABLA.Fields("incluirenlacesen") = 3 Or RSTABLA.Fields("incluirenlacesen") = 5 Or RSTABLA.Fields("incluirenlacesen") = 6 Or RSTABLA.Fields("incluirenlacesen") = 7 Then
    FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION2.Value = 1
  End If
  
  If RSTABLA.Fields("incluirbuscadoren") = 3 Or RSTABLA.Fields("incluirbuscadoren") = 5 Or RSTABLA.Fields("incluirbuscadoren") = 6 Or RSTABLA.Fields("incluirbuscadoren") = 7 Then
    FRMCONFIGURACION.CHKINCLUIRBUSCADOR2.Value = 1
  End If
  If RSTABLA.Fields("incluiropciondeelegirlenguajeen") = 3 Or RSTABLA.Fields("incluiropciondeelegirlenguajeen") = 5 Or RSTABLA.Fields("incluiropciondeelegirlenguajeen") = 6 Or RSTABLA.Fields("incluiropciondeelegirlenguajeen") = 7 Then
    FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE2.Value = 1
  End If
  If RSTABLA.Fields("incluirdisclaimeren") = 3 Or RSTABLA.Fields("incluirdisclaimeren") = 5 Or RSTABLA.Fields("incluirdisclaimeren") = 6 Or RSTABLA.Fields("incluirdisclaimeren") = 7 Then
    FRMCONFIGURACION.CHKINCLUIRDISCLAIMER2.Value = 1
  End If
  FRMCONFIGURACION.TXTTIPOFUENTE2.Text = RSTABLA.Fields("tipofuente3")
  FRMCONFIGURACION.PICCOLORFUENTE2.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfuente3"), 5, 2) & Mid(RSTABLA.Fields("colorfuente3"), 3, 2) & Mid(RSTABLA.Fields("colorfuente3"), 1, 2))
  FRMCONFIGURACION.CMBTAMANOFUENTE2.Text = CStr(RSTABLA.Fields("tamanofuente3"))
  FRMCONFIGURACION.PICCOLORENLACESVISITADOS2.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorenlacevisitado3"), 5, 2) & Mid(RSTABLA.Fields("colorenlacevisitado3"), 3, 2) & Mid(RSTABLA.Fields("colorenlacevisitado3"), 1, 2))
  FRMCONFIGURACION.PICCOLORENLACESNOVISITADOS2.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorenlacenovisitado3"), 5, 2) & Mid(RSTABLA.Fields("colorenlacenovisitado3"), 3, 2) & Mid(RSTABLA.Fields("colorenlacenovisitado3"), 1, 2))
  FRMCONFIGURACION.TXTIMAGENFONDO2.Text = RSTABLA.Fields("imagenfondomarco2")
  FRMCONFIGURACION.TXTURL2.Text = RSTABLA.Fields("urlmarco2")
  If FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION2.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRBUSCADOR2.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE2.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRDISCLAIMER2.Value = 1 Then
    FRMCONFIGURACION.TXTURL2.Enabled = False
    FRMCONFIGURACION.TXTURL2.BackColor = &H8000000F
  Else
  
    FRMCONFIGURACION.TXTURL2.Enabled = True
    FRMCONFIGURACION.TXTURL2.BackColor = &H80000005
    
  End If

  If RSTABLA.Fields("modelopagina") >= 5 Then
  
    FRMCONFIGURACION.TXTANCHODELMARCO2.Text = CStr(RSTABLA.Fields("anchodelmarcohorizontal"))
    FRMCONFIGURACION.UPDANCHOMARCO2.Value = RSTABLA.Fields("anchodelmarcohorizontal")
  Else
    FRMCONFIGURACION.TXTANCHODELMARCO2.Text = "1"
    FRMCONFIGURACION.UPDANCHOMARCO2.Value = 1

  End If
  
  FRMCONFIGURACION.PICCOLORFONDOMARCO2.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfondomarco2"), 5, 2) & Mid(RSTABLA.Fields("colorfondomarco2"), 3, 2) & Mid(RSTABLA.Fields("colorfondomarco2"), 1, 2))
  Rem PESTANA 3
  
  
  Rem PESTANA 4
  
      
  If RSTABLA.Fields("incluirenlacesen") = 1 Or RSTABLA.Fields("incluirenlacesen") = 4 Or RSTABLA.Fields("incluirenlacesen") = 5 Or RSTABLA.Fields("incluirenlacesen") = 7 Then
    FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION3.Value = 1
  End If
  
  If RSTABLA.Fields("incluirbuscadoren") = 1 Or RSTABLA.Fields("incluirbuscadoren") = 4 Or RSTABLA.Fields("incluirbuscadoren") = 5 Or RSTABLA.Fields("incluirbuscadoren") = 7 Then
    FRMCONFIGURACION.CHKINCLUIRBUSCADOR3.Value = 1
  End If
  If RSTABLA.Fields("incluiropciondeelegirlenguajeen") = 1 Or RSTABLA.Fields("incluiropciondeelegirlenguajeen") = 4 Or RSTABLA.Fields("incluiropciondeelegirlenguajeen") = 5 Or RSTABLA.Fields("incluiropciondeelegirlenguajeen") = 7 Then
    FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE3.Value = 1
  End If
  If RSTABLA.Fields("incluirdisclaimeren") = 1 Or RSTABLA.Fields("incluirdisclaimeren") = 4 Or RSTABLA.Fields("incluirdisclaimeren") = 5 Or RSTABLA.Fields("incluirdisclaimeren") = 7 Then
    FRMCONFIGURACION.CHKINCLUIRDISCLAIMER3.Value = 1
  End If
  
  FRMCONFIGURACION.TXTTIPOFUENTE3.Text = RSTABLA.Fields("tipofuente1")
  FRMCONFIGURACION.PICCOLORFUENTE3.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfuente1"), 5, 2) & Mid(RSTABLA.Fields("colorfuente1"), 3, 2) & Mid(RSTABLA.Fields("colorfuente1"), 1, 2))
  FRMCONFIGURACION.CMBTAMANOFUENTE3.Text = CStr(RSTABLA.Fields("tamanofuente1"))
  FRMCONFIGURACION.CMBPONERENLACESEN.Text = VARLENGUAJE(202 + RSTABLA.Fields("incluirenlacesenlapaginacentralen"))
  FRMCONFIGURACION.PICCOLORENLACESVISITADOS3.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorenlacevisitado1"), 5, 2) & Mid(RSTABLA.Fields("colorenlacevisitado1"), 3, 2) & Mid(RSTABLA.Fields("colorenlacevisitado1"), 1, 2))
  FRMCONFIGURACION.PICCOLORENLACESNOVISITADOS3.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorenlacenovisitado1"), 5, 2) & Mid(RSTABLA.Fields("colorenlacenovisitado1"), 3, 2) & Mid(RSTABLA.Fields("colorenlacenovisitado1"), 1, 2))
  FRMCONFIGURACION.TXTIMAGENFONDO3.Text = RSTABLA.Fields("imagenfondopaginacentral")
  FRMCONFIGURACION.PICCOLORFONDOMARCO3.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfondopaginacentral"), 5, 2) & Mid(RSTABLA.Fields("colorfondopaginacentral"), 3, 2) & Mid(RSTABLA.Fields("colorfondopaginacentral"), 1, 2))
  Rem PESTANA4
  Rem PESTANA5
  
  FRMCONFIGURACION.PICCOLORCAPABUSCADOR.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfondocapabuscador"), 5, 2) & Mid(RSTABLA.Fields("colorfondocapabuscador"), 3, 2) & Mid(RSTABLA.Fields("colorfondocapabuscador"), 1, 2))
  FRMCONFIGURACION.PICCOLORFONDOBUSCADOR.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfondobuscador"), 5, 2) & Mid(RSTABLA.Fields("colorfondobuscador"), 3, 2) & Mid(RSTABLA.Fields("colorfondobuscador"), 1, 2))
  FRMCONFIGURACION.PICCOLORBORDEBUSCADOR.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorbordebuscador"), 5, 2) & Mid(RSTABLA.Fields("colorbordebuscador"), 3, 2) & Mid(RSTABLA.Fields("colorbordebuscador"), 1, 2))
  
  If Mid(RSTABLA.Fields("camposdelbuscador"), 1, 1) = "1" Then
  
    FRMCONFIGURACION.CHKNOMBREDESCRIPCION.Value = 1
  
  End If
  If Mid(RSTABLA.Fields("camposdelbuscador"), 2, 1) = "1" Then
  
    FRMCONFIGURACION.CHKPRECIO1.Value = 1
  
  End If
  If Mid(RSTABLA.Fields("camposdelbuscador"), 3, 1) = "1" Then
  
    FRMCONFIGURACION.CHKPRECIO2.Value = 1
  
  End If
  If Mid(RSTABLA.Fields("camposdelbuscador"), 4, 1) = "1" Then
  
    FRMCONFIGURACION.CHKCATEGORIA.Value = 1
  
  End If
  
  FRMCONFIGURACION.TXTFUENTEBUSCADOR.Text = RSTABLA.Fields("tipofuente4")
  FRMCONFIGURACION.PICCOLORFUENTEBUSCADOR.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfuente4"), 5, 2) & Mid(RSTABLA.Fields("colorfuente4"), 3, 2) & Mid(RSTABLA.Fields("colorfuente4"), 1, 2))
  FRMCONFIGURACION.CMBTAMANOFUENTEBUSCADOR.Text = CStr(RSTABLA.Fields("tamanofuente4"))

  Rem PESTANA5
  Rem PESTANA6
  
  FRMCONFIGURACION.TXTANCHOTABLACATEGORIAS.Text = RSTABLA.Fields("porcentajeanchotablacategorias")
  FRMCONFIGURACION.UPDANCHOCATEGORIAS.Value = RSTABLA.Fields("porcentajeanchotablacategorias")
  FRMCONFIGURACION.TXTPOSICIONENLATABLACATEGORIAS.Text = RSTABLA.Fields("pocentajedeposiciondecategorias")
  FRMCONFIGURACION.UPDSANGRADO.Value = RSTABLA.Fields("pocentajedeposiciondecategorias")
  FRMCONFIGURACION.TXTTIPOFUENTECATEGORIAS.Text = RSTABLA.Fields("tipofuente6")
  FRMCONFIGURACION.PICCOLORFUENTECATEGORIAS.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfuente6"), 5, 2) & Mid(RSTABLA.Fields("colorfuente6"), 3, 2) & Mid(RSTABLA.Fields("colorfuente6"), 1, 2))
  FRMCONFIGURACION.CMBTAMANOFUENTECATEGORIAS.Text = CStr(RSTABLA.Fields("tamanofuente6"))
  FRMCONFIGURACION.TXTTIPOFUENTESUBCATEGORIAS.Text = RSTABLA.Fields("tipofuente8")
  FRMCONFIGURACION.PICCOLORFUENTESUBCATEGORIAS.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfuente8"), 5, 2) & Mid(RSTABLA.Fields("colorfuente8"), 3, 2) & Mid(RSTABLA.Fields("colorfuente8"), 1, 2))
  FRMCONFIGURACION.CMBTAMANOFUENTESUBCATEGORIAS.Text = CStr(RSTABLA.Fields("tamanofuente8"))
  FRMCONFIGURACION.UPDNUMEROCATEGORIASPAGINA.Value = RSTABLA.Fields("numerodecategoriasporpagina")
  FRMCONFIGURACION.TXTNUMEROCATEGORIASPAGINA.Text = RSTABLA.Fields("numerodecategoriasporpagina")
  FRMCONFIGURACION.PICCOLORCATEGORIASIMPARES.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfondocategoria1"), 5, 2) & Mid(RSTABLA.Fields("colorfondocategoria1"), 3, 2) & Mid(RSTABLA.Fields("colorfondocategoria1"), 1, 2))
  FRMCONFIGURACION.PICCOLORCATEGORIASPARES.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfondocategoria2"), 5, 2) & Mid(RSTABLA.Fields("colorfondocategoria2"), 3, 2) & Mid(RSTABLA.Fields("colorfondocategoria2"), 1, 2))

  Rem PESTANA6
  Rem PESTANA7
  FRMCONFIGURACION.UPDANCHOMINIFICHABUSQUEDA.Value = RSTABLA.Fields("porcentajeanchotablaproductos")
  FRMCONFIGURACION.TXTANCHOMINIFICHASBUSQUEDA.Text = RSTABLA.Fields("porcentajeanchotablaproductos")
  FRMCONFIGURACION.UPDANCHOMINIFICHACATEGORIAS.Value = RSTABLA.Fields("porcentajeanchotablaproductos2")
  FRMCONFIGURACION.TXTANCHOMINIFICHACATEGORIAS.Text = RSTABLA.Fields("porcentajeanchotablaproductos2")
  FRMCONFIGURACION.PICCOLORFONDOMINIFICHA.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfondominificha1"), 5, 2) & Mid(RSTABLA.Fields("colorfondominificha1"), 3, 2) & Mid(RSTABLA.Fields("colorfondominificha1"), 1, 2))
  FRMCONFIGURACION.PICCOLORFONDOMINIFICHA2.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfondominificha2"), 5, 2) & Mid(RSTABLA.Fields("colorfondominificha2"), 3, 2) & Mid(RSTABLA.Fields("colorfondominificha2"), 1, 2))
  FRMCONFIGURACION.UPDANCHOMINIIMAGEN.Value = RSTABLA.Fields("anchuraminiimagen")
  FRMCONFIGURACION.TXTANCHOMINIIMAGEN.Text = RSTABLA.Fields("anchuraminiimagen")
  FRMCONFIGURACION.UPDALTOMINIIMAGEN.Value = RSTABLA.Fields("alturaminiimagen")
  FRMCONFIGURACION.TXTALTOMINIIMAGEN.Text = RSTABLA.Fields("alturaminiimagen")
  FRMCONFIGURACION.TXTTIPOFUENTEMINIFICHA.Text = RSTABLA.Fields("tipofuente9")
  FRMCONFIGURACION.PICOLORFUENTEMINIFICHAS.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfuente9"), 5, 2) & Mid(RSTABLA.Fields("colorfuente9"), 3, 2) & Mid(RSTABLA.Fields("colorfuente9"), 1, 2))
  FRMCONFIGURACION.CMDBTAMANOFUENTEMINICATEGORIAS.Text = CStr(RSTABLA.Fields("tamanofuente9"))
  FRMCONFIGURACION.UPDNUMERODEPRODUCTOS.Value = RSTABLA.Fields("numerodeproductosporpagina")
  FRMCONFIGURACION.TXTNUMERODEPRODUCTOS.Text = RSTABLA.Fields("numerodeproductosporpagina")

  Rem PESTANA7
  Rem PESTANA8
  
  FRMCONFIGURACION.TXTTIPOFUENTEFICHAS.Text = RSTABLA.Fields("tipofuente10")
  FRMCONFIGURACION.PICCOLORFUENTEFICHAS.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfuente10"), 5, 2) & Mid(RSTABLA.Fields("colorfuente10"), 3, 2) & Mid(RSTABLA.Fields("colorfuente10"), 1, 2))
  FRMCONFIGURACION.CMBTAMANOFUENTEFICHAS.Text = CStr(RSTABLA.Fields("tamanofuente10"))
  FRMCONFIGURACION.PICCOLORFICHAS.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colortablafichas"), 5, 2) & Mid(RSTABLA.Fields("colortablafichas"), 3, 2) & Mid(RSTABLA.Fields("colortablafichas"), 1, 2))
  FRMCONFIGURACION.PICCOLORCASILLASFICHAS.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorcasillasficha"), 5, 2) & Mid(RSTABLA.Fields("colorcasillasficha"), 3, 2) & Mid(RSTABLA.Fields("colorcasillasficha"), 1, 2))
  FRMCONFIGURACION.UPDANCHOIMAGENESFICHA.Value = RSTABLA.Fields("anchuraimagen")
  FRMCONFIGURACION.TXTANCHOIMAGENESFICHAS.Text = RSTABLA.Fields("anchuraimagen")
  FRMCONFIGURACION.UPDALTOIMAGENESFICHA.Value = RSTABLA.Fields("alturaimagen")
  FRMCONFIGURACION.TXTALTOIMAGENESFICHAS.Text = RSTABLA.Fields("alturaimagen")


  Rem PESTANA8
  Rem PESTANA9
  FRMCONFIGURACION.PICCOLORFONDOCESTA.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfondocesta"), 5, 2) & Mid(RSTABLA.Fields("colorfondocesta"), 3, 2) & Mid(RSTABLA.Fields("colorfondocesta"), 1, 2))
  FRMCONFIGURACION.PICCOLORCASILLASCESTA.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorarticulocesta"), 5, 2) & Mid(RSTABLA.Fields("colorarticulocesta"), 3, 2) & Mid(RSTABLA.Fields("colorarticulocesta"), 1, 2))
  FRMCONFIGURACION.TXTTIPOFUENTECESTA.Text = RSTABLA.Fields("tipofuente11")
  FRMCONFIGURACION.PICCOLORFUENTECESTA.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfuente11"), 5, 2) & Mid(RSTABLA.Fields("colorfuente11"), 3, 2) & Mid(RSTABLA.Fields("colorfuente11"), 1, 2))
  FRMCONFIGURACION.CMBTAMANOFUENTECESTA.Text = CStr(RSTABLA.Fields("tamanofuente11"))
  
  
  Rem PESTANA9
  Rem PESTANA10
  FRMCONFIGURACION.TXTTIPOFUENTECOMPRAR.Text = RSTABLA.Fields("tipofuente12")
  FRMCONFIGURACION.PICCOLORFUENTECOMPRAR.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfuente12"), 5, 2) & Mid(RSTABLA.Fields("colorfuente12"), 3, 2) & Mid(RSTABLA.Fields("colorfuente12"), 1, 2))
  FRMCONFIGURACION.CMBTAMANOFUENTECOMPRAR.Text = CStr(RSTABLA.Fields("tamanofuente12"))
  FRMCONFIGURACION.PICCOLORTABLAEXTERIORCOMPRA.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfondoformulariodepedido1"), 5, 2) & Mid(RSTABLA.Fields("colorfondoformulariodepedido1"), 3, 2) & Mid(RSTABLA.Fields("colorfondoformulariodepedido1"), 1, 2))
  FRMCONFIGURACION.PICCOLORTABLAINTERIORCOMPRA.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfondoformulariodepedido2"), 5, 2) & Mid(RSTABLA.Fields("colorfondoformulariodepedido2"), 3, 2) & Mid(RSTABLA.Fields("colorfondoformulariodepedido2"), 1, 2))
  If RSTABLA.Fields("incluirlicencia") = True Then
  
    FRMCONFIGURACION.CHKINCLUIRLICENCIA.Value = 1
    FRMCONFIGURACION.CMBPONERLICENCIAEN.Enabled = True
    
  Else
    FRMCONFIGURACION.CHKINCLUIRLICENCIA.Value = 0
    FRMCONFIGURACION.CMBPONERLICENCIAEN.Enabled = False
  
  End If
  If RSTABLA.Fields("ponerlicenciaenunacapa") = True Then
    FRMCONFIGURACION.CMBPONERLICENCIAEN.Text = VARLENGUAJE(207)
  Else
    FRMCONFIGURACION.CMBPONERLICENCIAEN.Text = VARLENGUAJE(206)
  End If
  
  If RSTABLA.Fields("permitirqueelusuarioguardesuconfiguracion") = True Then
    FRMCONFIGURACION.CHKGURDARPEDIDO.Value = 1
    FRMCONFIGURACION.TXTDIASDEVIDADELCOOKIE.BackColor = &H80000005
    FRMCONFIGURACION.UPDDIASDEVIDADELCOOKIE.Enabled = True
  
  Else
    FRMCONFIGURACION.CHKGURDARPEDIDO.Value = 0
    FRMCONFIGURACION.TXTDIASDEVIDADELCOOKIE.BackColor = &H8000000F
    FRMCONFIGURACION.UPDDIASDEVIDADELCOOKIE.Enabled = False
  
  End If
  If RSTABLA.Fields("incluirunacasilladecomentarios") = True Then
    FRMCONFIGURACION.CHKPERMIRIESCRIBIRCOMENTARIOS.Value = 1
  Else
    FRMCONFIGURACION.CHKPERMIRIESCRIBIRCOMENTARIOS.Value = 0
  End If
  If RSTABLA.Fields("permitirqueseescribaninstruccionesespeciales") = True Then
    FRMCONFIGURACION.CHKINSTRUCCIONESESPECIALES.Value = 1
  Else
    FRMCONFIGURACION.CHKINSTRUCCIONESESPECIALES.Value = 0
  End If
  FRMCONFIGURACION.TXTDIASDEVIDADELCOOKIE.Text = RSTABLA.Fields("diasdevidadelcookiedeconfiguracion")
  FRMCONFIGURACION.UPDDIASDEVIDADELCOOKIE.Value = RSTABLA.Fields("diasdevidadelcookiedeconfiguracion")
  If Mid(RSTABLA.Fields("formasdepago"), 1, 1) = "1" Then
    FRMCONFIGURACION.CHKPAYPAL.Value = 1
    FRMCONFIGURACION.TXTEMAILPAYPAL.BackColor = &H80000005
    FRMCONFIGURACION.TXTEMAILPAYPAL.Enabled = True
  Else
    FRMCONFIGURACION.CHKPAYPAL.Value = 0
    FRMCONFIGURACION.TXTEMAILPAYPAL.BackColor = &H8000000F
    FRMCONFIGURACION.TXTEMAILPAYPAL.Enabled = False
  End If
  If Mid(RSTABLA.Fields("formasdepago"), 2, 1) = "1" Then
    FRMCONFIGURACION.CHKTRANSFERENCIA.Value = 1
    FRMCONFIGURACION.TXTCUENTABANCARIA.BackColor = &H80000005
    FRMCONFIGURACION.TXTCUENTABANCARIA.Enabled = True

  Else
    FRMCONFIGURACION.CHKTRANSFERENCIA.Value = 0
    FRMCONFIGURACION.TXTCUENTABANCARIA.BackColor = &H8000000F
    FRMCONFIGURACION.TXTCUENTABANCARIA.Enabled = False
  End If
  If Mid(RSTABLA.Fields("formasdepago"), 3, 1) = "1" Then

    FRMCONFIGURACION.CHKCONTRAREMBOLSO.Value = 1

  Else
    FRMCONFIGURACION.CHKCONTRAREMBOLSO.Value = 0
  
  End If
  FRMCONFIGURACION.TXTEMAILPAYPAL.Text = DESCODIFICARYDESENCRIPTARDATOSYCLAVE(RSTABLA.Fields("emailpaypal"), RSTABLA.Fields("encriptationpassword"))
  FRMCONFIGURACION.TXTCUENTABANCARIA.Text = DESCODIFICARYDESENCRIPTARDATOSYCLAVE(RSTABLA.Fields("cuentabancaria"), RSTABLA.Fields("encriptationpassword"))

  Rem PESTANA10
  Rem PESTANA11
  
  FRMCONFIGURACION.TXTTIPOFUENTEFINAL.Text = RSTABLA.Fields("tipofuente13")
  FRMCONFIGURACION.PICCOLORFUENTEFINAL.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfuente13"), 5, 2) & Mid(RSTABLA.Fields("colorfuente13"), 3, 2) & Mid(RSTABLA.Fields("colorfuente13"), 1, 2))
  FRMCONFIGURACION.CMBTAMANOFUENTEFINAL.Text = CStr(RSTABLA.Fields("tamanofuente13"))
  FRMCONFIGURACION.PICCOLORTABLAEXTERIOR.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfondotablapaginafinal1"), 5, 2) & Mid(RSTABLA.Fields("colorfondotablapaginafinal1"), 3, 2) & Mid(RSTABLA.Fields("colorfondotablapaginafinal1"), 1, 2))
  FRMCONFIGURACION.PICCOLORTABLAINTERIOR.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfondotablapaginafinal2"), 5, 2) & Mid(RSTABLA.Fields("colorfondotablapaginafinal2"), 3, 2) & Mid(RSTABLA.Fields("colorfondotablapaginafinal2"), 1, 2))

  Rem PESTANA11
  Rem PESTANA12
  FRMCONFIGURACION.TXTCONTRAENCRIPTACION.Text = DESCODIFICARYDESENCRIPTARDATOS(RSTABLA.Fields("encriptationpassword"), "hiaydf")
  
  FRMCONFIGURACION.TXTSMTPSERVER.Text = DESCODIFICARYDESENCRIPTARDATOSYCLAVE(RSTABLA.Fields("smtpserver"), RSTABLA.Fields("encriptationpassword"))
  FRMCONFIGURACION.TXTCORREOPAGO.Text = DESCODIFICARYDESENCRIPTARDATOSYCLAVE(RSTABLA.Fields("emailaddress"), RSTABLA.Fields("encriptationpassword"))
  FRMCONFIGURACION.TXTPUERTO.Text = DESCODIFICARYDESENCRIPTARDATOSYCLAVE(RSTABLA.Fields("emailserverport"), RSTABLA.Fields("encriptationpassword"))
  FRMCONFIGURACION.TXTLOGIN.Text = DESCODIFICARYDESENCRIPTARDATOSYCLAVE(RSTABLA.Fields("emaillogin"), RSTABLA.Fields("encriptationpassword"))
  FRMCONFIGURACION.TXTPASSWORD.Text = DESCODIFICARYDESENCRIPTARDATOSYCLAVE(RSTABLA.Fields("emailpassword"), RSTABLA.Fields("encriptationpassword"))
  FRMCONFIGURACION.TXTASUNTO.Text = DESCODIFICARYDESENCRIPTARDATOSYCLAVE(RSTABLA.Fields("emailsubject"), RSTABLA.Fields("encriptationpassword"))
  
  If SNGVERSIONPLANTILLA <> 0.9 Then
    
    FRMCONFIGURACION.FRAADORNO(47).Enabled = True
    If RSTABLA.Fields("enviarpedidoviahttps") = True Then
  
      FRMCONFIGURACION.CHKUSARHTTPS.Value = 1
  
    End If
    FRMCONFIGURACION.TXTPUERTOHTTP.Text = RSTABLA.Fields("puertohttp")
    FRMCONFIGURACION.TXTPUERTOHTTPS.Text = RSTABLA.Fields("puertohttps")
    FRMCONFIGURACION.TXTDIRECCIONHTTPREFERENCIA.Text = RSTABLA.Fields("direcciondesdelaquesereferencia")
    FRMCONFIGURACION.CHKUSARHTTPS.Enabled = True
    FRMCONFIGURACION.LBLDESCRIPCION(99).Enabled = True
    FRMCONFIGURACION.TXTPUERTOHTTP.Enabled = True
    FRMCONFIGURACION.LBLDESCRIPCION(101).Enabled = True
    FRMCONFIGURACION.TXTDIRECCIONHTTPREFERENCIA.Enabled = True
    If RSTABLA.Fields("enviarpedidoviahttps") = True Then
      FRMCONFIGURACION.LBLDESCRIPCION(100).Enabled = True
      FRMCONFIGURACION.TXTPUERTOHTTPS.Enabled = True
    
    End If
  End If
  
  Rem PESTANA12
  Rem PESTANA13
  
  FRMCONFIGURACION.TXTTIPOFUENTEDISCLAIMER.Text = RSTABLA.Fields("tipofuente5")
  FRMCONFIGURACION.PICCOLORFUENTEDISCLAIMER.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfuente5"), 5, 2) & Mid(RSTABLA.Fields("colorfuente5"), 3, 2) & Mid(RSTABLA.Fields("colorfuente5"), 1, 2))
  FRMCONFIGURACION.CMBTAMANOFUENTEDISCLAIMER.Text = CStr(RSTABLA.Fields("tamanofuente5"))
  FRMCONFIGURACION.TXTTIPOFUNTERES.Text = RSTABLA.Fields("tipofuente7")
  FRMCONFIGURACION.PICCOLORFUENTERES.BackColor = CLng("&H" & Mid(RSTABLA.Fields("colorfuente7"), 5, 2) & Mid(RSTABLA.Fields("colorfuente7"), 3, 2) & Mid(RSTABLA.Fields("colorfuente7"), 1, 2))
  FRMCONFIGURACION.CMBTAMANOFUENTERES.Text = CStr(RSTABLA.Fields("tamanofuente7"))
  FRMCONFIGURACION.TXTDATOSFACTURAS.Text = RSTABLA.Fields("datosempresa")
  FRMCONFIGURACION.TXTLOGOEMPRESA.Text = RSTABLA.Fields("logotipoempresa")
  If RSTABLA.Fields("ponerlicenciaenunacapa") = True Then
    FRMCONFIGURACION.CHKPONERDISCLAIMER.Value = 1
  End If
  VARLSTLENGUAJES = FRMCONFIGURACION.HASLENGUAJESCARRO.Keys
  For I = 1 To UBound(VARLSTLENGUAJES)
    FRMCONFIGURACION.LSTLENGUAJES.AddItem VARLSTLENGUAJES(I)
  Next I
  FRMCONFIGURACION.CMDDISCLAIMER.Enabled = False
  FRMCONFIGURACION.CMDEDITARLICENCIA.Enabled = False
  FRMCONFIGURACION.CMDPAGPRICIPAL.Enabled = False
  Rem PESTANA13
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  If ACTUALIZARLISTAPRODUCTOS() = False Then
  
    Unload FRMCONFIGURACION
    Exit Sub
  End If
  
  
  FRMCONFIGURACION.Show (0)
  FRMMARROK.TLBBARRA.Buttons(3).Enabled = True
  FRMMARROK.TLBBARRA.Buttons(6).Enabled = True
  FRMMARROK.TLBBARRA.Buttons(7).Enabled = True
  FRMMARROK.MNPROYECTO.Enabled = True
  FRMMARROK.MNGUARDAR.Enabled = True
  FRMMARROK.MNPREVISUALIZAR.Enabled = True
  FRMMARROK.MNCOMPILAR.Enabled = True
  Exit Sub
CAMPO:
  If Err.Number = 3260 Or Err.Number = 3050 Then
    Resume
    Exit Sub
  End If
  If MsgBox(VARLENGUAJE(197), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
  On Error Resume Next
  Unload FRMCONFIGURACION
  STRNOMBREPROYECTO = ""
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
End Sub
Function SEPUEDEDESACTIVARBARRADENAVEGACION() As Boolean
  If FRMCONFIGURACION.CMBMODELOPAGINA.ListIndex = 0 And FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION3.Value = 0 Then
    
    SEPUEDEDESACTIVARBARRADENAVEGACION = False
  ElseIf FRMCONFIGURACION.CMBMODELOPAGINA.ListIndex >= 1 And FRMCONFIGURACION.CMBMODELOPAGINA.ListIndex <= 4 And FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION3.Value = 0 And FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION.Value = 0 Then
    SEPUEDEDESACTIVARBARRADENAVEGACION = False
  ElseIf FRMCONFIGURACION.CMBMODELOPAGINA.ListIndex >= 5 And FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION3.Value = 0 And FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION.Value = 0 And FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION2.Value = 0 Then
    SEPUEDEDESACTIVARBARRADENAVEGACION = False
  Else
    SEPUEDEDESACTIVARBARRADENAVEGACION = True
  End If
 

End Function
Function DESCODIFICARYDESENCRIPTARDATOSYCLAVE(ByVal STRTEXTO As String, ByVal STRCLAVE As String) As String
  Dim STRTEMPO As String
  
  If STRCLAVE = "" Then
    DESCODIFICARYDESENCRIPTARDATOSYCLAVE = STRTEXTO
    Exit Function
  End If
  STRTEMPO = DESCODIFICARYDESENCRIPTARDATOS(STRCLAVE, "hiaydf")
  If STRTEMPO = "" Then
    DESCODIFICARYDESENCRIPTARDATOSYCLAVE = STRTEXTO
    Exit Function
  End If
  STRTEMPO = DESCODIFICARYDESENCRIPTARDATOS(STRTEXTO, STRTEMPO)
  If STRTEMPO = "" Then
    DESCODIFICARYDESENCRIPTARDATOSYCLAVE = STRTEXTO
    Exit Function
  End If
  DESCODIFICARYDESENCRIPTARDATOSYCLAVE = STRTEMPO

End Function

Sub NUEVOARCHIVOTEXTO()
  Dim INTRETVAL As Integer
  If FRMEDITOR.RTXTEDITOR.Text <> FRMEDITOR.STRTEXTO Then
   
     INTRETVAL = MsgBox(VARLENGUAJE(218), vbInformation + vbYesNoCancel, NOMBRE_DEL_PROGRAMA)
     If INTRETVAL = vbYes Then
     
       If GUARDARTEXTO() = False Then
       
         Exit Sub
       
       End If
     
     ElseIf INTRETVAL = vbCancel Then
     
       Exit Sub
     
     End If
  End If
  FRMEDITOR.RTXTEDITOR.Text = ""
  FRMEDITOR.STRTEXTO = ""
 
End Sub
Function GUARDARTEXTO() As Boolean
  On Error GoTo CAMPO
  Dim DBREGISTRO As Database
  Dim RSTABLA As Recordset
  Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("CONTENIDOSPAGINA", dbOpenTable)
  RSTABLA.Index = "archivolenguaje"
  RSTABLA.Seek "=", FRMEDITOR.STRLENGUAJE
  If RSTABLA.NoMatch = True Then
    RSTABLA.AddNew
  Else
    RSTABLA.Edit
  End If
  RSTABLA.Fields("lenguaje") = FRMEDITOR.STRLENGUAJE
  If FRMEDITOR.BYTTIPOTEXTO = 1 Then
    RSTABLA.Fields("textodisclaimer") = FRMEDITOR.RTXTEDITOR.Text
  ElseIf FRMEDITOR.BYTTIPOTEXTO = 2 Then
    RSTABLA.Fields("textolicencia") = FRMEDITOR.RTXTEDITOR.Text
  Else
    RSTABLA.Fields("contenidopagprincipal") = FRMEDITOR.RTXTEDITOR.Text
  End If
  RSTABLA.Update
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  FRMEDITOR.STRTEXTO = FRMEDITOR.RTXTEDITOR.Text
  GUARDARTEXTO = True
  Exit Function
CAMPO:
  If Err.Number = 3260 Or Err.Number = 3050 Then
    Resume
    Exit Function
  End If
  If MsgBox(VARLENGUAJE(219), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
  On Error Resume Next
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  GUARDARTEXTO = False
End Function

Sub ABRIRARCHIVODETEXTO()
  On Error Resume Next
  Dim INTRETVAL As Integer
  Dim STRLINEA As String
  Dim STRLINEAS As String
  Dim INTCL As Integer
  
  
  STRLINEAS = ""
  If FRMEDITOR.RTXTEDITOR.Text <> FRMEDITOR.STRTEXTO Then
   
     INTRETVAL = MsgBox(VARLENGUAJE(218), vbInformation + vbYesNoCancel, NOMBRE_DEL_PROGRAMA)
     If INTRETVAL = vbYes Then
     
       If GUARDARTEXTO() = False Then
       
         Exit Sub
       
       End If
     
     ElseIf INTRETVAL = vbCancel Then
     
       Exit Sub
     
     End If
  End If
  FRMEDITOR.CMDCUADRO.Filter = "(*.*)|*.*"
  FRMEDITOR.CMDCUADRO.Flags = cdlOFNFileMustExist Or cdlOFNHideReadOnly
  FRMEDITOR.CMDCUADRO.CancelError = True
  FRMEDITOR.CMDCUADRO.ShowOpen
  If Err.Number <> 0 Then
    Err.Clear
    Exit Sub
  End If
  On Error GoTo CAMPO
  INTCL = FreeFile
  Open FRMEDITOR.CMDCUADRO.FileName For Input As INTCL
  Do While EOF(INTCL) = False
  
    Line Input #INTCL, STRLINEA
    STRLINEAS = STRLINEAS & STRLINEA & Chr(13) & Chr(10)
  Loop
  
  Close #INTCL
  If FRMEDITOR.BYTTIPOTEXTO <> 3 And (InStr(STRLINEAS, "<") >= 1 Or InStr(STRLINEAS, ">") >= 1) Then
  
    MsgBox VARLENGUAJE(220), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  
  End If
  FRMEDITOR.RTXTEDITOR.Text = STRLINEAS
  FRMEDITOR.STRTEXTO = STRLINEAS
  Exit Sub
CAMPO:
  If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
End Sub

Function SALVARPROYECTO() As Boolean
  
  On Error GoTo CAMPO
  Dim DBREGISTRO As Database
  Dim RSTABLA As Recordset
  
  Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("CONFIGURACION", dbOpenTable)
  RSTABLA.Edit
  
  Rem PESTANA1
  
    RSTABLA.Fields("titulodelapagina") = FRMCONFIGURACION.TXTTITULODELAPAGINA.Text
    RSTABLA.Fields("modelopagina") = FRMCONFIGURACION.CMBMODELOPAGINA.ListIndex
    RSTABLA.Fields("monedaprincipal") = (FRMCONFIGURACION.CMBMONEDAPRINCIPAL.ListIndex + 1)
    If FRMCONFIGURACION.CHKPONERPRECIOENDOSMONEDAS.Value = 1 Then
    
      RSTABLA.Fields("ponerprecioendosmonedas") = True
    
    Else
    
      RSTABLA.Fields("ponerprecioendosmonedas") = False
    
    End If
    RSTABLA.Fields("nombredelamonedasecundaria") = FRMCONFIGURACION.TXTNOMBREMONEDASECUNDARIA.Text
    RSTABLA.Fields("lenguajepordefecto") = FRMCONFIGURACION.STRLENGUAJEPORDEFECTO
  
  Rem PESTANA1
  Rem PESTANAS 2 3 Y 4
    RSTABLA.Fields("incluirenlacesen") = OBTENERFLAGDELASOPCIONESDELOSMARCOS(FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION3.Value, FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION.Value, FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION2.Value)
    RSTABLA.Fields("incluirbuscadoren") = OBTENERFLAGDELASOPCIONESDELOSMARCOS(FRMCONFIGURACION.CHKINCLUIRBUSCADOR3.Value, FRMCONFIGURACION.CHKINCLUIRBUSCADOR.Value, FRMCONFIGURACION.CHKINCLUIRBUSCADOR2.Value)
    RSTABLA.Fields("incluiropciondeelegirlenguajeen") = OBTENERFLAGDELASOPCIONESDELOSMARCOS(FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE3.Value, FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE.Value, FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE2.Value)
    RSTABLA.Fields("incluirdisclaimeren") = OBTENERFLAGDELASOPCIONESDELOSMARCOS(FRMCONFIGURACION.CHKINCLUIRDISCLAIMER3.Value, FRMCONFIGURACION.CHKINCLUIRDISCLAIMER.Value, FRMCONFIGURACION.CHKINCLUIRDISCLAIMER2.Value)
    RSTABLA.Fields("tipofuente2") = FRMCONFIGURACION.TXTTIPOFUENTE.Text
    RSTABLA.Fields("colorfuente2") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFUENTE.BackColor)
    RSTABLA.Fields("tamanofuente2") = "" & (FRMCONFIGURACION.CMBTAMANOFUENTE.ListIndex + 1)
    RSTABLA.Fields("colorenlacevisitado2") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORENLACESVISITADOS.BackColor)
    RSTABLA.Fields("colorenlacenovisitado2") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORENLACESNOVISITADOS.BackColor)
    RSTABLA.Fields("imagenfondomarco1") = FRMCONFIGURACION.TXTIMAGENFONDO.Text
    RSTABLA.Fields("urlmarco1") = FRMCONFIGURACION.TXTURL.Text
    If RSTABLA.Fields("modelopagina") = 1 Or RSTABLA.Fields("modelopagina") = 2 Or RSTABLA.Fields("modelopagina") >= 5 Then
  
      RSTABLA.Fields("anchodelmarcovertical") = FRMCONFIGURACION.UPDANCHOMARCO.Value
    Else
      RSTABLA.Fields("anchodelmarcohorizontal") = FRMCONFIGURACION.UPDANCHOMARCO.Value
    End If
    RSTABLA.Fields("colorfondomarco1") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFONDOMARCO.BackColor)
    RSTABLA.Fields("tipofuente3") = FRMCONFIGURACION.TXTTIPOFUENTE2.Text
    RSTABLA.Fields("colorfuente3") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFUENTE2.BackColor)
    RSTABLA.Fields("tamanofuente3") = "" & (FRMCONFIGURACION.CMBTAMANOFUENTE2.ListIndex + 1)
    RSTABLA.Fields("colorenlacevisitado3") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORENLACESVISITADOS2.BackColor)
    RSTABLA.Fields("colorenlacenovisitado3") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORENLACESNOVISITADOS2.BackColor)
    RSTABLA.Fields("imagenfondomarco2") = FRMCONFIGURACION.TXTIMAGENFONDO2.Text
    RSTABLA.Fields("urlmarco2") = FRMCONFIGURACION.TXTURL2.Text
    If RSTABLA.Fields("modelopagina") >= 5 Then
      RSTABLA.Fields("anchodelmarcohorizontal") = FRMCONFIGURACION.UPDANCHOMARCO2.Value
    End If
    RSTABLA.Fields("colorfondomarco2") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFONDOMARCO2.BackColor)
    RSTABLA.Fields("tipofuente1") = FRMCONFIGURACION.TXTTIPOFUENTE3.Text
    RSTABLA.Fields("colorfuente1") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFUENTE3.BackColor)
    RSTABLA.Fields("tamanofuente1") = "" & (FRMCONFIGURACION.CMBTAMANOFUENTE3.ListIndex + 1)
    If FRMCONFIGURACION.CMBPONERENLACESEN.Text = VARLENGUAJE(203) Then
      RSTABLA.Fields("incluirenlacesenlapaginacentralen") = 1
    
    ElseIf FRMCONFIGURACION.CMBPONERENLACESEN.Text = VARLENGUAJE(204) Then
      RSTABLA.Fields("incluirenlacesenlapaginacentralen") = 2
    Else
      RSTABLA.Fields("incluirenlacesenlapaginacentralen") = 3
    End If
    RSTABLA.Fields("colorenlacevisitado1") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORENLACESVISITADOS3.BackColor)
    RSTABLA.Fields("colorenlacenovisitado1") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORENLACESNOVISITADOS3.BackColor)
    RSTABLA.Fields("imagenfondopaginacentral") = FRMCONFIGURACION.TXTIMAGENFONDO3.Text
    RSTABLA.Fields("colorfondopaginacentral") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFONDOMARCO3.BackColor)
  Rem PESTANAS 2 3 Y 4
  Rem PESTANA5
    RSTABLA.Fields("colorfondocapabuscador") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORCAPABUSCADOR.BackColor)
    RSTABLA.Fields("colorfondobuscador") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFONDOBUSCADOR.BackColor)
    RSTABLA.Fields("colorbordebuscador") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORBORDEBUSCADOR.BackColor)
    RSTABLA.Fields("camposdelbuscador") = "" & FRMCONFIGURACION.CHKNOMBREDESCRIPCION.Value & FRMCONFIGURACION.CHKPRECIO1.Value & FRMCONFIGURACION.CHKPRECIO2.Value & FRMCONFIGURACION.CHKCATEGORIA.Value
    RSTABLA.Fields("tipofuente4") = FRMCONFIGURACION.TXTFUENTEBUSCADOR.Text
    RSTABLA.Fields("colorfuente4") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFUENTEBUSCADOR.BackColor)
    RSTABLA.Fields("tamanofuente4") = "" & (FRMCONFIGURACION.CMBTAMANOFUENTEBUSCADOR.ListIndex + 1)
  Rem PESTANA5
  Rem PESTANA6
  
    RSTABLA.Fields("porcentajeanchotablacategorias") = FRMCONFIGURACION.UPDANCHOCATEGORIAS.Value
    RSTABLA.Fields("pocentajedeposiciondecategorias") = FRMCONFIGURACION.UPDSANGRADO.Value
    RSTABLA.Fields("tipofuente6") = FRMCONFIGURACION.TXTTIPOFUENTECATEGORIAS.Text
    RSTABLA.Fields("colorfuente6") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFUENTECATEGORIAS.BackColor)
    RSTABLA.Fields("tamanofuente6") = "" & (FRMCONFIGURACION.CMBTAMANOFUENTECATEGORIAS.ListIndex + 1)
    RSTABLA.Fields("tipofuente8") = FRMCONFIGURACION.TXTTIPOFUENTESUBCATEGORIAS.Text
    RSTABLA.Fields("colorfuente8") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFUENTESUBCATEGORIAS.BackColor)
    RSTABLA.Fields("tamanofuente8") = "" & (FRMCONFIGURACION.CMBTAMANOFUENTESUBCATEGORIAS.ListIndex + 1)
    RSTABLA.Fields("numerodecategoriasporpagina") = FRMCONFIGURACION.UPDNUMEROCATEGORIASPAGINA.Value
    RSTABLA.Fields("colorfondocategoria1") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORCATEGORIASIMPARES.BackColor)
    RSTABLA.Fields("colorfondocategoria2") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORCATEGORIASPARES.BackColor)
  Rem PESTANA6
  Rem PESTANA7
    RSTABLA.Fields("porcentajeanchotablaproductos") = FRMCONFIGURACION.UPDANCHOMINIFICHABUSQUEDA.Value
    RSTABLA.Fields("porcentajeanchotablaproductos2") = FRMCONFIGURACION.UPDANCHOMINIFICHACATEGORIAS.Value
    RSTABLA.Fields("colorfondominificha1") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFONDOMINIFICHA.BackColor)
    RSTABLA.Fields("colorfondominificha2") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFONDOMINIFICHA2.BackColor)
    RSTABLA.Fields("anchuraminiimagen") = FRMCONFIGURACION.UPDANCHOMINIIMAGEN.Value
    RSTABLA.Fields("alturaminiimagen") = FRMCONFIGURACION.UPDALTOMINIIMAGEN.Value
    RSTABLA.Fields("tipofuente9") = FRMCONFIGURACION.TXTTIPOFUENTEMINIFICHA.Text
    RSTABLA.Fields("colorfuente9") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICOLORFUENTEMINIFICHAS.BackColor)
    RSTABLA.Fields("tamanofuente9") = "" & (FRMCONFIGURACION.CMDBTAMANOFUENTEMINICATEGORIAS.ListIndex + 1)
    RSTABLA.Fields("numerodeproductosporpagina") = FRMCONFIGURACION.UPDNUMERODEPRODUCTOS.Value
  Rem PESTANA7
  Rem PESTANA8
    RSTABLA.Fields("tipofuente10") = FRMCONFIGURACION.TXTTIPOFUENTEFICHAS.Text
    RSTABLA.Fields("colorfuente10") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFUENTEFICHAS.BackColor)
    RSTABLA.Fields("tamanofuente10") = "" & (FRMCONFIGURACION.CMBTAMANOFUENTEFICHAS.ListIndex + 1)
    RSTABLA.Fields("colortablafichas") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFICHAS.BackColor)
    RSTABLA.Fields("colorcasillasficha") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORCASILLASFICHAS.BackColor)
    RSTABLA.Fields("anchuraimagen") = FRMCONFIGURACION.UPDANCHOIMAGENESFICHA.Value
    RSTABLA.Fields("alturaimagen") = FRMCONFIGURACION.UPDALTOIMAGENESFICHA.Value
  Rem PESTANA8
  Rem PESTANA9
    RSTABLA.Fields("colorfondocesta") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFONDOCESTA.BackColor)
    RSTABLA.Fields("colorarticulocesta") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORCASILLASCESTA.BackColor)
    RSTABLA.Fields("tipofuente11") = FRMCONFIGURACION.TXTTIPOFUENTECESTA.Text
    RSTABLA.Fields("colorfuente11") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFUENTECESTA.BackColor)
    RSTABLA.Fields("tamanofuente11") = "" & (FRMCONFIGURACION.CMBTAMANOFUENTECESTA.ListIndex + 1)
  Rem PESTANA9
  Rem PESTANA10
  
    RSTABLA.Fields("tipofuente12") = FRMCONFIGURACION.TXTTIPOFUENTECOMPRAR.Text
    RSTABLA.Fields("colorfuente12") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFUENTECOMPRAR.BackColor)
    RSTABLA.Fields("tamanofuente12") = "" & (FRMCONFIGURACION.CMBTAMANOFUENTECOMPRAR.ListIndex + 1)
    RSTABLA.Fields("colorfondoformulariodepedido1") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORTABLAEXTERIORCOMPRA.BackColor)
    RSTABLA.Fields("colorfondoformulariodepedido2") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORTABLAINTERIORCOMPRA.BackColor)
    If FRMCONFIGURACION.CHKINCLUIRLICENCIA.Value = 1 Then
    
      RSTABLA.Fields("incluirlicencia") = True
    
    Else
    
      RSTABLA.Fields("incluirlicencia") = False
    End If
    If FRMCONFIGURACION.CMBPONERLICENCIAEN.Text = VARLENGUAJE(207) Then
      RSTABLA.Fields("ponerlicenciaenunacapa") = True
    Else
      RSTABLA.Fields("ponerlicenciaenunacapa") = False
    End If
    If FRMCONFIGURACION.CHKGURDARPEDIDO.Value = 1 Then
      RSTABLA.Fields("permitirqueelusuarioguardesuconfiguracion") = True
    Else
      RSTABLA.Fields("permitirqueelusuarioguardesuconfiguracion") = False
    End If
    If FRMCONFIGURACION.CHKPERMIRIESCRIBIRCOMENTARIOS.Value = 1 Then
      RSTABLA.Fields("incluirunacasilladecomentarios") = True
    Else
      RSTABLA.Fields("incluirunacasilladecomentarios") = False
    End If
    If FRMCONFIGURACION.CHKINSTRUCCIONESESPECIALES.Value = 1 Then
      RSTABLA.Fields("permitirqueseescribaninstruccionesespeciales") = True
    Else
      RSTABLA.Fields("permitirqueseescribaninstruccionesespeciales") = False
    End If
    RSTABLA.Fields("diasdevidadelcookiedeconfiguracion") = FRMCONFIGURACION.UPDDIASDEVIDADELCOOKIE.Value
    RSTABLA.Fields("formasdepago") = "" & FRMCONFIGURACION.CHKPAYPAL.Value & FRMCONFIGURACION.CHKTRANSFERENCIA.Value & FRMCONFIGURACION.CHKCONTRAREMBOLSO.Value
    RSTABLA.Fields("emailpaypal") = ENCRIPTARYCODIFICARDATOS2(FRMCONFIGURACION.TXTEMAILPAYPAL.Text, FRMCONFIGURACION.TXTCONTRAENCRIPTACION.Text)
    RSTABLA.Fields("cuentabancaria") = ENCRIPTARYCODIFICARDATOS2(FRMCONFIGURACION.TXTCUENTABANCARIA.Text, FRMCONFIGURACION.TXTCONTRAENCRIPTACION.Text)
  
  Rem PESTANA10
  Rem PESTANA11
    RSTABLA.Fields("tipofuente13") = FRMCONFIGURACION.TXTTIPOFUENTEFINAL.Text
    RSTABLA.Fields("colorfuente13") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFUENTEFINAL.BackColor)
    RSTABLA.Fields("tamanofuente13") = "" & (FRMCONFIGURACION.CMBTAMANOFUENTEFINAL.ListIndex + 1)
    RSTABLA.Fields("colorfondotablapaginafinal1") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORTABLAEXTERIOR.BackColor)
    RSTABLA.Fields("colorfondotablapaginafinal2") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORTABLAINTERIOR.BackColor)
    
  Rem PESTANA11
  Rem PESTANA12
    RSTABLA.Fields("encriptationpassword") = ENCRIPTARYCODIFICARDATOS2(FRMCONFIGURACION.TXTCONTRAENCRIPTACION.Text, "hiaydf")
    RSTABLA.Fields("smtpserver") = ENCRIPTARYCODIFICARDATOS2(FRMCONFIGURACION.TXTSMTPSERVER.Text, FRMCONFIGURACION.TXTCONTRAENCRIPTACION.Text)
    RSTABLA.Fields("emailaddress") = ENCRIPTARYCODIFICARDATOS2(FRMCONFIGURACION.TXTCORREOPAGO.Text, FRMCONFIGURACION.TXTCONTRAENCRIPTACION.Text)
    RSTABLA.Fields("emailserverport") = ENCRIPTARYCODIFICARDATOS2(FRMCONFIGURACION.TXTPUERTO.Text, FRMCONFIGURACION.TXTCONTRAENCRIPTACION.Text)
    RSTABLA.Fields("emaillogin") = ENCRIPTARYCODIFICARDATOS2(FRMCONFIGURACION.TXTLOGIN.Text, FRMCONFIGURACION.TXTCONTRAENCRIPTACION.Text)
    RSTABLA.Fields("emailpassword") = ENCRIPTARYCODIFICARDATOS2(FRMCONFIGURACION.TXTPASSWORD.Text, FRMCONFIGURACION.TXTCONTRAENCRIPTACION.Text)
    RSTABLA.Fields("emailsubject") = ENCRIPTARYCODIFICARDATOS2(FRMCONFIGURACION.TXTASUNTO.Text, FRMCONFIGURACION.TXTCONTRAENCRIPTACION.Text)
    
    If SNGVERSIONPLANTILLA <> 0.9 Then
  
      If FRMCONFIGURACION.CHKUSARHTTPS.Value = 1 Then
      
        RSTABLA.Fields("enviarpedidoviahttps") = True
        
      
      Else
      
        RSTABLA.Fields("enviarpedidoviahttps") = False
      
      End If
    
      RSTABLA.Fields("puertohttp") = FRMCONFIGURACION.TXTPUERTOHTTP.Text
      RSTABLA.Fields("puertohttps") = FRMCONFIGURACION.TXTPUERTOHTTPS.Text
      RSTABLA.Fields("direcciondesdelaquesereferencia") = FRMCONFIGURACION.TXTDIRECCIONHTTPREFERENCIA.Text

  
    End If
   
  Rem PESTANA12
  Rem PESTANA13
  
  RSTABLA.Fields("tipofuente5") = FRMCONFIGURACION.TXTTIPOFUENTEDISCLAIMER.Text
  RSTABLA.Fields("colorfuente5") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFUENTEDISCLAIMER.BackColor)
  RSTABLA.Fields("tamanofuente5") = "" & (FRMCONFIGURACION.CMBTAMANOFUENTEDISCLAIMER.ListIndex + 1)
  RSTABLA.Fields("tipofuente7") = FRMCONFIGURACION.TXTTIPOFUNTERES.Text
  RSTABLA.Fields("colorfuente7") = OBTENERRGBCOLOR(FRMCONFIGURACION.PICCOLORFUENTERES.BackColor)
  RSTABLA.Fields("tamanofuente7") = "" & (FRMCONFIGURACION.CMBTAMANOFUENTERES.ListIndex + 1)
  RSTABLA.Fields("datosempresa") = FRMCONFIGURACION.TXTDATOSFACTURAS.Text
  RSTABLA.Fields("logotipoempresa") = FRMCONFIGURACION.TXTLOGOEMPRESA.Text
  If FRMCONFIGURACION.CHKPONERDISCLAIMER.Value = 1 Then
    RSTABLA.Fields("ponerlicenciaenunacapa") = True
  Else
    RSTABLA.Fields("ponerlicenciaenunacapa") = False
  End If
  Rem PESTANA13
  RSTABLA.Update
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  SALVARPROYECTO = COPIARARCHIVOSDELENGUAJE()
  Exit Function
CAMPO:
  If Err.Number = 3260 Or Err.Number = 3050 Then
    Resume
    Exit Function
  End If
  If MsgBox(VARLENGUAJE(231), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
  On Error Resume Next
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  SALVARPROYECTO = False
End Function
Function OBTENERFLAGDELASOPCIONESDELOSMARCOS(ByVal INTMARCOCENTRAL As Integer, ByVal INTMARCO1 As Integer, ByVal INTMARCO2 As Integer) As Byte

  If INTMARCOCENTRAL = 0 And INTMARCO1 = 0 And INTMARCO2 = 0 Then
    OBTENERFLAGDELASOPCIONESDELOSMARCOS = 0
  ElseIf INTMARCOCENTRAL = 1 And INTMARCO1 = 0 And INTMARCO2 = 0 Then
    OBTENERFLAGDELASOPCIONESDELOSMARCOS = 1
  ElseIf INTMARCOCENTRAL = 0 And INTMARCO1 = 1 And INTMARCO2 = 0 Then
    OBTENERFLAGDELASOPCIONESDELOSMARCOS = 2
  ElseIf INTMARCOCENTRAL = 0 And INTMARCO1 = 0 And INTMARCO2 = 1 Then
    OBTENERFLAGDELASOPCIONESDELOSMARCOS = 3
  ElseIf INTMARCOCENTRAL = 1 And INTMARCO1 = 1 And INTMARCO2 = 0 Then
    OBTENERFLAGDELASOPCIONESDELOSMARCOS = 4
  ElseIf INTMARCOCENTRAL = 1 And INTMARCO1 = 0 And INTMARCO2 = 1 Then
    OBTENERFLAGDELASOPCIONESDELOSMARCOS = 5
  ElseIf INTMARCOCENTRAL = 0 And INTMARCO1 = 1 And INTMARCO2 = 1 Then
    OBTENERFLAGDELASOPCIONESDELOSMARCOS = 6
  ElseIf INTMARCOCENTRAL = 1 And INTMARCO1 = 1 And INTMARCO2 = 1 Then
    OBTENERFLAGDELASOPCIONESDELOSMARCOS = 7
  End If

End Function
Function OBTENERRGBCOLOR(ByVal LNGCOLOR As Long) As String

  
  Dim STRRGBCOLOR As String
  Dim I As Byte
  
  STRRGBCOLOR = Hex(LNGCOLOR)
  For I = Len(STRRGBCOLOR) + 1 To 6
  
    STRRGBCOLOR = "0" & STRRGBCOLOR
  
  Next I
  OBTENERRGBCOLOR = Mid(STRRGBCOLOR, 5) & Mid(STRRGBCOLOR, 3, 2) & Mid(STRRGBCOLOR, 1, 2)
  
End Function

Function COPIARARCHIVOSDELENGUAJE() As Boolean
  On Error GoTo CAMPO
  Dim FSOARCHIVO As New Scripting.FileSystemObject
  Dim VARARCHIVOS As Variant
  Dim BOLRETVAL As Boolean
  Dim I As Integer
  
  BOLRETVAL = True
  VARARCHIVOS = FRMCONFIGURACION.HASLENGUAJESCARRO.Keys
  For I = 1 To UBound(VARARCHIVOS)
  
    If FSOARCHIVO.FileExists(STRRUTA & "plantillas web\plantilla1\Languages\" & VARARCHIVOS(I)) = False Then
      BOLRETVAL = False
      Exit For
    ElseIf ESUNARCHIVODELENGUJEVALIDO(STRRUTA & "plantillas web\plantilla1\Languages\" & VARARCHIVOS(I)) = False Then
      BOLRETVAL = False
      Exit For
    End If
  
  Next I
  
  If BOLRETVAL = False Then
    MsgBox VARLENGUAJE(232), vbCritical, NOMBRE_DEL_PROGRAMA
    COPIARARCHIVOSDELENGUAJE = False
    Exit Function
  End If
  
  If FSOARCHIVO.FolderExists(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\Languages") = True Then
  
    FSOARCHIVO.DeleteFolder STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\Languages", True
  
  End If
  FSOARCHIVO.CreateFolder STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\Languages"
  For I = 1 To UBound(VARARCHIVOS)
    FSOARCHIVO.CopyFile STRRUTA & "plantillas web\plantilla1\Languages\" & VARARCHIVOS(I), STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\Languages\" & VARARCHIVOS(I)
  Next I
  COPIARARCHIVOSDELENGUAJE = True
  Exit Function
CAMPO:
  If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
  COPIARARCHIVOSDELENGUAJE = False
End Function
Function ENCRIPTARYCODIFICARDATOS2(ByVal STRTEXTO As String, STRCLAVE As String) As String

  If STRCLAVE = "" Then
    ENCRIPTARYCODIFICARDATOS2 = STRTEXTO
  Else
    ENCRIPTARYCODIFICARDATOS2 = ENCRIPTARYCODIFICARDATOS(STRTEXTO, STRCLAVE)
  End If

End Function

Sub DESSELECCIONARCELDAS()
  Dim I As Long
  For I = 1 To FRMCONFIGURACION.MSFGPRODUCTOS.Rows - 1
  
    FRMCONFIGURACION.MSFGPRODUCTOS.Row = I
    FRMCONFIGURACION.MSFGPRODUCTOS.Col = 0
    FRMCONFIGURACION.MSFGPRODUCTOS.CellBackColor = vbWhite
    FRMCONFIGURACION.MSFGPRODUCTOS.Col = 1
    FRMCONFIGURACION.MSFGPRODUCTOS.CellBackColor = vbWhite
    FRMCONFIGURACION.MSFGPRODUCTOS.Col = 2
    FRMCONFIGURACION.MSFGPRODUCTOS.CellBackColor = vbWhite
    FRMCONFIGURACION.MSFGPRODUCTOS.Col = 3
    FRMCONFIGURACION.MSFGPRODUCTOS.CellBackColor = vbWhite
    FRMCONFIGURACION.MSFGPRODUCTOS.Col = 4
    FRMCONFIGURACION.MSFGPRODUCTOS.CellBackColor = vbWhite
      
  Next I
  FRMCONFIGURACION.CMDEDITARPRODUCTO.Enabled = False
  FRMCONFIGURACION.CMDBORRARPRODUCTO.Enabled = False
  
End Sub
Function ACTUALIZARLISTAPRODUCTOS() As Boolean
  On Error GoTo CAMPO
  Dim DBREGISTRO As Database
  Dim RSTABLA As Recordset
  Dim LNGCUENTA As Long
  FRMCONFIGURACION.CMDEDITARPRODUCTO.Enabled = False
  FRMCONFIGURACION.CMDBORRARPRODUCTO.Enabled = False
  BORRARPRODUCTOS
  Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("SELECT * FROM PRODUCTOS ORDER BY PRODUCTOS.categoria, PRODUCTOS.subcategoria, PRODUCTOS.nombreproducto", dbOpenDynaset)
  If RSTABLA.RecordCount >= 100 Then
    FRMCONFIGURACION.CMDANADIRPRODUCTO.Enabled = False
  Else
    FRMCONFIGURACION.CMDANADIRPRODUCTO.Enabled = True
  End If
  Do While RSTABLA.EOF = False
    LNGCUENTA = LNGCUENTA + 1
    FRMCONFIGURACION.MSFGPRODUCTOS.AddItem "RR"
    FRMCONFIGURACION.MSFGPRODUCTOS.Row = LNGCUENTA
    FRMCONFIGURACION.MSFGPRODUCTOS.Col = 0
    FRMCONFIGURACION.MSFGPRODUCTOS.Text = RSTABLA.Fields("nombreproducto")
    FRMCONFIGURACION.MSFGPRODUCTOS.Col = 1
    FRMCONFIGURACION.MSFGPRODUCTOS.Text = RSTABLA.Fields("idproducto")
    FRMCONFIGURACION.MSFGPRODUCTOS.Col = 2
    FRMCONFIGURACION.MSFGPRODUCTOS.Text = RSTABLA.Fields("categoria")
    FRMCONFIGURACION.MSFGPRODUCTOS.Col = 3
    FRMCONFIGURACION.MSFGPRODUCTOS.Text = RSTABLA.Fields("subcategoria")
    FRMCONFIGURACION.MSFGPRODUCTOS.Col = 4
    FRMCONFIGURACION.MSFGPRODUCTOS.Text = ""
    If RSTABLA.Fields("descripcion") <> vbNullString Then
      FRMCONFIGURACION.MSFGPRODUCTOS.Text = RSTABLA.Fields("descripcion")
    End If
    RSTABLA.MoveNext
  Loop
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  ACTUALIZARLISTAPRODUCTOS = True
  Exit Function
CAMPO:
If MsgBox(VARLENGUAJE(243), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
  On Error Resume Next
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  ACTUALIZARLISTAPRODUCTOS = False
End Function
Sub BORRARPRODUCTOS()
  Dim I As Long
  For I = 1 To FRMCONFIGURACION.MSFGPRODUCTOS.Rows - 1
    FRMCONFIGURACION.MSFGPRODUCTOS.RemoveItem 1
  Next I
End Sub

Sub SELECCIONARLENGUAJE()
  On Error Resume Next
  Dim BOLRETVAL As Boolean
  Dim STRARCHIVODECONFIGURACION As String
  Dim INICONFIGURACION As New INIFILES
  Dim STRLENGUAJE As String
  Dim STRDIRECTORIODELENGUAJES As String
  Dim VAREJECUTAR As New VBSUtilidades.VBSUtils
  Dim I As Integer
  BOLRETVAL = True
  Do
    If ExistsFile(STRRUTA & "SeleccionarLenguaje.exe") = False Then
      If MsgBox(VARLENGUAJE(4), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
        Exit Sub
      End If
    End If
    BOLRETVAL = False
  Loop While BOLRETVAL = True

  VAREJECUTAR.EjecutarSinc STRRUTA & "SeleccionarLenguaje.exe"
  If Err.Number <> 0 Then
    Exit Sub
  End If
  STRARCHIVODECONFIGURACION = STRRUTA
  If Mid(STRARCHIVODECONFIGURACION, Len(STRARCHIVODECONFIGURACION), 1) <> "\" Then
    STRARCHIVODECONFIGURACION = STRARCHIVODECONFIGURACION & "\"
  End If
  STRARCHIVODECONFIGURACION = STRARCHIVODECONFIGURACION & "config.ini"
  Do
    If ExistsFile(STRARCHIVODECONFIGURACION) = False Then
      If MsgBox(VARLENGUAJE(4), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
        Exit Sub
      End If
    End If
    BOLRETVAL = False
  Loop While BOLRETVAL = True
  INICONFIGURACION.File = STRARCHIVODECONFIGURACION
  BOLRETVAL = True
  Do

    INICONFIGURACION.Section = NOMBRE_DEL_PROGRAMA
    STRLENGUAJE = Trim(INICONFIGURACION.GetValue("Lenguaje"))
    If INICONFIGURACION.ErrorNumber = 0 Or STRLENGUAJE = "" Then
      If MsgBox(VARLENGUAJE(4), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
        Exit Sub
      End If
    End If
    BOLRETVAL = False
  Loop While BOLRETVAL = True
  STRDIRECTORIODELENGUAJES = STRRUTA
  If Mid(STRDIRECTORIODELENGUAJES, Len(STRDIRECTORIODELENGUAJES), 1) <> "\" Then
    STRDIRECTORIODELENGUAJES = STRDIRECTORIODELENGUAJES & "\"
  End If
  STRDIRECTORIODELENGUAJES = STRDIRECTORIODELENGUAJES & "LENGUAJE"
  BOLRETVAL = True
  Do
   
    If ExistsFile(STRDIRECTORIODELENGUAJES & "\NUL") = False Then
      If MsgBox(VARLENGUAJE(4), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
        Exit Sub
      End If
    End If
    BOLRETVAL = False
  Loop While BOLRETVAL = True
  FRMMARROK.FLBLENGUAJE.Path = STRDIRECTORIODELENGUAJES
  BOLRETVAL = True
  If CARGARLENGUAJE(STRLENGUAJE, FRMMARROK.FLBLENGUAJE) = False Then
    MsgBox VARLENGUAJE(5), vbCritical, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If

  
  FRMMARROK.TRADUCIRINTERFAZ
  If Trim(STRNOMBREPROYECTO) <> "" Then
    FRMCONFIGURACION.TRADUCIRINTERFAZ
    FRMCONFIGURACION.CMBMODELOPAGINA.Text = VARLENGUAJE(63 + FRMCONFIGURACION.BYTULTIMOMODELO)
  End If
End Sub
Sub DESENCRIPTARMENSAJE()
  On Error Resume Next
  Dim VAREJECUTAR As New VBSUtilidades.VBSUtils
  Dim BOLRETVAL As Boolean
  BOLRETVAL = True
  Do
    If ExistsFile(STRRUTA & "SeleccionarLenguaje.exe") = False Then
      If MsgBox(VARLENGUAJE(4), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
        Exit Sub
      End If
    End If
    BOLRETVAL = False
  Loop While BOLRETVAL = True

  VAREJECUTAR.EjecutarSinc STRRUTA & "ASISTENTEDESEN.exe"
 

End Sub

Sub COMPILARPROYECTO()
  On Error GoTo CAMPO
  Dim VBSUUTILIDADES As New VBSUtilidades.VBSUtils
  Dim FSOARCHIVOS As New FileSystemObject
  Dim STRDIRECTORIO As String
  
  If MsgBox(VARLENGUAJE(275), vbInformation + vbYesNo, NOMBRE_DEL_PROGRAMA) = vbNo Then
    Exit Sub
  
  End If
  
  If SALVARPROYECTO() = False Then
  
    Exit Sub
  
  End If
  If VERIFICARTODOSLOSDATOS() = False Then
  
    Exit Sub
  
  End If
  
  STRDIRECTORIO = VBSUUTILIDADES.PedirDirectorio(CStr(VARLENGUAJE(289)))
  If STRDIRECTORIO = "" Then
  
    Exit Sub
  
  End If
  FSOARCHIVOS.CopyFolder STRRUTA & "Proyectos\" & STRNOMBREPROYECTO, STRDIRECTORIO, True
  If Mid(STRDIRECTORIO, Len(STRDIRECTORIO), 1) <> "\" Then
    STRDIRECTORIO = STRDIRECTORIO & "\"
  End If
  If FSOARCHIVOS.FileExists(STRDIRECTORIO & STRNOMBREPROYECTO & "\configshop.edb") = True Then
    FSOARCHIVOS.DeleteFile STRDIRECTORIO & STRNOMBREPROYECTO & "\configshop.edb", True
  End If
  
  STRDIRECTORIO = STRDIRECTORIO & STRNOMBREPROYECTO & "\Config\"
  If CREARARCHIVOSDECONFIGURACION(STRDIRECTORIO) = False Then
       
    Exit Sub
  
  End If
  MsgBox VARLENGUAJE(292), vbInformation, NOMBRE_DEL_PROGRAMA
  Exit Sub
CAMPO:
  If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
End Sub

Function VERIFICARTODOSLOSDATOS() As Boolean
  On Error GoTo CAMPO
  Dim DBREGISTRO As Database
  Dim RSTABLA As Recordset
  Dim STRLISTAARCHIVOS() As String
  Dim STRNOMBREDELPROYECTO As String
  Dim VARLISTALENGUAJES As Variant
  Dim STRCLAVE As String
  Dim STRPUERTO As String
  Dim BOLANADIRLICENCIA As Boolean
  Dim BYTANADIRDISCLAIMER As Byte
  Dim I As Byte
  If SNGVERSIONPLANTILLA = 0.9 Then
    STRNOMBREDELPROYECTO = STRNOMBREPROYECTO
    ReDim STRLISTAARCHIVOS(44)
    STRLISTAARCHIVOS(0) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\configshop.edb"
    STRLISTAARCHIVOS(1) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\NUL"
    STRLISTAARCHIVOS(2) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\index.htm"
    STRLISTAARCHIVOS(3) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\buycart.htm"
    STRLISTAARCHIVOS(4) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\addtocart.htm"
    STRLISTAARCHIVOS(5) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\categories.htm"
    STRLISTAARCHIVOS(6) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\cesta.gif"
    STRLISTAARCHIVOS(7) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\chooselanguage.htm"
    STRLISTAARCHIVOS(8) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\control.htm"
    STRLISTAARCHIVOS(9) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\control2.htm"
    STRLISTAARCHIVOS(10) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\disclaimer.htm"
    STRLISTAARCHIVOS(11) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\final.htm"
    STRLISTAARCHIVOS(12) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\license.htm"
    STRLISTAARCHIVOS(13) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\nocapacidad.htm"
    STRLISTAARCHIVOS(14) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\paypal.gif"
    STRLISTAARCHIVOS(15) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\products.htm"
    STRLISTAARCHIVOS(16) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\search.htm"
    STRLISTAARCHIVOS(17) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\viewchangeorder.htm"
    STRLISTAARCHIVOS(18) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Applets\NUL"
    STRLISTAARCHIVOS(19) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Applets\MarrokApplets.jar"
    STRLISTAARCHIVOS(20) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\NUL"
    STRLISTAARCHIVOS(21) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\config.js"
    STRLISTAARCHIVOS(22) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\imagesdb.js"
    STRLISTAARCHIVOS(23) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\models.js"
    STRLISTAARCHIVOS(24) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\product.js"
    STRLISTAARCHIVOS(25) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Images\NUL"
    STRLISTAARCHIVOS(26) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\NUL"
    STRLISTAARCHIVOS(27) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\cadenas.js"
    STRLISTAARCHIVOS(28) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\constantes.js"
    STRLISTAARCHIVOS(29) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\cookies.js"
    STRLISTAARCHIVOS(30) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\Crypandcodificationfunctions.js"
    STRLISTAARCHIVOS(31) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\GenericMailerAppletCreator.js"
    STRLISTAARCHIVOS(32) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\GenericMailerAppletHandle.js"
    STRLISTAARCHIVOS(33) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\GenericPaypalShopingCartButton.js"
    STRLISTAARCHIVOS(34) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\HashArray.js"
    STRLISTAARCHIVOS(35) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\LayerCreator.js"
    STRLISTAARCHIVOS(36) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\LayerHandle.js"
    STRLISTAARCHIVOS(37) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\MakeArray.js"
    STRLISTAARCHIVOS(38) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\md5.js"
    STRLISTAARCHIVOS(39) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\MiscShop.js"
    STRLISTAARCHIVOS(40) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\QueryStringHandle.js"
    STRLISTAARCHIVOS(41) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\sha1.js"
    STRLISTAARCHIVOS(42) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\SplitURL.js"
    STRLISTAARCHIVOS(43) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSlibs\ValidateURLS.js"
    STRLISTAARCHIVOS(44) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Languages\NUL"

  
  ElseIf SNGVERSIONPLANTILLA = 0.91 And BOLESPLANTILLAORIGINAL = False Then
    STRNOMBREDELPROYECTO = STRNOMBREPROYECTO
    ReDim STRLISTAARCHIVOS(10)
    STRLISTAARCHIVOS(0) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\NUL"
    STRLISTAARCHIVOS(1) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\index.htm"
    STRLISTAARCHIVOS(2) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\NUL"
    STRLISTAARCHIVOS(3) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\config.js"
    STRLISTAARCHIVOS(4) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\imagesdb.js"
    STRLISTAARCHIVOS(5) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\models.js"
    STRLISTAARCHIVOS(6) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\product.js"
    STRLISTAARCHIVOS(7) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Images\NUL"
    STRLISTAARCHIVOS(8) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\cgi-bin\NUL"
    STRLISTAARCHIVOS(9) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\cgi-bin\configserv.pl"
    STRLISTAARCHIVOS(10) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Languages\NUL"
   

  Else

    STRNOMBREDELPROYECTO = STRNOMBREPROYECTO
    ReDim STRLISTAARCHIVOS(47)
    STRLISTAARCHIVOS(0) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\NUL"
    STRLISTAARCHIVOS(1) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\index.htm"
    STRLISTAARCHIVOS(2) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\NUL"
    STRLISTAARCHIVOS(3) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\config.js"
    STRLISTAARCHIVOS(4) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\imagesdb.js"
    STRLISTAARCHIVOS(5) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\models.js"
    STRLISTAARCHIVOS(6) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Config\product.js"
    STRLISTAARCHIVOS(7) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Images\NUL"
    STRLISTAARCHIVOS(8) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\cgi-bin\NUL"
    STRLISTAARCHIVOS(9) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\cgi-bin\configserv.pl"
    STRLISTAARCHIVOS(10) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\Languages\NUL"
    STRLISTAARCHIVOS(11) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\configshop.edb"
    STRLISTAARCHIVOS(12) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\NUL"
    STRLISTAARCHIVOS(13) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\index.htm"
    STRLISTAARCHIVOS(14) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\buycart.htm"
    STRLISTAARCHIVOS(15) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\addtocart.htm"
    STRLISTAARCHIVOS(16) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\categories.htm"
    STRLISTAARCHIVOS(17) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\cesta.gif"
    STRLISTAARCHIVOS(18) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\chooselanguage.htm"
    STRLISTAARCHIVOS(19) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\control.htm"
    STRLISTAARCHIVOS(20) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\control2.htm"
    STRLISTAARCHIVOS(21) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\disclaimer.htm"
    STRLISTAARCHIVOS(22) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\license.htm"
    STRLISTAARCHIVOS(23) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\nocapacidad.htm"
    STRLISTAARCHIVOS(24) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\paypal.gif"
    STRLISTAARCHIVOS(25) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\products.htm"
    STRLISTAARCHIVOS(26) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\search.htm"
    STRLISTAARCHIVOS(27) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\viewchangeorder.htm"
    STRLISTAARCHIVOS(28) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\NUL"
    STRLISTAARCHIVOS(29) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\cadenas.js"
    STRLISTAARCHIVOS(30) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\constantes.js"
    STRLISTAARCHIVOS(31) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\cookies.js"
    STRLISTAARCHIVOS(32) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\Crypandcodificationfunctions.js"
    STRLISTAARCHIVOS(33) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\GenericPaypalShopingCartButton.js"
    STRLISTAARCHIVOS(34) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\HashArray.js"
    STRLISTAARCHIVOS(35) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\LayerCreator.js"
    STRLISTAARCHIVOS(36) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\LayerHandle.js"
    STRLISTAARCHIVOS(37) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\MakeArray.js"
    STRLISTAARCHIVOS(38) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\md5.js"
    STRLISTAARCHIVOS(39) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\MiscShop.js"
    STRLISTAARCHIVOS(40) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\QueryStringHandle.js"
    STRLISTAARCHIVOS(41) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\sha1.js"
    STRLISTAARCHIVOS(42) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSLibs\SplitURL.js"
    STRLISTAARCHIVOS(43) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\JSlibs\ValidateURLS.js"
    STRLISTAARCHIVOS(44) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\cgi-bin\final.pl"
    STRLISTAARCHIVOS(45) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\cgi-bin\MiscShop.pm"
    STRLISTAARCHIVOS(46) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\cgi-bin\final.htm"
    STRLISTAARCHIVOS(47) = STRRUTA & "Proyectos\" & STRNOMBREDELPROYECTO & "\cgi-bin\final2.htm"
 

  End If
  For I = 0 To UBound(STRLISTAARCHIVOS)
    If ExistsFile(STRLISTAARCHIVOS(I)) = False Then
      MsgBox VARLENGUAJE(276), vbExclamation, NOMBRE_DEL_PROGRAMA
      VERIFICARTODOSLOSDATOS = False
      Exit Function
    End If
  Next I
  
  Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("CONFIGURACION", dbOpenTable)
  BOLANADIRLICENCIA = RSTABLA.Fields("incluirlicencia")
  BYTANADIRDISCLAIMER = RSTABLA.Fields("incluirdisclaimeren")
  If Trim(RSTABLA.Fields("titulodelapagina")) = "" Then
    MsgBox VARLENGUAJE(277), vbExclamation, NOMBRE_DEL_PROGRAMA
    VERIFICARTODOSLOSDATOS = False
    Exit Function
  End If
  If Trim(RSTABLA.Fields("lenguajepordefecto")) = "" Then
    MsgBox VARLENGUAJE(278), vbExclamation, NOMBRE_DEL_PROGRAMA
    VERIFICARTODOSLOSDATOS = False
    Exit Function
  End If
  VARLISTALENGUAJES = FRMCONFIGURACION.HASLENGUAJESCARRO.Keys()
  
  For I = 1 To UBound(VARLISTALENGUAJES)
    If ExistsFile(STRRUTA & "PROYECTOS\" & STRNOMBREPROYECTO & "\LANGUAGES\" & VARLISTALENGUAJES(I)) = False Then
      MsgBox VARLENGUAJE(279), vbExclamation, NOMBRE_DEL_PROGRAMA
      VERIFICARTODOSLOSDATOS = False
      Exit Function
    ElseIf ESUNARCHIVODELENGUJEVALIDO(STRRUTA & "PROYECTOS\" & STRNOMBREPROYECTO & "\LANGUAGES\" & VARLISTALENGUAJES(I)) = False Then
        
      MsgBox VARLENGUAJE(279), vbExclamation, NOMBRE_DEL_PROGRAMA
      VERIFICARTODOSLOSDATOS = False
      Exit Function
    
    End If
  Next I
  If RSTABLA.Fields("ponerprecioendosmonedas") = True And Trim(RSTABLA.Fields("nombredelamonedasecundaria")) = "" Then
    MsgBox VARLENGUAJE(280), vbExclamation, NOMBRE_DEL_PROGRAMA
    VERIFICARTODOSLOSDATOS = False
    Exit Function
  End If
  STRCLAVE = DESCODIFICARYDESENCRIPTARDATOS(RSTABLA.Fields("encriptationpassword"), "hiaydf")
  If STRCLAVE = "" Then
  
    MsgBox VARLENGUAJE(281), vbExclamation, NOMBRE_DEL_PROGRAMA
    VERIFICARTODOSLOSDATOS = False
    Exit Function
  
  End If
  
  
  If Trim(DESCODIFICARYDESENCRIPTARDATOS(RSTABLA.Fields("smtpserver"), STRCLAVE)) = "" Then
    MsgBox VARLENGUAJE(282), vbExclamation, NOMBRE_DEL_PROGRAMA
    VERIFICARTODOSLOSDATOS = False
    Exit Function
  End If
  If IsValidEMail(DESCODIFICARYDESENCRIPTARDATOS(RSTABLA.Fields("emailaddress"), STRCLAVE)) = False Then
    MsgBox VARLENGUAJE(283), vbExclamation, NOMBRE_DEL_PROGRAMA
    VERIFICARTODOSLOSDATOS = False
    Exit Function
  End If
  If IsNumeric(DESCODIFICARYDESENCRIPTARDATOS(RSTABLA.Fields("emailserverport"), STRCLAVE)) = False Then
    MsgBox VARLENGUAJE(284), vbExclamation, NOMBRE_DEL_PROGRAMA
    VERIFICARTODOSLOSDATOS = False
    Exit Function
  End If
 
  If CStr(CLng(DESCODIFICARYDESENCRIPTARDATOS(RSTABLA.Fields("emailserverport"), STRCLAVE))) <> DESCODIFICARYDESENCRIPTARDATOS(RSTABLA.Fields("emailserverport"), STRCLAVE) Then
    MsgBox VARLENGUAJE(284), vbExclamation, NOMBRE_DEL_PROGRAMA
    VERIFICARTODOSLOSDATOS = False
    Exit Function
  End If
  If CLng(DESCODIFICARYDESENCRIPTARDATOS(RSTABLA.Fields("emailserverport"), STRCLAVE)) < 1 Then
    MsgBox VARLENGUAJE(284), vbExclamation, NOMBRE_DEL_PROGRAMA
    VERIFICARTODOSLOSDATOS = False
    Exit Function
  End If
  If Trim(DESCODIFICARYDESENCRIPTARDATOS(RSTABLA.Fields("emailsubject"), STRCLAVE)) = "" Then
    MsgBox VARLENGUAJE(285), vbExclamation, NOMBRE_DEL_PROGRAMA
    VERIFICARTODOSLOSDATOS = False
    Exit Function
  End If

  If Mid(RSTABLA.Fields("formasdepago"), 1, 1) = "1" And IsValidEMail(DESCODIFICARYDESENCRIPTARDATOS(RSTABLA.Fields("emailpaypal"), STRCLAVE)) = False Then
    MsgBox VARLENGUAJE(286), vbExclamation, NOMBRE_DEL_PROGRAMA
    VERIFICARTODOSLOSDATOS = False
    Exit Function
  End If
  If Mid(RSTABLA.Fields("formasdepago"), 2, 1) = "1" And Trim(DESCODIFICARYDESENCRIPTARDATOS(RSTABLA.Fields("cuentabancaria"), STRCLAVE)) = "" Then
    MsgBox VARLENGUAJE(287), vbExclamation, NOMBRE_DEL_PROGRAMA
    VERIFICARTODOSLOSDATOS = False
    Exit Function
  End If
  
  
  If SNGVERSIONPLANTILLA = 0.91 Then
  
    If IsNumeric(RSTABLA.Fields("puertohttp")) = False Then
      MsgBox VARLENGUAJE(330), vbExclamation, NOMBRE_DEL_PROGRAMA
      VERIFICARTODOSLOSDATOS = False
      Exit Function
    End If
 
    If CStr(CLng(RSTABLA.Fields("puertohttp"))) <> RSTABLA.Fields("puertohttp") Then
      MsgBox VARLENGUAJE(330), vbExclamation, NOMBRE_DEL_PROGRAMA
      VERIFICARTODOSLOSDATOS = False
      Exit Function
    End If
    If CLng(RSTABLA.Fields("puertohttp")) < 1 Then
      MsgBox VARLENGUAJE(330), vbExclamation, NOMBRE_DEL_PROGRAMA
      VERIFICARTODOSLOSDATOS = False
      Exit Function
    End If
 
    If CLng(RSTABLA.Fields("puertohttp")) = CLng(DESCODIFICARYDESENCRIPTARDATOS(RSTABLA.Fields("emailserverport"), STRCLAVE)) Then
    
      MsgBox VARLENGUAJE(333), vbExclamation, NOMBRE_DEL_PROGRAMA
      VERIFICARTODOSLOSDATOS = False
      Exit Function
    
    
    End If
    
    If RSTABLA.Fields("enviarpedidoviahttps") = True Then
    
      If IsNumeric(RSTABLA.Fields("puertohttps")) = False Then
        MsgBox VARLENGUAJE(331), vbExclamation, NOMBRE_DEL_PROGRAMA
        VERIFICARTODOSLOSDATOS = False
        Exit Function
      End If
 
      If CStr(CLng(RSTABLA.Fields("puertohttps"))) <> RSTABLA.Fields("puertohttps") Then
        MsgBox VARLENGUAJE(331), vbExclamation, NOMBRE_DEL_PROGRAMA
        VERIFICARTODOSLOSDATOS = False
        Exit Function
      End If
      If CLng(RSTABLA.Fields("puertohttps")) < 1 Then
        MsgBox VARLENGUAJE(331), vbExclamation, NOMBRE_DEL_PROGRAMA
        VERIFICARTODOSLOSDATOS = False
        Exit Function
      End If
 
      If CLng(RSTABLA.Fields("puertohttps")) = CLng(DESCODIFICARYDESENCRIPTARDATOS(RSTABLA.Fields("emailserverport"), STRCLAVE)) Then
    
        MsgBox VARLENGUAJE(333), vbExclamation, NOMBRE_DEL_PROGRAMA
        VERIFICARTODOSLOSDATOS = False
        Exit Function
    
      End If
  
      If CLng(RSTABLA.Fields("puertohttp")) = CLng(RSTABLA.Fields("puertohttps")) Then
    
        MsgBox VARLENGUAJE(333), vbExclamation, NOMBRE_DEL_PROGRAMA
        VERIFICARTODOSLOSDATOS = False
        Exit Function
      End If
    End If
    
    If isValidHTTPURL(RSTABLA.Fields("direcciondesdelaquesereferencia")) = False Then
      MsgBox VARLENGUAJE(332), vbExclamation, NOMBRE_DEL_PROGRAMA
      VERIFICARTODOSLOSDATOS = False
      Exit Function
    
    End If
    If RSTABLA.Fields("enviarpedidoviahttps") = True Then
      
      If InStr(1, RSTABLA.Fields("direcciondesdelaquesereferencia"), "HTTPS", vbTextCompare) <> 1 Then
        MsgBox VARLENGUAJE(332), vbExclamation, NOMBRE_DEL_PROGRAMA
        VERIFICARTODOSLOSDATOS = False
        Exit Function
      End If
      
    Else
    
      If InStr(1, RSTABLA.Fields("direcciondesdelaquesereferencia"), "HTTP", vbTextCompare) <> 1 Then
        MsgBox VARLENGUAJE(332), vbExclamation, NOMBRE_DEL_PROGRAMA
        VERIFICARTODOSLOSDATOS = False
        Exit Function
      End If
    
    End If
  End If
 
  
  
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  
  Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("PRODUCTOS", dbOpenTable)

  If RSTABLA.RecordCount <= 0 Then
    MsgBox VARLENGUAJE(288), vbExclamation, NOMBRE_DEL_PROGRAMA
    VERIFICARTODOSLOSDATOS = False
    Exit Function
  
  End If
  
  
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  
  Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("CONTENIDOSPAGINA", dbOpenTable)
  RSTABLA.Index = "archivolenguaje"
  For I = 1 To UBound(VARLISTALENGUAJES)
  
    RSTABLA.Seek "=", CStr(VARLISTALENGUAJES(I))
    If RSTABLA.NoMatch = True Then
    
      MsgBox VARLENGUAJE(291), vbExclamation, NOMBRE_DEL_PROGRAMA
      VERIFICARTODOSLOSDATOS = False
      Exit Function
    
    Else
    
    
      If isnull(RSTABLA.Fields("contenidopagprincipal")) = True Then
        MsgBox VARLENGUAJE(291), vbExclamation, NOMBRE_DEL_PROGRAMA
        VERIFICARTODOSLOSDATOS = False
        Exit Function
      ElseIf Trim(RSTABLA.Fields("contenidopagprincipal")) = "" Then
        MsgBox VARLENGUAJE(291), vbExclamation, NOMBRE_DEL_PROGRAMA
        VERIFICARTODOSLOSDATOS = False
        Exit Function
      End If
    
      If BYTANADIRDISCLAIMER <> 0 And isnull(RSTABLA.Fields("textodisclaimer")) = True Then
        MsgBox VARLENGUAJE(291), vbExclamation, NOMBRE_DEL_PROGRAMA
        VERIFICARTODOSLOSDATOS = False
        Exit Function
      ElseIf BYTANADIRDISCLAIMER <> 0 And Trim(RSTABLA.Fields("textodisclaimer")) = "" Then
        MsgBox VARLENGUAJE(291), vbExclamation, NOMBRE_DEL_PROGRAMA
        VERIFICARTODOSLOSDATOS = False
        Exit Function
      End If
    
    
      If BOLANADIRLICENCIA = True And isnull(RSTABLA.Fields("textolicencia")) = True Then
        MsgBox VARLENGUAJE(291), vbExclamation, NOMBRE_DEL_PROGRAMA
        VERIFICARTODOSLOSDATOS = False
        Exit Function
      ElseIf BOLANADIRLICENCIA = True And Trim(RSTABLA.Fields("textolicencia")) = "" Then
        MsgBox VARLENGUAJE(291), vbExclamation, NOMBRE_DEL_PROGRAMA
        VERIFICARTODOSLOSDATOS = False
        Exit Function
      End If
    
    
    End If
    
  Next I
  
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  
  
  VERIFICARTODOSLOSDATOS = True
  Exit Function
CAMPO:
  If Err.Number = 3260 Or Err.Number = 3050 Then
    Resume
    Exit Function
  End If
  If MsgBox(VARLENGUAJE(58), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
  On Error Resume Next
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  VERIFICARTODOSLOSDATOS = False
End Function

Function IsValidEMail(ByVal STREMAIL As String) As Boolean
  Dim VARPARTES As Variant
  Dim I As Long
  
  If Trim(STREMAIL) = "" Then
    IsValidEMail = False
    Exit Function
  End If
  
  If InStr(STREMAIL, "@") <= 1 Or InStr(STREMAIL, "@") = Len(STREMAIL) Then
  
    IsValidEMail = False
    Exit Function
  
  End If
  
  VARPARTES = Split(STREMAIL, "@")
  If UBound(VARPARTES) > 2 Then
  
    IsValidEMail = False
    Exit Function
  
  End If
  
  If InStr(VARPARTES(1), ".") <= 1 Or InStr(VARPARTES(1), ".") = Len(VARPARTES(1)) Then
  
    IsValidEMail = False
    Exit Function
  
  End If
  
  If Mid(STREMAIL, Len(STREMAIL) - 1, 1) = "." Then
    IsValidEMail = False
    Exit Function
  End If
  For I = 1 To Len(STREMAIL)
  
    If Mid(STREMAIL, I, 1) = " " Or Mid(STREMAIL, I, 1) = Chr(9) Then
      IsValidEMail = False
      Exit Function
    End If
  
  Next I
  IsValidEMail = True
End Function
Public Function CREARARCHIVOSDECONFIGURACION(ByVal STRRUTACONFIG As String) As Boolean
  On Error GoTo CAMPO
  Dim DBREGISTRO As Database
  Dim RSTABLA As Recordset
  Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("CONFIGURACION", dbOpenTable)
  Dim JSVARCHIVO As New JSVarArchives
  Dim VARCLAVE As Variant
  Dim VARLISTALENGUAJES As Variant
  Dim STRLENGUAJESANADIDOS As String
  Dim BYTRETVAL As Byte
  Dim BOLRETVAL As Boolean
  Dim HASIDPRODUCTO As New HASHARRAY
  Dim VARIDPRODUCTO As Variant
  Dim STRPAGINAQUEESREFERENCIA As String
  Dim INTCL As Integer
  Dim I As Long
  JSVARCHIVO.Archive = STRRUTACONFIG & "Config.js"
  For Each VARCLAVE In RSTABLA.Fields
  
    BOLRETVAL = True
    Do While (BOLRETVAL = True)
      BOLRETVAL = False
      If VARCLAVE.Type = dbBoolean Then
      
        If RSTABLA.Fields(VARCLAVE.Name) = True Then
          BYTRETVAL = JSVARCHIVO.SetJSVar(CStr(VARCLAVE.Name), "true")
        Else
           BYTRETVAL = JSVARCHIVO.SetJSVar(CStr(VARCLAVE.Name), "false")
        End If
        
      ElseIf UCase(VARCLAVE.Name) = "VERSIONPLANTILLA" Then
  
        
      ElseIf SNGVERSIONPLANTILLA = 0.91 And (UCase(VARCLAVE.Name) = "SMTPSERVER" Or UCase(VARCLAVE.Name) = "EMAILADDRESS" Or UCase(VARCLAVE.Name) = "EMAILSERVERPORT" Or UCase(VARCLAVE.Name) = "EMAILLOGIN" Or UCase(VARCLAVE.Name) = "EMAILPASSWORD" Or UCase(VARCLAVE.Name) = "EMAILSUBJECT" Or UCase(VARCLAVE.Name) = "ENCRIPTATIONPASSWORD" Or UCase(VARCLAVE.Name) = "EMAILPAYPAL" Or UCase(VARCLAVE.Name) = "CUENTABANCARIA" Or UCase(VARCLAVE.Name) = "DIRECCIONDESDELAQUESEREFERENCIA") Then
  
      ElseIf VARCLAVE.Type = dbMemo Or VARCLAVE.Type = dbText Then
        If InStr(CStr(VARCLAVE.Name), "color") >= 1 Then
        
          BYTRETVAL = JSVARCHIVO.SetJSVar(CStr(VARCLAVE.Name), "'#" & ESCAPARCARACTERES(RSTABLA.Fields(VARCLAVE.Name)) & "'")
        Else
          BYTRETVAL = JSVARCHIVO.SetJSVar(CStr(VARCLAVE.Name), "'" & ESCAPARCARACTERES(RSTABLA.Fields(VARCLAVE.Name)) & "'")
        End If
      Else
      
        BYTRETVAL = JSVARCHIVO.SetJSVar(CStr(VARCLAVE.Name), CStr(RSTABLA.Fields(VARCLAVE.Name)))

      
      End If
      
      If BYTRETVAL <> 0 Then
      
        If MsgBox(VARLENGUAJE(290), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
          BOLRETVAL = True
        Else
          CREARARCHIVOSDECONFIGURACION = False
          Exit Function
        End If
      
      End If
      
    Loop
  Next VARCLAVE
  
  
  
  
  
  VARLISTALENGUAJES = FRMCONFIGURACION.HASLENGUAJESCARRO.Keys
  For I = 1 To UBound(VARLISTALENGUAJES)
    If I = 1 Then
      STRLENGUAJESANADIDOS = Mid(VARLISTALENGUAJES(I), 1, Len(VARLISTALENGUAJES(I)) - 4)

   Else
      STRLENGUAJESANADIDOS = STRLENGUAJESANADIDOS & "|" & Mid(VARLISTALENGUAJES(I), 1, Len(VARLISTALENGUAJES(I)) - 4)
   
   End If
  
  Next I
  STRLENGUAJESANADIDOS = ESCAPARCARACTERES(STRLENGUAJESANADIDOS)
  
  
  BOLRETVAL = True
  Do While (BOLRETVAL = True)
    BOLRETVAL = False
    BYTRETVAL = JSVARCHIVO.SetJSVar("lenguajesdisponibles", "'" & STRLENGUAJESANADIDOS & "'")
    If BYTRETVAL <> 0 Then
      
      If MsgBox(VARLENGUAJE(290), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
        BOLRETVAL = True
      Else
        CREARARCHIVOSDECONFIGURACION = False
        Exit Function
      End If
      
    End If
      
  Loop
  
  
    If SNGVERSIONPLANTILLA = 0.91 Then
    BOLRETVAL = True
    JSVARCHIVO.Archive = Mid(STRRUTACONFIG, 1, Len(STRRUTACONFIG) - 7) & "cgi-bin\configserv.pl"
    
    Do While (BOLRETVAL = True)
      BOLRETVAL = False

        BYTRETVAL = JSVARCHIVO.SetJSVar("smtpserver", "'" & RSTABLA.Fields("smtpserver") & "'")
        If BYTRETVAL <> 0 Then
      
          If MsgBox(VARLENGUAJE(290), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
            BOLRETVAL = True
          Else
            CREARARCHIVOSDECONFIGURACION = False
            Exit Function
          End If
        End If


'''''''''''''''''''''''''''''''''''''

        BYTRETVAL = JSVARCHIVO.SetJSVar("emailaddress", "'" & RSTABLA.Fields("emailaddress") & "'")
        If BYTRETVAL <> 0 Then
      
          If MsgBox(VARLENGUAJE(290), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
            BOLRETVAL = True
          Else
            CREARARCHIVOSDECONFIGURACION = False
            Exit Function
          End If
        End If
        BYTRETVAL = JSVARCHIVO.SetJSVar("emailserverport", "'" & RSTABLA.Fields("emailserverport") & "'")
        If BYTRETVAL <> 0 Then
      
          If MsgBox(VARLENGUAJE(290), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
            BOLRETVAL = True
          Else
            CREARARCHIVOSDECONFIGURACION = False
            Exit Function
          End If
        End If
        BYTRETVAL = JSVARCHIVO.SetJSVar("emaillogin", "'" & RSTABLA.Fields("emaillogin") & "'")
        If BYTRETVAL <> 0 Then
      
          If MsgBox(VARLENGUAJE(290), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
            BOLRETVAL = True
          Else
            CREARARCHIVOSDECONFIGURACION = False
            Exit Function
          End If
        End If
        BYTRETVAL = JSVARCHIVO.SetJSVar("emailpassword", "'" & RSTABLA.Fields("emailpassword") & "'")
        If BYTRETVAL <> 0 Then
      
          If MsgBox(VARLENGUAJE(290), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
            BOLRETVAL = True
          Else
            CREARARCHIVOSDECONFIGURACION = False
            Exit Function
          End If
        End If
        BYTRETVAL = JSVARCHIVO.SetJSVar("emailsubject", "'" & RSTABLA.Fields("emailsubject") & "'")
        If BYTRETVAL <> 0 Then
      
          If MsgBox(VARLENGUAJE(290), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
            BOLRETVAL = True
          Else
            CREARARCHIVOSDECONFIGURACION = False
            Exit Function
          End If
        End If
        BYTRETVAL = JSVARCHIVO.SetJSVar("encriptationpassword", "'" & RSTABLA.Fields("encriptationpassword") & "'")
        If BYTRETVAL <> 0 Then
      
          If MsgBox(VARLENGUAJE(290), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
            BOLRETVAL = True
          Else
            CREARARCHIVOSDECONFIGURACION = False
            Exit Function
          End If
        End If
        BYTRETVAL = JSVARCHIVO.SetJSVar("emailpaypal", "'" & RSTABLA.Fields("emailpaypal") & "'")
        If BYTRETVAL <> 0 Then
      
          If MsgBox(VARLENGUAJE(290), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
            BOLRETVAL = True
          Else
            CREARARCHIVOSDECONFIGURACION = False
            Exit Function
          End If
        End If
        BYTRETVAL = JSVARCHIVO.SetJSVar("cuentabancaria", "'" & RSTABLA.Fields("cuentabancaria") & "'")
        If BYTRETVAL <> 0 Then
      
          If MsgBox(VARLENGUAJE(290), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
            BOLRETVAL = True
          Else
            CREARARCHIVOSDECONFIGURACION = False
            Exit Function
          End If
        End If
        
        If BOLESPLANTILLAORIGINAL = True Then
          STRPAGINAQUEESREFERENCIA = RSTABLA.Fields("direcciondesdelaquesereferencia")
          If Mid(STRPAGINAQUEESREFERENCIA, Len(STRPAGINAQUEESREFERENCIA), 1) <> "/" Then
            STRPAGINAQUEESREFERENCIA = STRPAGINAQUEESREFERENCIA & "/"
          End If
          STRPAGINAQUEESREFERENCIA = STRPAGINAQUEESREFERENCIA & "buycart.htm"
          BYTRETVAL = JSVARCHIVO.SetJSVar("direcciondesdelaquesereferencia", "'" & STRPAGINAQUEESREFERENCIA & "'")
      
        Else
        
          BYTRETVAL = JSVARCHIVO.SetJSVar("direcciondesdelaquesereferencia", "'" & RSTABLA.Fields("direcciondesdelaquesereferencia") & "'")
        
        End If
        If BYTRETVAL <> 0 Then
      
          If MsgBox(VARLENGUAJE(290), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
            BOLRETVAL = True
          Else
            CREARARCHIVOSDECONFIGURACION = False
            Exit Function
          End If
        End If
  



'''''''''''''''''''''''''''''''''''''


      Loop
    End If
  
  
  
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("CONTENIDOSPAGINA", dbOpenTable)
  RSTABLA.Index = "archivolenguaje"
  For I = 1 To UBound(VARLISTALENGUAJES)
  
  
    RSTABLA.Seek "=", CStr(VARLISTALENGUAJES(I))
    If RSTABLA.NoMatch = False Then
      JSVARCHIVO.Archive = Mid(STRRUTACONFIG, 1, Len(STRRUTACONFIG) - 7) & "Languages\" & VARLISTALENGUAJES(I)
      BOLRETVAL = True
      Do While (BOLRETVAL = True)
        BOLRETVAL = False
        
        If isnull(RSTABLA.Fields("contenidopagprincipal")) = True Then
             
          BYTRETVAL = JSVARCHIVO.SetJSVar("contenidopagprincipal", "''")
        
        
        ElseIf Trim(RSTABLA.Fields("contenidopagprincipal")) = "" Then
          BYTRETVAL = JSVARCHIVO.SetJSVar("contenidopagprincipal", "''")
      
        Else
          BYTRETVAL = JSVARCHIVO.SetJSVar("contenidopagprincipal", "'" & ESCAPARCARACTERES(RSTABLA.Fields("contenidopagprincipal")) & "'")

        End If
        
        
        If BYTRETVAL <> 0 Then
      
          If MsgBox(VARLENGUAJE(290), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
            BOLRETVAL = True
          Else
            CREARARCHIVOSDECONFIGURACION = False
            Exit Function
          End If
      
        End If
      Loop
      
      BOLRETVAL = True
      Do While (BOLRETVAL = True)
        BOLRETVAL = False
        
        If isnull(RSTABLA.Fields("textodisclaimer")) = True Then
             
          BYTRETVAL = JSVARCHIVO.SetJSVar("textodisclaimer", "''")
        
        
        ElseIf Trim(RSTABLA.Fields("textodisclaimer")) = "" Then
          BYTRETVAL = JSVARCHIVO.SetJSVar("textodisclaimer", "''")
      
        Else
          BYTRETVAL = JSVARCHIVO.SetJSVar("textodisclaimer", "'" & ESCAPARCARACTERES2(RSTABLA.Fields("textodisclaimer")) & "'")

        End If
        
        
        If BYTRETVAL <> 0 Then
      
          If MsgBox(VARLENGUAJE(290), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
            BOLRETVAL = True
          Else
            CREARARCHIVOSDECONFIGURACION = False
            Exit Function
          End If
      
        End If
      
      Loop

      BOLRETVAL = True
      Do While (BOLRETVAL = True)
        BOLRETVAL = False
        
        If isnull(RSTABLA.Fields("textolicencia")) = True Then
             
          BYTRETVAL = JSVARCHIVO.SetJSVar("textolicencia", "''")
        
        
        ElseIf Trim(RSTABLA.Fields("textolicencia")) = "" Then
          BYTRETVAL = JSVARCHIVO.SetJSVar("textolicencia", "''")
      
        Else
          BYTRETVAL = JSVARCHIVO.SetJSVar("textolicencia", "'" & ESCAPARCARACTERES2(RSTABLA.Fields("textolicencia")) & "'")

        End If
        
        
        If BYTRETVAL <> 0 Then
      
          If MsgBox(VARLENGUAJE(290), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
            BOLRETVAL = True
          Else
            CREARARCHIVOSDECONFIGURACION = False
            Exit Function
          End If
      
        End If
      
      Loop
      
      
    End If
  Next I
  
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  
  
  Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("PRODUCTOS", dbOpenTable)
  HASIDPRODUCTO.HashArrayType = False
  INTCL = FreeFile
  I = 0
  Open STRRUTACONFIG & "product.js" For Output As INTCL
  
  Print #INTCL, "var product = new Array();"
  Do While (RSTABLA.EOF = False)
  
    Print #INTCL, "product[" & I & "] = new ProductRecord('" & ESCAPARCARACTERES(RSTABLA.Fields("nombreproducto")) & "','" & ESCAPARCARACTERES(RSTABLA.Fields("idproducto")) & "','" & ESCAPARCARACTERES(RSTABLA.Fields("categoria")) & "','" & ESCAPARCARACTERES(RSTABLA.Fields("subcategoria")) & "','" & ESCAPARCARACTERES2(RSTABLA.Fields("descripcion")) & "');"
  
    HASIDPRODUCTO.Add RSTABLA.Fields("idproducto"), "SI"
    RSTABLA.MoveNext
    I = I + 1
  Loop
  Close #INTCL
  
  
  
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  
  
  
  Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("MODELOS", dbOpenTable)
  INTCL = FreeFile
  Open STRRUTACONFIG & "models.js" For Output As INTCL
  I = 0
  Print #INTCL, "var models = new Array();"
  Do While (RSTABLA.EOF = False)
  
    Print #INTCL, "models[" & I & "] = new ModelRecord('" & ESCAPARCARACTERES(RSTABLA.Fields("idproducto")) & "','" & ESCAPARCARACTERES(RSTABLA.Fields("modelo")) & "'," & Replace(CStr(RSTABLA.Fields("precio1")), ",", ".") & "," & Replace(CStr(RSTABLA.Fields("precio2")), ",", ".") & "," & RSTABLA.Fields("descuento") & "," & RSTABLA.Fields("impuesto") & ");"
    I = I + 1
    RSTABLA.MoveNext
  Loop
  Close #INTCL
  
  
  
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  

  VARIDPRODUCTO = HASIDPRODUCTO.Keys
  INTCL = FreeFile
  Open STRRUTACONFIG & "imagesdb.js" For Output As INTCL
    Print #INTCL, "var imagesdb = new ImageRecord();"
    For I = 1 To UBound(VARIDPRODUCTO)
      Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
      Set RSTABLA = DBREGISTRO.OpenRecordset("SELECT *  FROM IMAGENES WHERE idproducto='" & Replace(CStr(VARIDPRODUCTO(I)), "'", ",,") & "'", dbOpenDynaset)
      If RSTABLA.RecordCount <= 0 Then
      
        Print #INTCL, "imagesdb[" & (I - 1) & "] = null;"
      
      Else
        Print #INTCL, "imagesdb[" & (I - 1) & "] = new ImageRecord('" & ESCAPARCARACTERES(RSTABLA.Fields("nombreimagen")) & "','" & ESCAPARCARACTERES(RSTABLA.Fields("imagenid")) & "','" & ESCAPARCARACTERES(RSTABLA.Fields("archivo")) & "','" & ESCAPARCARACTERES(RSTABLA.Fields("copyright")) & "','" & ESCAPARCARACTERES(RSTABLA.Fields("alternativetext")) & "','" & ESCAPARCARACTERES(RSTABLA.Fields("description")) & "');"

      
      End If
    
      RSTABLA.Close
      DBREGISTRO.Close
      Set RSTABLA = Nothing
      Set DBREGISTRO = Nothing
    Next I
  Close #INTCL
  CREARARCHIVOSDECONFIGURACION = True
  Exit Function
CAMPO:
 If Err.Number = 3260 Or Err.Number = 3050 Then
    Resume
    Exit Function
  End If
  If MsgBox(VARLENGUAJE(290), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
  On Error Resume Next
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  CREARARCHIVOSDECONFIGURACION = False
End Function
Function ESCAPARCARACTERES(ByVal STRCADENAAESCAPAR As String) As String
  Dim STRCADENAESCAPADA As String
  
  If STRCADENAAESCAPAR = "" Then
    ESCAPARCARACTERES = STRCADENAAESCAPAR
    Exit Function
  End If
  STRCADENAESCAPADA = Replace(STRCADENAAESCAPAR, "\\", "\\")
  STRCADENAESCAPADA = Replace(STRCADENAESCAPADA, Chr(34), "\" & Chr(34))
  STRCADENAESCAPADA = Replace(STRCADENAESCAPADA, "'", "\'")
  STRCADENAESCAPADA = Replace(STRCADENAESCAPADA, Chr(0), "\0")
  STRCADENAESCAPADA = Replace(STRCADENAESCAPADA, Chr(9), "\t")
  STRCADENAESCAPADA = Replace(STRCADENAESCAPADA, Chr(13) & Chr(10), "\r\n")
  STRCADENAESCAPADA = Replace(STRCADENAESCAPADA, Chr(13), "\n")
  STRCADENAESCAPADA = Replace(STRCADENAESCAPADA, Chr(10), "\r")
  ESCAPARCARACTERES = STRCADENAESCAPADA
End Function
Function ESCAPARCARACTERES2(ByVal STRCADENAAESCAPAR As String) As String
  Dim STRCADENAESCAPADA As String
  
  If STRCADENAAESCAPAR = "" Then
    ESCAPARCARACTERES2 = STRCADENAAESCAPAR
    Exit Function
  End If
  STRCADENAESCAPADA = Replace(STRCADENAAESCAPAR, "\\", "\\")
  STRCADENAESCAPADA = Replace(STRCADENAESCAPADA, Chr(34), "\" & Chr(34))
  STRCADENAESCAPADA = Replace(STRCADENAESCAPADA, "'", "\'")
  STRCADENAESCAPADA = Replace(STRCADENAESCAPADA, Chr(0), "\0")
  STRCADENAESCAPADA = Replace(STRCADENAESCAPADA, Chr(9), "\t")
  STRCADENAESCAPADA = Replace(STRCADENAESCAPADA, Chr(13) & Chr(10), "<BR>")
  STRCADENAESCAPADA = Replace(STRCADENAESCAPADA, Chr(13), "<BR>")
  STRCADENAESCAPADA = Replace(STRCADENAESCAPADA, Chr(10), "<BR>")
  ESCAPARCARACTERES2 = STRCADENAESCAPADA
End Function
Sub PREVISUALIZARPROYECTO()
  On Error GoTo CAMPO
  Dim FSOARCHIVO As New Scripting.FileSystemObject
  Dim VBSUUTILIDADES As New VBSUtilidades.VBSUtils
  Dim STRTEXTOARCHIVO As String
  Dim STRLINEA As String
  Dim INTCL As Integer
  Dim I As Integer
    
 

  
  
  If ExistsFile(STRRUTA & "TINYWEBSERVER\NUL") = False Or ExistsFile(STRRUTA & "TINYWEBSERVER\TINY.EXE") = False Then
  
    MsgBox VARLENGUAJE(4), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  
  If Trim(VBSUUTILIDADES.EjecutableAsociado(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\index.htm")) = "" Then
  
    MsgBox VARLENGUAJE(293), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  
  End If
  
  
   If MsgBox(VARLENGUAJE(275), vbInformation + vbYesNo, NOMBRE_DEL_PROGRAMA) = vbNo Then
    Exit Sub
  
  End If

  If SALVARPROYECTO() = False Then
  
    Exit Sub
  
  End If
  If VERIFICARTODOSLOSDATOS() = False Then
  
    Exit Sub
  
  End If
  
  
  If FSOARCHIVO.FolderExists(STRRUTA & "TINYWEBSERVER\RAIZ") = True Then
  
    FSOARCHIVO.DeleteFolder STRRUTA & "TINYWEBSERVER\RAIZ", True
  
  End If
  FSOARCHIVO.CreateFolder STRRUTA & "TINYWEBSERVER\RAIZ"
  
  FSOARCHIVO.CopyFolder STRRUTA & "Proyectos\" & STRNOMBREPROYECTO, STRRUTA & "TINYWEBSERVER\RAIZ\", True

  If FSOARCHIVO.FileExists(STRRUTA & "TINYWEBSERVER\RAIZ\" & STRNOMBREPROYECTO & "\configshop.edb") = True Then
    FSOARCHIVO.DeleteFile STRRUTA & "TINYWEBSERVER\RAIZ\" & STRNOMBREPROYECTO & "\configshop.edb", True
  End If
  
  
  If CREARARCHIVOSDECONFIGURACION(STRRUTA & "TINYWEBSERVER\RAIZ\" & STRNOMBREPROYECTO & "\Config\") = False Then
       
    Exit Sub
  
  End If
  
  INTCL = FreeFile
  Open STRRUTA & "TINYWEBSERVER\RAIZ\" & STRNOMBREPROYECTO & "\buycart.htm" For Input As INTCL
  Do While EOF(INTCL) = False
  
    Line Input #INTCL, STRLINEA
    STRTEXTOARCHIVO = STRTEXTOARCHIVO & STRLINEA & Chr(13) & Chr(10)
  Loop
  Close #INTCL
  STRTEXTOARCHIVO = Replace(STRTEXTOARCHIVO, "if (enviarmensajecorreo(mensaje)!=0) {", "if (2!=2){")
  STRTEXTOARCHIVO = Replace(STRTEXTOARCHIVO, "document.write(" & Chr(34) & "<OBJECT", "//")
  STRTEXTOARCHIVO = Replace(STRTEXTOARCHIVO, "document.write(" & Chr(34) & "<PARAM", "//")
  STRTEXTOARCHIVO = Replace(STRTEXTOARCHIVO, "document.write(" & Chr(34) & "</OBJECT", "//")
  

  
  INTCL = FreeFile
  Open STRRUTA & "TINYWEBSERVER\RAIZ\" & STRNOMBREPROYECTO & "\buycart.htm" For Output As INTCL
  Print #INTCL, STRTEXTOARCHIVO
  Close #INTCL
  
  INTCL = FreeFile
  Open STRRUTA & "TINYWEBSERVER\RAIZ\" & STRNOMBREPROYECTO & "\index.html" For Output As INTCL
  Print #INTCL, "VISTA PREVIA DE MARROK SHOPING CART"
  Close #INTCL
  TWSHSERVIDOR.ServerPath = STRRUTA & "TINYWEBSERVER"
  TWSHSERVIDOR.RootDirectoryPath = STRRUTA & "TINYWEBSERVER\RAIZ\" & STRNOMBREPROYECTO
  If Trim(TWSHSERVIDOR.BindIP) = "" Then
    Load FRMCONFIGURARSERVIDOR
    FRMCONFIGURARSERVIDOR.Show (1)
  End If
  If SNGVERSIONPLANTILLA = 0.91 And BOLESPLANTILLAORIGINAL = True Then
    AJUSTARARCHIVOSPREVISUALIZACION (STRRUTA & "TINYWEBSERVER\RAIZ\" & STRNOMBREPROYECTO)
  End If
  If Trim(TWSHSERVIDOR.BindIP) <> "" Then

    If ACTIVARNAVEGADORWEB() = False Then
      Exit Sub
    End If
  End If
  On Error Resume Next
  
  If FSOARCHIVO.FolderExists(STRRUTA & "TINYWEBSERVER\RAIZ\" & STRNOMBREPROYECTO) = True Then
  
    FSOARCHIVO.DeleteFolder STRRUTA & "TINYWEBSERVER\RAIZ\" & STRNOMBREPROYECTO, True
  
  End If
  
  Exit Sub
CAMPO:
  If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
End Sub
Function ACTIVARSERVIDORWEB() As Boolean
  On Error Resume Next
  Dim BOLRETVAL As Boolean
  
  BOLRETVAL = True
  
  Do While (BOLRETVAL = True)
    BOLRETVAL = False
    TWSHSERVIDOR.BindIP = FRMCONFIGURARSERVIDOR.TXTIP.Text
    TWSHSERVIDOR.Port = CLng(FRMCONFIGURARSERVIDOR.TXTPUERTO.Text)
    TWSHSERVIDOR.Terminate
    TWSHSERVIDOR.Start
    If Err.Number <> 0 Then
      Err.Clear
      If MsgBox(VARLENGUAJE(299), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
        BOLRETVAL = True
      Else
        ACTIVARSERVIDORWEB = False
        Exit Function
      End If
    End If
    
  Loop
  ACTIVARSERVIDORWEB = True
 End Function
Function ACTIVARNAVEGADORWEB() As Boolean
  On Error GoTo CAMPO
  Dim VBSUUTILIDADES As New VBSUtilidades.VBSUtils
  Dim BOLRETVAL As Boolean
  If Trim(VBSUUTILIDADES.EjecutableAsociado(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\index.htm")) = "" Then
  
    MsgBox VARLENGUAJE(293), vbExclamation, NOMBRE_DEL_PROGRAMA
    ACTIVARNAVEGADORWEB = False
    Exit Function
  
  End If
  BOLRETVAL = False
  Do While (BOLRETVAL = False)
    BOLRETVAL = VBSUUTILIDADES.ShellSinc(VBSUUTILIDADES.EjecutableAsociado(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\index.htm") & " http://" & TWSHSERVIDOR.BindIP & ":" & TWSHSERVIDOR.Port & "/index.htm")
    If BOLRETVAL = False Then
      If MsgBox(VARLENGUAJE(300), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
        ACTIVARNAVEGADORWEB = False
        Exit Function
      End If
    End If
  Loop
  ACTIVARNAVEGADORWEB = True
  Exit Function
CAMPO:
  If MsgBox(VARLENGUAJE(300), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
  ACTIVARNAVEGADORWEB = False
End Function

Function VERIFICARPLANTILLA2(ByVal STRRUTAPLANTILLA) As Boolean
  Dim JSVLENGUAJE As New JSVarArchives
  Dim VPJSDDATOS As New ValidateJSDatas
  Dim VARPARTESRUTA As Variant
    Dim VARRETVAL As Variant
  Dim I As Byte
  Dim Z As Byte
  If Mid(STRRUTAPLANTILLA, Len(STRRUTAPLANTILLA), 1) <> "\" Then
    STRRUTAPLANTILLA = STRRUTAPLANTILLA & "\"
  End If
  If ExistsFile(STRRUTAPLANTILLA & "configshop.edb") = False Then
    VERIFICARPLANTILLA2 = False
    Exit Function
  End If
  If CARGARVERSIONPLANTILLA(STRRUTAPLANTILLA & "configshop.edb") = False Then
  
    VERIFICARPLANTILLA2 = False
    Exit Function
  
  End If
  
  If SNGVERSIONPLANTILLA = 0.91 Then
    Dim STRLISTAARCHIVOS(12) As String
    STRLISTAARCHIVOS(0) = STRRUTAPLANTILLA & "NUL"
    STRLISTAARCHIVOS(1) = STRRUTAPLANTILLA & "index.htm"
    STRLISTAARCHIVOS(2) = STRRUTAPLANTILLA & "Config\NUL"
    STRLISTAARCHIVOS(3) = STRRUTAPLANTILLA & "Config\config.js"
    STRLISTAARCHIVOS(4) = STRRUTAPLANTILLA & "Config\imagesdb.js"
    STRLISTAARCHIVOS(5) = STRRUTAPLANTILLA & "Config\models.js"
    STRLISTAARCHIVOS(6) = STRRUTAPLANTILLA & "Config\product.js"
    STRLISTAARCHIVOS(7) = STRRUTAPLANTILLA & "Images\NUL"
    STRLISTAARCHIVOS(8) = STRRUTAPLANTILLA & "cgi-bin\NUL"
    STRLISTAARCHIVOS(9) = STRRUTAPLANTILLA & "cgi-bin\configserv.pl"
    STRLISTAARCHIVOS(10) = STRRUTAPLANTILLA & "Languages\NUL"
    STRLISTAARCHIVOS(11) = STRRUTAPLANTILLA & "Languages\Espanol.lng"
    STRLISTAARCHIVOS(12) = STRRUTAPLANTILLA & "Languages\English.lng"
  End If
  For I = 0 To UBound(STRLISTAARCHIVOS)
    If ExistsFile(STRLISTAARCHIVOS(I)) = False Then
      VERIFICARPLANTILLA2 = False
      Exit Function
    End If
  Next I
  
  VARPARTESRUTA = Split(Mid(STRRUTAPLANTILLA, 1, Len(STRRUTAPLANTILLA) - 1), "\")
  If UCase(VARPARTESRUTA(UBound(VARPARTESRUTA))) = "PLANTILLA2" And VERIFICARSIESPLANTILLAORIGINAL(0.91, STRRUTAPLANTILLA) = False Then
    VERIFICARPLANTILLA2 = False
    Exit Function
  End If
  For I = UBound(STRLISTAARCHIVOS) - 1 To UBound(STRLISTAARCHIVOS)
  
    JSVLENGUAJE.Archive = STRLISTAARCHIVOS(I)
    Do
      For Z = 1 To 96
        VARRETVAL = JSVLENGUAJE.GetJSVar("texto" & Z, True)
        If VARRETVAL(1) = 3 Then
          If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
            VERIFICARPLANTILLA2 = False
            Exit Function
          End If
        ElseIf VARRETVAL(1) <> 0 Then
          VERIFICARPLANTILLA2 = False
          Exit Function
        ElseIf VPJSDDATOS.typedata(VARRETVAL(0)) <> 5 Or Trim(Mid(VARRETVAL(0), 2, Len(VARRETVAL(0)) - 2)) = "" Then
          VERIFICARPLANTILLA2 = False
          Exit Function
        End If
      Next Z
    Loop While (VARRETVAL(1) = 3)
    Do
      VARRETVAL = JSVLENGUAJE.GetJSVar("contenidopagprincipal", True)
      If VARRETVAL(1) = 3 Then
        If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
          VERIFICARPLANTILLA2 = False
          Exit Function
        End If
      ElseIf VARRETVAL(1) <> 0 Then
        VERIFICARPLANTILLA2 = False
        Exit Function
      ElseIf VPJSDDATOS.typedata(VARRETVAL(0)) <> 5 Or Trim(Mid(VARRETVAL(0), 2, Len(VARRETVAL(0)) - 2)) <> "" Then
        VERIFICARPLANTILLA2 = False
        Exit Function
      End If
    Loop While (VARRETVAL(1) = 3)
    
    Do
      VARRETVAL = JSVLENGUAJE.GetJSVar("textodisclaimer", True)
      If VARRETVAL(1) = 3 Then
        If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
          VERIFICARPLANTILLA2 = False
          Exit Function
        End If
      ElseIf VARRETVAL(1) <> 0 Then
        VERIFICARPLANTILLA2 = False
        Exit Function
      ElseIf VPJSDDATOS.typedata(VARRETVAL(0)) <> 5 Or Trim(Mid(VARRETVAL(0), 2, Len(VARRETVAL(0)) - 2)) <> "" Then
        VERIFICARPLANTILLA2 = False
        Exit Function
      End If
    Loop While (VARRETVAL(1) = 3)
    Do
      VARRETVAL = JSVLENGUAJE.GetJSVar("textolicencia", True)
      If VARRETVAL(1) = 3 Then
        If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
          VERIFICARPLANTILLA2 = False
          Exit Function
        End If
      ElseIf VARRETVAL(1) <> 0 Then
        VERIFICARPLANTILLA2 = False
        Exit Function
      ElseIf VPJSDDATOS.typedata(VARRETVAL(0)) <> 5 Or Trim(Mid(VARRETVAL(0), 2, Len(VARRETVAL(0)) - 2)) <> "" Then
        VERIFICARPLANTILLA2 = False
        Exit Function
      End If
    Loop While (VARRETVAL(1) = 3)
   
  Next I
  VERIFICARPLANTILLA2 = True

End Function

Function CARGARVERSIONPLANTILLA(RUTAARCHIVOBD) As Boolean
  On Error GoTo CAMPO
  Dim DBREGISTRO As Database
  Dim RSTABLA As Recordset
  SNGVERSIONPLANTILLA = 0.9
  
  Set DBREGISTRO = OpenDatabase(RUTAARCHIVOBD, False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("CONFIGURACION", dbOpenTable)
  On Error Resume Next
  SNGVERSIONPLANTILLA = RSTABLA.Fields("versionplantilla")
  If Err.Number <> 0 Then
    RSTABLA.Close
    DBREGISTRO.Close
    Set RSTABLA = Nothing
    Set DBREGISTRO = Nothing
    Err.Clear
    On Error GoTo CAMPO
    SNGVERSIONPLANTILLA = 0.9
    CARGARVERSIONPLANTILLA = False
    Exit Function
  End If
  
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  CARGARVERSIONPLANTILLA = True
  Exit Function
CAMPO:
  If Err.Number = 3260 Or Err.Number = 3050 Then
    Resume
    Exit Function
  End If
  On Error Resume Next
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  CARGARVERSIONPLANTILLA = False

End Function

Private Function VERIFICARSIESPLANTILLAORIGINAL(ByVal SNGVERSIONPLANTILLA As Single, ByVal STRRUTAPLANTILLA As String) As Boolean

  
  Dim VARRETVAL As Variant
  Dim I As Byte

  If SNGVERSIONPLANTILLA = 0.9 Then
    VERIFICARSIESPLANTILLAORIGINAL = True
    Exit Function
  End If
  
  If Mid(STRRUTAPLANTILLA, Len(STRRUTAPLANTILLA) - 1, 1) <> "\" Then
    STRRUTAPLANTILLA = STRRUTAPLANTILLA & "\"
  End If
  
  If SNGVERSIONPLANTILLA = 0.91 Then
  
    Dim STRLISTAARCHIVOS(36) As String
  
    STRLISTAARCHIVOS(0) = STRRUTAPLANTILLA & "\configshop.edb"
    STRLISTAARCHIVOS(1) = STRRUTAPLANTILLA & "\NUL"
    STRLISTAARCHIVOS(2) = STRRUTAPLANTILLA & "\index.htm"
    STRLISTAARCHIVOS(3) = STRRUTAPLANTILLA & "\buycart.htm"
    STRLISTAARCHIVOS(4) = STRRUTAPLANTILLA & "\addtocart.htm"
    STRLISTAARCHIVOS(5) = STRRUTAPLANTILLA & "\categories.htm"
    STRLISTAARCHIVOS(6) = STRRUTAPLANTILLA & "\cesta.gif"
    STRLISTAARCHIVOS(7) = STRRUTAPLANTILLA & "\chooselanguage.htm"
    STRLISTAARCHIVOS(8) = STRRUTAPLANTILLA & "\control.htm"
    STRLISTAARCHIVOS(9) = STRRUTAPLANTILLA & "\control2.htm"
    STRLISTAARCHIVOS(10) = STRRUTAPLANTILLA & "\disclaimer.htm"
    STRLISTAARCHIVOS(11) = STRRUTAPLANTILLA & "\license.htm"
    STRLISTAARCHIVOS(12) = STRRUTAPLANTILLA & "\nocapacidad.htm"
    STRLISTAARCHIVOS(13) = STRRUTAPLANTILLA & "\paypal.gif"
    STRLISTAARCHIVOS(14) = STRRUTAPLANTILLA & "\products.htm"
    STRLISTAARCHIVOS(15) = STRRUTAPLANTILLA & "\search.htm"
    STRLISTAARCHIVOS(16) = STRRUTAPLANTILLA & "\viewchangeorder.htm"
    STRLISTAARCHIVOS(17) = STRRUTAPLANTILLA & "\JSLibs\NUL"
    STRLISTAARCHIVOS(18) = STRRUTAPLANTILLA & "\JSLibs\cadenas.js"
    STRLISTAARCHIVOS(19) = STRRUTAPLANTILLA & "\JSLibs\constantes.js"
    STRLISTAARCHIVOS(20) = STRRUTAPLANTILLA & "\JSLibs\cookies.js"
    STRLISTAARCHIVOS(21) = STRRUTAPLANTILLA & "\JSLibs\Crypandcodificationfunctions.js"
    STRLISTAARCHIVOS(22) = STRRUTAPLANTILLA & "\JSLibs\GenericPaypalShopingCartButton.js"
    STRLISTAARCHIVOS(23) = STRRUTAPLANTILLA & "\JSLibs\HashArray.js"
    STRLISTAARCHIVOS(24) = STRRUTAPLANTILLA & "\JSLibs\LayerCreator.js"
    STRLISTAARCHIVOS(25) = STRRUTAPLANTILLA & "\JSLibs\LayerHandle.js"
    STRLISTAARCHIVOS(26) = STRRUTAPLANTILLA & "\JSLibs\MakeArray.js"
    STRLISTAARCHIVOS(27) = STRRUTAPLANTILLA & "\JSLibs\md5.js"
    STRLISTAARCHIVOS(28) = STRRUTAPLANTILLA & "\JSLibs\MiscShop.js"
    STRLISTAARCHIVOS(29) = STRRUTAPLANTILLA & "\JSLibs\QueryStringHandle.js"
    STRLISTAARCHIVOS(30) = STRRUTAPLANTILLA & "\JSLibs\sha1.js"
    STRLISTAARCHIVOS(31) = STRRUTAPLANTILLA & "\JSLibs\SplitURL.js"
    STRLISTAARCHIVOS(32) = STRRUTAPLANTILLA & "\JSlibs\ValidateURLS.js"
    STRLISTAARCHIVOS(33) = STRRUTAPLANTILLA & "\cgi-bin\final.pl"
    STRLISTAARCHIVOS(34) = STRRUTAPLANTILLA & "\cgi-bin\MiscShop.pm"
    STRLISTAARCHIVOS(35) = STRRUTAPLANTILLA & "\cgi-bin\final.htm"
    STRLISTAARCHIVOS(36) = STRRUTAPLANTILLA & "\cgi-bin\final2.htm"
    
  End If

  For I = 0 To UBound(STRLISTAARCHIVOS)
    If ExistsFile(STRLISTAARCHIVOS(I)) = False Then
      VERIFICARSIESPLANTILLAORIGINAL = False
      Exit Function
    End If
  Next I
  VERIFICARSIESPLANTILLAORIGINAL = True
End Function
Private Sub AJUSTARARCHIVOSPREVISUALIZACION(ByVal STRRUTAPROYECTO As String)
  Dim STRLINEA As String
  Dim STRTEXTOARCHIVO As String
  Dim INTCL As Integer
  
  If Mid(STRRUTAPROYECTO, Len(STRRUTAPROYECTO), 1) <> "\" Then
  
    STRRUTAPROYECTO = STRRUTAPROYECTO & "\"
  
  End If
  
  STRTEXTOARCHIVO = ""
  INTCL = FreeFile

  Open STRRUTAPROYECTO & "Config\config.js" For Input As INTCL
  Do While EOF(INTCL) = False
  
    Line Input #INTCL, STRLINEA
    STRTEXTOARCHIVO = STRTEXTOARCHIVO & STRLINEA & Chr(13) & Chr(10)
  Loop
  Close #INTCL
  
  STRTEXTOARCHIVO = Replace(STRTEXTOARCHIVO, "enviarpedidoviahttps = true", "enviarpedidoviahttps = false")
  

  
  INTCL = FreeFile
  Open STRRUTAPROYECTO & "Config\config.js" For Output As INTCL
  Print #INTCL, STRTEXTOARCHIVO
  Close #INTCL
  
  
  
  STRTEXTOARCHIVO = ""
  INTCL = FreeFile

  Open STRRUTAPROYECTO & "cgi-bin\configserv.pl" For Input As INTCL
  Do While EOF(INTCL) = False
  
    Line Input #INTCL, STRLINEA
    If InStr(1, Trim(STRLINEA), "var direcciondesdelaquesereferencia", vbTextCompare) = 1 Then
    
      STRLINEA = "var direcciondesdelaquesereferencia = http://" & TWSHSERVIDOR.BindIP
      If TWSHSERVIDOR.Port <> 80 Then
      
      STRLINEA = STRLINEA & ":" & TWSHSERVIDOR.Port
      
      End If
      STRLINEA = STRLINEA & "/buycart.htm"
    End If
    STRTEXTOARCHIVO = STRTEXTOARCHIVO & STRLINEA & Chr(13) & Chr(10)
  Loop
  Close #INTCL
  
  INTCL = FreeFile
  Open STRRUTAPROYECTO & "cgi-bin\configserv.pl" For Output As INTCL
  Print #INTCL, STRTEXTOARCHIVO
  Close #INTCL
  End Sub
