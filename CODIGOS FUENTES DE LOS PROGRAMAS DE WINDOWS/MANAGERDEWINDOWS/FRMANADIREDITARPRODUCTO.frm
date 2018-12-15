VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "Comdlg32.ocx"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Begin VB.Form FRMANADIREDITARPRODUCTO 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   5925
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4710
   Icon            =   "FRMANADIREDITARPRODUCTO.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5925
   ScaleWidth      =   4710
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton CMDCERRAR 
      Cancel          =   -1  'True
      Height          =   345
      Left            =   2340
      TabIndex        =   17
      Top             =   5490
      Width           =   1275
   End
   Begin VB.CommandButton CMDAPLICAR 
      Default         =   -1  'True
      Height          =   345
      Left            =   960
      TabIndex        =   16
      Top             =   5490
      Width           =   1275
   End
   Begin VB.Frame FRAPESTANA3 
      Height          =   5025
      Left            =   30
      TabIndex        =   33
      Top             =   330
      Visible         =   0   'False
      Width           =   4635
      Begin MSComDlg.CommonDialog CMDCUADRO 
         Left            =   960
         Top             =   1530
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.Frame FRAADORNO2 
         Height          =   1185
         Left            =   90
         TabIndex        =   39
         Top             =   2880
         Width           =   4455
         Begin VB.TextBox TXTIMAGEN 
            BackColor       =   &H8000000F&
            Enabled         =   0   'False
            Height          =   285
            Left            =   1710
            Locked          =   -1  'True
            TabIndex        =   41
            TabStop         =   0   'False
            Top             =   240
            Width           =   2625
         End
         Begin VB.CommandButton CMDEXAMINAR 
            Height          =   405
            Left            =   1680
            TabIndex        =   40
            Top             =   660
            Width           =   1275
         End
         Begin VB.Label LBLDESCRIPCION16 
            Alignment       =   1  'Right Justify
            Height          =   225
            Left            =   120
            TabIndex        =   42
            Top             =   270
            UseMnemonic     =   0   'False
            Width           =   1515
         End
      End
      Begin VB.TextBox TXTDESCRIPCION 
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   1800
         MaxLength       =   55
         TabIndex        =   15
         Top             =   2490
         Width           =   2625
      End
      Begin VB.TextBox TXTALTER 
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   1800
         MaxLength       =   25
         TabIndex        =   14
         Top             =   2100
         Width           =   2625
      End
      Begin VB.TextBox TXTCOPY 
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   1800
         MaxLength       =   55
         TabIndex        =   13
         Top             =   1710
         Width           =   2625
      End
      Begin VB.TextBox TXTIMAGENID 
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   1800
         MaxLength       =   25
         TabIndex        =   12
         Top             =   1320
         Width           =   2625
      End
      Begin VB.TextBox TXTNOMBREIMAGEN 
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   1800
         MaxLength       =   25
         TabIndex        =   11
         Top             =   900
         Width           =   2625
      End
      Begin VB.CheckBox CHKINCLUIRIMAGEN 
         Height          =   315
         Left            =   210
         TabIndex        =   10
         Top             =   390
         Width           =   2145
      End
      Begin VB.Label LBLDESCRIPCION15 
         Alignment       =   1  'Right Justify
         Height          =   225
         Left            =   210
         TabIndex        =   38
         Top             =   2520
         UseMnemonic     =   0   'False
         Width           =   1515
      End
      Begin VB.Label LBLDESCRIPCION14 
         Alignment       =   1  'Right Justify
         Height          =   225
         Left            =   210
         TabIndex        =   37
         Top             =   2130
         UseMnemonic     =   0   'False
         Width           =   1515
      End
      Begin VB.Label LBLDESCRIPCION13 
         Alignment       =   1  'Right Justify
         Height          =   225
         Left            =   210
         TabIndex        =   36
         Top             =   1740
         UseMnemonic     =   0   'False
         Width           =   1515
      End
      Begin VB.Label LBLDESCRIPCION12 
         Alignment       =   1  'Right Justify
         Height          =   225
         Left            =   210
         TabIndex        =   35
         Top             =   1350
         UseMnemonic     =   0   'False
         Width           =   1515
      End
      Begin VB.Label LBLDESCRIPCION11 
         Alignment       =   1  'Right Justify
         Height          =   225
         Left            =   210
         TabIndex        =   34
         Top             =   930
         UseMnemonic     =   0   'False
         Width           =   1515
      End
   End
   Begin VB.Frame FRAPESTANA2 
      Height          =   5025
      Left            =   30
      TabIndex        =   19
      Top             =   330
      Visible         =   0   'False
      Width           =   4635
      Begin VB.Frame FRAADORNO 
         Height          =   2025
         Left            =   150
         TabIndex        =   43
         Top             =   210
         Width           =   4275
         Begin VB.CommandButton CMDBORRAR 
            Enabled         =   0   'False
            Height          =   405
            Left            =   2610
            TabIndex        =   46
            Top             =   750
            Width           =   1515
         End
         Begin VB.CommandButton CMDANADIR 
            Height          =   405
            Left            =   2610
            TabIndex        =   45
            Top             =   240
            Width           =   1515
         End
         Begin VB.ListBox LSTMODELOS 
            Height          =   1620
            Left            =   150
            TabIndex        =   44
            Top             =   240
            Width           =   2355
         End
      End
      Begin VB.TextBox TXTIVA 
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   405
         Left            =   1740
         Locked          =   -1  'True
         TabIndex        =   32
         TabStop         =   0   'False
         Text            =   "0"
         Top             =   4380
         Width           =   465
      End
      Begin MSComCtl2.UpDown UPDDESCUENTO 
         Height          =   555
         Left            =   2220
         TabIndex        =   9
         Top             =   3750
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   979
         _Version        =   393216
         Max             =   99
         Enabled         =   0   'False
      End
      Begin VB.TextBox TXTDESCUENTO 
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   405
         Left            =   1740
         Locked          =   -1  'True
         TabIndex        =   31
         TabStop         =   0   'False
         Text            =   "0"
         Top             =   3780
         Width           =   465
      End
      Begin VB.TextBox TXTPRECIO2 
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   1740
         MaxLength       =   7
         TabIndex        =   8
         Top             =   3330
         Width           =   2685
      End
      Begin VB.TextBox TXTPRECIO 
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   1740
         MaxLength       =   7
         TabIndex        =   7
         Top             =   2880
         Width           =   2685
      End
      Begin VB.TextBox TXTMODELO 
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   1740
         MaxLength       =   55
         TabIndex        =   6
         Top             =   2460
         Width           =   2685
      End
      Begin MSComCtl2.UpDown UPDIVA 
         Height          =   555
         Left            =   2220
         TabIndex        =   18
         Top             =   4350
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   979
         _Version        =   393216
         Max             =   99
         Enabled         =   0   'False
      End
      Begin VB.Label LBLDESCRIPCION10 
         Alignment       =   1  'Right Justify
         Height          =   225
         Left            =   150
         TabIndex        =   30
         Top             =   4440
         UseMnemonic     =   0   'False
         Width           =   1515
      End
      Begin VB.Label LBLDESCRIPCION9 
         Alignment       =   1  'Right Justify
         Height          =   225
         Left            =   150
         TabIndex        =   29
         Top             =   3870
         UseMnemonic     =   0   'False
         Width           =   1515
      End
      Begin VB.Label LBLDESCRIPCION8 
         Alignment       =   1  'Right Justify
         Height          =   225
         Left            =   150
         TabIndex        =   28
         Top             =   3360
         UseMnemonic     =   0   'False
         Width           =   1515
      End
      Begin VB.Label LBLDESCRIPCION7 
         Alignment       =   1  'Right Justify
         Height          =   225
         Left            =   150
         TabIndex        =   27
         Top             =   2910
         UseMnemonic     =   0   'False
         Width           =   1515
      End
      Begin VB.Label LBLDESCRIPCION6 
         Alignment       =   1  'Right Justify
         Height          =   225
         Left            =   150
         TabIndex        =   26
         Top             =   2490
         UseMnemonic     =   0   'False
         Width           =   1515
      End
   End
   Begin VB.Frame FRAPESTANA 
      Height          =   5025
      Left            =   30
      TabIndex        =   20
      Top             =   330
      Width           =   4545
      Begin RichTextLib.RichTextBox RTXTDESCRIPCION 
         Height          =   2445
         Left            =   120
         TabIndex        =   5
         Top             =   2460
         Width           =   4305
         _ExtentX        =   7594
         _ExtentY        =   4313
         _Version        =   393217
         MaxLength       =   65000
         TextRTF         =   $"FRMANADIREDITARPRODUCTO.frx":030A
      End
      Begin VB.TextBox TXTSUBCATEGORIA 
         Height          =   285
         Left            =   1770
         MaxLength       =   55
         TabIndex        =   4
         Top             =   1620
         Width           =   2625
      End
      Begin VB.TextBox TXTCATEGORIA 
         Height          =   285
         Left            =   1770
         MaxLength       =   55
         TabIndex        =   3
         Top             =   1170
         Width           =   2625
      End
      Begin VB.TextBox TXTID 
         Height          =   285
         Left            =   1770
         MaxLength       =   25
         TabIndex        =   2
         Top             =   720
         Width           =   2625
      End
      Begin VB.TextBox TXTNOMBRE 
         Height          =   285
         Left            =   1770
         MaxLength       =   55
         TabIndex        =   1
         Top             =   270
         Width           =   2625
      End
      Begin VB.Label LBLDESCRIPCION5 
         Alignment       =   2  'Center
         Height          =   225
         Left            =   150
         TabIndex        =   25
         Top             =   2070
         UseMnemonic     =   0   'False
         Width           =   4245
      End
      Begin VB.Label LBLDESCRIPCION4 
         Alignment       =   1  'Right Justify
         Height          =   225
         Left            =   150
         TabIndex        =   24
         Top             =   1650
         UseMnemonic     =   0   'False
         Width           =   1545
      End
      Begin VB.Label LBLDESCRIPCION3 
         Alignment       =   1  'Right Justify
         Height          =   225
         Left            =   150
         TabIndex        =   23
         Top             =   1200
         UseMnemonic     =   0   'False
         Width           =   1545
      End
      Begin VB.Label LBLDESCRIPCION2 
         Alignment       =   1  'Right Justify
         Height          =   225
         Left            =   150
         TabIndex        =   22
         Top             =   750
         UseMnemonic     =   0   'False
         Width           =   1545
      End
      Begin VB.Label LBLDESCRIPCION 
         Alignment       =   1  'Right Justify
         Height          =   225
         Left            =   150
         TabIndex        =   21
         Top             =   300
         UseMnemonic     =   0   'False
         Width           =   1545
      End
   End
   Begin MSComctlLib.TabStrip TABPESTANA 
      Height          =   5925
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4695
      _ExtentX        =   8281
      _ExtentY        =   10451
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   3
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "FRMANADIREDITARPRODUCTO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim STRMMODELOS() As STRUCMODELO
Dim LNGNMODELOS As Long

