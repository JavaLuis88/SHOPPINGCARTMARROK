VERSION 5.00
Begin VB.Form FRMBORRARPROYECTO 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   3375
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4650
   Icon            =   "FRMBORRARPROYECTO.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3375
   ScaleWidth      =   4650
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.DirListBox DIRPROYECTOS 
      Height          =   540
      Left            =   1740
      TabIndex        =   3
      Top             =   1320
      Visible         =   0   'False
      Width           =   1245
   End
   Begin VB.ListBox LSTPROYECTOS 
      Height          =   3375
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   3255
   End
   Begin VB.CommandButton CMDBORRAR 
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   525
      Left            =   3360
      TabIndex        =   1
      Top             =   780
      Width           =   1245
   End
   Begin VB.CommandButton CMDCERRAR 
      Cancel          =   -1  'True
      Height          =   525
      Left            =   3360
      TabIndex        =   0
      Top             =   1470
      Width           =   1245
   End
End
Attribute VB_Name = "FRMBORRARPROYECTO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub TRADUCIRINTERFAZ()
  Me.Caption = VARLENGUAJE(37)
  CMDBORRAR.Caption = VARLENGUAJE(59)
  CMDCERRAR.Caption = VARLENGUAJE(3)
End Sub
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

Private Sub CMDBORRAR_Click()
  On Error GoTo CAMPO
  Dim FSOARCHIVOS As New Scripting.FileSystemObject
  If UCase(STRNOMBREPROYECTO) = UCase(LSTPROYECTOS.Text) Then
    MsgBox VARLENGUAJE(60), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  If FSOARCHIVOS.FolderExists(STRRUTA & "Proyectos\" & LSTPROYECTOS.Text) = True Then
    FSOARCHIVOS.DeleteFolder STRRUTA & "Proyectos\" & LSTPROYECTOS.Text, True
  End If
  MOSTRARLISTAPROYECTOS
  CMDBORRAR.Enabled = False
  Exit Sub
CAMPO:
  If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
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
    CMDBORRAR.Enabled = True
  End If
End Sub

