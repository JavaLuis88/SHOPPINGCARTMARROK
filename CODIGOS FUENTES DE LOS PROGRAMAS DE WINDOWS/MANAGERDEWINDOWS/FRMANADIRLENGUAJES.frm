VERSION 5.00
Begin VB.Form FRMANADIRLENGUAJES 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   3750
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4905
   Icon            =   "FRMANADIRLENGUAJES.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3750
   ScaleWidth      =   4905
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton CMDCERRAR 
      Cancel          =   -1  'True
      Height          =   525
      Left            =   2400
      TabIndex        =   7
      Top             =   3090
      Width           =   1245
   End
   Begin VB.CommandButton CMDAPLICAR 
      Default         =   -1  'True
      Height          =   525
      Left            =   1080
      TabIndex        =   6
      Top             =   3090
      Width           =   1245
   End
   Begin VB.CommandButton CMDQUITAR 
      Caption         =   "<-"
      Enabled         =   0   'False
      Height          =   585
      Left            =   2130
      TabIndex        =   3
      Top             =   1500
      Width           =   585
   End
   Begin VB.CommandButton CMDANADIR 
      Caption         =   "->"
      Enabled         =   0   'False
      Height          =   585
      Left            =   2130
      TabIndex        =   2
      Top             =   750
      Width           =   585
   End
   Begin VB.ListBox LSTLNGANADIDOS 
      Height          =   2595
      Left            =   2970
      TabIndex        =   4
      Top             =   360
      Width           =   1845
   End
   Begin VB.ListBox LSTLNGDISPONIBLES 
      Height          =   2595
      Left            =   30
      TabIndex        =   1
      Top             =   360
      Width           =   1845
   End
   Begin VB.Label LBLDESCRIPCION2 
      Height          =   225
      Left            =   3000
      TabIndex        =   5
      Top             =   120
      UseMnemonic     =   0   'False
      Width           =   1815
   End
   Begin VB.Label LBLDESCRIPCION 
      Height          =   225
      Left            =   60
      TabIndex        =   0
      Top             =   120
      UseMnemonic     =   0   'False
      Width           =   1815
   End
End
Attribute VB_Name = "FRMANADIRLENGUAJES"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub TRADUCIRINTERFAZ()
  Me.Caption = VARLENGUAJE(72)
  LBLDESCRIPCION.Caption = VARLENGUAJE(198)
  LBLDESCRIPCION2.Caption = VARLENGUAJE(199)
  CMDAPLICAR.Caption = VARLENGUAJE(2)
  CMDCERRAR.Caption = VARLENGUAJE(3)
End Sub

Private Sub CMDANADIR_Click()
  LSTLNGANADIDOS.AddItem LSTLNGDISPONIBLES.Text
  LSTLNGDISPONIBLES.RemoveItem LSTLNGDISPONIBLES.ListIndex
  CMDANADIR.Enabled = False
End Sub

Private Sub CMDAPLICAR_Click()
  Dim VARLSTLENGUAJES As Variant
  Dim I As Long
  VARLSTLENGUAJES = FRMCONFIGURACION.HASLENGUAJESCARRO.Keys
  
  For I = 1 To UBound(VARLSTLENGUAJES)
  
    FRMCONFIGURACION.HASLENGUAJESCARRO.Delete VARLSTLENGUAJES(I)
    
  
  Next I
  
  For I = 0 To LSTLNGANADIDOS.ListCount - 1
   
    FRMCONFIGURACION.HASLENGUAJESCARRO.Add LSTLNGANADIDOS.List(I), "SI"
   
   Next I
   FRMCONFIGURACION.LSTLENGUAJES.Clear
   VARLSTLENGUAJES = FRMCONFIGURACION.HASLENGUAJESCARRO.Keys
   For I = 1 To UBound(VARLSTLENGUAJES)
     FRMCONFIGURACION.LSTLENGUAJES.AddItem VARLSTLENGUAJES(I)
   Next I
   If FRMCONFIGURACION.HASLENGUAJESCARRO.ExistsKey(FRMCONFIGURACION.STRLENGUAJEPORDEFECTO & ".lng") = False Then
     FRMCONFIGURACION.STRLENGUAJEPORDEFECTO = ""
   End If
   FRMCONFIGURACION.CMDDISCLAIMER.Enabled = False
   FRMCONFIGURACION.CMDEDITARLICENCIA.Enabled = False
   FRMCONFIGURACION.CMDPAGPRICIPAL.Enabled = False

   
   Unload Me
End Sub

Private Sub CMDCERRAR_Click()
  Unload Me
End Sub

Private Sub CMDQUITAR_Click()
  LSTLNGDISPONIBLES.AddItem LSTLNGANADIDOS.Text
  LSTLNGANADIDOS.RemoveItem LSTLNGANADIDOS.ListIndex
  CMDQUITAR.Enabled = False
End Sub

Private Sub Form_Load()
  On Error Resume Next
  Dim VARLENGUAJESANADIDOS
  Dim Z As Long
  TRADUCIRINTERFAZ
  Me.Top = CInt(Screen.Height / 2) - CInt(Me.Height / 2)
  Me.Left = CInt(Screen.Width / 2) - CInt(Me.Width / 2)
  FRMMARROK.FLBLENGUAJE.Path = STRRUTA & "plantillas web\plantilla1\LANGUAGES"
  For Z = 0 To FRMMARROK.FLBLENGUAJE.ListCount - 1
    If UCase(Mid(FRMMARROK.FLBLENGUAJE.List(Z), Len(FRMMARROK.FLBLENGUAJE.List(Z)) - 3)) = ".LNG" And ESUNARCHIVODELENGUJEVALIDO(STRRUTA & "plantillas web\plantilla1\LANGUAGES\" & FRMMARROK.FLBLENGUAJE.List(Z)) = True And FRMCONFIGURACION.HASLENGUAJESCARRO.ExistsKey(FRMMARROK.FLBLENGUAJE.List(Z)) = False Then
      LSTLNGDISPONIBLES.AddItem FRMMARROK.FLBLENGUAJE.List(Z)
    End If
  Next Z
  VARLENGUAJESANADIDOS = FRMCONFIGURACION.HASLENGUAJESCARRO.Keys()
  For Z = 1 To UBound(VARLENGUAJESANADIDOS)
    LSTLNGANADIDOS.AddItem VARLENGUAJESANADIDOS(Z)
  
  Next Z
End Sub


Private Sub LSTLNGANADIDOS_Click()
  CMDQUITAR.Enabled = True
End Sub

Private Sub LSTLNGDISPONIBLES_Click()
  CMDANADIR.Enabled = True
End Sub
