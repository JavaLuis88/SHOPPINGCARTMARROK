VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "Comdlg32.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form FRMCONFIGURACION 
   AutoRedraw      =   -1  'True
   ClientHeight    =   11010
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   10905
   Icon            =   "FRMCONFIGURACION.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   Picture         =   "FRMCONFIGURACION.frx":030A
   ScaleHeight     =   11010
   ScaleWidth      =   10905
   WindowState     =   2  'Maximized
   Begin VB.Frame FRAGENERAL 
      Height          =   20000
      Index           =   13
      Left            =   0
      TabIndex        =   367
      Top             =   450
      Visible         =   0   'False
      Width           =   20000
      Begin VB.CommandButton CMDACTUALIZARPRODUCTO 
         Height          =   435
         Left            =   9300
         TabIndex        =   371
         Top             =   8550
         Width           =   1545
      End
      Begin VB.CommandButton CMDBORRARPRODUCTO 
         Height          =   435
         Left            =   7590
         TabIndex        =   370
         Top             =   8550
         Width           =   1545
      End
      Begin VB.CommandButton CMDANADIRPRODUCTO 
         Height          =   435
         Left            =   4200
         TabIndex        =   369
         Top             =   8550
         Width           =   1545
      End
      Begin VB.CommandButton CMDEDITARPRODUCTO 
         Height          =   435
         Left            =   5880
         TabIndex        =   368
         Top             =   8550
         Width           =   1545
      End
      Begin MSFlexGridLib.MSFlexGrid MSFGPRODUCTOS 
         Height          =   8175
         Left            =   0
         TabIndex        =   131
         Top             =   90
         Width           =   15300
         _ExtentX        =   26988
         _ExtentY        =   14420
         _Version        =   393216
         Rows            =   1
         Cols            =   5
         FixedRows       =   0
         FixedCols       =   0
      End
   End
   Begin VB.Frame FRAGENERAL 
      Height          =   20000
      Index           =   12
      Left            =   0
      TabIndex        =   334
      Top             =   450
      Visible         =   0   'False
      Width           =   10815
      Begin VB.Frame FRAADORNO 
         Height          =   2295
         Index           =   41
         Left            =   120
         TabIndex        =   351
         Top             =   6780
         Width           =   7965
         Begin VB.ListBox LSTLENGUAJES 
            Height          =   1815
            Left            =   150
            TabIndex        =   127
            Top             =   300
            Width           =   6045
         End
         Begin VB.CommandButton CMDDISCLAIMER 
            Height          =   435
            Left            =   6240
            TabIndex        =   128
            Top             =   300
            Width           =   1545
         End
         Begin VB.CommandButton CMDEDITARLICENCIA 
            Height          =   435
            Left            =   6240
            TabIndex        =   129
            Top             =   750
            Width           =   1545
         End
         Begin VB.CommandButton CMDPAGPRICIPAL 
            Height          =   435
            Left            =   6240
            TabIndex        =   130
            Top             =   1200
            Width           =   1545
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   855
         Index           =   40
         Left            =   120
         TabIndex        =   350
         Top             =   5730
         Width           =   3975
         Begin VB.CheckBox CHKPONERDISCLAIMER 
            Height          =   255
            Left            =   240
            TabIndex        =   126
            Top             =   330
            Width           =   3465
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1305
         Index           =   39
         Left            =   120
         TabIndex        =   347
         Top             =   4230
         Width           =   8115
         Begin VB.CommandButton CMDLOGOEMPRESA 
            Height          =   435
            Left            =   6390
            TabIndex        =   125
            Top             =   720
            Width           =   1545
         End
         Begin VB.TextBox TXTDATOSFACTURAS 
            Height          =   285
            Left            =   3390
            MaxLength       =   255
            TabIndex        =   123
            Top             =   330
            Width           =   2865
         End
         Begin VB.TextBox TXTLOGOEMPRESA 
            Height          =   285
            Left            =   3390
            Locked          =   -1  'True
            MaxLength       =   55
            TabIndex        =   124
            Top             =   780
            Width           =   2865
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   94
            Left            =   240
            TabIndex        =   349
            Top             =   330
            UseMnemonic     =   0   'False
            Width           =   3045
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   95
            Left            =   240
            TabIndex        =   348
            Top             =   780
            UseMnemonic     =   0   'False
            Width           =   3045
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1815
         Index           =   38
         Left            =   120
         TabIndex        =   341
         Top             =   2220
         Width           =   8115
         Begin VB.TextBox TXTTIPOFUNTERES 
            Height          =   285
            Left            =   3390
            Locked          =   -1  'True
            MaxLength       =   55
            TabIndex        =   343
            Top             =   330
            Width           =   2865
         End
         Begin VB.CommandButton CMDCOLORFUENTERES 
            Height          =   435
            Left            =   4020
            TabIndex        =   121
            Top             =   750
            Width           =   1545
         End
         Begin VB.CommandButton CMDTIPOFUENTERES 
            Height          =   435
            Left            =   6390
            TabIndex        =   120
            Top             =   240
            Width           =   1545
         End
         Begin VB.ComboBox CMBTAMANOFUENTERES 
            Height          =   315
            Left            =   3390
            Style           =   2  'Dropdown List
            TabIndex        =   122
            Top             =   1320
            Width           =   1725
         End
         Begin VB.PictureBox PICCOLORFUENTERES 
            Height          =   495
            Left            =   3390
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   342
            Top             =   720
            Width           =   495
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   93
            Left            =   240
            TabIndex        =   346
            Top             =   330
            UseMnemonic     =   0   'False
            Width           =   3045
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   92
            Left            =   240
            TabIndex        =   345
            Top             =   840
            UseMnemonic     =   0   'False
            Width           =   3045
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   91
            Left            =   240
            TabIndex        =   344
            Top             =   1350
            UseMnemonic     =   0   'False
            Width           =   3045
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1815
         Index           =   37
         Left            =   120
         TabIndex        =   335
         Top             =   270
         Width           =   8115
         Begin VB.PictureBox PICCOLORFUENTEDISCLAIMER 
            Height          =   495
            Left            =   3390
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   337
            Top             =   720
            Width           =   495
         End
         Begin VB.ComboBox CMBTAMANOFUENTEDISCLAIMER 
            Height          =   315
            Left            =   3390
            Style           =   2  'Dropdown List
            TabIndex        =   119
            Top             =   1320
            Width           =   1725
         End
         Begin VB.CommandButton CMDTIPOFUENTEDISCLAIMER 
            Height          =   435
            Left            =   6390
            TabIndex        =   117
            Top             =   240
            Width           =   1545
         End
         Begin VB.CommandButton CMDCOLORFUENTEDISCLAIMER 
            Height          =   435
            Left            =   4020
            TabIndex        =   118
            Top             =   750
            Width           =   1545
         End
         Begin VB.TextBox TXTTIPOFUENTEDISCLAIMER 
            Height          =   285
            Left            =   3390
            Locked          =   -1  'True
            MaxLength       =   55
            TabIndex        =   336
            Top             =   330
            Width           =   2865
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   90
            Left            =   210
            TabIndex        =   340
            Top             =   1320
            UseMnemonic     =   0   'False
            Width           =   3045
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   89
            Left            =   240
            TabIndex        =   339
            Top             =   840
            UseMnemonic     =   0   'False
            Width           =   3045
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   88
            Left            =   240
            TabIndex        =   338
            Top             =   330
            UseMnemonic     =   0   'False
            Width           =   3045
         End
      End
   End
   Begin VB.Frame FRAGENERAL 
      Height          =   20000
      Index           =   11
      Left            =   0
      TabIndex        =   331
      Top             =   450
      Visible         =   0   'False
      Width           =   9225
      Begin VB.Frame FRAADORNO 
         Enabled         =   0   'False
         Height          =   2445
         Index           =   47
         Left            =   180
         TabIndex        =   372
         Top             =   4680
         Width           =   6435
         Begin VB.TextBox TXTDIRECCIONHTTPREFERENCIA 
            Enabled         =   0   'False
            Height          =   315
            Left            =   2940
            MaxLength       =   255
            TabIndex        =   379
            Top             =   1740
            Width           =   3225
         End
         Begin VB.TextBox TXTPUERTOHTTPS 
            Enabled         =   0   'False
            Height          =   285
            Left            =   2940
            MaxLength       =   4
            TabIndex        =   376
            Top             =   1290
            Width           =   1485
         End
         Begin VB.TextBox TXTPUERTOHTTP 
            Enabled         =   0   'False
            Height          =   285
            Left            =   2940
            MaxLength       =   4
            TabIndex        =   374
            Top             =   840
            Width           =   1485
         End
         Begin VB.CheckBox CHKUSARHTTPS 
            Enabled         =   0   'False
            Height          =   285
            Left            =   300
            TabIndex        =   373
            Top             =   360
            Width           =   5655
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Enabled         =   0   'False
            Height          =   495
            Index           =   101
            Left            =   300
            TabIndex        =   378
            Top             =   1680
            Width           =   2565
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Enabled         =   0   'False
            Height          =   255
            Index           =   100
            Left            =   270
            TabIndex        =   377
            Top             =   1320
            UseMnemonic     =   0   'False
            Width           =   2595
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Enabled         =   0   'False
            Height          =   255
            Index           =   99
            Left            =   270
            TabIndex        =   375
            Top             =   870
            UseMnemonic     =   0   'False
            Width           =   2595
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   3105
         Index           =   43
         Left            =   180
         TabIndex        =   354
         Top             =   1260
         Width           =   6435
         Begin VB.TextBox TXTSMTPSERVER 
            Height          =   285
            Left            =   2940
            MaxLength       =   255
            TabIndex        =   111
            Top             =   330
            Width           =   3255
         End
         Begin VB.TextBox TXTCORREOPAGO 
            Height          =   285
            Left            =   2940
            MaxLength       =   255
            TabIndex        =   112
            Top             =   780
            Width           =   3255
         End
         Begin VB.TextBox TXTPUERTO 
            Height          =   285
            Left            =   2940
            MaxLength       =   4
            TabIndex        =   113
            Top             =   1230
            Width           =   1485
         End
         Begin VB.TextBox TXTLOGIN 
            Height          =   285
            Left            =   2940
            MaxLength       =   255
            TabIndex        =   114
            Top             =   1680
            Width           =   3255
         End
         Begin VB.TextBox TXTPASSWORD 
            Height          =   285
            Left            =   2940
            MaxLength       =   255
            TabIndex        =   115
            Top             =   2130
            Width           =   3255
         End
         Begin VB.TextBox TXTASUNTO 
            Height          =   285
            Left            =   2940
            MaxLength       =   255
            TabIndex        =   116
            Top             =   2580
            Width           =   3255
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   82
            Left            =   240
            TabIndex        =   360
            Top             =   330
            UseMnemonic     =   0   'False
            Width           =   2595
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   83
            Left            =   240
            TabIndex        =   359
            Top             =   780
            UseMnemonic     =   0   'False
            Width           =   2595
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   84
            Left            =   240
            TabIndex        =   358
            Top             =   1230
            UseMnemonic     =   0   'False
            Width           =   2595
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   85
            Left            =   240
            TabIndex        =   357
            Top             =   1680
            UseMnemonic     =   0   'False
            Width           =   2595
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   86
            Left            =   240
            TabIndex        =   356
            Top             =   2130
            UseMnemonic     =   0   'False
            Width           =   2595
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   87
            Left            =   240
            TabIndex        =   355
            Top             =   2580
            UseMnemonic     =   0   'False
            Width           =   2595
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   855
         Index           =   42
         Left            =   180
         TabIndex        =   352
         Top             =   240
         Width           =   6435
         Begin VB.TextBox TXTCONTRAENCRIPTACION 
            Height          =   285
            Left            =   2940
            MaxLength       =   255
            TabIndex        =   110
            Top             =   330
            Width           =   3255
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   81
            Left            =   240
            TabIndex        =   353
            Top             =   330
            UseMnemonic     =   0   'False
            Width           =   2595
         End
      End
   End
   Begin VB.Frame FRAGENERAL 
      Height          =   20000
      Index           =   10
      Left            =   0
      TabIndex        =   319
      Top             =   450
      Visible         =   0   'False
      Width           =   9225
      Begin VB.Frame FRAADORNO 
         Height          =   1815
         Index           =   36
         Left            =   180
         TabIndex        =   325
         Top             =   240
         Width           =   8115
         Begin VB.TextBox TXTTIPOFUENTEFINAL 
            Height          =   285
            Left            =   3390
            Locked          =   -1  'True
            MaxLength       =   55
            TabIndex        =   327
            Top             =   330
            Width           =   2865
         End
         Begin VB.CommandButton CMDCOLORFUENTEFINAL 
            Height          =   435
            Left            =   4020
            TabIndex        =   106
            Top             =   750
            Width           =   1545
         End
         Begin VB.CommandButton CMDSELECCIONARTIPOFUENTEFINAL 
            Height          =   435
            Left            =   6390
            TabIndex        =   105
            Top             =   240
            Width           =   1545
         End
         Begin VB.ComboBox CMBTAMANOFUENTEFINAL 
            Height          =   315
            Left            =   3390
            Style           =   2  'Dropdown List
            TabIndex        =   107
            Top             =   1320
            Width           =   1725
         End
         Begin VB.PictureBox PICCOLORFUENTEFINAL 
            Height          =   495
            Left            =   3390
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   326
            Top             =   720
            Width           =   495
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   74
            Left            =   240
            TabIndex        =   330
            Top             =   330
            UseMnemonic     =   0   'False
            Width           =   3045
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   75
            Left            =   240
            TabIndex        =   329
            Top             =   840
            UseMnemonic     =   0   'False
            Width           =   3045
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   76
            Left            =   240
            TabIndex        =   328
            Top             =   1350
            UseMnemonic     =   0   'False
            Width           =   3045
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1635
         Index           =   35
         Left            =   180
         TabIndex        =   320
         Top             =   2310
         Width           =   6015
         Begin VB.PictureBox PICCOLORTABLAINTERIOR 
            Height          =   495
            Left            =   3630
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   322
            Top             =   930
            Width           =   495
         End
         Begin VB.CommandButton CMDCOLORTABLAINTERIOR2 
            Height          =   435
            Left            =   4260
            TabIndex        =   109
            Top             =   960
            Width           =   1545
         End
         Begin VB.PictureBox PICCOLORTABLAEXTERIOR 
            Height          =   495
            Left            =   3630
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   321
            Top             =   270
            Width           =   495
         End
         Begin VB.CommandButton CMDCOLORTABLAEXTERIOR2 
            Height          =   435
            Left            =   4260
            TabIndex        =   108
            Top             =   300
            Width           =   1545
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   78
            Left            =   240
            TabIndex        =   324
            Top             =   1020
            UseMnemonic     =   0   'False
            Width           =   3285
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   77
            Left            =   240
            TabIndex        =   323
            Top             =   360
            UseMnemonic     =   0   'False
            Width           =   3285
         End
      End
   End
   Begin VB.Frame FRAGENERAL 
      Height          =   20000
      Index           =   9
      Left            =   0
      TabIndex        =   301
      Top             =   450
      Visible         =   0   'False
      Width           =   10815
      Begin VB.Frame FRAADORNO 
         Height          =   1485
         Index           =   34
         Left            =   180
         TabIndex        =   317
         Top             =   7620
         Width           =   10065
         Begin VB.TextBox TXTEMAILPAYPAL 
            Height          =   285
            Left            =   6750
            MaxLength       =   255
            TabIndex        =   101
            Top             =   360
            Width           =   3105
         End
         Begin VB.TextBox TXTCUENTABANCARIA 
            Height          =   285
            Left            =   6750
            MaxLength       =   255
            TabIndex        =   103
            Top             =   720
            Width           =   3105
         End
         Begin VB.CheckBox CHKPAYPAL 
            Height          =   255
            Left            =   2640
            TabIndex        =   100
            Top             =   390
            Width           =   1335
         End
         Begin VB.CheckBox CHKTRANSFERENCIA 
            Height          =   255
            Left            =   2640
            TabIndex        =   102
            Top             =   720
            Width           =   2145
         End
         Begin VB.CheckBox CHKCONTRAREMBOLSO 
            Height          =   255
            Left            =   2640
            TabIndex        =   104
            Top             =   1050
            Width           =   2505
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   79
            Left            =   4440
            TabIndex        =   333
            Top             =   390
            Width           =   2265
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   80
            Left            =   5070
            TabIndex        =   332
            Top             =   720
            Width           =   1635
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   72
            Left            =   240
            TabIndex        =   318
            Top             =   390
            UseMnemonic     =   0   'False
            Width           =   2265
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1695
         Index           =   33
         Left            =   180
         TabIndex        =   315
         Top             =   5670
         Width           =   8955
         Begin MSComCtl2.UpDown UPDDIASDEVIDADELCOOKIE 
            Height          =   495
            Left            =   8490
            TabIndex        =   97
            Top             =   300
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   873
            _Version        =   393216
            Value           =   1
            Max             =   99
            Min             =   1
            Enabled         =   -1  'True
         End
         Begin VB.TextBox TXTDIASDEVIDADELCOOKIE 
            Height          =   375
            Left            =   7770
            Locked          =   -1  'True
            MaxLength       =   2
            TabIndex        =   283
            Top             =   330
            Width           =   705
         End
         Begin VB.CheckBox CHKGURDARPEDIDO 
            Height          =   255
            Left            =   240
            TabIndex        =   96
            Top             =   390
            Width           =   4335
         End
         Begin VB.CheckBox CHKPERMIRIESCRIBIRCOMENTARIOS 
            Height          =   225
            Left            =   240
            TabIndex        =   98
            Top             =   810
            Width           =   4335
         End
         Begin VB.CheckBox CHKINSTRUCCIONESESPECIALES 
            Height          =   255
            Left            =   240
            TabIndex        =   99
            Top             =   1200
            Width           =   4335
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   73
            Left            =   4650
            TabIndex        =   316
            Top             =   390
            UseMnemonic     =   0   'False
            Width           =   3075
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1245
         Index           =   32
         Left            =   180
         TabIndex        =   313
         Top             =   4170
         Width           =   6285
         Begin VB.CheckBox CHKINCLUIRLICENCIA 
            Height          =   255
            Left            =   1740
            TabIndex        =   94
            Top             =   300
            Width           =   2955
         End
         Begin VB.ComboBox CMBPONERLICENCIAEN 
            Height          =   315
            Left            =   3540
            TabIndex        =   95
            Top             =   720
            Width           =   2505
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   71
            Left            =   210
            TabIndex        =   314
            Top             =   750
            UseMnemonic     =   0   'False
            Width           =   3225
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1635
         Index           =   31
         Left            =   180
         TabIndex        =   308
         Top             =   2310
         Width           =   6015
         Begin VB.CommandButton CMDCOLORTABLAEXTERIOR 
            Height          =   435
            Left            =   4260
            TabIndex        =   92
            Top             =   300
            Width           =   1545
         End
         Begin VB.PictureBox PICCOLORTABLAEXTERIORCOMPRA 
            Height          =   495
            Left            =   3630
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   310
            Top             =   270
            Width           =   495
         End
         Begin VB.CommandButton CMDCOLORTABLAINTERIOR 
            Height          =   435
            Left            =   4260
            TabIndex        =   93
            Top             =   960
            Width           =   1545
         End
         Begin VB.PictureBox PICCOLORTABLAINTERIORCOMPRA 
            Height          =   495
            Left            =   3630
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   309
            Top             =   930
            Width           =   495
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   69
            Left            =   240
            TabIndex        =   312
            Top             =   360
            UseMnemonic     =   0   'False
            Width           =   3285
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   70
            Left            =   240
            TabIndex        =   311
            Top             =   1020
            UseMnemonic     =   0   'False
            Width           =   3285
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1815
         Index           =   30
         Left            =   180
         TabIndex        =   302
         Top             =   240
         Width           =   8115
         Begin VB.PictureBox PICCOLORFUENTECOMPRAR 
            Height          =   495
            Left            =   3390
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   304
            Top             =   720
            Width           =   495
         End
         Begin VB.ComboBox CMBTAMANOFUENTECOMPRAR 
            Height          =   315
            Left            =   3390
            Style           =   2  'Dropdown List
            TabIndex        =   91
            Top             =   1320
            Width           =   1725
         End
         Begin VB.CommandButton CMDTAMANOFUENTECOMPRAR 
            Height          =   435
            Left            =   6390
            TabIndex        =   89
            Top             =   240
            Width           =   1545
         End
         Begin VB.CommandButton CMDCOLORFUENTECOMPRAR 
            Height          =   435
            Left            =   4020
            TabIndex        =   90
            Top             =   750
            Width           =   1545
         End
         Begin VB.TextBox TXTTIPOFUENTECOMPRAR 
            Height          =   285
            Left            =   3390
            Locked          =   -1  'True
            MaxLength       =   55
            TabIndex        =   303
            Top             =   330
            Width           =   2865
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   68
            Left            =   240
            TabIndex        =   307
            Top             =   1350
            UseMnemonic     =   0   'False
            Width           =   3045
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   67
            Left            =   240
            TabIndex        =   306
            Top             =   840
            UseMnemonic     =   0   'False
            Width           =   3045
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   66
            Left            =   240
            TabIndex        =   305
            Top             =   330
            UseMnemonic     =   0   'False
            Width           =   3045
         End
      End
   End
   Begin VB.Frame FRAGENERAL 
      Height          =   20000
      Index           =   7
      Left            =   0
      TabIndex        =   251
      Top             =   450
      Visible         =   0   'False
      Width           =   9225
      Begin VB.Frame FRAADORNO 
         Height          =   1605
         Index           =   17
         Left            =   210
         TabIndex        =   266
         Top             =   4110
         Width           =   4995
         Begin VB.TextBox TXTANCHOIMAGENESFICHAS 
            Height          =   405
            Left            =   3630
            Locked          =   -1  'True
            MaxLength       =   3
            TabIndex        =   268
            Top             =   300
            Width           =   495
         End
         Begin VB.TextBox TXTALTOIMAGENESFICHAS 
            Height          =   405
            Left            =   3630
            Locked          =   -1  'True
            MaxLength       =   3
            TabIndex        =   267
            Top             =   930
            Width           =   495
         End
         Begin MSComCtl2.UpDown UPDALTOIMAGENESFICHA 
            Height          =   555
            Left            =   4140
            TabIndex        =   83
            Top             =   870
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   979
            _Version        =   393216
            Value           =   250
            Max             =   500
            Min             =   250
            Enabled         =   -1  'True
         End
         Begin MSComCtl2.UpDown UPDANCHOIMAGENESFICHA 
            Height          =   555
            Left            =   4140
            TabIndex        =   82
            Top             =   240
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   979
            _Version        =   393216
            Value           =   250
            Max             =   500
            Min             =   250
            Enabled         =   -1  'True
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   60
            Left            =   240
            TabIndex        =   272
            Top             =   360
            UseMnemonic     =   0   'False
            Width           =   3285
         End
         Begin VB.Label LBLTEXTOFIJO 
            Caption         =   "px"
            Height          =   255
            Index           =   1
            Left            =   4440
            TabIndex        =   271
            Top             =   420
            Width           =   195
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   59
            Left            =   240
            TabIndex        =   270
            Top             =   1020
            UseMnemonic     =   0   'False
            Width           =   3285
         End
         Begin VB.Label LBLTEXTOFIJO 
            Caption         =   "px"
            Height          =   255
            Index           =   2
            Left            =   4440
            TabIndex        =   269
            Top             =   1020
            Width           =   195
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1815
         Index           =   14
         Left            =   180
         TabIndex        =   257
         Top             =   240
         Width           =   8115
         Begin VB.TextBox TXTTIPOFUENTEFICHAS 
            Height          =   285
            Left            =   3390
            Locked          =   -1  'True
            MaxLength       =   55
            TabIndex        =   259
            Top             =   330
            Width           =   2865
         End
         Begin VB.CommandButton CMDCOLORFUENTEFICHAS 
            Height          =   435
            Left            =   4020
            TabIndex        =   78
            Top             =   750
            Width           =   1545
         End
         Begin VB.CommandButton CMDTIPOFUENTESFICHAS 
            Height          =   435
            Left            =   6390
            TabIndex        =   77
            Top             =   240
            Width           =   1545
         End
         Begin VB.ComboBox CMBTAMANOFUENTEFICHAS 
            Height          =   315
            Left            =   3390
            Style           =   2  'Dropdown List
            TabIndex        =   79
            Top             =   1320
            Width           =   1725
         End
         Begin VB.PictureBox PICCOLORFUENTEFICHAS 
            Height          =   495
            Left            =   3390
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   258
            Top             =   720
            Width           =   495
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   54
            Left            =   240
            TabIndex        =   262
            Top             =   330
            UseMnemonic     =   0   'False
            Width           =   3045
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   55
            Left            =   240
            TabIndex        =   261
            Top             =   840
            UseMnemonic     =   0   'False
            Width           =   3045
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   56
            Left            =   240
            TabIndex        =   260
            Top             =   1350
            UseMnemonic     =   0   'False
            Width           =   3045
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1635
         Index           =   15
         Left            =   180
         TabIndex        =   252
         Top             =   2310
         Width           =   6015
         Begin VB.PictureBox PICCOLORFICHAS 
            Height          =   495
            Left            =   3630
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   254
            Top             =   930
            Width           =   495
         End
         Begin VB.CommandButton CMDCOLORFONDOFICHAS 
            Height          =   435
            Left            =   4260
            TabIndex        =   81
            Top             =   960
            Width           =   1545
         End
         Begin VB.PictureBox PICCOLORCASILLASFICHAS 
            Height          =   495
            Left            =   3630
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   253
            Top             =   270
            Width           =   495
         End
         Begin VB.CommandButton CMDCOLORFONDOCASILLASFICHAS 
            Height          =   435
            Left            =   4260
            TabIndex        =   80
            Top             =   300
            Width           =   1545
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   57
            Left            =   240
            TabIndex        =   256
            Top             =   1020
            UseMnemonic     =   0   'False
            Width           =   3285
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   58
            Left            =   240
            TabIndex        =   255
            Top             =   360
            UseMnemonic     =   0   'False
            Width           =   3285
         End
      End
   End
   Begin VB.Frame FRAGENERAL 
      ClipControls    =   0   'False
      Height          =   20000
      Index           =   8
      Left            =   0
      TabIndex        =   214
      Top             =   450
      Visible         =   0   'False
      Width           =   9225
      Begin VB.Frame FRAADORNO 
         Height          =   1695
         Index           =   8
         Left            =   180
         TabIndex        =   221
         Top             =   240
         Width           =   6375
         Begin VB.PictureBox PICCOLORFONDOCESTA 
            Height          =   495
            Left            =   3930
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   223
            Top             =   300
            Width           =   495
         End
         Begin VB.CommandButton CMDSELECCIONARFONDOCESTA 
            Height          =   435
            Left            =   4560
            TabIndex        =   84
            Top             =   330
            Width           =   1545
         End
         Begin VB.PictureBox PICCOLORCASILLASCESTA 
            Height          =   495
            Left            =   3930
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   222
            Top             =   900
            Width           =   495
         End
         Begin VB.CommandButton CMDSELECCIONARCOLORFONDOCASILLASCESTA 
            Height          =   435
            Left            =   4560
            TabIndex        =   85
            Top             =   930
            Width           =   1545
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   64
            Left            =   120
            TabIndex        =   225
            Top             =   450
            UseMnemonic     =   0   'False
            Width           =   3705
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   65
            Left            =   120
            TabIndex        =   224
            Top             =   1020
            UseMnemonic     =   0   'False
            Width           =   3705
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1845
         Index           =   7
         Left            =   180
         TabIndex        =   215
         Top             =   2190
         Width           =   7725
         Begin VB.TextBox TXTTIPOFUENTECESTA 
            Height          =   285
            Left            =   2910
            Locked          =   -1  'True
            MaxLength       =   55
            TabIndex        =   217
            Top             =   330
            Width           =   2865
         End
         Begin VB.CommandButton CMDSELECCIONARCOLORFUENTECESTA 
            Height          =   435
            Left            =   3570
            TabIndex        =   87
            Top             =   780
            Width           =   1545
         End
         Begin VB.CommandButton CMDSELECCIONARTIPOFUNTECESTA 
            Height          =   435
            Left            =   5910
            TabIndex        =   86
            Top             =   270
            Width           =   1545
         End
         Begin VB.ComboBox CMBTAMANOFUENTECESTA 
            Height          =   315
            Left            =   2910
            Style           =   2  'Dropdown List
            TabIndex        =   88
            Top             =   1350
            Width           =   1725
         End
         Begin VB.PictureBox PICCOLORFUENTECESTA 
            Height          =   495
            Left            =   2910
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   216
            Top             =   750
            Width           =   495
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   61
            Left            =   120
            TabIndex        =   220
            Top             =   360
            UseMnemonic     =   0   'False
            Width           =   2685
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   62
            Left            =   120
            TabIndex        =   219
            Top             =   840
            UseMnemonic     =   0   'False
            Width           =   2685
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   63
            Left            =   120
            TabIndex        =   218
            Top             =   1410
            UseMnemonic     =   0   'False
            Width           =   2685
         End
      End
   End
   Begin VB.Frame FRAGENERAL 
      Height          =   20000
      Index           =   6
      Left            =   0
      TabIndex        =   211
      Top             =   450
      Visible         =   0   'False
      Width           =   9225
      Begin VB.Frame FRAADORNO 
         Height          =   885
         Index           =   16
         Left            =   180
         TabIndex        =   263
         Top             =   6330
         Width           =   4305
         Begin VB.TextBox TXTNUMERODEPRODUCTOS 
            Height          =   405
            Left            =   3390
            Locked          =   -1  'True
            MaxLength       =   3
            TabIndex        =   264
            Top             =   270
            Width           =   495
         End
         Begin MSComCtl2.UpDown UPDNUMERODEPRODUCTOS 
            Height          =   555
            Left            =   3900
            TabIndex        =   76
            Top             =   210
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   979
            _Version        =   393216
            Value           =   10
            Max             =   100
            Min             =   10
            Enabled         =   -1  'True
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   48
            Left            =   240
            TabIndex        =   265
            Top             =   330
            UseMnemonic     =   0   'False
            Width           =   3045
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1815
         Index           =   13
         Left            =   180
         TabIndex        =   245
         Top             =   4290
         Width           =   8115
         Begin VB.TextBox TXTTIPOFUENTEMINIFICHA 
            Height          =   285
            Left            =   3390
            Locked          =   -1  'True
            MaxLength       =   55
            TabIndex        =   247
            Top             =   300
            Width           =   2865
         End
         Begin VB.CommandButton CMDCOLORFUENTEMINIFICHAS 
            Height          =   435
            Left            =   4020
            TabIndex        =   74
            Top             =   750
            Width           =   1545
         End
         Begin VB.CommandButton CMDTIPOFUENTEMINIFICHAS 
            Height          =   435
            Left            =   6390
            TabIndex        =   73
            Top             =   240
            Width           =   1545
         End
         Begin VB.ComboBox CMDBTAMANOFUENTEMINICATEGORIAS 
            Height          =   315
            Left            =   3390
            Style           =   2  'Dropdown List
            TabIndex        =   75
            Top             =   1320
            Width           =   1725
         End
         Begin VB.PictureBox PICOLORFUENTEMINIFICHAS 
            Height          =   495
            Left            =   3390
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   246
            Top             =   720
            Width           =   495
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   51
            Left            =   240
            TabIndex        =   250
            Top             =   330
            UseMnemonic     =   0   'False
            Width           =   3045
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   52
            Left            =   240
            TabIndex        =   249
            Top             =   840
            UseMnemonic     =   0   'False
            Width           =   3045
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   53
            Left            =   240
            TabIndex        =   248
            Top             =   1350
            UseMnemonic     =   0   'False
            Width           =   3045
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1065
         Index           =   12
         Left            =   180
         TabIndex        =   238
         Top             =   3090
         Width           =   8805
         Begin VB.TextBox TXTALTOMINIIMAGEN 
            Height          =   405
            Left            =   7650
            Locked          =   -1  'True
            MaxLength       =   3
            TabIndex        =   240
            Top             =   420
            Width           =   495
         End
         Begin VB.TextBox TXTANCHOMINIIMAGEN 
            Height          =   405
            Left            =   3390
            Locked          =   -1  'True
            MaxLength       =   3
            TabIndex        =   239
            Top             =   390
            Width           =   495
         End
         Begin MSComCtl2.UpDown UPDALTOMINIIMAGEN 
            Height          =   555
            Left            =   8160
            TabIndex        =   72
            Top             =   360
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   979
            _Version        =   393216
            Value           =   50
            Max             =   200
            Min             =   50
            Enabled         =   -1  'True
         End
         Begin MSComCtl2.UpDown UPDANCHOMINIIMAGEN 
            Height          =   555
            Left            =   3900
            TabIndex        =   71
            Top             =   330
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   979
            _Version        =   393216
            Value           =   50
            Max             =   200
            Min             =   50
            Enabled         =   -1  'True
         End
         Begin VB.Label LBLTEXTOFIJO 
            Caption         =   "px"
            Height          =   255
            Index           =   7
            Left            =   8460
            TabIndex        =   244
            Top             =   510
            Width           =   195
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   46
            Left            =   4560
            TabIndex        =   243
            Top             =   510
            UseMnemonic     =   0   'False
            Width           =   3015
         End
         Begin VB.Label LBLTEXTOFIJO 
            Caption         =   "px"
            Height          =   255
            Index           =   9
            Left            =   4200
            TabIndex        =   242
            Top             =   480
            Width           =   195
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   47
            Left            =   300
            TabIndex        =   241
            Top             =   480
            UseMnemonic     =   0   'False
            Width           =   3015
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1635
         Index           =   10
         Left            =   180
         TabIndex        =   233
         Top             =   1260
         Width           =   5685
         Begin VB.PictureBox PICCOLORFONDOMINIFICHA 
            Height          =   495
            Left            =   3360
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   235
            Top             =   990
            Width           =   495
         End
         Begin VB.CommandButton CMDCOLORFONDOMINIFICHA 
            Height          =   435
            Left            =   3960
            TabIndex        =   70
            Top             =   1050
            Width           =   1545
         End
         Begin VB.PictureBox PICCOLORFONDOMINIFICHA2 
            Height          =   495
            Left            =   3360
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   234
            Top             =   330
            Width           =   495
         End
         Begin VB.CommandButton CMDCOLORFONDOMINIFICHA2 
            Height          =   435
            Left            =   3960
            TabIndex        =   69
            Top             =   360
            Width           =   1545
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   43
            Left            =   120
            TabIndex        =   237
            Top             =   1110
            UseMnemonic     =   0   'False
            Width           =   3165
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   45
            Left            =   120
            TabIndex        =   236
            Top             =   450
            UseMnemonic     =   0   'False
            Width           =   3165
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   855
         Index           =   9
         Left            =   180
         TabIndex        =   226
         Top             =   240
         Width           =   8865
         Begin VB.TextBox TXTANCHOMINIFICHASBUSQUEDA 
            Height          =   405
            Left            =   7740
            Locked          =   -1  'True
            MaxLength       =   3
            TabIndex        =   228
            Top             =   270
            Width           =   495
         End
         Begin VB.TextBox TXTANCHOMINIFICHACATEGORIAS 
            Height          =   405
            Left            =   3330
            Locked          =   -1  'True
            MaxLength       =   3
            TabIndex        =   227
            Top             =   270
            Width           =   495
         End
         Begin MSComCtl2.UpDown UPDANCHOMINIFICHABUSQUEDA 
            Height          =   555
            Left            =   8250
            TabIndex        =   68
            Top             =   210
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   979
            _Version        =   393216
            Value           =   50
            Max             =   100
            Min             =   50
            Enabled         =   -1  'True
         End
         Begin MSComCtl2.UpDown UPDANCHOMINIFICHACATEGORIAS 
            Height          =   555
            Left            =   3840
            TabIndex        =   67
            Top             =   210
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   979
            _Version        =   393216
            Value           =   50
            Max             =   100
            Min             =   50
            Enabled         =   -1  'True
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   42
            Left            =   4500
            TabIndex        =   232
            Top             =   360
            UseMnemonic     =   0   'False
            Width           =   3165
         End
         Begin VB.Label LBLTEXTOFIJO 
            Caption         =   "%"
            Height          =   255
            Index           =   6
            Left            =   8550
            TabIndex        =   231
            Top             =   360
            Width           =   195
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   44
            Left            =   120
            TabIndex        =   230
            Top             =   360
            UseMnemonic     =   0   'False
            Width           =   3165
         End
         Begin VB.Label LBLTEXTOFIJO 
            Caption         =   "%"
            Height          =   255
            Index           =   8
            Left            =   4140
            TabIndex        =   229
            Top             =   360
            Width           =   195
         End
      End
   End
   Begin VB.Frame FRAGENERAL 
      Height          =   20000
      Index           =   5
      Left            =   0
      TabIndex        =   210
      Top             =   450
      Visible         =   0   'False
      Width           =   9225
      Begin VB.Frame FRAADORNO 
         Height          =   1575
         Index           =   29
         Left            =   180
         TabIndex        =   296
         Top             =   7470
         Width           =   5925
         Begin VB.PictureBox PICCOLORCATEGORIASIMPARES 
            Height          =   495
            Left            =   3570
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   298
            Top             =   240
            Width           =   495
         End
         Begin VB.CommandButton CMDCOLORCATEGORIASIMPARES 
            Height          =   435
            Left            =   4200
            TabIndex        =   65
            Top             =   270
            Width           =   1545
         End
         Begin VB.PictureBox PICCOLORCATEGORIASPARES 
            Height          =   495
            Left            =   3570
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   297
            Top             =   870
            Width           =   495
         End
         Begin VB.CommandButton CMDCOLORCATEGORIASPARES 
            Height          =   435
            Left            =   4200
            TabIndex        =   66
            Top             =   930
            Width           =   1545
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   49
            Left            =   270
            TabIndex        =   300
            Top             =   360
            UseMnemonic     =   0   'False
            Width           =   3165
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   50
            Left            =   270
            TabIndex        =   299
            Top             =   990
            UseMnemonic     =   0   'False
            Width           =   3165
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   885
         Index           =   28
         Left            =   180
         TabIndex        =   293
         Top             =   6300
         Width           =   4545
         Begin VB.TextBox TXTNUMEROCATEGORIASPAGINA 
            Height          =   345
            Left            =   3570
            Locked          =   -1  'True
            MaxLength       =   4
            TabIndex        =   294
            Top             =   300
            Width           =   555
         End
         Begin MSComCtl2.UpDown UPDNUMEROCATEGORIASPAGINA 
            Height          =   495
            Left            =   4140
            TabIndex        =   64
            Top             =   240
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   873
            _Version        =   393216
            Value           =   10
            Max             =   9999
            Min             =   10
            Enabled         =   -1  'True
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   225
            Index           =   41
            Left            =   270
            TabIndex        =   295
            Top             =   360
            UseMnemonic     =   0   'False
            Width           =   3165
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1935
         Index           =   20
         Left            =   180
         TabIndex        =   287
         Top             =   4140
         Width           =   8235
         Begin VB.ComboBox CMBTAMANOFUENTESUBCATEGORIAS 
            Height          =   315
            Left            =   3570
            Style           =   2  'Dropdown List
            TabIndex        =   63
            Top             =   1380
            Width           =   1725
         End
         Begin VB.CommandButton CMDTIPOFUENTESUBCATEGORIAS 
            Height          =   435
            Left            =   6570
            TabIndex        =   61
            Top             =   300
            Width           =   1455
         End
         Begin VB.CommandButton CMDCOLORFUENTESUBCATEGORIAS 
            Height          =   435
            Left            =   4200
            TabIndex        =   62
            Top             =   810
            Width           =   1545
         End
         Begin VB.PictureBox PICCOLORFUENTESUBCATEGORIAS 
            Height          =   495
            Left            =   3570
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   289
            Top             =   780
            Width           =   495
         End
         Begin VB.TextBox TXTTIPOFUENTESUBCATEGORIAS 
            Height          =   285
            Left            =   3570
            Locked          =   -1  'True
            MaxLength       =   55
            TabIndex        =   288
            Top             =   360
            Width           =   2865
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   40
            Left            =   270
            TabIndex        =   292
            Top             =   1410
            UseMnemonic     =   0   'False
            Width           =   3165
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   39
            Left            =   270
            TabIndex        =   291
            Top             =   900
            UseMnemonic     =   0   'False
            Width           =   3165
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   38
            Left            =   270
            TabIndex        =   290
            Top             =   360
            UseMnemonic     =   0   'False
            Width           =   3165
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1935
         Index           =   19
         Left            =   180
         TabIndex        =   280
         Top             =   1920
         Width           =   8235
         Begin VB.ComboBox CMBTAMANOFUENTECATEGORIAS 
            Height          =   315
            Left            =   3570
            Style           =   2  'Dropdown List
            TabIndex        =   60
            Top             =   1380
            Width           =   1725
         End
         Begin VB.CommandButton CMDTIPOFUENTECATEGORIAS 
            Height          =   435
            Left            =   6570
            TabIndex        =   58
            Top             =   300
            Width           =   1455
         End
         Begin VB.CommandButton CMDCOLORFUENTESSUBCATEGORIAS 
            Height          =   435
            Left            =   4200
            TabIndex        =   59
            Top             =   810
            Width           =   1545
         End
         Begin VB.PictureBox PICCOLORFUENTECATEGORIAS 
            Height          =   495
            Left            =   3570
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   282
            Top             =   780
            Width           =   495
         End
         Begin VB.TextBox TXTTIPOFUENTECATEGORIAS 
            Height          =   285
            Left            =   3570
            Locked          =   -1  'True
            MaxLength       =   55
            TabIndex        =   281
            Top             =   360
            Width           =   2865
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   37
            Left            =   270
            TabIndex        =   286
            Top             =   1410
            UseMnemonic     =   0   'False
            Width           =   3165
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   36
            Left            =   270
            TabIndex        =   285
            Top             =   900
            UseMnemonic     =   0   'False
            Width           =   3165
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   35
            Left            =   270
            TabIndex        =   284
            Top             =   360
            UseMnemonic     =   0   'False
            Width           =   3165
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1515
         Index           =   18
         Left            =   180
         TabIndex        =   273
         Top             =   240
         Width           =   5355
         Begin VB.TextBox TXTANCHOTABLACATEGORIAS 
            Height          =   345
            Left            =   4020
            Locked          =   -1  'True
            MaxLength       =   3
            TabIndex        =   275
            Top             =   300
            Width           =   615
         End
         Begin VB.TextBox TXTPOSICIONENLATABLACATEGORIAS 
            Height          =   345
            Left            =   4020
            MaxLength       =   3
            TabIndex        =   274
            Top             =   900
            Width           =   615
         End
         Begin MSComCtl2.UpDown UPDSANGRADO 
            Height          =   525
            Left            =   4650
            TabIndex        =   57
            Top             =   810
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   926
            _Version        =   393216
            Value           =   1
            Max             =   50
            Min             =   1
            Enabled         =   -1  'True
         End
         Begin MSComCtl2.UpDown UPDANCHOCATEGORIAS 
            Height          =   465
            Left            =   4650
            TabIndex        =   56
            Top             =   270
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   820
            _Version        =   393216
            Value           =   50
            Max             =   100
            Min             =   50
            Enabled         =   -1  'True
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   225
            Index           =   33
            Left            =   270
            TabIndex        =   279
            Top             =   360
            UseMnemonic     =   0   'False
            Width           =   3645
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   34
            Left            =   270
            TabIndex        =   278
            Top             =   930
            UseMnemonic     =   0   'False
            Width           =   3645
         End
         Begin VB.Label LBLTEXTOFIJO 
            Caption         =   "%"
            Height          =   315
            Index           =   0
            Left            =   4950
            TabIndex        =   277
            Top             =   390
            UseMnemonic     =   0   'False
            Width           =   195
         End
         Begin VB.Label LBLTEXTOFIJO 
            Caption         =   "%"
            Height          =   285
            Index           =   3
            Left            =   4950
            TabIndex        =   276
            Top             =   960
            Width           =   165
         End
      End
   End
   Begin VB.Frame FRAGENERAL 
      Height          =   20000
      Index           =   4
      Left            =   0
      TabIndex        =   136
      Top             =   450
      Visible         =   0   'False
      Width           =   9195
      Begin VB.Frame FRAADORNO 
         Height          =   1365
         Index           =   46
         Left            =   180
         TabIndex        =   145
         Top             =   4470
         Width           =   7725
         Begin VB.ComboBox CMBTAMANOFUENTEBUSCADOR 
            Height          =   315
            Left            =   3030
            Style           =   2  'Dropdown List
            TabIndex        =   55
            Top             =   1290
            Visible         =   0   'False
            Width           =   1725
         End
         Begin VB.CommandButton CMDELEGIRTIPOFUENTEBUSCADOR 
            Height          =   435
            Left            =   6060
            TabIndex        =   53
            Top             =   270
            Width           =   1455
         End
         Begin VB.CommandButton CMDELEGIRCOLORFUENTEBUSCADOR 
            Height          =   435
            Left            =   3660
            TabIndex        =   54
            Top             =   750
            Width           =   1545
         End
         Begin VB.PictureBox PICCOLORFUENTEBUSCADOR 
            Height          =   495
            Left            =   3030
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   147
            Top             =   720
            Width           =   495
         End
         Begin VB.TextBox TXTFUENTEBUSCADOR 
            Height          =   285
            Left            =   3030
            Locked          =   -1  'True
            MaxLength       =   55
            TabIndex        =   146
            Top             =   330
            Width           =   2865
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   29
            Left            =   120
            TabIndex        =   150
            Top             =   1320
            UseMnemonic     =   0   'False
            Visible         =   0   'False
            Width           =   2685
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   28
            Left            =   120
            TabIndex        =   149
            Top             =   840
            UseMnemonic     =   0   'False
            Width           =   2685
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   27
            Left            =   120
            TabIndex        =   148
            Top             =   360
            UseMnemonic     =   0   'False
            Width           =   2685
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1425
         Index           =   45
         Left            =   180
         TabIndex        =   144
         Top             =   2820
         Width           =   4155
         Begin VB.CheckBox CHKPRECIO1 
            Height          =   345
            Left            =   2460
            TabIndex        =   50
            Top             =   390
            Width           =   1425
         End
         Begin VB.CheckBox CHKNOMBREDESCRIPCION 
            Height          =   345
            Left            =   90
            TabIndex        =   49
            Top             =   390
            Width           =   2145
         End
         Begin VB.CheckBox CHKCATEGORIA 
            Height          =   345
            Left            =   90
            TabIndex        =   51
            Top             =   810
            Width           =   2145
         End
         Begin VB.CheckBox CHKPRECIO2 
            Height          =   345
            Left            =   2460
            TabIndex        =   52
            Top             =   810
            Width           =   1425
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   2295
         Index           =   44
         Left            =   180
         TabIndex        =   137
         Top             =   300
         Width           =   5505
         Begin VB.PictureBox PICCOLORCAPABUSCADOR 
            Height          =   495
            Left            =   3030
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   140
            Top             =   300
            Width           =   495
         End
         Begin VB.CommandButton CMDCOLORCAPABUSCADOR 
            Height          =   435
            Left            =   3660
            TabIndex        =   46
            Top             =   330
            Width           =   1545
         End
         Begin VB.PictureBox PICCOLORFONDOBUSCADOR 
            Height          =   495
            Left            =   3030
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   139
            Top             =   900
            Width           =   495
         End
         Begin VB.CommandButton CMDCOLORFONDOBUSCADOR 
            Height          =   435
            Left            =   3660
            TabIndex        =   47
            Top             =   930
            Width           =   1545
         End
         Begin VB.PictureBox PICCOLORBORDEBUSCADOR 
            Height          =   495
            Left            =   3030
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   138
            Top             =   1530
            Width           =   495
         End
         Begin VB.CommandButton CMDCOLORBORDEBUSCADOR 
            Height          =   435
            Left            =   3660
            TabIndex        =   48
            Top             =   1560
            Width           =   1545
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   24
            Left            =   120
            TabIndex        =   143
            Top             =   450
            UseMnemonic     =   0   'False
            Width           =   2805
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   25
            Left            =   120
            TabIndex        =   142
            Top             =   1020
            UseMnemonic     =   0   'False
            Width           =   2805
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   26
            Left            =   120
            TabIndex        =   141
            Top             =   1620
            Width           =   2805
         End
      End
      Begin MSComDlg.CommonDialog CMDCUADRO 
         Left            =   6840
         Top             =   2580
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
   End
   Begin VB.Frame FRAGENERAL 
      Height          =   20000
      Index           =   3
      Left            =   0
      TabIndex        =   135
      Top             =   450
      Visible         =   0   'False
      Width           =   9225
      Begin VB.Frame FRAADORNO 
         Height          =   1515
         Index           =   22
         Left            =   180
         TabIndex        =   164
         Top             =   7290
         Width           =   7185
         Begin VB.PictureBox PICCOLORFONDOMARCO3 
            Height          =   495
            Left            =   2070
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   365
            Top             =   750
            Width           =   495
         End
         Begin VB.CommandButton CMDSELECCIONARCOLORFONDOMARCO3 
            Height          =   435
            Left            =   2670
            TabIndex        =   45
            Top             =   780
            Width           =   1515
         End
         Begin VB.TextBox TXTIMAGENFONDO3 
            Height          =   285
            Left            =   2070
            MaxLength       =   255
            TabIndex        =   165
            Top             =   330
            Width           =   3135
         End
         Begin VB.CommandButton CMDSELECCIONARIMAGENFONDO3 
            Height          =   435
            Left            =   5340
            TabIndex        =   44
            Top             =   270
            Width           =   1545
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   98
            Left            =   90
            TabIndex        =   366
            Top             =   900
            Width           =   1875
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   30
            Left            =   90
            TabIndex        =   166
            Top             =   360
            Width           =   1875
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   2115
         Index           =   21
         Left            =   180
         TabIndex        =   158
         Top             =   5010
         Width           =   5325
         Begin VB.ComboBox CMBPONERENLACESEN 
            Height          =   315
            Left            =   2940
            Style           =   2  'Dropdown List
            TabIndex        =   41
            Top             =   360
            Width           =   2055
         End
         Begin VB.CommandButton CMDSELECCIONARCOLORENLACESNOVISITADOS3 
            Height          =   435
            Left            =   3570
            TabIndex        =   43
            Top             =   1440
            Width           =   1545
         End
         Begin VB.PictureBox PICCOLORENLACESNOVISITADOS3 
            Height          =   495
            Left            =   2940
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   160
            Top             =   1410
            Width           =   495
         End
         Begin VB.CommandButton CMDSELECCIONARCOLORENLACESVISTADOS3 
            Height          =   435
            Left            =   3570
            TabIndex        =   42
            Top             =   810
            Width           =   1545
         End
         Begin VB.PictureBox PICCOLORENLACESVISITADOS3 
            Height          =   495
            Left            =   2940
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   159
            Top             =   780
            Width           =   495
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   17
            Left            =   180
            TabIndex        =   163
            Top             =   390
            UseMnemonic     =   0   'False
            Width           =   2625
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   23
            Left            =   180
            TabIndex        =   162
            Top             =   1530
            Width           =   2625
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   22
            Left            =   180
            TabIndex        =   161
            Top             =   930
            Width           =   2625
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   2025
         Index           =   11
         Left            =   180
         TabIndex        =   152
         Top             =   2760
         Width           =   7095
         Begin VB.TextBox TXTTIPOFUENTE3 
            Height          =   285
            Left            =   2400
            Locked          =   -1  'True
            MaxLength       =   55
            TabIndex        =   154
            Top             =   420
            Width           =   2865
         End
         Begin VB.PictureBox PICCOLORFUENTE3 
            Height          =   495
            Left            =   2400
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   153
            Top             =   810
            Width           =   495
         End
         Begin VB.CommandButton CMDELEGIRCOLORFUENTE3 
            Height          =   435
            Left            =   3030
            TabIndex        =   39
            Top             =   840
            Width           =   1545
         End
         Begin VB.CommandButton CMDELEGIRFUENTE3 
            Height          =   435
            Left            =   5400
            TabIndex        =   38
            Top             =   360
            Width           =   1545
         End
         Begin VB.ComboBox CMBTAMANOFUENTE3 
            Height          =   315
            Left            =   2400
            Style           =   2  'Dropdown List
            TabIndex        =   40
            Top             =   1440
            Width           =   1725
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   12
            Left            =   150
            TabIndex        =   157
            Top             =   420
            UseMnemonic     =   0   'False
            Width           =   2145
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   13
            Left            =   150
            TabIndex        =   156
            Top             =   900
            UseMnemonic     =   0   'False
            Width           =   2145
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   14
            Left            =   150
            TabIndex        =   155
            Top             =   1470
            UseMnemonic     =   0   'False
            Width           =   2145
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   2295
         Index           =   0
         Left            =   180
         TabIndex        =   151
         Top             =   240
         Width           =   3555
         Begin VB.CheckBox CHKINCLUIRDISCLAIMER3 
            Height          =   345
            Left            =   210
            TabIndex        =   37
            Top             =   1740
            Width           =   3075
         End
         Begin VB.CheckBox CHKINCLUIRBUSCADOR3 
            Height          =   345
            Left            =   210
            TabIndex        =   35
            Top             =   840
            Width           =   3075
         End
         Begin VB.CheckBox CHKINCLUIRELEGIRLENGUAJE3 
            Height          =   345
            Left            =   210
            TabIndex        =   36
            Top             =   1290
            Width           =   3075
         End
         Begin VB.CheckBox CHKINCLUIRBARRADENAVEGACION3 
            Height          =   345
            Left            =   210
            TabIndex        =   34
            Top             =   390
            Width           =   3075
         End
      End
   End
   Begin VB.Frame FRAGENERAL 
      Height          =   20000
      Index           =   2
      Left            =   0
      TabIndex        =   134
      Top             =   450
      Visible         =   0   'False
      Width           =   9225
      Begin VB.Frame FRAADORNO 
         Height          =   2475
         Index           =   26
         Left            =   180
         TabIndex        =   179
         Top             =   6810
         Width           =   7185
         Begin VB.PictureBox PICCOLORFONDOMARCO2 
            Height          =   495
            Left            =   2070
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   363
            Top             =   1800
            Width           =   495
         End
         Begin VB.CommandButton CMDSELECCIONARCOLORFONDOMARCO2 
            Height          =   435
            Left            =   2670
            TabIndex        =   33
            Top             =   1830
            Width           =   1515
         End
         Begin VB.TextBox TXTANCHODELMARCO2 
            Height          =   435
            Left            =   2070
            Locked          =   -1  'True
            MaxLength       =   3
            TabIndex        =   183
            Top             =   1230
            Width           =   465
         End
         Begin VB.TextBox TXTURL2 
            Height          =   285
            Left            =   2070
            MaxLength       =   255
            TabIndex        =   31
            Top             =   810
            Width           =   3135
         End
         Begin VB.TextBox TXTIMAGENFONDO2 
            Height          =   285
            Left            =   2070
            MaxLength       =   255
            TabIndex        =   180
            Top             =   330
            Width           =   3135
         End
         Begin VB.CommandButton CMDSELECCIONARIMAGENFONDO2 
            Height          =   435
            Left            =   5340
            TabIndex        =   30
            Top             =   270
            Width           =   1545
         End
         Begin MSComCtl2.UpDown UPDANCHOMARCO2 
            Height          =   525
            Left            =   2550
            TabIndex        =   32
            Top             =   1200
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   926
            _Version        =   393216
            Value           =   1
            Max             =   100
            Min             =   1
            Enabled         =   -1  'True
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   97
            Left            =   90
            TabIndex        =   364
            Top             =   1950
            Width           =   1875
         End
         Begin VB.Label LBLTEXTOFIJO 
            Caption         =   "%"
            Height          =   225
            Index           =   4
            Left            =   2850
            TabIndex        =   212
            Top             =   1350
            Width           =   195
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   16
            Left            =   90
            TabIndex        =   184
            Top             =   1320
            UseMnemonic     =   0   'False
            Width           =   1875
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   8
            Left            =   90
            TabIndex        =   182
            Top             =   810
            UseMnemonic     =   0   'False
            Width           =   1875
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   31
            Left            =   90
            TabIndex        =   181
            Top             =   360
            Width           =   1875
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1575
         Index           =   25
         Left            =   180
         TabIndex        =   174
         Top             =   5010
         Width           =   5325
         Begin VB.PictureBox PICCOLORENLACESVISITADOS2 
            Height          =   495
            Left            =   2910
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   176
            Top             =   240
            Width           =   495
         End
         Begin VB.CommandButton CMDSELECCIONARCOLORENLACESVISTADOS2 
            Height          =   435
            Left            =   3540
            TabIndex        =   28
            Top             =   270
            Width           =   1515
         End
         Begin VB.PictureBox PICCOLORENLACESNOVISITADOS2 
            Height          =   495
            Left            =   2910
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   175
            Top             =   870
            Width           =   495
         End
         Begin VB.CommandButton CMDSELECCIONARCOLORENLACESNOVISITADOS2 
            Height          =   435
            Left            =   3540
            TabIndex        =   29
            Top             =   900
            Width           =   1515
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   20
            Left            =   180
            TabIndex        =   178
            Top             =   360
            Width           =   2625
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   21
            Left            =   180
            TabIndex        =   177
            Top             =   990
            Width           =   2625
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   2025
         Index           =   23
         Left            =   180
         TabIndex        =   168
         Top             =   2760
         Width           =   7095
         Begin VB.ComboBox CMBTAMANOFUENTE2 
            Height          =   315
            Left            =   2400
            Style           =   2  'Dropdown List
            TabIndex        =   27
            Top             =   1440
            Width           =   1725
         End
         Begin VB.CommandButton CMDELEGIRFUENTE2 
            Height          =   435
            Left            =   5400
            TabIndex        =   25
            Top             =   360
            Width           =   1515
         End
         Begin VB.CommandButton CMDELEGIRCOLORFUENTE2 
            Height          =   435
            Left            =   3030
            TabIndex        =   26
            Top             =   840
            Width           =   1515
         End
         Begin VB.PictureBox PICCOLORFUENTE2 
            Height          =   495
            Left            =   2400
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   170
            Top             =   810
            Width           =   495
         End
         Begin VB.TextBox TXTTIPOFUENTE2 
            Height          =   285
            Left            =   2400
            Locked          =   -1  'True
            MaxLength       =   55
            TabIndex        =   169
            Top             =   420
            Width           =   2865
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   11
            Left            =   150
            TabIndex        =   173
            Top             =   1470
            UseMnemonic     =   0   'False
            Width           =   2145
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   10
            Left            =   150
            TabIndex        =   172
            Top             =   900
            UseMnemonic     =   0   'False
            Width           =   2145
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   9
            Left            =   150
            TabIndex        =   171
            Top             =   420
            UseMnemonic     =   0   'False
            Width           =   2145
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   2295
         Index           =   24
         Left            =   180
         TabIndex        =   167
         Top             =   240
         Width           =   3555
         Begin VB.CheckBox CHKINCLUIRBARRADENAVEGACION2 
            Height          =   345
            Left            =   210
            TabIndex        =   21
            Top             =   390
            Width           =   3075
         End
         Begin VB.CheckBox CHKINCLUIRELEGIRLENGUAJE2 
            Height          =   345
            Left            =   210
            TabIndex        =   23
            Top             =   1290
            Width           =   3075
         End
         Begin VB.CheckBox CHKINCLUIRBUSCADOR2 
            Height          =   345
            Left            =   210
            TabIndex        =   22
            Top             =   840
            Width           =   3075
         End
         Begin VB.CheckBox CHKINCLUIRDISCLAIMER2 
            Height          =   345
            Left            =   210
            TabIndex        =   24
            Top             =   1740
            Width           =   3075
         End
      End
   End
   Begin VB.Frame FRAGENERAL 
      Height          =   20000
      Index           =   1
      Left            =   0
      TabIndex        =   133
      Top             =   450
      Visible         =   0   'False
      Width           =   9225
      Begin VB.Frame FRAADORNO 
         Height          =   2475
         Index           =   3
         Left            =   180
         TabIndex        =   197
         Top             =   6810
         Width           =   7185
         Begin VB.CommandButton CMDSELECCIONARCOLORFONDOMARCO 
            Height          =   435
            Left            =   2670
            TabIndex        =   20
            Top             =   1830
            Width           =   1515
         End
         Begin VB.PictureBox PICCOLORFONDOMARCO 
            Height          =   495
            Left            =   2070
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   361
            Top             =   1800
            Width           =   495
         End
         Begin VB.TextBox TXTANCHODELMARCO 
            Height          =   435
            Left            =   2070
            Locked          =   -1  'True
            MaxLength       =   3
            TabIndex        =   202
            TabStop         =   0   'False
            Top             =   1230
            Width           =   465
         End
         Begin VB.TextBox TXTURL 
            Height          =   285
            Left            =   2070
            MaxLength       =   255
            TabIndex        =   18
            Top             =   810
            Width           =   3135
         End
         Begin VB.CommandButton CMDSELECCIONARIMAGENFONDO 
            Height          =   435
            Left            =   5340
            TabIndex        =   17
            Top             =   270
            Width           =   1545
         End
         Begin VB.TextBox TXTIMAGENFONDO 
            Height          =   285
            Left            =   2070
            MaxLength       =   255
            TabIndex        =   198
            TabStop         =   0   'False
            Top             =   330
            Width           =   3135
         End
         Begin MSComCtl2.UpDown UPDANCHOMARCO 
            Height          =   525
            Left            =   2550
            TabIndex        =   19
            Top             =   1200
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   926
            _Version        =   393216
            Value           =   1
            Max             =   100
            Min             =   1
            Enabled         =   -1  'True
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   96
            Left            =   90
            TabIndex        =   362
            Top             =   1950
            Width           =   1875
         End
         Begin VB.Label LBLTEXTOFIJO 
            Caption         =   "%"
            Height          =   225
            Index           =   5
            Left            =   2850
            TabIndex        =   213
            Top             =   1350
            Width           =   195
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   15
            Left            =   90
            TabIndex        =   201
            Top             =   1320
            UseMnemonic     =   0   'False
            Width           =   1875
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   225
            Index           =   4
            Left            =   90
            TabIndex        =   200
            Top             =   810
            UseMnemonic     =   0   'False
            Width           =   1875
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   32
            Left            =   90
            TabIndex        =   199
            Top             =   360
            Width           =   1875
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   1575
         Index           =   2
         Left            =   180
         TabIndex        =   192
         Top             =   5010
         Width           =   5325
         Begin VB.PictureBox PICCOLORENLACESVISITADOS 
            Height          =   495
            Left            =   2910
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   194
            Top             =   240
            Width           =   495
         End
         Begin VB.CommandButton CMDSELECCIONARCOLORENLACESVISTADOS 
            Height          =   435
            Left            =   3540
            TabIndex        =   15
            Top             =   270
            Width           =   1515
         End
         Begin VB.PictureBox PICCOLORENLACESNOVISITADOS 
            Height          =   495
            Left            =   2910
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   193
            Top             =   870
            Width           =   495
         End
         Begin VB.CommandButton CMDSELECCIONARCOLORENLACESNOVISITADOS 
            Height          =   435
            Left            =   3540
            TabIndex        =   16
            Top             =   900
            Width           =   1515
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   18
            Left            =   180
            TabIndex        =   196
            Top             =   360
            Width           =   2625
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   19
            Left            =   180
            TabIndex        =   195
            Top             =   990
            Width           =   2625
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   2025
         Index           =   1
         Left            =   180
         TabIndex        =   186
         Top             =   2760
         Width           =   7095
         Begin VB.TextBox TXTTIPOFUENTE 
            Height          =   285
            Left            =   2400
            Locked          =   -1  'True
            MaxLength       =   55
            TabIndex        =   188
            TabStop         =   0   'False
            Top             =   420
            Width           =   2865
         End
         Begin VB.PictureBox PICCOLORFUENTE 
            Height          =   495
            Left            =   2400
            ScaleHeight     =   435
            ScaleWidth      =   435
            TabIndex        =   187
            Top             =   810
            Width           =   495
         End
         Begin VB.CommandButton CMDELEGIRCOLORFUENTE 
            Height          =   435
            Left            =   3030
            TabIndex        =   13
            Top             =   840
            Width           =   1515
         End
         Begin VB.CommandButton CMDELEGIRFUENTE 
            Height          =   435
            Left            =   5400
            TabIndex        =   12
            Top             =   360
            Width           =   1515
         End
         Begin VB.ComboBox CMBTAMANOFUENTE 
            Height          =   315
            Left            =   2400
            Style           =   2  'Dropdown List
            TabIndex        =   14
            Top             =   1440
            Width           =   1725
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   5
            Left            =   150
            TabIndex        =   191
            Top             =   420
            UseMnemonic     =   0   'False
            Width           =   2145
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   6
            Left            =   150
            TabIndex        =   190
            Top             =   900
            UseMnemonic     =   0   'False
            Width           =   2145
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   7
            Left            =   150
            TabIndex        =   189
            Top             =   1470
            UseMnemonic     =   0   'False
            Width           =   2145
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   2295
         Index           =   27
         Left            =   180
         TabIndex        =   185
         Top             =   240
         Width           =   3555
         Begin VB.CheckBox CHKINCLUIRBUSCADOR 
            Height          =   345
            Left            =   210
            TabIndex        =   9
            Top             =   840
            Width           =   3075
         End
         Begin VB.CheckBox CHKINCLUIRELEGIRLENGUAJE 
            Height          =   345
            Left            =   210
            TabIndex        =   10
            Top             =   1290
            Width           =   3075
         End
         Begin VB.CheckBox CHKINCLUIRBARRADENAVEGACION 
            Height          =   345
            Left            =   210
            TabIndex        =   8
            Top             =   390
            Width           =   3075
         End
         Begin VB.CheckBox CHKINCLUIRDISCLAIMER 
            Height          =   345
            Left            =   210
            TabIndex        =   11
            Top             =   1740
            Width           =   3075
         End
      End
   End
   Begin VB.Frame FRAGENERAL 
      Height          =   20000
      Index           =   0
      Left            =   0
      TabIndex        =   132
      Top             =   450
      Width           =   9255
      Begin VB.Frame FRAADORNO 
         Height          =   1755
         Index           =   6
         Left            =   210
         TabIndex        =   207
         Top             =   3600
         Width           =   5925
         Begin VB.CheckBox CHKPONERPRECIOENDOSMONEDAS 
            Height          =   345
            Left            =   90
            TabIndex        =   5
            Top             =   360
            Width           =   2715
         End
         Begin VB.ComboBox CMBMONEDAPRINCIPAL 
            Height          =   315
            Left            =   3090
            Style           =   2  'Dropdown List
            TabIndex        =   6
            Top             =   780
            Width           =   2565
         End
         Begin VB.TextBox TXTNOMBREMONEDASECUNDARIA 
            Height          =   315
            Left            =   3090
            MaxLength       =   55
            TabIndex        =   7
            Top             =   1170
            Width           =   2565
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   2
            Left            =   90
            TabIndex        =   209
            Top             =   810
            UseMnemonic     =   0   'False
            Width           =   2895
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   3
            Left            =   90
            TabIndex        =   208
            Top             =   1200
            UseMnemonic     =   0   'False
            Width           =   2895
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   855
         Index           =   5
         Left            =   180
         TabIndex        =   206
         Top             =   2550
         Width           =   4875
         Begin VB.CommandButton CMDLENGUAJEPORDEFECTO 
            Height          =   345
            Left            =   2070
            TabIndex        =   4
            Top             =   330
            Width           =   2595
         End
         Begin VB.CommandButton CMDANADIRLENGUAJE 
            Height          =   375
            Left            =   90
            TabIndex        =   3
            Top             =   300
            Width           =   1905
         End
      End
      Begin VB.Frame FRAADORNO 
         Height          =   2145
         Index           =   4
         Left            =   180
         TabIndex        =   203
         Top             =   240
         Width           =   6645
         Begin VB.ComboBox CMBMODELOPAGINA 
            Height          =   315
            Left            =   2070
            Style           =   2  'Dropdown List
            TabIndex        =   2
            Top             =   750
            Width           =   2565
         End
         Begin VB.TextBox TXTTITULODELAPAGINA 
            Height          =   315
            Left            =   2070
            MaxLength       =   255
            TabIndex        =   1
            Top             =   390
            Width           =   2565
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   0
            Left            =   90
            TabIndex        =   205
            Top             =   420
            UseMnemonic     =   0   'False
            Width           =   1905
         End
         Begin VB.Label LBLDESCRIPCION 
            Alignment       =   1  'Right Justify
            Height          =   255
            Index           =   1
            Left            =   90
            TabIndex        =   204
            Top             =   780
            UseMnemonic     =   0   'False
            Width           =   1905
         End
         Begin VB.Image IMGMODELOPAGINA 
            Height          =   1515
            Left            =   4800
            Picture         =   "FRMCONFIGURACION.frx":1285
            Stretch         =   -1  'True
            Top             =   360
            Width           =   1575
         End
      End
   End
   Begin MSComctlLib.TabStrip TABPESTANA 
      Height          =   19995
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10875
      _ExtentX        =   19182
      _ExtentY        =   35269
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   14
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab4 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab5 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab6 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab7 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab8 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab9 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab10 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab11 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab12 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab13 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab14 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "FRMCONFIGURACION"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public HASLENGUAJESCARRO As New HASHARRAY
Public STRLENGUAJEPORDEFECTO As String
Public BOLPREGUNTARSIDESEASALVAR As Boolean
Public LNGCOLUMNASELECIONADA As Long
Public BYTULTIMOMODELO As Byte



