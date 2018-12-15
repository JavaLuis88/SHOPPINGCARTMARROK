VERSION 5.00
Begin VB.Form FRMOPCIONES 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   3090
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "FRMOPCIONES.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton CMDCERRAR 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   945
      Left            =   0
      Picture         =   "FRMOPCIONES.frx":030A
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   2100
      Width           =   975
   End
   Begin VB.CommandButton CMDABRIRPROYECTO 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   945
      Left            =   0
      Picture         =   "FRMOPCIONES.frx":246C
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   1050
      Width           =   975
   End
   Begin VB.CommandButton CMDNUEVOPROYECTO 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   945
      Left            =   0
      Picture         =   "FRMOPCIONES.frx":3446
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   0
      Width           =   975
   End
   Begin VB.Label LBLDESCRIPCION3 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Left            =   1020
      TabIndex        =   5
      Top             =   2370
      UseMnemonic     =   0   'False
      Width           =   3615
   End
   Begin VB.Label LBLDESCRIPCION2 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Left            =   1020
      TabIndex        =   4
      Top             =   1350
      UseMnemonic     =   0   'False
      Width           =   3615
   End
   Begin VB.Label LBLDESCRIPCION 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Left            =   1020
      TabIndex        =   3
      Top             =   300
      UseMnemonic     =   0   'False
      Width           =   3615
   End
End
Attribute VB_Name = "FRMOPCIONES"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub TRADUCIRINTERFAZ()
  Me.Caption = VARLENGUAJE(50)
  LBLDESCRIPCION.Caption = VARLENGUAJE(47)
  LBLDESCRIPCION2.Caption = VARLENGUAJE(48)
  LBLDESCRIPCION3.Caption = VARLENGUAJE(49)
End Sub

Private Sub CMDABRIRPROYECTO_Click()
  FRMOPCIONES.Hide
  ABRIRPROYECTO
  Unload FRMOPCIONES
End Sub

Private Sub CMDCERRAR_Click()
  FRMOPCIONES.Hide
  Unload FRMOPCIONES
End Sub

Private Sub CMDNUEVOPROYECTO_Click()
  FRMOPCIONES.Hide
  NUEVOPROYECTO
  Unload FRMOPCIONES
End Sub

Private Sub Form_Load()
  TRADUCIRINTERFAZ
  Me.Top = CInt(Screen.Height / 2) - CInt(Me.Height / 2)
  Me.Left = CInt(Screen.Width / 2) - CInt(Me.Width / 2)
End Sub