Private Type STRUCMODELO

  STRMODELO As String * 55
  STRPRECIO As String * 55
  STRPRECIO2 As String * 55
  BYTDESCUENTO As Byte
  BYTIVA As Byte
  

End Type

Public Sub ANADIRMODELO(STRMODELO As String, DBLPRECIO As Double, DBLPRECIO2 As Double, BYTDESCUENTO As Byte, BYTIVA As Byte)

  ReDim Preserve STRMMODELOS(LNGNMODELOS)
  STRMMODELOS(LNGNMODELOS).STRMODELO = STRMODELO
  STRMMODELOS(LNGNMODELOS).STRPRECIO = CStr(DBLPRECIO)
  STRMMODELOS(LNGNMODELOS).STRPRECIO2 = CStr(DBLPRECIO2)
  STRMMODELOS(LNGNMODELOS).BYTDESCUENTO = BYTDESCUENTO
  STRMMODELOS(LNGNMODELOS).BYTIVA = BYTIVA
  LNGNMODELOS = LNGNMODELOS + 1
  LSTMODELOS.AddItem LNGNMODELOS & " " & STRMODELO
  If LNGNMODELOS >= 3 Then
    CMDANADIR.Enabled = False
  End If
End Sub

Private Sub ACTUALIZARLISTAMODELOS()
  Dim I As Long
  
  LSTMODELOS.Clear
  
  For I = 0 To LNGNMODELOS - 1
    LSTMODELOS.AddItem (I + 1) & " " & STRMMODELOS(I).STRMODELO
  Next I

