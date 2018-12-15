VERSION 5.00
Begin VB.Form FRMKEYGEN 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Keygen de Marrok Shping Cart"
   ClientHeight    =   2235
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4680
   Icon            =   "FRMKEYGEN.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2235
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton CMDCERRAR 
      Cancel          =   -1  'True
      Caption         =   "Cerrar"
      Height          =   375
      Left            =   2280
      TabIndex        =   7
      Top             =   1650
      Width           =   1245
   End
   Begin VB.CommandButton CMDGENERAR 
      Caption         =   "Generar"
      Default         =   -1  'True
      Height          =   375
      Left            =   990
      TabIndex        =   6
      Top             =   1650
      Width           =   1245
   End
   Begin VB.TextBox TXTCONTRA 
      Height          =   315
      Left            =   1770
      Locked          =   -1  'True
      TabIndex        =   5
      Top             =   1170
      Width           =   2775
   End
   Begin VB.TextBox TXTLICENCIA2 
      Height          =   315
      Left            =   1770
      Locked          =   -1  'True
      TabIndex        =   3
      Top             =   720
      Width           =   2775
   End
   Begin VB.TextBox TXTLICENCIA 
      Height          =   315
      Left            =   1770
      TabIndex        =   1
      Top             =   270
      Width           =   2775
   End
   Begin VB.Label LBLDESCRIPCION3 
      Alignment       =   1  'Right Justify
      Caption         =   "Contraseña encriptada:"
      Height          =   255
      Left            =   0
      TabIndex        =   4
      Top             =   1200
      UseMnemonic     =   0   'False
      Width           =   1725
   End
   Begin VB.Label LBLDESCRIPCION2 
      Alignment       =   1  'Right Justify
      Caption         =   "Licencia encriptada:"
      Height          =   255
      Left            =   0
      TabIndex        =   2
      Top             =   750
      UseMnemonic     =   0   'False
      Width           =   1695
   End
   Begin VB.Label LBLDESCRIPCION 
      Alignment       =   1  'Right Justify
      Caption         =   "Licencia:"
      Height          =   255
      Left            =   0
      TabIndex        =   0
      Top             =   330
      UseMnemonic     =   0   'False
      Width           =   1695
   End
End
Attribute VB_Name = "FRMKEYGEN"
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

Private Function ENCRIPTARYCODIFICARDATOS(ByVal STRTEXTO As String, ByVal STRCLAVE As String) As String
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

Private Sub CMDCERRAR_Click()
  End
End Sub

Private Sub CMDGENERAR_Click()
  Dim STRLICENCIAENCRIPTADA As String
  Dim STRCONTRAENCRIPTADA As String
  
  STRLICENCIAENCRIPTADA = TXTLICENCIA.Text
  
  STRCONTRAENCRIPTADA = RC4(TXTLICENCIA.Text, "VERONICA")
  STRLICENCIAENCRIPTADA = ENCRIPTARYCODIFICARDATOS(STRLICENCIAENCRIPTADA, "VERONICA")
  STRCONTRAENCRIPTADA = ENCRIPTARYCODIFICARDATOS(STRCONTRAENCRIPTADA, "VERONICA")
  TXTLICENCIA2.Text = STRLICENCIAENCRIPTADA
  TXTCONTRA.Text = STRCONTRAENCRIPTADA
  
End Sub

Private Sub TXTLICENCIA_Change()
  If TXTLICENCIA.Text <> "" Then
    CMDGENERAR.Enabled = True
  Else
    CMDGENERAR.Enabled = False
  End If
End Sub
