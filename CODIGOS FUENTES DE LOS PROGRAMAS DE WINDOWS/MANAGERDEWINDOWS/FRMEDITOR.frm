VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "Comdlg32.ocx"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form FRMEDITOR 
   AutoRedraw      =   -1  'True
   ClientHeight    =   3090
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   4680
   Icon            =   "FRMEDITOR.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ImageList IMGLISTA 
      Left            =   2070
      Top             =   1260
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   7
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMEDITOR.frx":030A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMEDITOR.frx":084C
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMEDITOR.frx":0D8E
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMEDITOR.frx":12D0
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMEDITOR.frx":1812
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMEDITOR.frx":1D54
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FRMEDITOR.frx":2296
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar TLBBARRA 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   4680
      _ExtentX        =   8255
      _ExtentY        =   741
      ButtonWidth     =   609
      ButtonHeight    =   582
      Appearance      =   1
      ImageList       =   "IMGLISTA"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   10
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   3
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   4
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   5
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   6
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   7
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
         EndProperty
      EndProperty
      Begin MSComDlg.CommonDialog CMDCUADRO 
         Left            =   3510
         Top             =   90
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
   End
   Begin VB.Timer TRMTEMPO 
      Interval        =   100
      Left            =   1740
      Top             =   1320
   End
   Begin RichTextLib.RichTextBox RTXTEDITOR 
      Height          =   2835
      Left            =   0
      TabIndex        =   0
      Top             =   420
      Width           =   4635
      _ExtentX        =   8176
      _ExtentY        =   5001
      _Version        =   393217
      ScrollBars      =   3
      MaxLength       =   65000
      TextRTF         =   $"FRMEDITOR.frx":27D8
   End
   Begin VB.Menu MNARCHIVO 
      Caption         =   "A"
      Begin VB.Menu MNNUEVO 
         Caption         =   "B"
         Shortcut        =   ^N
      End
      Begin VB.Menu MNABRIR 
         Caption         =   "C"
         Shortcut        =   ^A
      End
      Begin VB.Menu MNGUARDAR 
         Caption         =   "D"
         Shortcut        =   ^G
      End
      Begin VB.Menu MNSEPARADOR 
         Caption         =   "-"
      End
      Begin VB.Menu MNSALIR 
         Caption         =   "E"
         Shortcut        =   ^S
      End
   End
   Begin VB.Menu MNEDICION 
      Caption         =   "G"
      Begin VB.Menu MNCOPIAR 
         Caption         =   "H"
         Shortcut        =   ^C
      End
      Begin VB.Menu MNCORTAR 
         Caption         =   "I"
         Shortcut        =   ^V
      End
      Begin VB.Menu MNPEGAR 
         Caption         =   "J"
         Shortcut        =   ^P
      End
      Begin VB.Menu MNSEPARADOR2 
         Caption         =   "-"
      End
      Begin VB.Menu MNBUSCAR 
         Caption         =   "K"
         Shortcut        =   ^B
      End
      Begin VB.Menu MNBUSCARSIGUIENTE 
         Caption         =   "Z"
         Shortcut        =   ^T
      End
      Begin VB.Menu MNREMPLAZAR 
         Caption         =   "M"
         Shortcut        =   ^R
      End
      Begin VB.Menu MNSEPARADOR5 
         Caption         =   "-"
      End
      Begin VB.Menu MNENLACE 
         Caption         =   "N"
         Shortcut        =   ^E
         Visible         =   0   'False
      End
      Begin VB.Menu MNPREVISUALIZAR 
         Caption         =   "O"
         Shortcut        =   ^W
      End
   End
End
Attribute VB_Name = "FRMEDITOR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public STRLENGUAJE As String
Public BYTTIPOTEXTO As Byte
Public STRTEXTO As String
Public STRCADBUSQUEDA As String
Public LNGPOSICIONUBUSQUEDA As Long
Public INTMAYUSCULAS As Integer

Private Sub TRADUCIRINTERFAZ()
  MNARCHIVO.Caption = VARLENGUAJE(33)
  MNNUEVO.Caption = VARLENGUAJE(208)
  MNABRIR.Caption = VARLENGUAJE(209)
  MNGUARDAR.Caption = VARLENGUAJE(210)
  MNSALIR.Caption = VARLENGUAJE(38)
  MNEDICION.Caption = VARLENGUAJE(211)
  MNCOPIAR.Caption = VARLENGUAJE(212)
  MNCORTAR.Caption = VARLENGUAJE(213)
  MNPEGAR.Caption = VARLENGUAJE(214)
  MNBUSCAR.Caption = VARLENGUAJE(215)
  MNBUSCARSIGUIENTE.Caption = VARLENGUAJE(226)
  MNREMPLAZAR.Caption = VARLENGUAJE(216)
  MNENLACE.Caption = VARLENGUAJE(217)
  MNPREVISUALIZAR.Caption = VARLENGUAJE(40)
  TLBBARRA.Buttons(1).ToolTipText = VARLENGUAJE(208)
  TLBBARRA.Buttons(2).ToolTipText = VARLENGUAJE(209)
  TLBBARRA.Buttons(3).ToolTipText = VARLENGUAJE(210)
  TLBBARRA.Buttons(5).ToolTipText = VARLENGUAJE(212)
  TLBBARRA.Buttons(6).ToolTipText = VARLENGUAJE(213)
  TLBBARRA.Buttons(7).ToolTipText = VARLENGUAJE(214)
  TLBBARRA.Buttons(9).ToolTipText = VARLENGUAJE(40)
  TLBBARRA.Buttons(10).ToolTipText = VARLENGUAJE(217)