End Sub


Private Sub TRADUCIRINTERFAZ()
  Me.Caption = VARLENGUAJE(244)
  LBLDESCRIPCION.Caption = VARLENGUAJE(235) & ":"
  LBLDESCRIPCION2.Caption = VARLENGUAJE(236) & ":"
  LBLDESCRIPCION3.Caption = VARLENGUAJE(237) & ":"
  LBLDESCRIPCION4.Caption = VARLENGUAJE(238) & ":"
  LBLDESCRIPCION5.Caption = VARLENGUAJE(239) & ":"
  LBLDESCRIPCION6.Caption = VARLENGUAJE(246) & ":"
  LBLDESCRIPCION7.Caption = VARLENGUAJE(120) & ":"
  LBLDESCRIPCION8.Caption = VARLENGUAJE(121) & ":"
  LBLDESCRIPCION9.Caption = VARLENGUAJE(248)
  LBLDESCRIPCION10.Caption = VARLENGUAJE(249)
  CMDANADIR.Caption = VARLENGUAJE(240)
  CMDBORRAR.Caption = VARLENGUAJE(59)
  CHKINCLUIRIMAGEN.Caption = VARLENGUAJE(250)
  LBLDESCRIPCION11.Caption = VARLENGUAJE(251)
  LBLDESCRIPCION12.Caption = VARLENGUAJE(252)
  LBLDESCRIPCION13.Caption = VARLENGUAJE(253)
  LBLDESCRIPCION14.Caption = VARLENGUAJE(254)
  LBLDESCRIPCION15.Caption = VARLENGUAJE(255)
  LBLDESCRIPCION16.Caption = VARLENGUAJE(33) & ":"
  CMDEXAMINAR.Caption = VARLENGUAJE(19)
  CMDAPLICAR.Caption = VARLENGUAJE(2)
  CMDCERRAR.Caption = VARLENGUAJE(3)
