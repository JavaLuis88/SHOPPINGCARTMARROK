VERSION 5.00
Begin VB.Form FRMREGMARROK 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Registrar el programa"
   ClientHeight    =   1740
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4680
   Icon            =   "FRMREGMARROK.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1740
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton CMDCERRAR 
      Cancel          =   -1  'True
      Height          =   405
      Left            =   2340
      TabIndex        =   6
      Top             =   1200
      Width           =   1245
   End
   Begin VB.CommandButton CMDACEPTAR 
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   405
      Left            =   930
      TabIndex        =   5
      Top             =   1200
      Width           =   1335
   End
   Begin VB.TextBox TXTCONTRA 
      Height          =   315
      Left            =   1950
      TabIndex        =   3
      Top             =   750
      Width           =   2655
   End
   Begin VB.TextBox TXTLICENCIA 
      Height          =   315
      Left            =   1950
      TabIndex        =   2
      Top             =   210
      Width           =   2655
   End
   Begin VB.FileListBox FLBLENGUAJE 
      Height          =   480
      Left            =   3720
      TabIndex        =   0
      Top             =   2910
      Visible         =   0   'False
      Width           =   1245
   End
   Begin VB.Label LBLDESCRIPCION2 
      Alignment       =   1  'Right Justify
      Height          =   255
      Left            =   30
      TabIndex        =   4
      Top             =   780
      UseMnemonic     =   0   'False
      Width           =   1845
   End
   Begin VB.Label LBLDESCRIPCION 
      Alignment       =   1  'Right Justify
      Height          =   255
      Left            =   30
      TabIndex        =   1
      Top             =   240
      UseMnemonic     =   0   'False
      Width           =   1845
   End
End
Attribute VB_Name = "FRMREGMARROK"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Function ESTAREGISTRADO(ByVal STRLOGIN As String, ByVal STRPASSWORD As String) As Boolean

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
Private Function DESCODIFICARYDESENCRIPTARDATOS(ByVal STRTEXTO As String, ByVal STRCLAVE As String) As String
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

Private Sub TRADUCIRINTERFAZ()
  LBLDESCRIPCION.Caption = VARLENGUAJE(303)
  LBLDESCRIPCION2.Caption = VARLENGUAJE(313)
  CMDACEPTAR.Caption = VARLENGUAJE(2)
  CMDCERRAR.Caption = VARLENGUAJE(3)
  
End Sub

Private Sub CMDACEPTAR_Click()
  On Error GoTo CAMPO
  Dim DBREGISTRO As Database
  Dim RSTABLA As Recordset
  Dim STRBASEDATOS As String
  
  If ESTAREGISTRADO(TXTLICENCIA.Text, TXTCONTRA.Text) = False Then
    MsgBox VARLENGUAJE(314), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  
  STRBASEDATOS = SystemDirectory() & "WCR32.DLL"
  If ExistsFile(STRBASEDATOS) = False Then
    MsgBox VARLENGUAJE(315), vbCritical, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  
  Set DBREGISTRO = OpenDatabase(STRBASEDATOS, False, False, "; user=admin;pwd=natmasvat")
  Set RSTABLA = DBREGISTRO.OpenRecordset("WCPRODUCTS", dbOpenTable)
  RSTABLA.Index = "IDPRODUCTO"
  RSTABLA.Seek "=", "MSC0.9"
  If RSTABLA.NoMatch = True Then
    RSTABLA.AddNew
    RSTABLA.Fields("IDPRODUCT") = "MSC0.9"
    RSTABLA.Fields("LOGIN") = TXTLICENCIA.Text
    RSTABLA.Fields("PASSWORD") = TXTCONTRA.Text
    RSTABLA.Update
  Else
    RSTABLA.Edit
    RSTABLA.Fields("LOGIN") = TXTLICENCIA.Text
    RSTABLA.Fields("PASSWORD") = TXTCONTRA.Text
    RSTABLA.Update
  End If
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  MsgBox VARLENGUAJE(316), vbInformation, NOMBRE_DEL_PROGRAMA
  End
Exit Sub
  
  Exit Sub
CAMPO:
If Err.Number = 3260 Or Err.Number = 3050 Then
  Resume
  Exit Sub
End If
On Error Resume Next
RSTABLA.Close
DBREGISTRO.Close
Set RSTABLA = Nothing
Set DBREGISTRO = Nothing
MsgBox VARLENGUAJE(315), vbCritical, NOMBRE_DEL_PROGRAMA

End Sub

Private Sub CMDCERRAR_Click()
  End
End Sub

