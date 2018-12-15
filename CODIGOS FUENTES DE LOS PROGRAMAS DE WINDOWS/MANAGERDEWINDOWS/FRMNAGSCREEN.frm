VERSION 5.00
Begin VB.Form FRMNAGSCREEN 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   2685
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4695
   Icon            =   "FRMNAGSCREEN.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2685
   ScaleWidth      =   4695
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton CMDREGISTRAR 
      Height          =   525
      Left            =   2340
      TabIndex        =   2
      Top             =   1980
      Width           =   1245
   End
   Begin VB.CommandButton CMDCONTINUAR 
      Default         =   -1  'True
      Height          =   525
      Left            =   1020
      TabIndex        =   1
      Top             =   1980
      Width           =   1245
   End
   Begin VB.TextBox TXTMENSAJE 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1815
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Top             =   0
      Width           =   4665
   End
End
Attribute VB_Name = "FRMNAGSCREEN"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub TRADUCIRINTERFAZ()

  Me.Caption = VARLENGUAJE(29)
  CMDCONTINUAR.Caption = VARLENGUAJE(30)
  CMDREGISTRAR.Caption = VARLENGUAJE(31)

End Sub

Private Sub CMDCONTINUAR_Click()
  Unload Me
End Sub

Private Sub CMDREGISTRAR_Click()
  On Error GoTo CAMPO
  Dim VBSUEJECUTAR As New VBSUtilidades.VBSUtils
  If ExistsFile(STRRUTA & "REGMARROK.EXE") = False Then
    MsgBox VARLENGUAJE(4), vbCritical, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  Shell STRRUTA & "REGMARROK.EXE", vbNormalFocus
  Exit Sub
CAMPO:
  If MsgBox(VARLENGUAJE(32), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
End Sub

Private Sub Form_Load()
  TRADUCIRINTERFAZ
  Me.Top = CInt(Screen.Height / 2) - CInt(Me.Height / 2)
  Me.Left = CInt(Screen.Width / 2) - CInt(Me.Width / 2)
End Sub