End Sub

Private Sub CHKINCLUIRIMAGEN_Click()
  If CHKINCLUIRIMAGEN.Value = 1 Then
    TXTNOMBREIMAGEN.Enabled = True
    TXTIMAGENID.Enabled = True
    TXTCOPY.Enabled = True
    TXTALTER.Enabled = True
    TXTDESCRIPCION.Enabled = True
    TXTIMAGEN.Enabled = True
    CMDEXAMINAR.Enabled = True
    TXTNOMBREIMAGEN.BackColor = &H80000005
    TXTIMAGENID.BackColor = &H80000005
    TXTCOPY.BackColor = &H80000005
    TXTALTER.BackColor = &H80000005
    TXTDESCRIPCION.BackColor = &H80000005
    TXTIMAGEN.BackColor = &H80000005
  Else
    TXTNOMBREIMAGEN.Enabled = False
    TXTIMAGENID.Enabled = False
    TXTCOPY.Enabled = False
    TXTALTER.Enabled = False
    TXTDESCRIPCION.Enabled = False
    TXTDESCRIPCION.Enabled = False
    CMDEXAMINAR.Enabled = False
    TXTNOMBREIMAGEN.BackColor = &H8000000F
    TXTIMAGENID.BackColor = &H8000000F
    TXTCOPY.BackColor = &H8000000F
    TXTALTER.BackColor = &H8000000F
    TXTDESCRIPCION.BackColor = &H8000000F
    TXTIMAGEN.BackColor = &H8000000F
  
  End If
End Sub

Private Sub CMDANADIR_Click()

  ANADIRMODELO "", 0, 0, 0, 0
  LSTMODELOS.ListIndex = LNGNMODELOS - 1

End Sub



