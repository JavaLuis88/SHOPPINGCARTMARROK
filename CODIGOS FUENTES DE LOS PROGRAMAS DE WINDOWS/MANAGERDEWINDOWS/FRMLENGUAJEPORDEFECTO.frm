VERSION 5.00
Begin VB.Form FRMLENGUAJEPORDEFECTO 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   3045
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4005
   Icon            =   "FRMLENGUAJEPORDEFECTO.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3045
   ScaleWidth      =   4005
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton CMDCERRAR 
      Cancel          =   -1  'True
      Height          =   465
      Left            =   2490
      TabIndex        =   2
      Top             =   1590
      Width           =   1365
   End
   Begin VB.CommandButton CMDAPLICAR 
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   465
      Left            =   2490
      TabIndex        =   1
      Top             =   900
      Width           =   1365
   End
   Begin VB.ListBox LSTLENGUAJE 
      Height          =   2985
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   2325
   End
End
Attribute VB_Name = "FRMLENGUAJEPORDEFECTO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub TRADUCIRINTERFAZ()
  Me.Caption = VARLENGUAJE(73)
  CMDAPLICAR.Caption = VARLENGUAJE(2)
  CMDCERRAR.Caption = VARLENGUAJE(3)
End Sub

Private Sub ANADIRLENGUAJES()

  Dim VARLISTADELOSLENGUAJES As Variant
  Dim I As Long

  VARLISTADELOSLENGUAJES = FRMCONFIGURACION.HASLENGUAJESCARRO.Keys
  For I = 1 To UBound(VARLISTADELOSLENGUAJES)
    LSTLENGUAJE.AddItem Mid(VARLISTADELOSLENGUAJES(I), 1, Len(VARLISTADELOSLENGUAJES(I)) - 4)
  Next I
  
  For I = 1 To UBound(VARLISTADELOSLENGUAJES)
    If Trim(FRMCONFIGURACION.STRLENGUAJEPORDEFECTO) <> "" And UCase(Mid(VARLISTADELOSLENGUAJES(I), 1, Len(VARLISTADELOSLENGUAJES(I)) - 4)) = UCase(FRMCONFIGURACION.STRLENGUAJEPORDEFECTO) Then
    
      LSTLENGUAJE.Selected(I - 1) = True
    End If
    
  Next I
  

End Sub

Private Sub CMDAPLICAR_Click()
  FRMCONFIGURACION.STRLENGUAJEPORDEFECTO = LSTLENGUAJE.Text
  Unload Me
End Sub

Private Sub CMDCERRAR_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  TRADUCIRINTERFAZ
  Me.Top = CInt(Screen.Height / 2) - CInt(Me.Height / 2)
  Me.Left = CInt(Screen.Width / 2) - CInt(Me.Width / 2)
  ANADIRLENGUAJES
End Sub

Private Sub LSTLENGUAJE_Click()
  If Trim(LSTLENGUAJE.Text) <> "" Then
    CMDAPLICAR.Enabled = True
  End If
End Sub
