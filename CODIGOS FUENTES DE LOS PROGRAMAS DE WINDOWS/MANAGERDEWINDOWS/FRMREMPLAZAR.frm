VERSION 5.00
Begin VB.Form FRMREMPLAZAR 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   2010
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4680
   Icon            =   "FRMREMPLAZAR.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2010
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton CMDCERRAR 
      Cancel          =   -1  'True
      Height          =   375
      Left            =   2340
      TabIndex        =   6
      Top             =   1500
      Width           =   1245
   End
   Begin VB.CommandButton CMDREMPLAZAR 
      Default         =   -1  'True
      Height          =   375
      Left            =   1020
      TabIndex        =   5
      Top             =   1500
      Width           =   1245
   End
   Begin VB.CheckBox CHKMAYUSCULAS 
      Height          =   345
      Left            =   780
      TabIndex        =   4
      Top             =   1050
      Width           =   3615
   End
   Begin VB.TextBox TXTREMPLAZAR 
      Height          =   315
      Left            =   1740
      MaxLength       =   255
      TabIndex        =   3
      Top             =   570
      Width           =   2835
   End
   Begin VB.TextBox TXTBUSCAR 
      Height          =   315
      Left            =   1740
      MaxLength       =   255
      TabIndex        =   1
      Top             =   150
      Width           =   2835
   End
   Begin VB.Label LBLDESCRIPCION2 
      Alignment       =   1  'Right Justify
      Height          =   345
      Left            =   90
      TabIndex        =   2
      Top             =   600
      UseMnemonic     =   0   'False
      Width           =   1605
   End
   Begin VB.Label LBLDESCRIPCION 
      Alignment       =   1  'Right Justify
      Height          =   345
      Left            =   90
      TabIndex        =   0
      Top             =   180
      UseMnemonic     =   0   'False
      Width           =   1605
   End
End
Attribute VB_Name = "FRMREMPLAZAR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub TRADUCIRINTERFAZ()

  Me.Caption = VARLENGUAJE(216)
  LBLDESCRIPCION.Caption = VARLENGUAJE(221)
  LBLDESCRIPCION2.Caption = VARLENGUAJE(227)
  CHKMAYUSCULAS.Caption = VARLENGUAJE(222)
  CMDREMPLAZAR.Caption = VARLENGUAJE(216)
  CMDCERRAR.Caption = VARLENGUAJE(3)
End Sub

Private Sub CMDCERRAR_Click()
  Unload Me
End Sub

Private Sub CMDREMPLAZAR_Click()
  Dim LNGUPOSICION As Long
  If TXTBUSCAR.Text = "" Then
    MsgBox VARLENGUAJE(223), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  If TXTREMPLAZAR.Text = "" Then
    MsgBox VARLENGUAJE(228), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  If FRMEDITOR.BYTTIPOTEXTO <> 3 And (InStr(TXTREMPLAZAR.Text, ">") >= 1 Or InStr(TXTREMPLAZAR.Text, "<") >= 1) Then
  
    MsgBox VARLENGUAJE(220), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  
  End If
  If CHKMAYUSCULAS.Value = 1 Then
  
    LNGUPOSICION = InStr(1, FRMEDITOR.RTXTEDITOR.Text, TXTBUSCAR.Text, vbBinaryCompare)
  Else
    LNGUPOSICION = InStr(1, FRMEDITOR.RTXTEDITOR.Text, TXTBUSCAR.Text, vbTextCompare)
  End If
  
  If LNGUPOSICION <= 0 Then
    
    MsgBox VARLENGUAJE(224), vbInformation, NOMBRE_DEL_PROGRAMA
  
 
  Else
    If CHKMAYUSCULAS.Value = 1 Then
      FRMEDITOR.RTXTEDITOR.Text = Replace(FRMEDITOR.RTXTEDITOR.Text, TXTBUSCAR.Text, TXTREMPLAZAR.Text, , , vbBinaryCompare)
    Else
      FRMEDITOR.RTXTEDITOR.Text = Replace(FRMEDITOR.RTXTEDITOR.Text, TXTBUSCAR.Text, TXTREMPLAZAR.Text, , , vbTextCompare)
    End If
    MsgBox VARLENGUAJE(229), vbInformation, NOMBRE_DEL_PROGRAMA

  End If
End Sub

Private Sub Form_Load()
  TRADUCIRINTERFAZ
  Me.Top = CInt(Screen.Height / 2) - CInt(Me.Height / 2)
  Me.Left = CInt(Screen.Width / 2) - CInt(Me.Width / 2)
End Sub