Private Sub CMDAPLICAR_Click()
  On Error GoTo CAMPO
  Dim DBREGISTRO As Database
  Dim RSTABLA As Recordset
  Dim I As Long
  
  
  If Trim(TXTNOMBRE.Text) = "" Then
  
    MsgBox VARLENGUAJE(258), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  
  If Trim(TXTID.Text) = "" Then
  
    MsgBox VARLENGUAJE(259), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
   
  If Trim(TXTCATEGORIA.Text) = "" Then
  
    MsgBox VARLENGUAJE(260), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  If Trim(TXTSUBCATEGORIA.Text) = "" Then
  
    MsgBox VARLENGUAJE(261), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
 
  
  If LNGNMODELOS < 1 Then
    MsgBox VARLENGUAJE(262), vbExclamation, NOMBRE_DEL_PROGRAMA
    Exit Sub
  End If
  
  
  For I = 0 To LNGNMODELOS - 1
  
    If Trim(STRMMODELOS(I).STRMODELO) = "" Then
      MsgBox VARLENGUAJE(263), vbExclamation, NOMBRE_DEL_PROGRAMA
      Exit Sub
    End If
    
    If IsNumeric(Trim(STRMMODELOS(I).STRPRECIO)) = False Or IsNumeric(Trim(STRMMODELOS(I).STRPRECIO2)) = False Then
    
      MsgBox VARLENGUAJE(334), vbExclamation, NOMBRE_DEL_PROGRAMA
      Exit Sub
    
    
    End If
    
    
    If CDbl(Trim(STRMMODELOS(I).STRPRECIO)) <= 0 Or CDbl(Trim(STRMMODELOS(I).STRPRECIO2)) <= 0 Then
      MsgBox VARLENGUAJE(264), vbExclamation, NOMBRE_DEL_PROGRAMA
      Exit Sub
    End If
  Next I
  For I = 0 To UBound(STRMMODELOS) - 1
  
    If UCase(STRMMODELOS(I).STRMODELO) = UCase(STRMMODELOS(I + 1).STRMODELO) Then
    
      MsgBox VARLENGUAJE(265), vbExclamation, NOMBRE_DEL_PROGRAMA
      Exit Sub
    
    End If
  
  Next I
  
  If CHKINCLUIRIMAGEN.Value = 1 Then
  
    If Trim(TXTNOMBREIMAGEN.Text) = "" Then
      MsgBox VARLENGUAJE(266), vbExclamation, NOMBRE_DEL_PROGRAMA
      Exit Sub
    End If
    
    If Trim(TXTIMAGENID.Text) = "" Then
      MsgBox VARLENGUAJE(267), vbExclamation, NOMBRE_DEL_PROGRAMA
      Exit Sub
    End If
    If Trim(TXTIMAGEN.Text) = "" Then
      MsgBox VARLENGUAJE(268), vbExclamation, NOMBRE_DEL_PROGRAMA
      Exit Sub
    End If
  
  End If
  If TXTNOMBRE.Enabled = True Then
    Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
    Set RSTABLA = DBREGISTRO.OpenRecordset("SELECT * FROM PRODUCTOS WHERE nombreproducto='" & Replace(TXTNOMBRE.Text, "'", "''") & "'", dbOpenDynaset)
    If RSTABLA.RecordCount >= 1 Then
      MsgBox VARLENGUAJE(269), vbExclamation, NOMBRE_DEL_PROGRAMA
      RSTABLA.Close
      DBREGISTRO.Close
      Set RSTABLA = Nothing
      Set DBREGISTRO = Nothing
      Exit Sub
    End If
    RSTABLA.Close
    DBREGISTRO.Close
    
    Set RSTABLA = Nothing
    Set DBREGISTRO = Nothing
    Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
    Set RSTABLA = DBREGISTRO.OpenRecordset("SELECT * FROM PRODUCTOS WHERE idproducto='" & Replace(TXTID.Text, "'", "''") & "'", dbOpenDynaset)
    If RSTABLA.RecordCount >= 1 Then
      MsgBox VARLENGUAJE(270), vbExclamation, NOMBRE_DEL_PROGRAMA
      RSTABLA.Close
      DBREGISTRO.Close
      Set RSTABLA = Nothing
      Set DBREGISTRO = Nothing
      Exit Sub
    End If
    RSTABLA.Close
    DBREGISTRO.Close
    Set RSTABLA = Nothing
    Set DBREGISTRO = Nothing
  
  End If
  
  
  If CHKINCLUIRIMAGEN.Value = 1 Then
  
    Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
    Set RSTABLA = DBREGISTRO.OpenRecordset("SELECT * FROM IMAGENES WHERE nombreimagen='" & Replace(TXTNOMBREIMAGEN.Text, "'", "''") & "' AND idproducto<>'" & Replace(TXTID.Text, "'", "''") & "'", dbOpenDynaset)
    If RSTABLA.RecordCount >= 1 Then
      MsgBox VARLENGUAJE(271), vbExclamation, NOMBRE_DEL_PROGRAMA
      RSTABLA.Close
      DBREGISTRO.Close
      Set RSTABLA = Nothing
      Set DBREGISTRO = Nothing
      Exit Sub
    End If
    RSTABLA.Close
    DBREGISTRO.Close
    Set RSTABLA = Nothing
    Set DBREGISTRO = Nothing
  
    Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
    Set RSTABLA = DBREGISTRO.OpenRecordset("SELECT * FROM IMAGENES WHERE imagenid='" & Replace(TXTIMAGENID.Text, "'", "''") & "' AND idproducto<>'" & Replace(TXTID.Text, "'", "''") & "'", dbOpenDynaset)
    If RSTABLA.RecordCount >= 1 Then
      MsgBox VARLENGUAJE(272), vbExclamation, NOMBRE_DEL_PROGRAMA
      RSTABLA.Close
      DBREGISTRO.Close
      Set RSTABLA = Nothing
      Set DBREGISTRO = Nothing
      Exit Sub
    End If
    RSTABLA.Close
    DBREGISTRO.Close
    Set RSTABLA = Nothing
    Set DBREGISTRO = Nothing
  End If
    Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
    Set RSTABLA = DBREGISTRO.OpenRecordset("SELECT * FROM PRODUCTOS WHERE idproducto='" & Replace(TXTID.Text, "'", "''") & "'", dbOpenDynaset)
    If RSTABLA.RecordCount >= 1 Then
      RSTABLA.Edit
    Else
      RSTABLA.AddNew
    End If
    RSTABLA.Fields("nombreproducto") = TXTNOMBRE.Text
    RSTABLA.Fields("idproducto") = TXTID.Text
    RSTABLA.Fields("categoria") = TXTCATEGORIA.Text
    RSTABLA.Fields("subcategoria") = TXTSUBCATEGORIA.Text
    RSTABLA.Fields("descripcion") = RTXTDESCRIPCION.Text
    RSTABLA.Update
    RSTABLA.Close
    DBREGISTRO.Close
    Set RSTABLA = Nothing
    Set DBREGISTRO = Nothing
  
    
    Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
    Set RSTABLA = DBREGISTRO.OpenRecordset("SELECT *  FROM MODELOS WHERE idproducto='" & Replace(TXTID.Text, "'", "''") & "'", dbOpenDynaset)
    Do While RSTABLA.EOF = False
      RSTABLA.Delete
      RSTABLA.MoveNext
    Loop
    
    For I = 0 To LNGNMODELOS - 1
      RSTABLA.AddNew
      RSTABLA.Fields("idproducto") = TXTID.Text
      RSTABLA.Fields("modelo") = Trim(STRMMODELOS(I).STRMODELO)
      RSTABLA.Fields("precio1") = CDbl(STRMMODELOS(I).STRPRECIO)
      RSTABLA.Fields("precio2") = CDbl(STRMMODELOS(I).STRPRECIO2)
      RSTABLA.Fields("descuento") = STRMMODELOS(I).BYTDESCUENTO
      RSTABLA.Fields("impuesto") = STRMMODELOS(I).BYTIVA
      RSTABLA.Update
    
    Next I
  
    RSTABLA.Close
    DBREGISTRO.Close
    Set RSTABLA = Nothing
    Set DBREGISTRO = Nothing
    If CHKINCLUIRIMAGEN.Value = 1 Then
      Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
      Set RSTABLA = DBREGISTRO.OpenRecordset("SELECT *  FROM IMAGENES WHERE idproducto='" & Replace(TXTID.Text, "'", "''") & "'", dbOpenDynaset)
      Do While RSTABLA.EOF = False
        RSTABLA.Delete
        RSTABLA.MoveNext
      Loop
      RSTABLA.AddNew
      RSTABLA.Fields("nombreimagen") = TXTNOMBREIMAGEN.Text
      RSTABLA.Fields("imagenid") = TXTIMAGENID.Text
      RSTABLA.Fields("copyright") = TXTCOPY.Text
      RSTABLA.Fields("alternativetext") = TXTALTER.Text
      RSTABLA.Fields("description") = TXTDESCRIPCION.Text
      RSTABLA.Fields("archivo") = TXTIMAGEN.Text
      RSTABLA.Fields("idproducto") = TXTID.Text
      RSTABLA.Update
      RSTABLA.Close
      DBREGISTRO.Close
      Set RSTABLA = Nothing
      Set DBREGISTRO = Nothing
    End If
    Unload Me
  Exit Sub
