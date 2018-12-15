VERSION 5.00
Begin VB.Form FRMSELECCIONARLENGUAJE 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Selección de lenguaje"
   ClientHeight    =   1215
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   5745
   Icon            =   "FRMSELECCIONARLENGUAJE.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1215
   ScaleWidth      =   5745
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.FileListBox FLBLENGUAJE 
      Height          =   480
      Left            =   3360
      TabIndex        =   4
      Top             =   1050
      Visible         =   0   'False
      Width           =   1245
   End
   Begin VB.CommandButton CMDCERRAR 
      Cancel          =   -1  'True
      Height          =   345
      Left            =   3060
      TabIndex        =   3
      Top             =   660
      Width           =   1245
   End
   Begin VB.CommandButton CMDAPLICAR 
      Default         =   -1  'True
      Height          =   375
      Left            =   1740
      TabIndex        =   2
      Top             =   660
      Width           =   1245
   End
   Begin VB.ComboBox CMBLENGUAJE 
      Height          =   315
      Left            =   3060
      TabIndex        =   1
      Top             =   240
      Width           =   2145
   End
   Begin VB.Label LBLDESCRIPCION 
      Alignment       =   1  'Right Justify
      Height          =   315
      Left            =   0
      TabIndex        =   0
      Top             =   270
      UseMnemonic     =   0   'False
      Width           =   2955
   End
End
Attribute VB_Name = "FRMSELECCIONARLENGUAJE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub TRADUCIRINTERFAZ()
  LBLDESCRIPCION.Caption = VARLENGUAJE(1)
  CMDAPLICAR.Caption = VARLENGUAJE(2)
  CMDCERRAR.Caption = VARLENGUAJE(3)
End Sub



Private Sub CMDAPLICAR_Click()

   Dim STRLENGUAJETEMPO(NUMERO_DE_ENTRADAS_DEL_ARCHIVO_DE_LENGUAJE) As String
    Dim INICONFIGURACION As New INIFILES
   Dim I As Integer
   
   If ExistsFile(STRRUTA & "config.ini") = False Or ExistsFile(STRRUTA & "LENGUAJE\NUL") = False Then
    MsgBox VARLENGUAJE(4), vbCritical, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  For I = 0 To NUMERO_DE_ENTRADAS_DEL_ARCHIVO_DE_LENGUAJE
    STRLENGUAJETEMPO(I) = VARLENGUAJE(I)
  Next I
  
  If CARGARLENGUAJE(CMBLENGUAJE.Text, FLBLENGUAJE) = False Then
    MsgBox VARLENGUAJE(5), vbCritical, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  INICONFIGURACION.File = STRRUTA & "\config.ini"
  INICONFIGURACION.Section = NOMBRE_DEL_PROGRAMA
  INICONFIGURACION.WriteValue "Lenguaje", CMBLENGUAJE.Text
  If INICONFIGURACION.ErrorNumber = 0 Then
    For I = 0 To NUMERO_DE_ENTRADAS_DEL_ARCHIVO_DE_LENGUAJE
       VARLENGUAJE(I) = STRLENGUAJETEMPO(I)
    Next I
    MsgBox VARLENGUAJE(6), vbCritical, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  TRADUCIRINTERFAZ
End Sub

Private Sub CMDCERRAR_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  Dim BYTRETVAL As Byte
  Dim STRVALOR As String
  Dim INICONFIGURACION As New INIFILES
  Dim VARLISTALENGUAJES As Variant
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

  TRADUCIRINTERFAZ
  VARLISTALENGUAJES = OBTENERLENGUAJESDISPONIBLES("", FLBLENGUAJE)
  For I = 1 To UBound(VARLISTALENGUAJES)
    CMBLENGUAJE.AddItem VARLISTALENGUAJES(I)
  Next I
  CMBLENGUAJE.Text = VARLENGUAJE(0)
  Me.Top = CInt(Screen.Height / 2) - CInt(Me.Height / 2)
  Me.Left = CInt(Screen.Width / 2) - CInt(Me.Width / 2)

End Sub
