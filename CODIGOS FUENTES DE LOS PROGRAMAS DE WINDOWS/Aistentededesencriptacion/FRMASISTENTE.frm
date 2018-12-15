VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form FRMASISTENTE 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Asistente de desencriptación de mensajes"
   ClientHeight    =   2955
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7470
   Icon            =   "FRMASISTENTE.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2955
   ScaleWidth      =   7470
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog CMDCUADRO 
      Left            =   3510
      Top             =   1230
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame FRAMARCO3 
      Height          =   2175
      Left            =   30
      TabIndex        =   13
      Top             =   0
      Visible         =   0   'False
      Width           =   7395
      Begin VB.OptionButton RDBGUARDAR 
         Height          =   435
         Left            =   450
         TabIndex        =   15
         Top             =   630
         Value           =   -1  'True
         Width           =   3495
      End
      Begin VB.OptionButton RDBPORTAPAPELES 
         Height          =   585
         Left            =   450
         TabIndex        =   14
         Top             =   1020
         Width           =   3585
      End
      Begin VB.Label LBLDESCRIPCION4 
         Height          =   525
         Left            =   450
         TabIndex        =   16
         Top             =   270
         UseMnemonic     =   0   'False
         Width           =   3975
      End
   End
   Begin VB.Frame FRAMARCO2 
      Height          =   2175
      Left            =   30
      TabIndex        =   7
      Top             =   0
      Visible         =   0   'False
      Width           =   7395
      Begin VB.CommandButton CMDEXAMINAR 
         Height          =   315
         Left            =   6090
         TabIndex        =   11
         Top             =   600
         Width           =   1155
      End
      Begin RichTextLib.RichTextBox RTXTCONTRA 
         Height          =   345
         Left            =   30
         TabIndex        =   12
         Top             =   1410
         Width           =   7305
         _ExtentX        =   12885
         _ExtentY        =   609
         _Version        =   393217
         Enabled         =   -1  'True
         TextRTF         =   $"FRMASISTENTE.frx":030A
      End
      Begin RichTextLib.RichTextBox RTXTRUTAMENSAJE 
         Height          =   345
         Left            =   30
         TabIndex        =   9
         Top             =   600
         Width           =   5925
         _ExtentX        =   10451
         _ExtentY        =   609
         _Version        =   393217
         Enabled         =   -1  'True
         TextRTF         =   $"FRMASISTENTE.frx":038C
      End
      Begin VB.Label LBLDESCRIPCION3 
         Height          =   495
         Left            =   60
         TabIndex        =   10
         Top             =   1140
         UseMnemonic     =   0   'False
         Width           =   7275
      End
      Begin VB.Label LBLDESCRIPCION2 
         Height          =   555
         Left            =   60
         TabIndex        =   8
         Top             =   330
         UseMnemonic     =   0   'False
         Width           =   7275
      End
   End
   Begin VB.CommandButton CMDFINALIZAR 
      Enabled         =   0   'False
      Height          =   525
      Left            =   5100
      TabIndex        =   4
      Top             =   2310
      Width           =   1245
   End
   Begin VB.CommandButton CMDCERRAR 
      Cancel          =   -1  'True
      Height          =   525
      Left            =   3780
      TabIndex        =   3
      Top             =   2310
      Width           =   1245
   End
   Begin VB.CommandButton CMDANTERIOR 
      Enabled         =   0   'False
      Height          =   525
      Left            =   2460
      TabIndex        =   2
      Top             =   2310
      Width           =   1245
   End
   Begin VB.CommandButton CMDSIGUIENTE 
      Default         =   -1  'True
      Height          =   525
      Left            =   1140
      TabIndex        =   1
      Top             =   2310
      Width           =   1245
   End
   Begin VB.Frame FRAMARCO 
      Height          =   2175
      Left            =   30
      TabIndex        =   5
      Top             =   0
      Width           =   7395
      Begin VB.Label LBLDESCRIPCION 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1695
         Left            =   600
         TabIndex        =   6
         Top             =   330
         UseMnemonic     =   0   'False
         Width           =   6315
      End
   End
   Begin VB.FileListBox FLBLENGUAJE 
      Height          =   480
      Left            =   1740
      TabIndex        =   0
      Top             =   1320
      Visible         =   0   'False
      Width           =   1245
   End