CAMPO:
  If Err.Number = 3260 Or Err.Number = 3050 Then
    Resume
    Exit Sub
  End If
  If MsgBox(VARLENGUAJE(257), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
  On Error Resume Next
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
End Sub

Private Sub CMDBORRAR_Click()
  Dim I As Long
  
  For I = LSTMODELOS.ListIndex + 1 To UBound(STRMMODELOS())
    STRMMODELOS(I - 1) = STRMMODELOS(I)
  Next I
  ReDim Preserve STRMMODELOS(LNGNMODELOS - 1)
  LNGNMODELOS = LNGNMODELOS - 1
  CMDBORRAR.Enabled = False
  CMDANADIR.Enabled = True
  TXTMODELO.Text = ""
  TXTPRECIO.Text = ""
  TXTPRECIO2.Text = ""
  TXTDESCUENTO.Text = ""
  UPDDESCUENTO.Value = 0
  TXTIVA.Text = ""
  UPDIVA.Value = 0

  TXTMODELO.BackColor = &H8000000F
  TXTPRECIO.BackColor = &H8000000F
  TXTPRECIO2.BackColor = &H8000000F
  TXTDESCUENTO.BackColor = &H8000000F
  TXTIVA.BackColor = &H8000000F
 
  TXTMODELO.Enabled = False
  TXTPRECIO.Enabled = False
  TXTPRECIO2.Enabled = False
  TXTDESCUENTO.Enabled = False
  UPDDESCUENTO.Enabled = False
  TXTIVA.Enabled = False
  UPDIVA.Enabled = False

  ACTUALIZARLISTAMODELOS
End Sub

Private Sub CMDCERRAR_Click()
  Unload Me
End Sub

Private Sub CMDEXAMINAR_Click()
  On Error GoTo CAMPO
  Dim STRRUTAARCHIVO As String
  Dim STRRUTAARCHIVOACOPIAR As String
  Dim FSOARCHIVO As New Scripting.FileSystemObject
  Dim BOLRETVAL As Boolean
  CMDCUADRO.CancelError = True
  CMDCUADRO.Filter = "(*.gif)|*.gif|(*.jpg)|*.jpg|(*.png)|*.png"
  CMDCUADRO.Flags = cdlOFNFileMustExist Or cdlOFNHideReadOnly
  CMDCUADRO.ShowOpen
  On Error Resume Next
  STRRUTAARCHIVO = CMDCUADRO.FileName
  STRRUTAARCHIVOACOPIAR = STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\Images\" & FSOARCHIVO.GetFileName(STRRUTAARCHIVO)
  If ExistsFile(STRRUTAARCHIVOACOPIAR) = True Then
    If MsgBox(VARLENGUAJE(202), vbExclamation + vbYesNo, NOMBRE_DEL_PROGRAMA) = vbNo Then
      Exit Sub
    End If
  End If
  BOLRETVAL = True
  Do While (BOLRETVAL = True)
    BOLRETVAL = False
    FileCopy STRRUTAARCHIVO, STRRUTAARCHIVOACOPIAR
    If Err.Number <> 0 Then
      Err.Clear
      If MsgBox(VARLENGUAJE(6), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
        BOLRETVAL = True
      Else
        Exit Sub
      End If
    End If
  Loop
  TXTIMAGEN.Text = FSOARCHIVO.GetFileName(STRRUTAARCHIVO)
  Exit Sub
CAMPO:
End Sub

Private Sub Form_Load()
  TRADUCIRINTERFAZ
  Me.Top = CInt(Screen.Height / 2) - CInt(Me.Height / 2)
  Me.Left = CInt(Screen.Width / 2) - CInt(Me.Width / 2)
  LNGNMODELOS = 0
  TABPESTANA.Tabs(1).Caption = VARLENGUAJE(245)
  TABPESTANA.Tabs(2).Caption = VARLENGUAJE(246)
  TABPESTANA.Tabs(3).Caption = VARLENGUAJE(247)

Rem &H8000000F&
End Sub





Private Sub LSTMODELOS_Click()
 If LSTMODELOS.Text <> "" Then
 
   CMDBORRAR.Enabled = True
 
 End If
 TXTMODELO.Text = Trim(STRMMODELOS(LSTMODELOS.ListIndex).STRMODELO)
 TXTPRECIO.Text = Trim(STRMMODELOS(LSTMODELOS.ListIndex).STRPRECIO)
 TXTPRECIO2.Text = Trim(STRMMODELOS(LSTMODELOS.ListIndex).STRPRECIO2)
 TXTDESCUENTO.Text = CStr(STRMMODELOS(LSTMODELOS.ListIndex).BYTDESCUENTO)
 UPDDESCUENTO.Value = STRMMODELOS(LSTMODELOS.ListIndex).BYTDESCUENTO
 TXTIVA.Text = CStr(STRMMODELOS(LSTMODELOS.ListIndex).BYTIVA)
 UPDIVA.Value = STRMMODELOS(LSTMODELOS.ListIndex).BYTIVA
 
 
 TXTMODELO.BackColor = &H80000005
 TXTPRECIO.BackColor = &H80000005
 TXTPRECIO2.BackColor = &H80000005
 TXTDESCUENTO.BackColor = &H80000005
 TXTIVA.BackColor = &H80000005
 
 TXTMODELO.Enabled = True
 TXTPRECIO.Enabled = True
 TXTPRECIO2.Enabled = True
 TXTDESCUENTO.Enabled = True
 UPDDESCUENTO.Enabled = True
 TXTIVA.Enabled = True
 UPDIVA.Enabled = True

 
End Sub

Private Sub TABPESTANA_Click()
  If TABPESTANA.SelectedItem = VARLENGUAJE(245) Then
    FRAPESTANA.Visible = True
    FRAPESTANA2.Visible = False
    FRAPESTANA3.Visible = False
  ElseIf TABPESTANA.SelectedItem = VARLENGUAJE(246) Then
    FRAPESTANA.Visible = False
    FRAPESTANA2.Visible = True
    FRAPESTANA3.Visible = False
    
  Else
    FRAPESTANA.Visible = False
    FRAPESTANA2.Visible = False
    FRAPESTANA3.Visible = True

  End If
End Sub

  



Private Sub TXTMODELO_Change()
  STRMMODELOS(LSTMODELOS.ListIndex).STRMODELO = TXTMODELO.Text
End Sub

Private Sub TXTMODELO_LostFocus()
  ACTUALIZARLISTAMODELOS
  LSTMODELOS.ListIndex = LNGNMODELOS - 1
End Sub

Private Sub TXTPRECIO_Change()
  STRMMODELOS(LSTMODELOS.ListIndex).STRPRECIO = TXTPRECIO.Text
End Sub


Private Sub TXTPRECIO2_Change()
  STRMMODELOS(LSTMODELOS.ListIndex).STRPRECIO2 = TXTPRECIO2.Text
End Sub


Private Sub UPDDESCUENTO_Change()
  TXTDESCUENTO.Text = UPDDESCUENTO.Value
  STRMMODELOS(LSTMODELOS.ListIndex).BYTDESCUENTO = UPDDESCUENTO.Value

End Sub

Private Sub UPDIVA_Change()
  TXTIVA.Text = UPDIVA.Value
  STRMMODELOS(LSTMODELOS.ListIndex).BYTIVA = UPDIVA.Value

End Sub