Public Sub TRADUCIRINTERFAZ()
  Dim I As Integer
  CMBMODELOPAGINA.Clear
  For I = 63 To 71
    CMBMODELOPAGINA.AddItem VARLENGUAJE(I)
  Next I
  For I = 191 To 196
    CMBMONEDAPRINCIPAL.AddItem VARLENGUAJE(I)
  Next I
  LBLDESCRIPCION(0).Caption = VARLENGUAJE(61)
  LBLDESCRIPCION(1).Caption = VARLENGUAJE(62)
  CMDANADIRLENGUAJE.Caption = VARLENGUAJE(72)
  CMDLENGUAJEPORDEFECTO.Caption = VARLENGUAJE(73)
  CHKPONERPRECIOENDOSMONEDAS.Caption = VARLENGUAJE(74)
  LBLDESCRIPCION(2).Caption = VARLENGUAJE(75)
  LBLDESCRIPCION(3).Caption = VARLENGUAJE(76)
  TABPESTANA.Tabs(1).Caption = VARLENGUAJE(84)
  TABPESTANA.Tabs(2).Caption = VARLENGUAJE(85)
  CHKINCLUIRBARRADENAVEGACION.Caption = VARLENGUAJE(77)
  CHKINCLUIRBUSCADOR.Caption = VARLENGUAJE(78)
  CHKINCLUIRELEGIRLENGUAJE.Caption = VARLENGUAJE(79)
  LBLDESCRIPCION(4).Caption = VARLENGUAJE(80)
  LBLDESCRIPCION(5).Caption = VARLENGUAJE(81)
  LBLDESCRIPCION(6).Caption = VARLENGUAJE(82)
  LBLDESCRIPCION(7).Caption = VARLENGUAJE(83)
  CMDELEGIRFUENTE.Caption = VARLENGUAJE(86)
  CMDELEGIRCOLORFUENTE.Caption = VARLENGUAJE(86)
  CHKINCLUIRBARRADENAVEGACION2.Caption = VARLENGUAJE(77)
  CHKINCLUIRBUSCADOR2.Caption = VARLENGUAJE(78)
  CHKINCLUIRELEGIRLENGUAJE2.Caption = VARLENGUAJE(79)
  LBLDESCRIPCION(8).Caption = VARLENGUAJE(80)
  LBLDESCRIPCION(9).Caption = VARLENGUAJE(81)
  LBLDESCRIPCION(10).Caption = VARLENGUAJE(82)
  LBLDESCRIPCION(11).Caption = VARLENGUAJE(83)
  CMDELEGIRFUENTE2.Caption = VARLENGUAJE(86)
  CMDELEGIRCOLORFUENTE2.Caption = VARLENGUAJE(86)
  TABPESTANA.Tabs(3).Caption = VARLENGUAJE(87)
  TABPESTANA.Tabs(4).Caption = VARLENGUAJE(88)
  
  
  CHKINCLUIRBARRADENAVEGACION3.Caption = VARLENGUAJE(77)
  CHKINCLUIRBUSCADOR3.Caption = VARLENGUAJE(78)
  CHKINCLUIRELEGIRLENGUAJE3.Caption = VARLENGUAJE(79)
  LBLDESCRIPCION(12).Caption = VARLENGUAJE(81)
  LBLDESCRIPCION(13).Caption = VARLENGUAJE(82)
  LBLDESCRIPCION(14).Caption = VARLENGUAJE(83)
  CMDELEGIRFUENTE3.Caption = VARLENGUAJE(86)
  CMDELEGIRCOLORFUENTE3.Caption = VARLENGUAJE(86)
  TABPESTANA.Tabs(5).Caption = VARLENGUAJE(89)
  TABPESTANA.Tabs(6).Caption = VARLENGUAJE(90)
  TABPESTANA.Tabs(7).Caption = VARLENGUAJE(91)
  TABPESTANA.Tabs(8).Caption = VARLENGUAJE(92)
  TABPESTANA.Tabs(9).Caption = VARLENGUAJE(93)
  TABPESTANA.Tabs(10).Caption = VARLENGUAJE(94)
  TABPESTANA.Tabs(11).Caption = VARLENGUAJE(95)
  TABPESTANA.Tabs(12).Caption = VARLENGUAJE(96)
  TABPESTANA.Tabs(13).Caption = VARLENGUAJE(97)
  FRAADORNO(4).Caption = VARLENGUAJE(98)
  FRAADORNO(5).Caption = VARLENGUAJE(99)
  FRAADORNO(6).Caption = VARLENGUAJE(100)
  FRAADORNO(27).Caption = VARLENGUAJE(101)
  FRAADORNO(1).Caption = VARLENGUAJE(102)
  FRAADORNO(2).Caption = VARLENGUAJE(103)
  FRAADORNO(3).Caption = VARLENGUAJE(104)
  CHKINCLUIRDISCLAIMER.Caption = VARLENGUAJE(105)
  LBLDESCRIPCION(18).Caption = VARLENGUAJE(106)
  LBLDESCRIPCION(19).Caption = VARLENGUAJE(107)
  LBLDESCRIPCION(32).Caption = VARLENGUAJE(108)
  LBLDESCRIPCION(15).Caption = VARLENGUAJE(109)
  CMDSELECCIONARCOLORENLACESVISTADOS.Caption = VARLENGUAJE(86)
  CMDSELECCIONARCOLORENLACESNOVISITADOS.Caption = VARLENGUAJE(86)
  CMDSELECCIONARIMAGENFONDO.Caption = VARLENGUAJE(86)
  FRAADORNO(24).Caption = VARLENGUAJE(101)
  FRAADORNO(23).Caption = VARLENGUAJE(110)
  FRAADORNO(25).Caption = VARLENGUAJE(103)
  FRAADORNO(26).Caption = VARLENGUAJE(104)
  CHKINCLUIRDISCLAIMER2.Caption = VARLENGUAJE(105)
  LBLDESCRIPCION(20).Caption = VARLENGUAJE(106)
  LBLDESCRIPCION(21).Caption = VARLENGUAJE(107)
  LBLDESCRIPCION(31).Caption = VARLENGUAJE(108)
  LBLDESCRIPCION(16).Caption = VARLENGUAJE(109)
  CMDSELECCIONARCOLORENLACESVISTADOS2.Caption = VARLENGUAJE(86)
  CMDSELECCIONARCOLORENLACESNOVISITADOS2.Caption = VARLENGUAJE(86)
  CMDSELECCIONARIMAGENFONDO2.Caption = VARLENGUAJE(86)
  FRAADORNO(0).Caption = VARLENGUAJE(101)
  FRAADORNO(11).Caption = VARLENGUAJE(111)
  FRAADORNO(21).Caption = VARLENGUAJE(103)
  FRAADORNO(22).Caption = VARLENGUAJE(104)
  CHKINCLUIRDISCLAIMER3.Caption = VARLENGUAJE(105)
  LBLDESCRIPCION(17).Caption = VARLENGUAJE(112)
  LBLDESCRIPCION(22).Caption = VARLENGUAJE(106)
  LBLDESCRIPCION(23).Caption = VARLENGUAJE(107)
  LBLDESCRIPCION(30).Caption = VARLENGUAJE(108)
  CMDSELECCIONARCOLORENLACESVISTADOS3.Caption = VARLENGUAJE(86)
  CMDSELECCIONARCOLORENLACESNOVISITADOS3.Caption = VARLENGUAJE(86)
  CMDSELECCIONARIMAGENFONDO3.Caption = VARLENGUAJE(86)
  FRAADORNO(44).Caption = VARLENGUAJE(113)
  FRAADORNO(45).Caption = VARLENGUAJE(114)
  FRAADORNO(46).Caption = VARLENGUAJE(115)
  LBLDESCRIPCION(24).Caption = VARLENGUAJE(116)
  LBLDESCRIPCION(25).Caption = VARLENGUAJE(117)
  LBLDESCRIPCION(26).Caption = VARLENGUAJE(118)
  CMDCOLORCAPABUSCADOR.Caption = VARLENGUAJE(86)
  CMDCOLORFONDOBUSCADOR.Caption = VARLENGUAJE(86)
  CMDCOLORBORDEBUSCADOR.Caption = VARLENGUAJE(86)
  CHKNOMBREDESCRIPCION.Caption = VARLENGUAJE(119)
  CHKPRECIO1.Caption = VARLENGUAJE(120)
  CHKCATEGORIA.Caption = VARLENGUAJE(90)
  CHKPRECIO2.Caption = VARLENGUAJE(121)
  LBLDESCRIPCION(27).Caption = VARLENGUAJE(81)
  LBLDESCRIPCION(28).Caption = VARLENGUAJE(82)
  LBLDESCRIPCION(29).Caption = VARLENGUAJE(83)
  CMDELEGIRTIPOFUENTEBUSCADOR.Caption = VARLENGUAJE(86)
  CMDELEGIRCOLORFUENTEBUSCADOR.Caption = VARLENGUAJE(86)
  FRAADORNO(18).Caption = VARLENGUAJE(122)
  FRAADORNO(19).Caption = VARLENGUAJE(123)
  FRAADORNO(20).Caption = VARLENGUAJE(124)
  FRAADORNO(28).Caption = VARLENGUAJE(125)
  FRAADORNO(29).Caption = VARLENGUAJE(126)
  LBLDESCRIPCION(33).Caption = VARLENGUAJE(127)
  LBLDESCRIPCION(34).Caption = VARLENGUAJE(128)
  LBLDESCRIPCION(35).Caption = VARLENGUAJE(81)
  LBLDESCRIPCION(36).Caption = VARLENGUAJE(82)
  LBLDESCRIPCION(37).Caption = VARLENGUAJE(83)
  CMDTIPOFUENTECATEGORIAS.Caption = VARLENGUAJE(86)
  CMDCOLORFUENTESSUBCATEGORIAS.Caption = VARLENGUAJE(86)
  LBLDESCRIPCION(38).Caption = VARLENGUAJE(81)
  LBLDESCRIPCION(39).Caption = VARLENGUAJE(82)
  LBLDESCRIPCION(40).Caption = VARLENGUAJE(83)
  CMDTIPOFUENTESUBCATEGORIAS.Caption = VARLENGUAJE(86)
  CMDCOLORFUENTESUBCATEGORIAS.Caption = VARLENGUAJE(86)
  LBLDESCRIPCION(41).Caption = VARLENGUAJE(129)
  LBLDESCRIPCION(49).Caption = VARLENGUAJE(130)
  LBLDESCRIPCION(50).Caption = VARLENGUAJE(131)
  CMDCOLORCATEGORIASIMPARES.Caption = VARLENGUAJE(86)
  CMDCOLORCATEGORIASPARES.Caption = VARLENGUAJE(86)
  FRAADORNO(9).Caption = VARLENGUAJE(132)
  FRAADORNO(10).Caption = VARLENGUAJE(133)
  FRAADORNO(12).Caption = VARLENGUAJE(134)
  FRAADORNO(13).Caption = VARLENGUAJE(135)
  FRAADORNO(16).Caption = VARLENGUAJE(136)
  LBLDESCRIPCION(44).Caption = VARLENGUAJE(137)
  LBLDESCRIPCION(42).Caption = VARLENGUAJE(138)
  LBLDESCRIPCION(45).Caption = VARLENGUAJE(131)
  LBLDESCRIPCION(43).Caption = VARLENGUAJE(130)
  LBLDESCRIPCION(47).Caption = VARLENGUAJE(139)
  LBLDESCRIPCION(46).Caption = VARLENGUAJE(140)
  LBLDESCRIPCION(51).Caption = VARLENGUAJE(81)
  LBLDESCRIPCION(52).Caption = VARLENGUAJE(82)
  LBLDESCRIPCION(53).Caption = VARLENGUAJE(83)
  LBLDESCRIPCION(48).Caption = VARLENGUAJE(136) & ":"
  CMDCOLORFONDOMINIFICHA2.Caption = VARLENGUAJE(86)
  CMDCOLORFONDOMINIFICHA.Caption = VARLENGUAJE(86)
  CMDTIPOFUENTEMINIFICHAS.Caption = VARLENGUAJE(86)
  CMDCOLORFUENTEMINIFICHAS.Caption = VARLENGUAJE(86)
  FRAADORNO(14).Caption = VARLENGUAJE(141)
  FRAADORNO(15).Caption = VARLENGUAJE(142)
  FRAADORNO(17).Caption = VARLENGUAJE(143)
  LBLDESCRIPCION(54).Caption = VARLENGUAJE(81)
  LBLDESCRIPCION(55).Caption = VARLENGUAJE(82)
  LBLDESCRIPCION(56).Caption = VARLENGUAJE(83)
  CMDTIPOFUENTESFICHAS.Caption = VARLENGUAJE(86)
  CMDCOLORFUENTEFICHAS.Caption = VARLENGUAJE(86)
  LBLDESCRIPCION(58).Caption = VARLENGUAJE(144)
  LBLDESCRIPCION(57).Caption = VARLENGUAJE(145)
  CMDCOLORFONDOCASILLASFICHAS.Caption = VARLENGUAJE(86)
  CMDCOLORFONDOFICHAS.Caption = VARLENGUAJE(86)
  LBLDESCRIPCION(60).Caption = VARLENGUAJE(139)
  LBLDESCRIPCION(59).Caption = VARLENGUAJE(140)
  FRAADORNO(8).Caption = VARLENGUAJE(146)
  FRAADORNO(7).Caption = VARLENGUAJE(147)
  LBLDESCRIPCION(64).Caption = VARLENGUAJE(148)
  LBLDESCRIPCION(65).Caption = VARLENGUAJE(149)
  CMDSELECCIONARFONDOCESTA.Caption = VARLENGUAJE(86)
  CMDSELECCIONARCOLORFONDOCASILLASCESTA.Caption = VARLENGUAJE(86)
  LBLDESCRIPCION(61).Caption = VARLENGUAJE(81)
  LBLDESCRIPCION(62).Caption = VARLENGUAJE(82)
  LBLDESCRIPCION(63).Caption = VARLENGUAJE(83)
  CMDSELECCIONARTIPOFUNTECESTA.Caption = VARLENGUAJE(86)
  CMDSELECCIONARCOLORFUENTECESTA.Caption = VARLENGUAJE(86)
  FRAADORNO(30).Caption = VARLENGUAJE(150)
  FRAADORNO(31).Caption = VARLENGUAJE(151)
  FRAADORNO(32).Caption = VARLENGUAJE(152)
  FRAADORNO(33).Caption = VARLENGUAJE(153)
  FRAADORNO(34).Caption = VARLENGUAJE(154)
  LBLDESCRIPCION(66).Caption = VARLENGUAJE(81)
  LBLDESCRIPCION(67).Caption = VARLENGUAJE(82)
  LBLDESCRIPCION(68).Caption = VARLENGUAJE(83)
  CMDTAMANOFUENTECOMPRAR.Caption = VARLENGUAJE(86)
  CMDCOLORFUENTECOMPRAR.Caption = VARLENGUAJE(86)
  LBLDESCRIPCION(69).Caption = VARLENGUAJE(155)
  LBLDESCRIPCION(70).Caption = VARLENGUAJE(156)
  CMDCOLORTABLAEXTERIOR.Caption = VARLENGUAJE(86)
  CMDCOLORTABLAINTERIOR.Caption = VARLENGUAJE(86)
  CHKINCLUIRLICENCIA.Caption = VARLENGUAJE(157)
  LBLDESCRIPCION(71).Caption = VARLENGUAJE(158)
  CHKGURDARPEDIDO.Caption = VARLENGUAJE(159)
  CHKPERMIRIESCRIBIRCOMENTARIOS.Caption = VARLENGUAJE(160)
  CHKINSTRUCCIONESESPECIALES.Caption = VARLENGUAJE(161)
  LBLDESCRIPCION(73).Caption = VARLENGUAJE(162)
  LBLDESCRIPCION(72).Caption = VARLENGUAJE(163)
  CHKPAYPAL.Caption = VARLENGUAJE(164)
  CHKTRANSFERENCIA.Caption = VARLENGUAJE(165)
  CHKCONTRAREMBOLSO.Caption = VARLENGUAJE(166)
  LBLDESCRIPCION(79).Caption = VARLENGUAJE(167)
  LBLDESCRIPCION(80).Caption = VARLENGUAJE(168)
  FRAADORNO(36).Caption = VARLENGUAJE(169)
  FRAADORNO(35).Caption = VARLENGUAJE(170)
  LBLDESCRIPCION(74).Caption = VARLENGUAJE(81)
  LBLDESCRIPCION(75).Caption = VARLENGUAJE(82)
  LBLDESCRIPCION(76).Caption = VARLENGUAJE(83)
  CMDSELECCIONARTIPOFUENTEFINAL.Caption = VARLENGUAJE(86)
  CMDCOLORFUENTEFINAL.Caption = VARLENGUAJE(86)
  LBLDESCRIPCION(77).Caption = VARLENGUAJE(155)
  LBLDESCRIPCION(78).Caption = VARLENGUAJE(156)
  CMDCOLORTABLAEXTERIOR2.Caption = VARLENGUAJE(86)
  CMDCOLORTABLAINTERIOR2.Caption = VARLENGUAJE(86)
  FRAADORNO(42).Caption = VARLENGUAJE(171)
  FRAADORNO(43).Caption = VARLENGUAJE(172)
  LBLDESCRIPCION(81).Caption = VARLENGUAJE(173)
  LBLDESCRIPCION(82).Caption = VARLENGUAJE(174)
  LBLDESCRIPCION(83).Caption = VARLENGUAJE(175)
  LBLDESCRIPCION(84).Caption = VARLENGUAJE(176)
  LBLDESCRIPCION(85).Caption = VARLENGUAJE(177)
  LBLDESCRIPCION(86).Caption = VARLENGUAJE(178)
  LBLDESCRIPCION(87).Caption = VARLENGUAJE(179)
  FRAADORNO(37).Caption = VARLENGUAJE(180)
  FRAADORNO(38).Caption = VARLENGUAJE(181)
  FRAADORNO(39).Caption = VARLENGUAJE(182)
  FRAADORNO(40).Caption = VARLENGUAJE(183)
  FRAADORNO(41).Caption = VARLENGUAJE(184)
  LBLDESCRIPCION(88).Caption = VARLENGUAJE(81)
  LBLDESCRIPCION(89).Caption = VARLENGUAJE(82)
  LBLDESCRIPCION(90).Caption = VARLENGUAJE(83)
  CMDTIPOFUENTEDISCLAIMER.Caption = VARLENGUAJE(86)
  CMDCOLORFUENTEDISCLAIMER.Caption = VARLENGUAJE(86)
  LBLDESCRIPCION(93).Caption = VARLENGUAJE(81)
  LBLDESCRIPCION(92).Caption = VARLENGUAJE(82)
  LBLDESCRIPCION(91).Caption = VARLENGUAJE(83)
  CMDTIPOFUENTERES.Caption = VARLENGUAJE(86)
  CMDCOLORFUENTERES.Caption = VARLENGUAJE(86)
  LBLDESCRIPCION(94).Caption = VARLENGUAJE(185)
  LBLDESCRIPCION(95).Caption = VARLENGUAJE(186)
  CMDLOGOEMPRESA.Caption = VARLENGUAJE(19)
  CHKPONERDISCLAIMER.Caption = VARLENGUAJE(187)
  CMDDISCLAIMER.Caption = VARLENGUAJE(188)
  CMDEDITARLICENCIA.Caption = VARLENGUAJE(189)
  CMDPAGPRICIPAL.Caption = VARLENGUAJE(190)
  LBLDESCRIPCION(96).Caption = VARLENGUAJE(200)
  CMDSELECCIONARCOLORFONDOMARCO.Caption = VARLENGUAJE(86)
  LBLDESCRIPCION(97).Caption = VARLENGUAJE(200)
  CMDSELECCIONARCOLORFONDOMARCO2.Caption = VARLENGUAJE(86)
  LBLDESCRIPCION(98).Caption = VARLENGUAJE(200)
  CMDSELECCIONARCOLORFONDOMARCO3.Caption = VARLENGUAJE(86)
  CMBPONERENLACESEN.Clear
  CMBPONERENLACESEN.AddItem VARLENGUAJE(203)
  CMBPONERENLACESEN.AddItem VARLENGUAJE(204)
  CMBPONERENLACESEN.AddItem VARLENGUAJE(205)
  CMBPONERLICENCIAEN.AddItem VARLENGUAJE(206)
  CMBPONERLICENCIAEN.AddItem VARLENGUAJE(207)
  TABPESTANA.Tabs(14).Caption = VARLENGUAJE(234)
  MSFGPRODUCTOS.Row = 0
  MSFGPRODUCTOS.Col = 0
  MSFGPRODUCTOS.Text = VARLENGUAJE(235)
  MSFGPRODUCTOS.Row = 0
  MSFGPRODUCTOS.Col = 1
  MSFGPRODUCTOS.Text = VARLENGUAJE(236)
  MSFGPRODUCTOS.Row = 0
  MSFGPRODUCTOS.Col = 2
  MSFGPRODUCTOS.Text = VARLENGUAJE(237)
  MSFGPRODUCTOS.Row = 0
  MSFGPRODUCTOS.Col = 3
  MSFGPRODUCTOS.Text = VARLENGUAJE(238)
  MSFGPRODUCTOS.Row = 0
  MSFGPRODUCTOS.Col = 4
  MSFGPRODUCTOS.Text = VARLENGUAJE(239)
  CMDANADIRPRODUCTO.Caption = VARLENGUAJE(240)
  CMDEDITARPRODUCTO.Caption = VARLENGUAJE(241)
  CMDBORRARPRODUCTO.Caption = VARLENGUAJE(59)
  CMDACTUALIZARPRODUCTO.Caption = VARLENGUAJE(242)
  FRAADORNO(47).Caption = VARLENGUAJE(325)
  CHKUSARHTTPS.Caption = VARLENGUAJE(326)
  LBLDESCRIPCION(99).Caption = VARLENGUAJE(327)
  LBLDESCRIPCION(100).Caption = VARLENGUAJE(328)
  LBLDESCRIPCION(101).Caption = VARLENGUAJE(329)
  
