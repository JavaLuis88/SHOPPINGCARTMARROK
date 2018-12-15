VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.MDIForm FRMMARROK 
   BackColor       =   &H8000000C&
   Caption         =   "Asistente de configuarcion de Marrok"
   ClientHeight    =   3090
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   4680
   Icon            =   "FRMMARROK.frx":0000
   LinkTopic       =   "MDIForm1"
   LockControls    =   -1  'True
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin MSComctlLib.Toolbar TLBBARRA 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   2
      Top             =   525
      Width           =   4680
      _ExtentX        =   8255
      _ExtentY        =   741
      ButtonWidth     =   609
      ButtonHeight    =   582
      Appearance      =   1
      ImageList       =   "IMGICONOS"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   11
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   3
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   4
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   5
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   6
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   7
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   8
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList IMGICONOS 
      Left            =   6960
      Top             =   3930
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   8
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMARROK.frx":030A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMARROK.frx":041C
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMARROK.frx":052E
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMARROK.frx":0640
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMARROK.frx":0752
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMARROK.frx":0C94
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMARROK.frx":196E
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMMARROK.frx":1DC0
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.PictureBox PICCONTENEDOR 
      Align           =   1  'Align Top
      Height          =   525
      Left            =   0
      ScaleHeight     =   465
      ScaleWidth      =   4620
      TabIndex        =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   4680
      Begin VB.Timer TMRRETARDO 
         Enabled         =   0   'False
         Interval        =   1000
         Left            =   3000
         Top             =   30
      End
      Begin VB.FileListBox FLBLENGUAJE 
         Height          =   285
         Left            =   690
         TabIndex        =   1
         Top             =   180
         Width           =   1995
      End
   End
   Begin VB.Menu MNARCHIVO 
      Caption         =   "A"
      Begin VB.Menu MNNUEVO 
         Caption         =   "B"
      End
      Begin VB.Menu MNABRIR 
         Caption         =   "C"
      End
      Begin VB.Menu MNGUARDAR 
         Caption         =   "D"
      End
      Begin VB.Menu MNBORRAR 
         Caption         =   "E"
      End
      Begin VB.Menu MNSEPARADOR 
         Caption         =   "-"
      End
      Begin VB.Menu MNCERRAR 
         Caption         =   "G"
      End
   End
   Begin VB.Menu MNPROYECTO 
      Caption         =   "H"
      Begin VB.Menu MNPREVISUALIZAR 
         Caption         =   "I"
      End
      Begin VB.Menu MNCOMPILAR 
         Caption         =   "J"
      End
   End
   Begin VB.Menu MNHERRAMIENTAS 
      Caption         =   "K"
      Begin VB.Menu MNLENGUAJE 
         Caption         =   "M"
      End
      Begin VB.Menu MNSEPARADOR2 
         Caption         =   "-"
      End
      Begin VB.Menu MNDESNCRIPTACION 
         Caption         =   "N"
      End
   End
   Begin VB.Menu MNAYUDA 
      Caption         =   "O"
      Begin VB.Menu MNAYUDA2 
         Caption         =   "P"
      End
      Begin VB.Menu MNSEPARADOR5 
         Caption         =   "-"
      End
      Begin VB.Menu MNACERCADE 
         Caption         =   "Q"
      End
   End
End
Attribute VB_Name = "FRMMARROK"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public Sub TRADUCIRINTERFAZ()
  Me.MNARCHIVO.Caption = VARLENGUAJE(33)
  Me.MNNUEVO.Caption = VARLENGUAJE(34)
  Me.MNABRIR.Caption = VARLENGUAJE(35)
  Me.MNGUARDAR.Caption = VARLENGUAJE(36)
  Me.MNBORRAR.Caption = VARLENGUAJE(37)
  Me.MNCERRAR.Caption = VARLENGUAJE(38)
  Me.MNPROYECTO.Caption = VARLENGUAJE(39)
  Me.MNPREVISUALIZAR.Caption = VARLENGUAJE(40)
  Me.MNCOMPILAR.Caption = VARLENGUAJE(41)
  Me.MNHERRAMIENTAS.Caption = VARLENGUAJE(42)
  Me.MNLENGUAJE.Caption = VARLENGUAJE(43)
  Me.MNDESNCRIPTACION.Caption = VARLENGUAJE(44)
  Me.MNAYUDA.Caption = VARLENGUAJE(45)
  Me.MNAYUDA2.Caption = VARLENGUAJE(45)
  Me.MNACERCADE.Caption = VARLENGUAJE(46)
  TLBBARRA.Buttons(1).ToolTipText = VARLENGUAJE(34)
  TLBBARRA.Buttons(2).ToolTipText = VARLENGUAJE(35)
  TLBBARRA.Buttons(3).ToolTipText = VARLENGUAJE(36)
  TLBBARRA.Buttons(4).ToolTipText = VARLENGUAJE(37)
  TLBBARRA.Buttons(6).ToolTipText = VARLENGUAJE(40)
  TLBBARRA.Buttons(7).ToolTipText = VARLENGUAJE(41)
  TLBBARRA.Buttons(9).ToolTipText = VARLENGUAJE(43)
  TLBBARRA.Buttons(11).ToolTipText = VARLENGUAJE(45)