End
Attribute VB_Name = "FRMASISTENTE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim BYTNPASO As Byte
Dim STRCONTENIDOARCHIVO As String
Private Sub TRADUCIRINTERFAZ()
  LBLDESCRIPCION.Caption = VARLENGUAJE(7)
  CMDSIGUIENTE.Caption = VARLENGUAJE(8)
  CMDANTERIOR.Caption = VARLENGUAJE(9)
  CMDCERRAR.Caption = VARLENGUAJE(10)
  CMDFINALIZAR.Caption = VARLENGUAJE(11)
  LBLDESCRIPCION2.Caption = VARLENGUAJE(12)
  LBLDESCRIPCION3.Caption = VARLENGUAJE(13)
  LBLDESCRIPCION4.Caption = VARLENGUAJE(14)
  RDBGUARDAR.Caption = VARLENGUAJE(15)
  RDBPORTAPAPELES.Caption = VARLENGUAJE(16)
  CMDEXAMINAR.Caption = VARLENGUAJE(19)
End Sub

Private Sub CMDANTERIOR_Click()
  BYTNPASO = BYTNPASO - 1
  If BYTNPASO = 1 Then
    CMDANTERIOR.Enabled = False
    FRAMARCO2.Visible = False
    FRAMARCO.Visible = True
  ElseIf BYTNPASO = 2 Then
    CMDSIGUIENTE.Enabled = True
    CMDFINALIZAR.Enabled = False
    FRAMARCO3.Visible = False
    FRAMARCO2.Visible = True
  End If
  
End Sub

Private Sub CMDCERRAR_Click()
  Unload Me
End Sub

Private Sub CMDEXAMINAR_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.Filter = "*.*"
  CMDCUADRO.Flags = cdlOFNFileMustExist + cdlOFNHideReadOnly
  CMDCUADRO.DialogTitle = VARLENGUAJE(21)
  CMDCUADRO.ShowOpen
  RTXTRUTAMENSAJE.Text = CMDCUADRO.FileName
  Exit Sub
CAMPO:
End Sub

Private Sub CMDFINALIZAR_Click()
  On Error Resume Next
  Dim STRRUTAARCHIVO As String
  Dim STRRUTABLOCDENOTAS As String
  Dim INTCL As Integer
  If RDBGUARDAR.Value = True Then
  
    CMDCUADRO.CancelError = True
    CMDCUADRO.Filter = "*.*"
    CMDCUADRO.DialogTitle = VARLENGUAJE(23)
    CMDCUADRO.ShowSave
    If Err.Number <> 0 Then
      Err.Clear
      Exit Sub
    End If
    STRRUTAARCHIVO = CMDCUADRO.FileName
    STRRUTABLOCDENOTAS = WindowsDirectory() & "NOTEPAD.EXE"
    If ExistsFile(STRRUTABLOCDENOTAS) = False Then
      CMDCUADRO.CancelError = True
      CMDCUADRO.FileName = "notepad.exe"
      CMDCUADRO.Filter = "*.exe"
      CMDCUADRO.Flags = cdlOFNFileMustExist + cdlOFNHideReadOnly
      CMDCUADRO.DialogTitle = VARLENGUAJE(24)
      CMDCUADRO.ShowOpen
      If Err.Number <> 0 Then
        Err.Clear
        Exit Sub
      End If
      STRRUTABLOCDENOTAS = CMDCUADRO.FileName
    End If
    Do
      INTCL = FreeFile
      Open STRRUTAARCHIVO For Output As INTCL
      Print #INTCL, STRCONTENIDOARCHIVO
      Close #INTCL
      If Err.Number <> 0 Then
        If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbCancel Then
          Err.Clear
          Exit Sub
        End If
      End If
    Loop While (Err.Number <> 0)
    Shell STRRUTABLOCDENOTAS & " " & STRRUTAARCHIVO, vbNormalFocus
    If Err.Number <> 0 Then
      MsgBox VARLENGUAJE(25), vbCritical, NOMBRE_DEL_PROGRAMA
      Err.Clear
      Exit Sub
    End If
   
  Else
  
   Clipboard.SetText STRCONTENIDOARCHIVO
  
  End If
  Unload Me
End Sub