End Sub




Private Sub CHKGURDARPEDIDO_Click()
  If CHKGURDARPEDIDO.Value = 1 Then
  
    TXTDIASDEVIDADELCOOKIE.BackColor = &H80000005
    UPDDIASDEVIDADELCOOKIE.Enabled = True
  
  Else
  
    TXTDIASDEVIDADELCOOKIE.BackColor = &H8000000F
    UPDDIASDEVIDADELCOOKIE.Enabled = False
  
  
  End If
End Sub

Private Sub CHKINCLUIRBARRADENAVEGACION_Click()
  If SEPUEDEDESACTIVARBARRADENAVEGACION() = False Then
  
    MsgBox VARLENGUAJE(201), vbExclamation, NOMBRE_DEL_PROGRAMA
    CHKINCLUIRBARRADENAVEGACION.Value = 1
  End If
  
  If CHKINCLUIRBARRADENAVEGACION.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRBUSCADOR.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRDISCLAIMER.Value = 1 Then
    TXTURL.Enabled = False
    TXTURL.BackColor = &H8000000F
  Else
    TXTURL.Enabled = True
    TXTURL.BackColor = &H80000005
  End If
End Sub

Private Sub CHKINCLUIRBARRADENAVEGACION2_Click()
  If SEPUEDEDESACTIVARBARRADENAVEGACION() = False Then
    MsgBox VARLENGUAJE(201), vbExclamation, NOMBRE_DEL_PROGRAMA
    CHKINCLUIRBARRADENAVEGACION2.Value = 1
  End If
  If CHKINCLUIRBARRADENAVEGACION2.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRBUSCADOR2.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE2.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRDISCLAIMER2.Value = 1 Then
    TXTURL2.Enabled = False
    TXTURL2.BackColor = &H8000000F
  Else
    TXTURL2.Enabled = True
    TXTURL2.BackColor = &H80000005
  End If
