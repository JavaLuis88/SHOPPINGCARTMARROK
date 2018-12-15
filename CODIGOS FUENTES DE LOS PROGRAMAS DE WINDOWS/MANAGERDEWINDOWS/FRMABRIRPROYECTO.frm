VERSION 5.00
Begin VB.Form FRMABRIRPROYECTO 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   3405
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4680
   Icon            =   "FRMABRIRPROYECTO.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3405
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton CMDCERRAR 
      Cancel          =   -1  'True
      Height          =   525
      Left            =   3360
      TabIndex        =   3
      Top             =   1470
      Width           =   1245
   End
   Begin VB.CommandButton CMDABRIR 
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   525
      Left            =   3360
      TabIndex        =   2
      Top             =   780
      Width           =   1245
   End
   Begin VB.ListBox LSTPROYECTOS 
      Height          =   3375
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   3255
   End
   Begin VB.DirListBox DIRPROYECTOS 
      Height          =   540
      Left            =   1740
      TabIndex        =   0
      Top             =   1320
      Visible         =   0   'False
      Width           =   1245
   End
End
Attribute VB_Name = "FRMABRIRPROYECTO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub MOSTRARLISTAPROYECTOS()
  On Error GoTo CAMPO
    Dim I As Integer
    If ExistsFile(STRRUTA & "Proyectos\NUL") = False Then
      MsgBox VARLENGUAJE(4), vbCritical, NOMBRE_DEL_PROGRAMA
      Unload Me
      Exit Sub
    End If
    DIRPROYECTOS.Path = STRRUTA & "Proyectos"
    DIRPROYECTOS.Refresh
    LSTPROYECTOS.Clear
    For I = 0 To DIRPROYECTOS.ListCount - 1
      LSTPROYECTOS.AddItem Mid(DIRPROYECTOS.List(I), Len(STRRUTA & "PROYECTOS") + 2)
    Next I
  Exit Sub
CAMPO:
  If MsgBox(VARLENGUAJE(56), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
End Sub
Private Sub TRADUCIRINTERFAZ()
  Me.Caption = VARLENGUAJE(35)
  CMDABRIR.Caption = VARLENGUAJE(57)
  CMDCERRAR.Caption = VARLENGUAJE(3)
End Sub

Private Sub CMDABRIR_Click()
  FRMABRIRPROYECTO.Hide
  VERIFICARINTEGRIDADPROYECTOYCARGAR LSTPROYECTOS.Text
  Unload FRMABRIRPROYECTO
End Sub

Private Sub CMDCERRAR_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  TRADUCIRINTERFAZ
  MOSTRARLISTAPROYECTOS
  Me.Top = CInt(Screen.Height / 2) - CInt(Me.Height / 2)
  Me.Left = CInt(Screen.Width / 2) - CInt(Me.Width / 2)

End Sub


Private Sub LSTPROYECTOS_Click()
  If LSTPROYECTOS.Text <> "" Then
    CMDABRIR.Enabled = True
  End If
End Sub
