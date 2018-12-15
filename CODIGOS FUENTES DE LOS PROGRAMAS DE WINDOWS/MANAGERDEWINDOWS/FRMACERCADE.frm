VERSION 5.00
Begin VB.Form FRMACERCADE 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00000000&
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   6585
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6480
   Icon            =   "FRMACERCADE.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6585
   ScaleWidth      =   6480
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox TXTCREDITOS 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      ForeColor       =   &H000000FF&
      Height          =   1305
      Left            =   30
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   2
      Top             =   5250
      Width           =   6405
   End
   Begin VB.Label LBLDESCRIPCION 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   30
      TabIndex        =   1
      Top             =   4950
      UseMnemonic     =   0   'False
      Width           =   6405
   End
   Begin VB.Image IMGPRESENTACION 
      Height          =   4275
      Left            =   0
      Picture         =   "FRMACERCADE.frx":030A
      Stretch         =   -1  'True
      Top             =   630
      Width           =   6465
   End
   Begin VB.Label LBLDESCRIPCION3 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "Marrok Shoping Cart"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   27.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   675
      Left            =   30
      TabIndex        =   0
      Top             =   0
      Width           =   6435
   End
End
Attribute VB_Name = "FRMACERCADE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Sub TRADUCIRINTERFAZ()


  Me.Caption = VARLENGUAJE(46)
  TXTCREDITOS.Text = NOMBRE_DEL_PROGRAMA & " V0.91 " & VARLENGUAJE(305) & Chr(13) & Chr(10) & VARLENGUAJE(306) & Chr(13) & Chr(10) & VARLENGUAJE(307) & Chr(13) & Chr(10) & VARLENGUAJE(308) & Chr(13) & Chr(10) & VARLENGUAJE(309) & Chr(13) & Chr(10) & VARLENGUAJE(317) & Chr(13) & Chr(10) & VARLENGUAJE(310) & Chr(13) & Chr(10) & VARLENGUAJE(311) & Chr(13) & Chr(10) & VARLENGUAJE(318) & Chr(13) & Chr(10) & VARLENGUAJE(312)

End Sub

Private Sub Form_Load()
On Error GoTo CAMPO:
Dim DBREGISTRO As Database
Dim RSTABLA As Recordset
Dim STRBASEDATOS As String

TRADUCIRINTERFAZ
Me.Top = CInt(Screen.Height / 2) - CInt(Me.Height / 2)
Me.Left = CInt(Screen.Width / 2) - CInt(Me.Width / 2)
FRMPRESENTACION.Caption = NOMBRE_DEL_PROGRAMA
STRBASEDATOS = SystemDirectory() & "WCR32.DLL"
If ExistsFile(STRBASEDATOS) = False Then
  LBLDESCRIPCION.Caption = VARLENGUAJE(303) & VARLENGUAJE(304)
  Exit Sub
End If
Set DBREGISTRO = OpenDatabase(STRBASEDATOS, False, False, "; user=admin;pwd=natmasvat")
Set RSTABLA = DBREGISTRO.OpenRecordset("WCPRODUCTS", dbOpenTable)
RSTABLA.Index = "IDPRODUCTO"
RSTABLA.Seek "=", "MSC0.9"
If RSTABLA.NoMatch = True Then
  LBLDESCRIPCION.Caption = VARLENGUAJE(303) & VARLENGUAJE(304)
ElseIf ESTAREGISTRADO(RSTABLA.Fields("LOGIN"), RSTABLA.Fields("PASSWORD")) = True Then
  LBLDESCRIPCION.Caption = VARLENGUAJE(303) & RSTABLA.Fields("LOGIN")
Else
  LBLDESCRIPCION.Caption = VARLENGUAJE(303) & VARLENGUAJE(304)
End If
RSTABLA.Close
DBREGISTRO.Close
Set RSTABLA = Nothing
Set DBREGISTRO = Nothing
Exit Sub
CAMPO:
If Err.Number = 3260 Or Err.Number = 3050 Then
  Resume
  Exit Sub
End If
On Error Resume Next
RSTABLA.Close
DBREGISTRO.Close
Set RSTABLA = Nothing
Set DBREGISTRO = Nothing
Exit Sub
End Sub