End Sub

Private Sub CHKINCLUIRBARRADENAVEGACION3_Click()
  If SEPUEDEDESACTIVARBARRADENAVEGACION() = False Then
    MsgBox VARLENGUAJE(201), vbExclamation, NOMBRE_DEL_PROGRAMA
    CHKINCLUIRBARRADENAVEGACION3.Value = 1
  End If
End Sub

Private Sub CHKINCLUIRBUSCADOR_Click()
  If CHKINCLUIRBARRADENAVEGACION.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRBUSCADOR.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRDISCLAIMER.Value = 1 Then
    TXTURL.Enabled = False
    TXTURL.BackColor = &H8000000F
  Else
    TXTURL.Enabled = True
    TXTURL.BackColor = &H80000005
  End If
End Sub

Private Sub CHKINCLUIRBUSCADOR2_Click()
  If CHKINCLUIRBARRADENAVEGACION2.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRBUSCADOR2.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE2.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRDISCLAIMER2.Value = 1 Then
    TXTURL2.Enabled = False
    TXTURL2.BackColor = &H8000000F
  Else
    TXTURL2.Enabled = True
    TXTURL2.BackColor = &H80000005
  End If
End Sub

Private Sub CHKINCLUIRDISCLAIMER_Click()
  If CHKINCLUIRBARRADENAVEGACION.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRBUSCADOR.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRDISCLAIMER.Value = 1 Then
    TXTURL.Enabled = False
    TXTURL.BackColor = &H8000000F
  Else
    TXTURL.Enabled = True
    TXTURL.BackColor = &H80000005
  End If