Private Sub CMDSIGUIENTE_Click()
  On Error GoTo CAMPO
  Dim INTCL As Integer
  Dim VARLINEASMENSAJE As Variant
  Dim STRMENSAJE As String
  Dim I As Long
  BYTNPASO = BYTNPASO + 1
  
  If BYTNPASO = 2 Then
  
    CMDANTERIOR.Enabled = True
    FRAMARCO.Visible = False
    FRAMARCO2.Visible = True
  ElseIf BYTNPASO = 3 Then
  
    If RTXTRUTAMENSAJE.Text = "" Then
      BYTNPASO = BYTNPASO - 1
      MsgBox VARLENGUAJE(17), vbExclamation, NOMBRE_DEL_PROGRAMA
      Exit Sub
    ElseIf RTXTCONTRA.Text = "" Then
      BYTNPASO = BYTNPASO - 1
      MsgBox VARLENGUAJE(18), vbExclamation, NOMBRE_DEL_PROGRAMA
      Exit Sub
    End If
    INTCL = FreeFile
    Open RTXTRUTAMENSAJE.Text For Input As #INTCL
    Line Input #INTCL, STRCONTENIDOARCHIVO
    Close #INTCL
    STRCONTENIDOARCHIVO = HexDeEncoded(STRCONTENIDOARCHIVO)
    If STRCONTENIDOARCHIVO = "" Then
      BYTNPASO = BYTNPASO - 1
      MsgBox VARLENGUAJE(20), vbExclamation, NOMBRE_DEL_PROGRAMA
      Exit Sub
    End If
    STRCONTENIDOARCHIVO = DeCriptModifiedXor(STRCONTENIDOARCHIVO)
    If STRCONTENIDOARCHIVO = "" Then
      BYTNPASO = BYTNPASO - 1
      MsgBox VARLENGUAJE(20), vbExclamation, NOMBRE_DEL_PROGRAMA
      Exit Sub
    End If
    STRCONTENIDOARCHIVO = DeCriptModifiedVigenere(STRCONTENIDOARCHIVO, RTXTCONTRA.Text)
    If STRCONTENIDOARCHIVO = "" Then
      BYTNPASO = BYTNPASO - 1
      MsgBox VARLENGUAJE(20), vbExclamation, NOMBRE_DEL_PROGRAMA
      Exit Sub
    End If
    VARLINEASMENSAJE = Split(STRCONTENIDOARCHIVO, Chr(13) & Chr(10))
    If UBound(VARLINEASMENSAJE) < 23 Then
      BYTNPASO = BYTNPASO - 1
      MsgBox VARLENGUAJE(22), vbExclamation, NOMBRE_DEL_PROGRAMA
      Exit Sub
    End If
    If Mid(VARLINEASMENSAJE(UBound(VARLINEASMENSAJE) - 1), 1, 4) <> "MD5:" Then
      BYTNPASO = BYTNPASO - 1
      MsgBox VARLENGUAJE(22), vbExclamation, NOMBRE_DEL_PROGRAMA
      Exit Sub
    End If
    If Mid(VARLINEASMENSAJE(UBound(VARLINEASMENSAJE)), 1, 5) <> "SHA1:" Then
      BYTNPASO = BYTNPASO - 1
      MsgBox VARLENGUAJE(22), vbExclamation, NOMBRE_DEL_PROGRAMA
      Exit Sub
    End If
    STRMENSAJE = VARLINEASMENSAJE(0)
    For I = 1 To UBound(VARLINEASMENSAJE) - 2
      STRMENSAJE = STRMENSAJE & Chr(13) & Chr(10) & VARLINEASMENSAJE(I)
    Next I
    If Mid(VARLINEASMENSAJE(UBound(VARLINEASMENSAJE) - 1), 5) <> MD5(STRMENSAJE) Then
      BYTNPASO = BYTNPASO - 1
      MsgBox VARLENGUAJE(22), vbExclamation, NOMBRE_DEL_PROGRAMA
      Exit Sub
    End If
    If Mid(VARLINEASMENSAJE(UBound(VARLINEASMENSAJE)), 6) <> SHA1(STRMENSAJE) Then
      BYTNPASO = BYTNPASO - 1
      MsgBox VARLENGUAJE(22), vbExclamation, NOMBRE_DEL_PROGRAMA
      Exit Sub
    End If
    CMDSIGUIENTE.Enabled = False
    CMDFINALIZAR.Enabled = True
    FRAMARCO2.Visible = False
    FRAMARCO3.Visible = True
  End If
  Exit Sub
CAMPO:
  If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Resume
  End If
  BYTNPASO = BYTNPASO - 1
End Sub

Private Sub Form_Load()
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
  BYTNPASO = 1
  Me.Top = CInt(Screen.Height / 2) - CInt(Me.Height / 2)
  Me.Left = CInt(Screen.Width / 2) - CInt(Me.Width / 2)

End Sub