End Sub
Private Sub MDIForm_Load()
  Dim BYTRETVAL As Byte
  Dim STRVALOR As String
  Dim INICONFIGURACION As New INIFILES
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
  If SEPUEDEACTIVARELPROGRAMA() = False Then
    Unload Me
    Exit Sub
  End If
  
  Load FRMPRESENTACION
  FRMPRESENTACION.Show (1)
  
  ACTIVARMENUYBOTONES (1)
  TMRRETARDO.Enabled = True
End Sub



Private Sub MDIForm_Unload(Cancel As Integer)
  End
End Sub

Private Sub MNABRIR_Click()
  ABRIRPROYECTO
End Sub



Private Sub MNACERCADE_Click()
  Load FRMACERCADE
  FRMACERCADE.Show (1)
End Sub

Private Sub MNAYUDA2_Click()
  On Error GoTo CAMPO
  Dim VBSUUTILIDADES As New VBSUtilidades.VBSUtils
  Dim BOLRETVAL As Boolean
  
  If ExistsFile(STRRUTA & "DOCUMENTACION\MANUAL.HTM") = False Then
  
    MsgBox VARLENGUAJE(302), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  
  End If
  
  If Trim(VBSUUTILIDADES.EjecutableAsociado(STRRUTA & "DOCUMENTACION\MANUAL.HTM")) = "" Then
  
    MsgBox VARLENGUAJE(301), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  
  End If
  BOLRETVAL = False
  Do While (BOLRETVAL = False)
    BOLRETVAL = VBSUUTILIDADES.ShellSinc(VBSUUTILIDADES.EjecutableAsociado(STRRUTA & "DOCUMENTACION\MANUAL.HTM") & " " & STRRUTA & "DOCUMENTACION\MANUAL.HTM")
    If BOLRETVAL = False Then
      If MsgBox(VARLENGUAJE(300), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
        Exit Sub
      End If
    End If
  Loop
  Exit Sub
CAMPO:
  If MsgBox(VARLENGUAJE(300), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
End Sub

Private Sub MNBORRAR_Click()
  BORRARPROYECTO
End Sub



Private Sub MNCERRAR_Click()
  Unload Me
End Sub

Private Sub MNCOMPILAR_Click()
  COMPILARPROYECTO
End Sub

Private Sub MNDESNCRIPTACION_Click()
  DESENCRIPTARMENSAJE
End Sub

Private Sub MNGUARDAR_Click()
  Dim BOLRETVAL As Boolean
  BOLRETVAL = SALVARPROYECTO()
End Sub

Private Sub MNLENGUAJE_Click()
  SELECCIONARLENGUAJE
End Sub

Private Sub MNNUEVO_Click()
  NUEVOPROYECTO
End Sub

Private Sub MNPREVISUALIZAR_Click()
  PREVISUALIZARPROYECTO
End Sub

Private Sub TLBBARRA_ButtonClick(ByVal Button As MSComctlLib.Button)
  Dim BOLRETVAL As Boolean
  If Button.Index = 1 Then
    NUEVOPROYECTO
  ElseIf Button.Index = 2 Then
    ABRIRPROYECTO
  ElseIf Button.Index = 4 Then
    BORRARPROYECTO
  ElseIf Button.Index = 3 Then
    BOLRETVAL = SALVARPROYECTO()
  ElseIf Button.Index = 9 Then
    SELECCIONARLENGUAJE
  ElseIf Button.Index = 7 Then
    COMPILARPROYECTO
  ElseIf Button.Index = 6 Then
    PREVISUALIZARPROYECTO
  ElseIf Button.Index = 11 Then
    MNAYUDA2_Click
  End If
  
  
End Sub

Private Sub TMRRETARDO_Timer()
  TMRRETARDO.Enabled = False
  Load FRMOPCIONES
  FRMOPCIONES.Show (1)
End Sub