End Sub
Private Sub Form_Load()
  TRADUCIRINTERFAZ
  Me.Top = CInt(Screen.Height / 2) - CInt(Me.Height / 2)
  Me.Left = CInt(Screen.Width / 2) - CInt(Me.Width / 2)
  STRLENGUAJE = ""
  BYTTIPOTEXTO = 1
  STRTEXTO = ""
  If RTXTEDITOR.SelText <> "" Then
    MNCOPIAR.Enabled = True
    MNCORTAR.Enabled = True
    TLBBARRA.Buttons(5).Enabled = True
    TLBBARRA.Buttons(6).Enabled = True
  
  Else
    MNCOPIAR.Enabled = False
    MNCORTAR.Enabled = False
    TLBBARRA.Buttons(5).Enabled = False
    TLBBARRA.Buttons(6).Enabled = False

  End If
  
  If Clipboard.GetText() <> "" Then
    MNPEGAR.Enabled = True
    TLBBARRA.Buttons(7).Enabled = True
  Else
    MNPEGAR.Enabled = False
    TLBBARRA.Buttons(7).Enabled = False
  End If
  MNBUSCARSIGUIENTE.Enabled = False
End Sub

Private Sub Form_Resize()
  RTXTEDITOR.Move 0, 420, ScaleWidth, ScaleHeight - 420