End Sub

Private Sub CHKINCLUIRDISCLAIMER2_Click()
  If CHKINCLUIRBARRADENAVEGACION2.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRBUSCADOR2.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE2.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRDISCLAIMER2.Value = 1 Then
    TXTURL2.Enabled = False
    TXTURL2.BackColor = &H8000000F
  Else
    TXTURL2.Enabled = True
    TXTURL2.BackColor = &H80000005
  End If
End Sub



Private Sub CHKINCLUIRELEGIRLENGUAJE_Click()
  If CHKINCLUIRBARRADENAVEGACION.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRBUSCADOR.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRDISCLAIMER.Value = 1 Then
    TXTURL.Enabled = False
    TXTURL.BackColor = &H8000000F
  Else
    TXTURL.Enabled = True
    TXTURL.BackColor = &H80000005
  End If
End Sub

Private Sub CHKINCLUIRELEGIRLENGUAJE2_Click()
  If CHKINCLUIRBARRADENAVEGACION2.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRBUSCADOR2.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE2.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRDISCLAIMER2.Value = 1 Then
    TXTURL2.Enabled = False
    TXTURL2.BackColor = &H8000000F
  Else
    TXTURL2.Enabled = True
    TXTURL2.BackColor = &H80000005
  End If
End Sub

Private Sub CHKINCLUIRLICENCIA_Click()
  If CHKINCLUIRLICENCIA.Value = 1 Then
    CMBPONERLICENCIAEN.Enabled = True
  
  Else
    CMBPONERLICENCIAEN.Enabled = False
  
  End If