Private Sub Form_Load()
  
  On Error Resume Next
  Dim BYTRETVAL As Byte
  Dim STRVALOR As String
  Dim INICONFIGURACION As New INIFILES
  Dim DBREGISTRO As Database
  Dim RSTABLA As Recordset
  Dim STRBASEDATOS As String
  Dim I As Integer
  
  If Screen.Width / Screen.TwipsPerPixelX < 1024 Or Screen.Height / Screen.TwipsPerPixelY < 768 Then
    MsgBox MSGERRORES(6), vbCritical, NOMBRE_DEL_PROGRAMA
    Unload Me
    Exit Sub
  End If
  BYTRETVAL = ESWINDOWSNT()
  If BYTRETVAL = 0 Then
    MsgBox MSGERRORES(0), vbCritical, NOMBRE_DEL_PROGRAMA
    Unload Me
    Exit Sub
  ElseIf BYTRETVAL = 1 Then
    MsgBox MSGERRORES(1), vbCritical, NOMBRE_DEL_PROGRAMA
    Unload Me
    Exit Sub
  End If
  If App.PrevInstance = True Then
    
    If ACTIVARYRESTAURARINSTANCIAPREVIA(Me) = False Then
      MsgBox MSGERRORES(2), vbCritical, NOMBRE_DEL_PROGRAMA
    End If
    Unload Me
    Exit Sub
  End If
  STRRUTA = App.Path
  If Mid(STRRUTA, Len(STRRUTA), 1) <> "\" Then
    STRRUTA = STRRUTA & "\"
  End If
  
  If ExistsFile(STRRUTA & "config.ini") = False Or ExistsFile(STRRUTA & "LENGUAJE\NUL") = False Then
    MsgBox MSGERRORES(3), vbCritical, NOMBRE_DEL_PROGRAMA
    Unload Me
    Exit Sub
  End If
  INICONFIGURACION.File = STRRUTA & "\config.ini"
  INICONFIGURACION.Section = NOMBRE_DEL_PROGRAMA
  STRVALOR = INICONFIGURACION.GetValue("Lenguaje")
  If INICONFIGURACION.ErrorNumber = 0 Or Trim(STRVALOR) = "" Then
    MsgBox MSGERRORES(4), vbCritical, NOMBRE_DEL_PROGRAMA
    Unload Me
    Exit Sub
  End If
  FLBLENGUAJE.Path = STRRUTA & "LENGUAJE"
  If CARGARLENGUAJE(STRVALOR, FLBLENGUAJE) = False Then
    MsgBox MSGERRORES(5), vbCritical, NOMBRE_DEL_PROGRAMA
    Unload Me
    Exit Sub
  End If
  
  
  Me.Top = CInt(Screen.Height / 2) - CInt(Me.Height / 2)
  Me.Left = CInt(Screen.Width / 2) - CInt(Me.Width / 2)


  TRADUCIRINTERFAZ
  STRBASEDATOS = SystemDirectory() & "WCR32.DLL"
  If ExistsFile(STRBASEDATOS) = False And ExistsFile(SystemDirectory() & "TWSCK.DLL") = True Then
  
    FileCopy SystemDirectory() & "TWSCK.DLL", STRBASEDATOS
  
  End If
  On Error GoTo CAMPO
  If ExistsFile(STRBASEDATOS) = False Then
    Exit Sub
  End If
  Set DBREGISTRO = OpenDatabase(STRBASEDATOS, False, False, "; user=admin;pwd=natmasvat")
  Set RSTABLA = DBREGISTRO.OpenRecordset("WCPRODUCTS", dbOpenTable)
  RSTABLA.Index = "IDPRODUCTO"
  RSTABLA.Seek "=", "MSC0.9"
  If RSTABLA.NoMatch = False Then
  
    If ESTAREGISTRADO(RSTABLA.Fields("LOGIN"), RSTABLA.Fields("PASSWORD")) = True Then
      End
    End If
  End If
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
Exit Sub
CAMPO:
If Err.Number = 3260 Or Err.Number = 3050 Then
  Resume
  Exit Sub
End If
On Error Resume Next
RSTABLA.Close
DBREGISTRO.Close
Set RSTABLA = Nothing
Set DBREGISTRO = Nothing
End Sub


Private Sub TXTCONTRA_Change()
  If TXTLICENCIA.Text <> "" And TXTCONTRA.Text <> "" Then
  
    CMDACEPTAR.Enabled = True
  
  Else
  
    CMDACEPTAR.Enabled = False
  
  End If
End Sub

Private Sub TXTLICENCIA_Change()
  If TXTLICENCIA.Text <> "" And TXTCONTRA.Text <> "" Then
  
    CMDACEPTAR.Enabled = True
  
  Else
  
    CMDACEPTAR.Enabled = False
  
  End If
End Sub
