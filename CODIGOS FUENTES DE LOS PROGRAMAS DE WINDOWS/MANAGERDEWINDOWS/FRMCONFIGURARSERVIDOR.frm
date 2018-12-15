VERSION 5.00
Begin VB.Form FRMCONFIGURARSERVIDOR 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   1500
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4365
   Icon            =   "FRMCONFIGURARSERVIDOR.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1500
   ScaleWidth      =   4365
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton CMDCERRAR 
      Cancel          =   -1  'True
      Height          =   345
      Left            =   2160
      TabIndex        =   4
      Top             =   1050
      Width           =   1245
   End
   Begin VB.CommandButton CMDACEPTAR 
      Default         =   -1  'True
      Height          =   345
      Left            =   840
      TabIndex        =   3
      Top             =   1050
      Width           =   1245
   End
   Begin VB.TextBox TXTPUERTO 
      Height          =   315
      Left            =   1290
      MaxLength       =   4
      TabIndex        =   2
      Text            =   "80"
      Top             =   600
      Width           =   2895
   End
   Begin VB.TextBox TXTIP 
      Height          =   315
      Left            =   1290
      MaxLength       =   15
      TabIndex        =   1
      Text            =   "127.0.0.1"
      Top             =   150
      Width           =   2895
   End
   Begin VB.Label LBLDESCRIPCION2 
      Alignment       =   1  'Right Justify
      Height          =   315
      Left            =   150
      TabIndex        =   5
      Top             =   630
      UseMnemonic     =   0   'False
      Width           =   1095
   End
   Begin VB.Label LBLDESCRIPCION 
      Alignment       =   1  'Right Justify
      Height          =   285
      Left            =   150
      TabIndex        =   0
      Top             =   180
      UseMnemonic     =   0   'False
      Width           =   1095
   End
End
Attribute VB_Name = "FRMCONFIGURARSERVIDOR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Sub TRADUCIRINTERFAZ()

  Me.Caption = VARLENGUAJE(294)
  LBLDESCRIPCION.Caption = VARLENGUAJE(295)
  LBLDESCRIPCION2.Caption = VARLENGUAJE(296)
  CMDACEPTAR.Caption = VARLENGUAJE(2)
  CMDCERRAR.Caption = VARLENGUAJE(3)
  

End Sub

Private Sub CMDACEPTAR_Click()
  On Error Resume Next
  Dim HASIP As New HASHARRAY
  Dim VARARIP As Variant
  Dim I As Integer
  
  HASIP.HashArrayType = True
  For I = 0 To 255
    HASIP.Add CStr(I), "SI"
  Next I
  If Trim(TXTIP.Text) = "" Then
    MsgBox VARLENGUAJE(297), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  VARARIP = Split(TXTIP.Text, ".")
  If UBound(VARARIP) <> 3 Then
    MsgBox VARLENGUAJE(297), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  For I = 0 To UBound(VARARIP)
    If HASIP.ExistsKey(VARARIP(I)) = False Then
      MsgBox VARLENGUAJE(297), vbExclamation, NOMBRE_DEL_PROGRAMA
      Exit Sub
    End If
  Next I
  If IsNumeric(TXTPUERTO.Text) = False Then
    MsgBox VARLENGUAJE(298), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  If CDbl(TXTPUERTO.Text) <> CInt(TXTPUERTO.Text) Then
    MsgBox VARLENGUAJE(298), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  If CInt(TXTPUERTO.Text) < 1 Then
    MsgBox VARLENGUAJE(298), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  
  FRMCONFIGURARSERVIDOR.Hide
  If ACTIVARSERVIDORWEB() = False Then
    Unload FRMCONFIGURARSERVIDOR
    Exit Sub
  
  End If
  Unload FRMCONFIGURARSERVIDOR
  
End Sub

Private Sub CMDCERRAR_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  TRADUCIRINTERFAZ
  Me.Top = CInt(Screen.Height / 2) - CInt(Me.Height / 2)
  Me.Left = CInt(Screen.Width / 2) - CInt(Me.Width / 2)

End Sub

