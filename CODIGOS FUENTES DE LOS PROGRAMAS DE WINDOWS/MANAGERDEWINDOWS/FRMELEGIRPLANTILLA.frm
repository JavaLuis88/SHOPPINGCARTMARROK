VERSION 5.00
Begin VB.Form FRMELEGIRPLANTILLA 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   3420
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9390
   Icon            =   "FRMELEGIRPLANTILLA.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3420
   ScaleWidth      =   9390
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox LSTPLANTILLAS 
      Height          =   3375
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   3255
   End
   Begin VB.CommandButton CMDABRIR 
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   525
      Left            =   7770
      TabIndex        =   1
      Top             =   1110
      Width           =   1455
   End
   Begin VB.CommandButton CMDCERRAR 
      Cancel          =   -1  'True
      Height          =   525
      Left            =   7800
      TabIndex        =   0
      Top             =   1800
      Width           =   1425
   End
   Begin VB.Label LBLDESCRIPCIONPLANTILLAS 
      BorderStyle     =   1  'Fixed Single
      Height          =   3405
      Left            =   3300
      TabIndex        =   3
      Top             =   0
      Width           =   4305
   End
End
Attribute VB_Name = "FRMELEGIRPLANTILLA"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub TRADUCIRINTERFAZ()

  Me.Caption = VARLENGUAJE(319)
  CMDABRIR.Caption = VARLENGUAJE(57)
  CMDCERRAR.Caption = VARLENGUAJE(3)
  LBLDESCRIPCIONPLANTILLAS.Caption = VARLENGUAJE(320)
End Sub

Private Sub MOSTRARLISTAPLANTILLAS()
 
  Dim FSOARCHIVOS As New Scripting.FileSystemObject
  Dim I As Byte

  LSTPLANTILLAS.AddItem ("plantilla1")
  LSTPLANTILLAS.AddItem ("plantilla2")
  

  For I = 11 To 99
  
  
    If FSOARCHIVOS.FolderExists(STRRUTA & "plantillas web\plantilla" & I) = True And VERIFICARPLANTILLA2(STRRUTA & "plantillas web\plantilla" & I) = True Then
  
      LSTPLANTILLAS.AddItem ("plantilla" & I)
      
  
    End If
  Next I

End Sub

Private Sub MOSTRARINFORMACIONDELAPLANTILLA(ByVal STRPLANTILLA As String)

  If UCase(STRPLANTILLA) = "PLANTILLA1" Then
    LBLDESCRIPCIONPLANTILLAS.Caption = VARLENGUAJE(322)
  ElseIf UCase(STRPLANTILLA) = "PLANTILLA2" Then
    LBLDESCRIPCIONPLANTILLAS.Caption = VARLENGUAJE(323)
  Else

    If ExistsFile(STRRUTA & "plantillas web\" & STRPLANTILLA & "\configshop.edb") = False Then
           
      LBLDESCRIPCIONPLANTILLAS.Caption = VARLENGUAJE(321)
      Exit Sub
    
    End If

    If CARGARVERSIONPLANTILLA(STRRUTA & "plantillas web\" & STRPLANTILLA & "\configshop.edb") = False Then
      LBLDESCRIPCIONPLANTILLAS.Caption = VARLENGUAJE(321)
    Else
      If SNGVERSIONPLANTILLA = 0.91 Then
        LBLDESCRIPCIONPLANTILLAS.Caption = VARLENGUAJE(324)
      
      
      End If
    End If
  End If


End Sub

Private Sub CMDABRIR_Click()
  STRPLANTILLAELEGIDA = LSTPLANTILLAS.Text
  Unload Me
End Sub

Private Sub CMDCERRAR_Click()
  STRPLANTILLAELEGIDA = ""
  Unload Me
End Sub

Private Sub Form_Load()
  TRADUCIRINTERFAZ
  MOSTRARLISTAPLANTILLAS
  Me.Top = CInt(Screen.Height / 2) - CInt(Me.Height / 2)
  Me.Left = CInt(Screen.Width / 2) - CInt(Me.Width / 2)
End Sub

Private Sub LSTPLANTILLAS_Click()
  If Trim(LSTPLANTILLAS.Text) <> "" Then
  
    MOSTRARINFORMACIONDELAPLANTILLA (LSTPLANTILLAS.Text)
    
    If ExistsFile(STRRUTA & "plantillas web\" & LSTPLANTILLAS.Text & "\configshop.edb") = False Then
           
      CMDABRIR.Enabled = False
      Exit Sub
    
    ElseIf UCase(LSTPLANTILLAS.Text) <> "PLANTILLA1" And CARGARVERSIONPLANTILLA(STRRUTA & "plantillas web\" & LSTPLANTILLAS.Text & "\configshop.edb") = False Then
    
      CMDABRIR.Enabled = False
      Exit Sub
    Else
      CMDABRIR.Enabled = True
      Exit Sub

    End If
     
  Else
    CMDABRIR.Enabled = False
  End If
End Sub