End Sub
Public Sub CARGARTEXTO()
  On Error GoTo CAMPO
  Dim DBREGISTRO As Database
  Dim RSTABLA As Recordset
  Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("CONTENIDOSPAGINA", dbOpenTable)
  RSTABLA.Index = "archivolenguaje"
  RSTABLA.Seek "=", STRLENGUAJE
  If RSTABLA.NoMatch = True Then
    RTXTEDITOR.Text = ""
    STRTEXTO = ""
  Else
    If BYTTIPOTEXTO = 1 Then
      If isnull(RSTABLA.Fields("textodisclaimer")) = False Then
        RTXTEDITOR.Text = RSTABLA.Fields("textodisclaimer")
        STRTEXTO = RSTABLA.Fields("textodisclaimer")
      End If
    ElseIf BYTTIPOTEXTO = 2 Then
      If isnull(RSTABLA.Fields("textolicencia")) = False Then
        RTXTEDITOR.Text = RSTABLA.Fields("textolicencia")
        STRTEXTO = RSTABLA.Fields("textolicencia")
      End If
    Else
      If isnull(RSTABLA.Fields("contenidopagprincipal")) = False Then
    
        RTXTEDITOR.Text = RSTABLA.Fields("contenidopagprincipal")
        STRTEXTO = RSTABLA.Fields("contenidopagprincipal")
      End If
    End If
  End If
  If BYTTIPOTEXTO <> 3 Then
    MNSEPARADOR5.Visible = False
    MNPREVISUALIZAR.Visible = False
    MNENLACE.Visible = False
    TLBBARRA.Buttons(9).Visible = False
    TLBBARRA.Buttons(10).Visible = False
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
  If MsgBox(VARLENGUAJE(197), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
  On Error Resume Next
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  Unload Me
End Sub

Private Sub MNABRIR_Click()
  ABRIRARCHIVODETEXTO
End Sub

Private Sub MNBUSCAR_Click()
  Load FRMBUSCAR
  FRMBUSCAR.Show (1)
End Sub

Private Sub MNBUSCARSIGUIENTE_Click()
  Dim LNGUPOSICION As Long
  

  If INTMAYUSCULAS = 1 Then
  
    LNGUPOSICION = InStr(LNGPOSICIONUBUSQUEDA + 1, RTXTEDITOR.Text, STRCADBUSQUEDA, vbBinaryCompare)
  Else
    LNGUPOSICION = InStr(LNGPOSICIONUBUSQUEDA + 1, RTXTEDITOR.Text, STRCADBUSQUEDA, vbTextCompare)
  End If
  
  If LNGUPOSICION <= 0 Then
    
    MsgBox VARLENGUAJE(225), vbInformation, NOMBRE_DEL_PROGRAMA
    LNGPOSICIONUBUSQUEDA = 0
 
  Else
    RTXTEDITOR.SelStart = LNGUPOSICION - 1
    RTXTEDITOR.SelLength = Len(STRCADBUSQUEDA)
    LNGPOSICIONUBUSQUEDA = LNGUPOSICION

  End If
End Sub

Private Sub MNCOPIAR_Click()
  Clipboard.SetText RTXTEDITOR.SelText
End Sub

Private Sub MNCORTAR_Click()
  Clipboard.SetText RTXTEDITOR.SelText
  RTXTEDITOR.SelText = ""
End Sub




Private Sub MNGUARDAR_Click()
  GUARDARTEXTO
End Sub

Private Sub MNNUEVO_Click()
  NUEVOARCHIVOTEXTO
End Sub

Private Sub MNPEGAR_Click()
  RTXTEDITOR.SelText = Clipboard.GetText
End Sub

Private Sub MNPREVISUALIZAR_Click()
  On Error Resume Next
  Dim STRRUTAARCHIVO As String
  Dim VBSUUTILIDADES As New VBSUtilidades.VBSUtils
  Dim INTRETVAL As Integer
  Dim BOLRETVAL As Boolean
  Dim INTCL As Integer
  STRRUTAARCHIVO = TempDirectory()
  STRRUTAARCHIVO = STRRUTAARCHIVO & "wzytempo.htm"
  INTRETVAL = vbRetry
  Do
  
    INTCL = FreeFile
    INTRETVAL = vbCancel
    Open STRRUTAARCHIVO For Output As INTCL
    If Err.Number <> 0 Then
    
      Err.Clear
      If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
        INTRETVAL = vbRetry
      Else
        INTRETVAL = vbCancel
        Exit Sub
      End If
    End If
  Loop While (INTRETVAL = vbRetry)
  
  
  Do
    INTRETVAL = vbCancel
    Print #INTCL, FRMEDITOR.RTXTEDITOR.Text
    If Err.Number <> 0 Then
    
      Err.Clear
      If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
        INTRETVAL = vbRetry
      Else
        Close #INTCL
        INTRETVAL = vbCancel
        Exit Sub
      End If
    End If
  Loop While (INTRETVAL = vbRetry)
  
  Do
  
    INTRETVAL = vbCancel
    Close #INTCL
    If Err.Number <> 0 Then
    
      Err.Clear
      If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
        INTRETVAL = vbRetry
      Else
        INTRETVAL = vbCancel
        Exit Sub
      End If
    End If
  Loop While (INTRETVAL = vbRetry)
  
  If Trim(VBSUUTILIDADES.EjecutableAsociado(STRRUTAARCHIVO)) = "" Then
  
    MsgBox VARLENGUAJE(223), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
 
  End If
  BOLRETVAL = VBSUUTILIDADES.ShellSinc(VBSUUTILIDADES.EjecutableAsociado(STRRUTAARCHIVO) & " " & STRRUTAARCHIVO)
End Sub

Private Sub MNREMPLAZAR_Click()
  Load FRMREMPLAZAR
  FRMREMPLAZAR.Show (1)
End Sub

Private Sub MNSALIR_Click()
  Unload Me
End Sub



Private Sub RTXTEDITOR_KeyPress(KeyAscii As Integer)
  If FRMEDITOR.BYTTIPOTEXTO <> 3 And (Chr(KeyAscii) = "<" Or Chr(KeyAscii) = ">") Then
    MsgBox VARLENGUAJE(220), vbExclamation, NOMBRE_DEL_PROGRAMA
    KeyAscii = 0
  End If
End Sub

Private Sub TLBBARRA_ButtonClick(ByVal Button As MSComctlLib.Button)
  If Button.Index = 1 Then
    NUEVOARCHIVOTEXTO
  ElseIf Button.Index = 2 Then
    ABRIRARCHIVODETEXTO
  ElseIf Button.Index = 3 Then
     GUARDARTEXTO
  ElseIf Button.Index = 5 Then
     MNCOPIAR_Click
  ElseIf Button.Index = 6 Then
     MNCORTAR_Click
  ElseIf Button.Index = 7 Then
     MNPEGAR_Click
  ElseIf Button.Index = 9 Then
    MNPREVISUALIZAR_Click
  End If
End Sub

Private Sub TRMTEMPO_Timer()
  On Error GoTo CAMPO:
  If RTXTEDITOR.SelText <> "" Then
    MNCOPIAR.Enabled = True
    MNCORTAR.Enabled = True
    TLBBARRA.Buttons(5).Enabled = True
    TLBBARRA.Buttons(6).Enabled = True
  
  Else
    MNCOPIAR.Enabled = False
    MNCORTAR.Enabled = False
    TLBBARRA.Buttons(5).Enabled = False
    TLBBARRA.Buttons(6).Enabled = False

  End If
  
  If Clipboard.GetText() <> "" Then
    MNPEGAR.Enabled = True
    TLBBARRA.Buttons(7).Enabled = True
  Else
    MNPEGAR.Enabled = False
    TLBBARRA.Buttons(7).Enabled = False
  End If
  Exit Sub
CAMPO:
End Sub