End Sub

Private Sub CHKPAYPAL_Click()
  If CHKPAYPAL.Value = 1 Then
    TXTEMAILPAYPAL.BackColor = &H80000005
    TXTEMAILPAYPAL.Enabled = True
  Else
    
    TXTEMAILPAYPAL.BackColor = &H8000000F
    TXTEMAILPAYPAL.Enabled = False
    
  End If
End Sub

Private Sub CHKPONERPRECIOENDOSMONEDAS_Click()
  If CHKPONERPRECIOENDOSMONEDAS.Value = 1 Then
    TXTNOMBREMONEDASECUNDARIA.Enabled = True
    TXTNOMBREMONEDASECUNDARIA.BackColor = &H80000005
 
  Else
  
    TXTNOMBREMONEDASECUNDARIA.Enabled = False
    TXTNOMBREMONEDASECUNDARIA.BackColor = &H8000000F

  
  End If
End Sub

Private Sub CHKTRANSFERENCIA_Click()
  If CHKTRANSFERENCIA.Value = 1 Then
    TXTCUENTABANCARIA.BackColor = &H80000005
    TXTCUENTABANCARIA.Enabled = True
  Else
    TXTCUENTABANCARIA.BackColor = &H8000000F
    TXTCUENTABANCARIA.Enabled = False
  
  End If
End Sub

Private Sub CHKUSARHTTPS_Click()
  If CHKUSARHTTPS.Value = 1 Then
    LBLDESCRIPCION(100).Enabled = True
    TXTPUERTOHTTPS.Enabled = True
  Else
    LBLDESCRIPCION(100).Enabled = False
    TXTPUERTOHTTPS.Enabled = False
  End If
End Sub

