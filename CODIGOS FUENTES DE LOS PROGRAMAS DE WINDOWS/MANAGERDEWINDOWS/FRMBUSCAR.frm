VERSION 5.00
Begin VB.Form FRMBUSCAR 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Form1"
   ClientHeight    =   1545
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4680
   Icon            =   "FRMBUSCAR.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1545
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton CMDCERRAR 
      Height          =   405
      Left            =   2340
      TabIndex        =   4
      Top             =   1050
      Width           =   1245
   End
   Begin VB.CommandButton CMDBUSCAR 
      Default         =   -1  'True
      Height          =   405
      Left            =   1020
      TabIndex        =   3
      Top             =   1050
      Width           =   1245
   End
   Begin VB.CheckBox CHKMAYUSCULAS 
      Height          =   315
      Left            =   840
      TabIndex        =   2
      Top             =   600
      Width           =   3285
   End
   Begin VB.TextBox TXTBUSCAR 
      Height          =   315
      Left            =   1800
      MaxLength       =   255
      TabIndex        =   1
      Top             =   150
      Width           =   2475
   End
   Begin VB.Label LBLDESCRIPCION 
      Alignment       =   1  'Right Justify
      Height          =   315
      Left            =   60
      TabIndex        =   0
      Top             =   180
      UseMnemonic     =   0   'False
      Width           =   1695
   End
End
Attribute VB_Name = "FRMBUSCAR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit



Sub TRADUCIRINTERFAZ()
  Me.Caption = VARLENGUAJE(215)
  LBLDESCRIPCION.Caption = VARLENGUAJE(221)
  CHKMAYUSCULAS.Caption = VARLENGUAJE(222)
  CMDBUSCAR.Caption = VARLENGUAJE(215)
  CMDCERRAR.Caption = VARLENGUAJE(3)
End Sub



Private Sub CMDBUSCAR_Click()
  Dim LNGUPOSICION As Long
  
  If TXTBUSCAR.Text = "" Then
    MsgBox VARLENGUAJE(223), vbExclamation, NOMBRE_DEL_PROGRAMA
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
    FRMEDITOR.RTXTEDITOR.SelStart = LNGUPOSICION - 1
    FRMEDITOR.RTXTEDITOR.SelLength = Len(TXTBUSCAR.Text)
    FRMEDITOR.LNGPOSICIONUBUSQUEDA = LNGUPOSICION
    FRMEDITOR.STRCADBUSQUEDA = TXTBUSCAR.Text
    FRMEDITOR.INTMAYUSCULAS = CHKMAYUSCULAS.Value
    FRMEDITOR.MNBUSCARSIGUIENTE.Enabled = True
    Unload Me
  End If
End Sub

Private Sub CMDCERRAR_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  TRADUCIRINTERFAZ
  Me.Top = CInt(Screen.Height / 2) - CInt(Me.Height / 2)
  Me.Left = CInt(Screen.Width / 2) - CInt(Me.Width / 2)
End Sub




