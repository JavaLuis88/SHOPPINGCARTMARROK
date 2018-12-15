VERSION 5.00
Begin VB.Form FRMPRESENTACION 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00000000&
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   5835
   ClientLeft      =   45
   ClientTop       =   45
   ClientWidth     =   6465
   ControlBox      =   0   'False
   Icon            =   "FRMPRESENTACION.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5835
   ScaleWidth      =   6465
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer TMRTEMPORIZADOR 
      Enabled         =   0   'False
      Interval        =   2500
      Left            =   3840
      Top             =   1290
   End
   Begin VB.Label LBLDESCRIPCION3 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "Marrok Shoping Cart"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   27.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   675
      Left            =   30
      TabIndex        =   2
      Top             =   30
      Width           =   6435
   End
   Begin VB.Label LBLDESCRIPCION2 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H000000FF&
      Height          =   525
      Left            =   30
      TabIndex        =   1
      Top             =   5280
      UseMnemonic     =   0   'False
      Width           =   6405
   End
   Begin VB.Image IMGPRESENTACION 
      Height          =   4275
      Left            =   0
      Picture         =   "FRMPRESENTACION.frx":030A
      Stretch         =   -1  'True
      Top             =   660
      Width           =   6465
   End
   Begin VB.Label LBLDESCRIPCION 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   30
      TabIndex        =   0
      Top             =   4980
      UseMnemonic     =   0   'False
      Width           =   6405
   End
End
Attribute VB_Name = "FRMPRESENTACION"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Sub TRADUCIRINTERFAZ()

  LBLDESCRIPCION2.Caption = NOMBRE_DEL_PROGRAMA & " V0.91 " & VARLENGUAJE(305) & Chr(13) & Chr(10) & VARLENGUAJE(306)
  LBLDESCRIPCION3.Caption = NOMBRE_DEL_PROGRAMA

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
  TMRTEMPORIZADOR.Enabled = True
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
TMRTEMPORIZADOR.Enabled = True
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
TMRTEMPORIZADOR.Enabled = True
Exit Sub
End Sub

Private Sub TMRTEMPORIZADOR_Timer()
  Unload Me
End Sub