Private Sub CMBMODELOPAGINA_Click()
  On Error Resume Next
  IMGMODELOPAGINA.Picture = LoadPicture(STRRUTA & "Imagenes\" & CMBMODELOPAGINA.ListIndex & ".jpg")
  If CMBMODELOPAGINA.ListIndex = 0 Then
    CHKINCLUIRBARRADENAVEGACION3.Value = 1
  ElseIf CMBMODELOPAGINA.ListIndex >= 1 And CMBMODELOPAGINA.ListIndex <= 4 And CHKINCLUIRBARRADENAVEGACION3.Value = 0 And CHKINCLUIRBARRADENAVEGACION.Value = 0 Then
    CHKINCLUIRBARRADENAVEGACION3.Value = 1
  ElseIf CMBMODELOPAGINA.ListIndex >= 5 And CHKINCLUIRBARRADENAVEGACION3.Value = 0 And CHKINCLUIRBARRADENAVEGACION.Value = 0 And CHKINCLUIRBARRADENAVEGACION2.Value = 0 Then
    CHKINCLUIRBARRADENAVEGACION3.Value = 1
  End If
  If CMBMODELOPAGINA.ListIndex < 1 Then
    CHKINCLUIRBARRADENAVEGACION.Enabled = False
    CHKINCLUIRBUSCADOR.Enabled = False
    CHKINCLUIRELEGIRLENGUAJE.Enabled = False
    CHKINCLUIRDISCLAIMER.Enabled = False
    TXTTIPOFUENTE.Enabled = False
    CMDELEGIRFUENTE.Enabled = False
    CMDELEGIRCOLORFUENTE.Enabled = False
    CMBTAMANOFUENTE.Enabled = False
    CMDSELECCIONARCOLORENLACESVISTADOS.Enabled = False
    CMDSELECCIONARCOLORENLACESVISTADOS.Enabled = False
    CMDSELECCIONARCOLORENLACESNOVISITADOS.Enabled = False
    TXTIMAGENFONDO.Enabled = False
    CMDSELECCIONARIMAGENFONDO.Enabled = False
    TXTURL.Enabled = False
    TXTANCHODELMARCO.Enabled = False
    UPDANCHOMARCO.Enabled = False
    LBLDESCRIPCION(5).Enabled = False
    LBLDESCRIPCION(6).Enabled = False
    LBLDESCRIPCION(7).Enabled = False
    LBLDESCRIPCION(18).Enabled = False
    LBLDESCRIPCION(19).Enabled = False
    LBLDESCRIPCION(32).Enabled = False
    LBLDESCRIPCION(4).Enabled = False
    LBLDESCRIPCION(15).Enabled = False
    LBLTEXTOFIJO(5).Enabled = False
    FRAADORNO(27).Enabled = False
    FRAADORNO(1).Enabled = False
    FRAADORNO(2).Enabled = False
    FRAADORNO(3).Enabled = False
    CHKINCLUIRBARRADENAVEGACION.BackColor = &H8000000F
    CHKINCLUIRBUSCADOR.BackColor = &H8000000F
    CHKINCLUIRELEGIRLENGUAJE.BackColor = &H8000000F
    CHKINCLUIRDISCLAIMER.BackColor = &H8000000F
    TXTTIPOFUENTE.BackColor = &H8000000F
    TXTIMAGENFONDO.BackColor = &H8000000F
    TXTURL.BackColor = &H8000000F
    TXTANCHODELMARCO.BackColor = &H8000000F
  Else
  
    CHKINCLUIRBARRADENAVEGACION.Enabled = True
    CHKINCLUIRBUSCADOR.Enabled = True
    CHKINCLUIRELEGIRLENGUAJE.Enabled = True
    CHKINCLUIRDISCLAIMER.Enabled = True
    TXTTIPOFUENTE.Enabled = True
    CMDELEGIRFUENTE.Enabled = True
    CMDELEGIRCOLORFUENTE.Enabled = True
    CMBTAMANOFUENTE.Enabled = True
    CMDSELECCIONARCOLORENLACESVISTADOS.Enabled = True
    CMDSELECCIONARCOLORENLACESVISTADOS.Enabled = True
    CMDSELECCIONARCOLORENLACESNOVISITADOS.Enabled = True
    TXTIMAGENFONDO.Enabled = True
    CMDSELECCIONARIMAGENFONDO.Enabled = True
    TXTURL.Enabled = True
    TXTANCHODELMARCO.Enabled = True
    UPDANCHOMARCO.Enabled = True
    LBLDESCRIPCION(5).Enabled = True
    LBLDESCRIPCION(6).Enabled = True
    LBLDESCRIPCION(7).Enabled = True
    LBLDESCRIPCION(18).Enabled = True
    LBLDESCRIPCION(19).Enabled = True
    LBLDESCRIPCION(32).Enabled = True
    LBLDESCRIPCION(4).Enabled = True
    LBLDESCRIPCION(15).Enabled = True
    LBLTEXTOFIJO(5).Enabled = True
    FRAADORNO(27).Enabled = True
    FRAADORNO(1).Enabled = True
    FRAADORNO(2).Enabled = True
    FRAADORNO(3).Enabled = True
    CHKINCLUIRBARRADENAVEGACION.BackColor = &H8000000F
    CHKINCLUIRBUSCADOR.BackColor = &H8000000F
    CHKINCLUIRELEGIRLENGUAJE.BackColor = &H8000000F
    CHKINCLUIRDISCLAIMER.BackColor = &H8000000F
    TXTTIPOFUENTE.BackColor = &H80000005
    TXTIMAGENFONDO.BackColor = &H80000005
    TXTURL.BackColor = &H80000005
    TXTANCHODELMARCO.BackColor = &H80000005
    If FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRBUSCADOR.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRDISCLAIMER.Value = 1 Then
      FRMCONFIGURACION.TXTURL.Enabled = False
      FRMCONFIGURACION.TXTURL.BackColor = &H8000000F
    Else
  
      FRMCONFIGURACION.TXTURL.Enabled = True
      FRMCONFIGURACION.TXTURL.BackColor = &H80000005
    
    End If
  End If
  If CMBMODELOPAGINA.ListIndex < 5 Then
  
    CHKINCLUIRBARRADENAVEGACION2.Enabled = False
    CHKINCLUIRBUSCADOR2.Enabled = False
    CHKINCLUIRELEGIRLENGUAJE2.Enabled = False
    CHKINCLUIRDISCLAIMER2.Enabled = False
    TXTTIPOFUENTE2.Enabled = False
    CMDELEGIRFUENTE2.Enabled = False
    CMDELEGIRCOLORFUENTE2.Enabled = False
    CMBTAMANOFUENTE2.Enabled = False
    CMDSELECCIONARCOLORENLACESVISTADOS2.Enabled = False
    CMDSELECCIONARCOLORENLACESVISTADOS2.Enabled = False
    CMDSELECCIONARCOLORENLACESNOVISITADOS2.Enabled = False
    TXTIMAGENFONDO2.Enabled = False
    CMDSELECCIONARIMAGENFONDO2.Enabled = False
    TXTURL2.Enabled = False
    TXTANCHODELMARCO2.Enabled = False
    UPDANCHOMARCO2.Enabled = False
    LBLDESCRIPCION(9).Enabled = False
    LBLDESCRIPCION(10).Enabled = False
    LBLDESCRIPCION(11).Enabled = False
    LBLDESCRIPCION(20).Enabled = False
    LBLDESCRIPCION(21).Enabled = False
    LBLDESCRIPCION(31).Enabled = False
    LBLDESCRIPCION(8).Enabled = False
    LBLDESCRIPCION(16).Enabled = False
    LBLTEXTOFIJO(4).Enabled = False
    FRAADORNO(24).Enabled = False
    FRAADORNO(23).Enabled = False
    FRAADORNO(25).Enabled = False
    FRAADORNO(26).Enabled = False
    CHKINCLUIRBARRADENAVEGACION2.BackColor = &H8000000F
    CHKINCLUIRBUSCADOR2.BackColor = &H8000000F
    CHKINCLUIRELEGIRLENGUAJE2.BackColor = &H8000000F
    CHKINCLUIRDISCLAIMER2.BackColor = &H8000000F
    TXTTIPOFUENTE2.BackColor = &H8000000F
    TXTIMAGENFONDO2.BackColor = &H8000000F
    TXTURL2.BackColor = &H8000000F
    TXTANCHODELMARCO2.BackColor = &H8000000F
    Rem HASLENGUAJESCARRO.HashArrayType = False
    
  Else
    CHKINCLUIRBARRADENAVEGACION2.Enabled = True
    CHKINCLUIRBUSCADOR2.Enabled = True
    CHKINCLUIRELEGIRLENGUAJE2.Enabled = True
    CHKINCLUIRDISCLAIMER2.Enabled = True
    TXTTIPOFUENTE2.Enabled = True
    CMDELEGIRFUENTE2.Enabled = True
    CMDELEGIRCOLORFUENTE2.Enabled = True
    CMBTAMANOFUENTE2.Enabled = True
    CMDSELECCIONARCOLORENLACESVISTADOS2.Enabled = True
    CMDSELECCIONARCOLORENLACESVISTADOS2.Enabled = True
    CMDSELECCIONARCOLORENLACESNOVISITADOS2.Enabled = True
    TXTIMAGENFONDO2.Enabled = True
    CMDSELECCIONARIMAGENFONDO2.Enabled = True
    TXTURL2.Enabled = True
    TXTANCHODELMARCO2.Enabled = True
    UPDANCHOMARCO2.Enabled = True
    LBLDESCRIPCION(9).Enabled = True
    LBLDESCRIPCION(10).Enabled = True
    LBLDESCRIPCION(11).Enabled = True
    LBLDESCRIPCION(20).Enabled = True
    LBLDESCRIPCION(21).Enabled = True
    LBLDESCRIPCION(31).Enabled = True
    LBLDESCRIPCION(8).Enabled = True
    LBLDESCRIPCION(16).Enabled = True
    LBLTEXTOFIJO(4).Enabled = True
    FRAADORNO(24).Enabled = True
    FRAADORNO(23).Enabled = True
    FRAADORNO(25).Enabled = True
    FRAADORNO(26).Enabled = True
    CHKINCLUIRBARRADENAVEGACION2.BackColor = &H8000000F
    CHKINCLUIRBUSCADOR2.BackColor = &H8000000F
    CHKINCLUIRELEGIRLENGUAJE2.BackColor = &H8000000F
    CHKINCLUIRDISCLAIMER2.BackColor = &H8000000F
    TXTTIPOFUENTE2.BackColor = &H80000005
    TXTIMAGENFONDO2.BackColor = &H80000005
    TXTURL2.BackColor = &H80000005
    TXTANCHODELMARCO2.BackColor = &H80000005
    Rem HASLENGUAJESCARRO.HashArrayType = False
    If FRMCONFIGURACION.CHKINCLUIRBARRADENAVEGACION2.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRBUSCADOR2.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRELEGIRLENGUAJE2.Value = 1 Or FRMCONFIGURACION.CHKINCLUIRDISCLAIMER2.Value = 1 Then
      FRMCONFIGURACION.TXTURL2.Enabled = False
      FRMCONFIGURACION.TXTURL2.BackColor = &H8000000F
    Else
  
      FRMCONFIGURACION.TXTURL2.Enabled = True
      FRMCONFIGURACION.TXTURL2.BackColor = &H80000005
    
    End If
  
  End If
  BYTULTIMOMODELO = CMBMODELOPAGINA.ListIndex
End Sub

Private Sub CMDACTUALIZARPRODUCTO_Click()
  ACTUALIZARLISTAPRODUCTOS
End Sub

Private Sub CMDANADIRLENGUAJE_Click()
  Load FRMANADIRLENGUAJES
  FRMANADIRLENGUAJES.Show (1)
End Sub

Private Sub CMDANADIRPRODUCTO_Click()
  Load FRMANADIREDITARPRODUCTO
  FRMANADIREDITARPRODUCTO.Show (1)
  ACTUALIZARLISTAPRODUCTOS
End Sub

Private Sub CMDBORRARPRODUCTO_Click()
  On Error GoTo CAMPO
  Dim DBREGISTRO As Database
  Dim RSTABLA As Recordset
  
  Dim I As Long
  
  If MsgBox(VARLENGUAJE(273), vbInformation + vbYesNo, NOMBRE_DEL_PROGRAMA) = vbNo Then
  
    Exit Sub
  
  End If
  MSFGPRODUCTOS.Row = LNGCOLUMNASELECIONADA
  MSFGPRODUCTOS.Col = 1
  Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("SELECT *  FROM IMAGENES WHERE idproducto='" & Replace(MSFGPRODUCTOS.Text, "'", ",,") & "'", dbOpenDynaset)
  Do While RSTABLA.EOF = False
    RSTABLA.Delete
    RSTABLA.MoveNext
  Loop
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  
  Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("SELECT *  FROM MODELOS WHERE idproducto='" & Replace(MSFGPRODUCTOS.Text, "'", ",,") & "'", dbOpenDynaset)
  Do While RSTABLA.EOF = False
    RSTABLA.Delete
    RSTABLA.MoveNext
  Loop
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("SELECT *  FROM PRODUCTOS WHERE idproducto='" & Replace(MSFGPRODUCTOS.Text, "'", ",,") & "'", dbOpenDynaset)
  Do While RSTABLA.EOF = False
    RSTABLA.Delete
    RSTABLA.MoveNext
  Loop
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  ACTUALIZARLISTAPRODUCTOS
  Exit Sub
CAMPO:
  If Err.Number = 3260 Or Err.Number = 3050 Then
    Resume
    Exit Sub
  End If
  If MsgBox(VARLENGUAJE(274), vbCritical + vbRetryCancel, NOMBRE_DEL_PROGRAMA) = vbRetry Then
    Err.Clear
    Resume
  End If
  On Error Resume Next
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
End Sub

Private Sub CMDCOLORBORDEBUSCADOR_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORBORDEBUSCADOR.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORCAPABUSCADOR_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORCAPABUSCADOR.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORCATEGORIASIMPARES_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORCATEGORIASIMPARES.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORCATEGORIASPARES_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORCATEGORIASPARES.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORFONDOBUSCADOR_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFONDOBUSCADOR.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORFONDOCASILLASFICHAS_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORCASILLASFICHAS.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORFONDOFICHAS_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFICHAS.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORFONDOMINIFICHA_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFONDOMINIFICHA.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORFONDOMINIFICHA2_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFONDOMINIFICHA2.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORFUENTECOMPRAR_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFUENTECOMPRAR.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORFUENTEDISCLAIMER_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFUENTEDISCLAIMER.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORFUENTEFICHAS_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFUENTEFICHAS.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORFUENTEFINAL_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFUENTEFINAL.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORFUENTEMINIFICHAS_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICOLORFUENTEMINIFICHAS.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORFUENTERES_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFUENTERES.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORFUENTESSUBCATEGORIAS_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFUENTECATEGORIAS.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORFUENTESUBCATEGORIAS_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFUENTESUBCATEGORIAS.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORTABLAEXTERIOR_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORTABLAEXTERIORCOMPRA.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORTABLAEXTERIOR2_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORTABLAEXTERIOR.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORTABLAINTERIOR_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORTABLAINTERIORCOMPRA.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDCOLORTABLAINTERIOR2_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORTABLAINTERIOR.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub



Private Sub CMDDISCLAIMER_Click()
  Load FRMEDITOR
  FRMEDITOR.STRLENGUAJE = LSTLENGUAJES.Text
  FRMEDITOR.BYTTIPOTEXTO = 1
  FRMEDITOR.Caption = VARLENGUAJE(188)
  FRMEDITOR.CARGARTEXTO
  FRMEDITOR.Show (1)
End Sub

Private Sub CMDEDITARLICENCIA_Click()
  Load FRMEDITOR
  FRMEDITOR.STRLENGUAJE = LSTLENGUAJES.Text
  FRMEDITOR.BYTTIPOTEXTO = 2
  FRMEDITOR.Caption = VARLENGUAJE(189)
  FRMEDITOR.CARGARTEXTO
  FRMEDITOR.Show (1)
End Sub

Private Sub CMDEDITARPRODUCTO_Click()
  On Error GoTo CAMPO
  Dim DBREGISTRO As Database
  Dim RSTABLA As Recordset
  
  
  Load FRMANADIREDITARPRODUCTO
  MSFGPRODUCTOS.Row = LNGCOLUMNASELECIONADA
  MSFGPRODUCTOS.Col = 1
  Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("SELECT * FROM PRODUCTOS WHERE idproducto='" & Replace(MSFGPRODUCTOS.Text, "'", "''") & "'", dbOpenDynaset)
  If RSTABLA.RecordCount <= 0 Then
    On Error Resume Next
    RSTABLA.Close
    DBREGISTRO.Close
    Set RSTABLA = Nothing
    Set DBREGISTRO = Nothing
    Unload FRMANADIREDITARPRODUCTO
    MsgBox VARLENGUAJE(256), vbExclamation, NOMBRE_DEL_PROGRAMA
    ACTUALIZARLISTAPRODUCTOS
    Exit Sub
  End If
  
  FRMANADIREDITARPRODUCTO.TXTNOMBRE.Text = RSTABLA.Fields("nombreproducto")
  FRMANADIREDITARPRODUCTO.TXTID.Text = RSTABLA.Fields("idproducto")
  FRMANADIREDITARPRODUCTO.TXTCATEGORIA.Text = RSTABLA.Fields("categoria")
  FRMANADIREDITARPRODUCTO.TXTSUBCATEGORIA.Text = RSTABLA.Fields("subcategoria")
  If RSTABLA.Fields("descripcion") <> vbNullString Then
    FRMANADIREDITARPRODUCTO.RTXTDESCRIPCION.Text = RSTABLA.Fields("descripcion")
  End If
  RSTABLA.Close
  DBREGISTRO.Close
  
  Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("SELECT * FROM MODELOS WHERE idproducto='" & Replace(MSFGPRODUCTOS.Text, "'", "''") & "'", dbOpenDynaset)
  Do While RSTABLA.EOF = False
    FRMANADIREDITARPRODUCTO.ANADIRMODELO RSTABLA.Fields("modelo"), RSTABLA.Fields("precio1"), RSTABLA.Fields("precio2"), RSTABLA.Fields("descuento"), RSTABLA.Fields("impuesto")
    RSTABLA.MoveNext
  Loop
  RSTABLA.Close
  DBREGISTRO.Close
  Set DBREGISTRO = OpenDatabase(STRRUTA & "Proyectos\" & STRNOMBREPROYECTO & "\configshop.edb", False, False, "; user=admin;pwd=HIAYDF")
  Set RSTABLA = DBREGISTRO.OpenRecordset("SELECT * FROM IMAGENES WHERE idproducto='" & Replace(MSFGPRODUCTOS.Text, "'", "''") & "'", dbOpenDynaset)
  If RSTABLA.RecordCount >= 1 Then
    FRMANADIREDITARPRODUCTO.CHKINCLUIRIMAGEN.Value = 1
    FRMANADIREDITARPRODUCTO.TXTNOMBREIMAGEN.Text = RSTABLA.Fields("nombreimagen")
    FRMANADIREDITARPRODUCTO.TXTIMAGENID.Text = RSTABLA.Fields("imagenid")
    If RSTABLA.Fields("copyright") <> vbNullString Then
    
      FRMANADIREDITARPRODUCTO.TXTCOPY.Text = RSTABLA.Fields("copyright")
    
    End If
    
    If RSTABLA.Fields("alternativetext") <> vbNullString Then
    
      FRMANADIREDITARPRODUCTO.TXTALTER.Text = RSTABLA.Fields("alternativetext")
    
    End If
    If RSTABLA.Fields("description") <> vbNullString Then
    
      FRMANADIREDITARPRODUCTO.TXTDESCRIPCION.Text = RSTABLA.Fields("description")
    
    End If
    FRMANADIREDITARPRODUCTO.TXTIMAGEN.Text = RSTABLA.Fields("archivo")

  End If
  RSTABLA.Close
  DBREGISTRO.Close
  Set RSTABLA = Nothing
  Set DBREGISTRO = Nothing
  FRMANADIREDITARPRODUCTO.TXTNOMBRE.Enabled = False
  FRMANADIREDITARPRODUCTO.TXTNOMBRE.BackColor = &H80000005
  FRMANADIREDITARPRODUCTO.TXTID.Enabled = False
  FRMANADIREDITARPRODUCTO.TXTID.BackColor = &H80000005
  FRMANADIREDITARPRODUCTO.Show (1)
  ACTUALIZARLISTAPRODUCTOS
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
  Unload FRMANADIREDITARPRODUCTO
  
End Sub

Private Sub CMDELEGIRCOLORFUENTE_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFUENTE.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDELEGIRCOLORFUENTE2_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFUENTE2.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDELEGIRCOLORFUENTE3_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFUENTE3.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDELEGIRCOLORFUENTEBUSCADOR_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFUENTEBUSCADOR.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDELEGIRFUENTE_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.Min = 1
  CMDCUADRO.Max = 7
  CMDCUADRO.Flags = cdlCFScreenFonts + cdlCFLimitSize
  CMDCUADRO.FontName = TXTTIPOFUENTE.Text
  CMDCUADRO.FontSize = CInt(CMBTAMANOFUENTE.Text)
  
  CMDCUADRO.ShowFont
  TXTTIPOFUENTE.Text = CMDCUADRO.FontName
  CMBTAMANOFUENTE.Text = CMDCUADRO.FontSize
  Exit Sub
CAMPO:
End Sub

Private Sub CMDELEGIRFUENTE2_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.Min = 1
  CMDCUADRO.Max = 7
  CMDCUADRO.Flags = cdlCFScreenFonts + cdlCFLimitSize
  CMDCUADRO.FontName = TXTTIPOFUENTE2.Text
  CMDCUADRO.FontSize = CInt(CMBTAMANOFUENTE2.Text)
  
  CMDCUADRO.ShowFont
  TXTTIPOFUENTE2.Text = CMDCUADRO.FontName
  CMBTAMANOFUENTE2.Text = CMDCUADRO.FontSize
  Exit Sub
CAMPO:
End Sub

Private Sub CMDELEGIRFUENTE3_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.Min = 1
  CMDCUADRO.Max = 7
  CMDCUADRO.Flags = cdlCFScreenFonts + cdlCFLimitSize
  CMDCUADRO.FontName = TXTTIPOFUENTE3.Text
  CMDCUADRO.FontSize = CInt(CMBTAMANOFUENTE3.Text)
  
  CMDCUADRO.ShowFont
  TXTTIPOFUENTE3.Text = CMDCUADRO.FontName
  CMBTAMANOFUENTE3.Text = CMDCUADRO.FontSize
  Exit Sub
CAMPO:
End Sub

Private Sub CMDELEGIRTIPOFUENTEBUSCADOR_Click()
 On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.Min = 1
  CMDCUADRO.Max = 7
  CMDCUADRO.Flags = cdlCFScreenFonts + cdlCFLimitSize
  CMDCUADRO.FontName = TXTFUENTEBUSCADOR.Text
  CMDCUADRO.FontSize = CInt(CMBTAMANOFUENTEBUSCADOR.Text)
  
  CMDCUADRO.ShowFont
  TXTFUENTEBUSCADOR.Text = CMDCUADRO.FontName
  CMBTAMANOFUENTEBUSCADOR.Text = CMDCUADRO.FontSize
  Exit Sub
CAMPO:
End Sub

Private Sub CMDLENGUAJEPORDEFECTO_Click()
  Load FRMLENGUAJEPORDEFECTO
  FRMLENGUAJEPORDEFECTO.Show (1)
End Sub

Private Sub CMDLOGOEMPRESA_Click()
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
  TXTLOGOEMPRESA.Text = FSOARCHIVO.GetFileName(STRRUTAARCHIVO)
  Exit Sub
CAMPO:
End Sub

Private Sub CMDPAGPRICIPAL_Click()
  Load FRMEDITOR
  FRMEDITOR.STRLENGUAJE = LSTLENGUAJES.Text
  FRMEDITOR.BYTTIPOTEXTO = 3
  FRMEDITOR.Caption = VARLENGUAJE(190)
  FRMEDITOR.CARGARTEXTO
  FRMEDITOR.Show (1)
End Sub

Private Sub CMDSELECCIONARIMAGENFONDO2_Click()
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
  TXTIMAGENFONDO2.Text = FSOARCHIVO.GetFileName(STRRUTAARCHIVO)
  Exit Sub
CAMPO:
End Sub

Private Sub CMDSELECCIONARCOLORENLACESNOVISITADOS_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORENLACESNOVISITADOS.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDSELECCIONARCOLORENLACESNOVISITADOS2_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORENLACESNOVISITADOS2.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDSELECCIONARCOLORENLACESNOVISITADOS3_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORENLACESNOVISITADOS3.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDSELECCIONARCOLORENLACESVISTADOS_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORENLACESVISITADOS.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDSELECCIONARCOLORENLACESVISTADOS2_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORENLACESVISITADOS2.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDSELECCIONARCOLORENLACESVISTADOS3_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORENLACESVISITADOS3.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDSELECCIONARCOLORFONDOCASILLASCESTA_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORCASILLASCESTA.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDSELECCIONARCOLORFONDOMARCO_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFONDOMARCO.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDSELECCIONARCOLORFONDOMARCO2_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFONDOMARCO2.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDSELECCIONARCOLORFONDOMARCO3_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFONDOMARCO3.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDSELECCIONARCOLORFUENTECESTA_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFUENTECESTA.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDSELECCIONARFONDOCESTA_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.ShowColor
  PICCOLORFONDOCESTA.BackColor = CMDCUADRO.Color
  Exit Sub
CAMPO:
End Sub

Private Sub CMDSELECCIONARIMAGENFONDO_Click()
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
  TXTIMAGENFONDO.Text = FSOARCHIVO.GetFileName(STRRUTAARCHIVO)
  Exit Sub
CAMPO:
End Sub



Private Sub CMDSELECCIONARIMAGENFONDO3_Click()
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
  TXTIMAGENFONDO3.Text = FSOARCHIVO.GetFileName(STRRUTAARCHIVO)
  Exit Sub
CAMPO:
End Sub

Private Sub CMDSELECCIONARTIPOFUENTEFINAL_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.Min = 1
  CMDCUADRO.Max = 7
  CMDCUADRO.Flags = cdlCFScreenFonts + cdlCFLimitSize
  CMDCUADRO.FontName = TXTTIPOFUENTEFINAL.Text
  CMDCUADRO.FontSize = CInt(CMBTAMANOFUENTEFINAL.Text)
  
  CMDCUADRO.ShowFont
  TXTTIPOFUENTEFINAL.Text = CMDCUADRO.FontName
  CMBTAMANOFUENTEFINAL.Text = CMDCUADRO.FontSize
  Exit Sub
CAMPO:
End Sub

Private Sub CMDSELECCIONARTIPOFUNTECESTA_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.Min = 1
  CMDCUADRO.Max = 7
  CMDCUADRO.Flags = cdlCFScreenFonts + cdlCFLimitSize
  CMDCUADRO.FontName = TXTTIPOFUENTECESTA.Text
  CMDCUADRO.FontSize = CInt(CMBTAMANOFUENTECESTA.Text)
  
  CMDCUADRO.ShowFont
  TXTTIPOFUENTECESTA.Text = CMDCUADRO.FontName
  CMBTAMANOFUENTECESTA.Text = CMDCUADRO.FontSize
  Exit Sub
CAMPO:
End Sub

Private Sub CMDTAMANOFUENTECOMPRAR_Click()
 On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.Min = 1
  CMDCUADRO.Max = 7
  CMDCUADRO.Flags = cdlCFScreenFonts + cdlCFLimitSize
  CMDCUADRO.FontName = TXTTIPOFUENTECOMPRAR.Text
  CMDCUADRO.FontSize = CInt(CMBTAMANOFUENTECOMPRAR.Text)
  
  CMDCUADRO.ShowFont
  TXTTIPOFUENTECOMPRAR.Text = CMDCUADRO.FontName
  CMBTAMANOFUENTECOMPRAR.Text = CMDCUADRO.FontSize
  Exit Sub
CAMPO:
End Sub

Private Sub CMDTIPOFUENTECATEGORIAS_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.Min = 1
  CMDCUADRO.Max = 7
  CMDCUADRO.Flags = cdlCFScreenFonts + cdlCFLimitSize
  CMDCUADRO.FontName = TXTTIPOFUENTECATEGORIAS.Text
  CMDCUADRO.FontSize = CInt(CMBTAMANOFUENTECATEGORIAS.Text)
  
  CMDCUADRO.ShowFont
  TXTTIPOFUENTECATEGORIAS.Text = CMDCUADRO.FontName
  CMBTAMANOFUENTECATEGORIAS.Text = CMDCUADRO.FontSize
  Exit Sub
CAMPO:
End Sub

Private Sub CMDTIPOFUENTEDISCLAIMER_Click()
 On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.Min = 1
  CMDCUADRO.Max = 7
  CMDCUADRO.Flags = cdlCFScreenFonts + cdlCFLimitSize
  CMDCUADRO.FontName = TXTTIPOFUENTEDISCLAIMER.Text
  CMDCUADRO.FontSize = CInt(CMBTAMANOFUENTEDISCLAIMER.Text)
  
  CMDCUADRO.ShowFont
  TXTTIPOFUENTEDISCLAIMER.Text = CMDCUADRO.FontName
  CMBTAMANOFUENTEDISCLAIMER.Text = CMDCUADRO.FontSize
  Exit Sub
CAMPO:
End Sub

Private Sub CMDTIPOFUENTEMINIFICHAS_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.Min = 1
  CMDCUADRO.Max = 7
  CMDCUADRO.Flags = cdlCFScreenFonts + cdlCFLimitSize
  CMDCUADRO.FontName = TXTTIPOFUENTEMINIFICHA.Text
  CMDCUADRO.FontSize = CInt(CMDBTAMANOFUENTEMINICATEGORIAS.Text)
  
  CMDCUADRO.ShowFont
  TXTTIPOFUENTEMINIFICHA.Text = CMDCUADRO.FontName
  CMDBTAMANOFUENTEMINICATEGORIAS.Text = CMDCUADRO.FontSize
  Exit Sub
CAMPO:
End Sub

Private Sub CMDTIPOFUENTERES_Click()
 On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.Min = 1
  CMDCUADRO.Max = 7
  CMDCUADRO.Flags = cdlCFScreenFonts + cdlCFLimitSize
  CMDCUADRO.FontName = TXTTIPOFUNTERES.Text
  CMDCUADRO.FontSize = CInt(CMBTAMANOFUENTERES.Text)
  
  CMDCUADRO.ShowFont
  TXTTIPOFUNTERES.Text = CMDCUADRO.FontName
  CMBTAMANOFUENTERES.Text = CMDCUADRO.FontSize
  Exit Sub
CAMPO:
End Sub

Private Sub CMDTIPOFUENTESFICHAS_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.Min = 1
  CMDCUADRO.Max = 7
  CMDCUADRO.Flags = cdlCFScreenFonts + cdlCFLimitSize
  CMDCUADRO.FontName = TXTTIPOFUENTEFICHAS.Text
  CMDCUADRO.FontSize = CInt(CMBTAMANOFUENTEFICHAS.Text)
  
  CMDCUADRO.ShowFont
  TXTTIPOFUENTEFICHAS.Text = CMDCUADRO.FontName
  CMBTAMANOFUENTEFICHAS.Text = CMDCUADRO.FontSize
  Exit Sub
CAMPO:
End Sub

Private Sub CMDTIPOFUENTESUBCATEGORIAS_Click()
  On Error GoTo CAMPO
  CMDCUADRO.CancelError = True
  CMDCUADRO.Min = 1
  CMDCUADRO.Max = 7
  CMDCUADRO.Flags = cdlCFScreenFonts + cdlCFLimitSize
  CMDCUADRO.FontName = TXTTIPOFUENTESUBCATEGORIAS.Text
  CMDCUADRO.FontSize = CInt(CMBTAMANOFUENTESUBCATEGORIAS.Text)
  
  CMDCUADRO.ShowFont
  TXTTIPOFUENTESUBCATEGORIAS.Text = CMDCUADRO.FontName
  CMBTAMANOFUENTESUBCATEGORIAS.Text = CMDCUADRO.FontSize
  Exit Sub
CAMPO:
End Sub

Private Sub Form_Load()
  BYTULTIMOMODELO = 0
  BOLPREGUNTARSIDESEASALVAR = True
  TRADUCIRINTERFAZ
  MSFGPRODUCTOS.Row = 0
  MSFGPRODUCTOS.Col = 0
  MSFGPRODUCTOS.CellBackColor = vbYellow
  MSFGPRODUCTOS.Row = 0
  MSFGPRODUCTOS.Col = 1
  MSFGPRODUCTOS.CellBackColor = vbYellow
  MSFGPRODUCTOS.Row = 0
  MSFGPRODUCTOS.Col = 2
  MSFGPRODUCTOS.CellBackColor = vbYellow
  MSFGPRODUCTOS.Row = 0
  MSFGPRODUCTOS.Col = 3
  MSFGPRODUCTOS.CellBackColor = vbYellow
  MSFGPRODUCTOS.Row = 0
  MSFGPRODUCTOS.Col = 4
  MSFGPRODUCTOS.CellBackColor = vbYellow
  MSFGPRODUCTOS.ColWidth(0) = CInt(Screen.Width / 5)
  MSFGPRODUCTOS.ColWidth(1) = CInt(Screen.Width / 5)
  MSFGPRODUCTOS.ColWidth(2) = CInt(Screen.Width / 5)
  MSFGPRODUCTOS.ColWidth(3) = CInt(Screen.Width / 5)
  MSFGPRODUCTOS.ColWidth(4) = CInt(Screen.Width / 5)
  CMDEDITARPRODUCTO.Enabled = False
  CMDBORRARPRODUCTO.Enabled = False
  Rem &H8000000F&
End Sub




















Private Sub Form_Unload(Cancel As Integer)
  Dim INTRETVAL As Integer
  
  If BOLPREGUNTARSIDESEASALVAR = True Then
  
    INTRETVAL = MsgBox(VARLENGUAJE(233), vbInformation + vbYesNoCancel, NOMBRE_DEL_PROGRAMA)

    If INTRETVAL = vbYes Then
    
      If SALVARPROYECTO() = False Then
      
        Cancel = True
        Exit Sub
      End If
    ElseIf INTRETVAL = vbCancel Then
      Cancel = True
      Exit Sub
    End If
  End If
  
  FRMMARROK.TLBBARRA.Buttons(3).Enabled = False
  FRMMARROK.TLBBARRA.Buttons(6).Enabled = False
  FRMMARROK.TLBBARRA.Buttons(7).Enabled = False
  FRMMARROK.MNPROYECTO.Enabled = False
  FRMMARROK.MNGUARDAR.Enabled = False
  FRMMARROK.MNPREVISUALIZAR.Enabled = False
  FRMMARROK.MNCOMPILAR.Enabled = False
  STRNOMBREPROYECTO = ""
  TWSHSERVIDOR.BindIP = ""
  TWSHSERVIDOR.Terminate
End Sub
























Private Sub LSTLENGUAJES_Click()
  If Trim(LSTLENGUAJES.Text) <> "" Then
  
    CMDDISCLAIMER.Enabled = True
    CMDEDITARLICENCIA.Enabled = True
    CMDPAGPRICIPAL.Enabled = True
  
  End If
End Sub

Private Sub MSFGPRODUCTOS_Click()
  Dim I As Long
  
  LNGCOLUMNASELECIONADA = MSFGPRODUCTOS.RowSel
  DESSELECCIONARCELDAS
  
  If LNGCOLUMNASELECIONADA >= 1 Then
  
    MSFGPRODUCTOS.Row = LNGCOLUMNASELECIONADA
    MSFGPRODUCTOS.Col = 0
    MSFGPRODUCTOS.CellBackColor = vbBlue
    MSFGPRODUCTOS.Col = 1
    MSFGPRODUCTOS.CellBackColor = vbBlue
    MSFGPRODUCTOS.Col = 2
    MSFGPRODUCTOS.CellBackColor = vbBlue
    MSFGPRODUCTOS.Col = 3
    MSFGPRODUCTOS.CellBackColor = vbBlue
    MSFGPRODUCTOS.Col = 4
    MSFGPRODUCTOS.CellBackColor = vbBlue
    CMDEDITARPRODUCTO.Enabled = True
    CMDBORRARPRODUCTO.Enabled = True
  
  End If
  
End Sub

Private Sub TABPESTANA_Click()
  If TABPESTANA.SelectedItem = VARLENGUAJE(84) Then
    FRAGENERAL(0).Visible = True
    FRAGENERAL(1).Visible = False
    FRAGENERAL(2).Visible = False
    FRAGENERAL(3).Visible = False
    FRAGENERAL(4).Visible = False
    FRAGENERAL(5).Visible = False
    FRAGENERAL(6).Visible = False
    FRAGENERAL(7).Visible = False
    FRAGENERAL(8).Visible = False
    FRAGENERAL(9).Visible = False
    FRAGENERAL(10).Visible = False
    FRAGENERAL(11).Visible = False
    FRAGENERAL(12).Visible = False
    FRAGENERAL(13).Visible = False
  
  ElseIf TABPESTANA.SelectedItem = VARLENGUAJE(85) Then
    FRAGENERAL(0).Visible = False
    FRAGENERAL(1).Visible = True
    FRAGENERAL(2).Visible = False
    FRAGENERAL(3).Visible = False
    FRAGENERAL(4).Visible = False
    FRAGENERAL(5).Visible = False
    FRAGENERAL(6).Visible = False
    FRAGENERAL(7).Visible = False
    FRAGENERAL(8).Visible = False
    FRAGENERAL(9).Visible = False
    FRAGENERAL(10).Visible = False
    FRAGENERAL(11).Visible = False
    FRAGENERAL(12).Visible = False
    FRAGENERAL(13).Visible = False

  ElseIf TABPESTANA.SelectedItem = VARLENGUAJE(87) Then
    FRAGENERAL(0).Visible = False
    FRAGENERAL(1).Visible = False
    FRAGENERAL(2).Visible = True
    FRAGENERAL(3).Visible = False
    FRAGENERAL(4).Visible = False
    FRAGENERAL(5).Visible = False
    FRAGENERAL(6).Visible = False
    FRAGENERAL(7).Visible = False
    FRAGENERAL(8).Visible = False
    FRAGENERAL(9).Visible = False
    FRAGENERAL(10).Visible = False
    FRAGENERAL(11).Visible = False
    FRAGENERAL(12).Visible = False
    FRAGENERAL(13).Visible = False

  ElseIf TABPESTANA.SelectedItem = VARLENGUAJE(88) Then
    FRAGENERAL(0).Visible = False
    FRAGENERAL(1).Visible = False
    FRAGENERAL(2).Visible = False
    FRAGENERAL(3).Visible = True
    FRAGENERAL(4).Visible = False
    FRAGENERAL(5).Visible = False
    FRAGENERAL(6).Visible = False
    FRAGENERAL(7).Visible = False
    FRAGENERAL(8).Visible = False
    FRAGENERAL(9).Visible = False
    FRAGENERAL(10).Visible = False
    FRAGENERAL(11).Visible = False
    FRAGENERAL(12).Visible = False
    FRAGENERAL(13).Visible = False

 ElseIf TABPESTANA.SelectedItem = VARLENGUAJE(89) Then
    FRAGENERAL(0).Visible = False
    FRAGENERAL(1).Visible = False
    FRAGENERAL(2).Visible = False
    FRAGENERAL(3).Visible = False
    FRAGENERAL(4).Visible = True
    FRAGENERAL(5).Visible = False
    FRAGENERAL(6).Visible = False
    FRAGENERAL(7).Visible = False
    FRAGENERAL(8).Visible = False
    FRAGENERAL(9).Visible = False
    FRAGENERAL(10).Visible = False
    FRAGENERAL(11).Visible = False
    FRAGENERAL(12).Visible = False
    FRAGENERAL(13).Visible = False

  ElseIf TABPESTANA.SelectedItem = VARLENGUAJE(90) Then
    FRAGENERAL(0).Visible = False
    FRAGENERAL(1).Visible = False
    FRAGENERAL(2).Visible = False
    FRAGENERAL(3).Visible = False
    FRAGENERAL(4).Visible = False
    FRAGENERAL(5).Visible = True
    FRAGENERAL(6).Visible = False
    FRAGENERAL(7).Visible = False
    FRAGENERAL(8).Visible = False
    FRAGENERAL(9).Visible = False
    FRAGENERAL(10).Visible = False
    FRAGENERAL(11).Visible = False
    FRAGENERAL(12).Visible = False
    FRAGENERAL(13).Visible = False

  ElseIf TABPESTANA.SelectedItem = VARLENGUAJE(91) Then
  
    FRAGENERAL(0).Visible = False
    FRAGENERAL(1).Visible = False
    FRAGENERAL(2).Visible = False
    FRAGENERAL(3).Visible = False
    FRAGENERAL(4).Visible = False
    FRAGENERAL(5).Visible = False
    FRAGENERAL(6).Visible = True
    FRAGENERAL(7).Visible = False
    FRAGENERAL(8).Visible = False
    FRAGENERAL(9).Visible = False
    FRAGENERAL(10).Visible = False
    FRAGENERAL(11).Visible = False
    FRAGENERAL(12).Visible = False
    FRAGENERAL(13).Visible = False

  ElseIf TABPESTANA.SelectedItem = VARLENGUAJE(92) Then
  
    FRAGENERAL(0).Visible = False
    FRAGENERAL(1).Visible = False
    FRAGENERAL(2).Visible = False
    FRAGENERAL(3).Visible = False
    FRAGENERAL(4).Visible = False
    FRAGENERAL(5).Visible = False
    FRAGENERAL(6).Visible = False
    FRAGENERAL(7).Visible = True
    FRAGENERAL(8).Visible = False
    FRAGENERAL(9).Visible = False
    FRAGENERAL(10).Visible = False
    FRAGENERAL(11).Visible = False
    FRAGENERAL(12).Visible = False
    FRAGENERAL(13).Visible = False
    
  ElseIf TABPESTANA.SelectedItem = VARLENGUAJE(93) Then
    
    FRAGENERAL(0).Visible = False
    FRAGENERAL(1).Visible = False
    FRAGENERAL(2).Visible = False
    FRAGENERAL(3).Visible = False
    FRAGENERAL(4).Visible = False
    FRAGENERAL(5).Visible = False
    FRAGENERAL(6).Visible = False
    FRAGENERAL(7).Visible = False
    FRAGENERAL(8).Visible = True
    FRAGENERAL(9).Visible = False
    FRAGENERAL(10).Visible = False
    FRAGENERAL(11).Visible = False
    FRAGENERAL(12).Visible = False
    FRAGENERAL(13).Visible = False
  
  ElseIf TABPESTANA.SelectedItem = VARLENGUAJE(94) Then
  
    FRAGENERAL(0).Visible = False
    FRAGENERAL(1).Visible = False
    FRAGENERAL(2).Visible = False
    FRAGENERAL(3).Visible = False
    FRAGENERAL(4).Visible = False
    FRAGENERAL(5).Visible = False
    FRAGENERAL(6).Visible = False
    FRAGENERAL(7).Visible = False
    FRAGENERAL(8).Visible = False
    FRAGENERAL(9).Visible = True
    FRAGENERAL(10).Visible = False
    FRAGENERAL(11).Visible = False
    FRAGENERAL(12).Visible = False
    FRAGENERAL(13).Visible = False
    
  ElseIf TABPESTANA.SelectedItem = VARLENGUAJE(95) Then
    FRAGENERAL(0).Visible = False
    FRAGENERAL(1).Visible = False
    FRAGENERAL(2).Visible = False
    FRAGENERAL(3).Visible = False
    FRAGENERAL(4).Visible = False
    FRAGENERAL(5).Visible = False
    FRAGENERAL(6).Visible = False
    FRAGENERAL(7).Visible = False
    FRAGENERAL(8).Visible = False
    FRAGENERAL(9).Visible = False
    FRAGENERAL(10).Visible = True
    FRAGENERAL(11).Visible = False
    FRAGENERAL(12).Visible = False
    FRAGENERAL(13).Visible = False

  ElseIf TABPESTANA.SelectedItem = VARLENGUAJE(96) Then

    FRAGENERAL(0).Visible = False
    FRAGENERAL(1).Visible = False
    FRAGENERAL(2).Visible = False
    FRAGENERAL(3).Visible = False
    FRAGENERAL(4).Visible = False
    FRAGENERAL(5).Visible = False
    FRAGENERAL(6).Visible = False
    FRAGENERAL(7).Visible = False
    FRAGENERAL(8).Visible = False
    FRAGENERAL(9).Visible = False
    FRAGENERAL(10).Visible = False
    FRAGENERAL(11).Visible = True
    FRAGENERAL(12).Visible = False
    FRAGENERAL(13).Visible = False
  
  ElseIf TABPESTANA.SelectedItem = VARLENGUAJE(97) Then
    FRAGENERAL(0).Visible = False
    FRAGENERAL(1).Visible = False
    FRAGENERAL(2).Visible = False
    FRAGENERAL(3).Visible = False
    FRAGENERAL(4).Visible = False
    FRAGENERAL(5).Visible = False
    FRAGENERAL(6).Visible = False
    FRAGENERAL(7).Visible = False
    FRAGENERAL(8).Visible = False
    FRAGENERAL(9).Visible = False
    FRAGENERAL(10).Visible = False
    FRAGENERAL(11).Visible = False
    FRAGENERAL(12).Visible = True
    FRAGENERAL(13).Visible = False
  ElseIf TABPESTANA.SelectedItem = VARLENGUAJE(234) Then
    FRAGENERAL(0).Visible = False
    FRAGENERAL(1).Visible = False
    FRAGENERAL(2).Visible = False
    FRAGENERAL(3).Visible = False
    FRAGENERAL(4).Visible = False
    FRAGENERAL(5).Visible = False
    FRAGENERAL(6).Visible = False
    FRAGENERAL(7).Visible = False
    FRAGENERAL(8).Visible = False
    FRAGENERAL(9).Visible = False
    FRAGENERAL(10).Visible = False
    FRAGENERAL(11).Visible = False
    FRAGENERAL(12).Visible = False
    FRAGENERAL(13).Visible = True
  End If
  
  
End Sub














Private Sub UPDALTOIMAGENESFICHA_Change()
  TXTALTOIMAGENESFICHAS.Text = UPDALTOIMAGENESFICHA.Value
End Sub

Private Sub UPDALTOMINIIMAGEN_Change()
  TXTALTOMINIIMAGEN.Text = UPDALTOMINIIMAGEN.Value
End Sub

Private Sub UPDANCHOCATEGORIAS_Change()
  TXTANCHOTABLACATEGORIAS.Text = UPDANCHOCATEGORIAS.Value
End Sub

Private Sub UPDANCHOIMAGENESFICHA_Change()
  TXTANCHOIMAGENESFICHAS.Text = UPDANCHOIMAGENESFICHA.Value
End Sub

Private Sub UPDANCHOMARCO_Change()
  TXTANCHODELMARCO.Text = UPDANCHOMARCO.Value
End Sub

Private Sub UPDANCHOMARCO2_Change()
  TXTANCHODELMARCO2.Text = UPDANCHOMARCO2.Value
End Sub

Private Sub UPDANCHOMINIFICHABUSQUEDA_Change()
  TXTANCHOMINIFICHASBUSQUEDA.Text = UPDANCHOMINIFICHABUSQUEDA.Value
End Sub

Private Sub UPDANCHOMINIFICHACATEGORIAS_Change()
  TXTANCHOMINIFICHACATEGORIAS.Text = UPDANCHOMINIFICHACATEGORIAS.Value
End Sub

Private Sub UPDANCHOMINIIMAGEN_Change()
  TXTANCHOMINIIMAGEN.Text = UPDANCHOMINIIMAGEN.Value
End Sub

Private Sub UPDDIASDEVIDADELCOOKIE_Change()
  TXTDIASDEVIDADELCOOKIE.Text = UPDDIASDEVIDADELCOOKIE.Value
End Sub

Private Sub UPDNUMEROCATEGORIASPAGINA_Change()
  TXTNUMEROCATEGORIASPAGINA.Text = UPDNUMEROCATEGORIASPAGINA.Value
End Sub

Private Sub UPDNUMERODEPRODUCTOS_Change()
  TXTNUMERODEPRODUCTOS.Text = UPDNUMERODEPRODUCTOS.Value
End Sub

Private Sub UPDSANGRADO_Change()
  TXTPOSICIONENLATABLACATEGORIAS.Text = UPDSANGRADO.Value
End Sub
