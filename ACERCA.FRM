VERSION 5.00
Begin VB.Form frmAcerca 
   BackColor       =   &H80000006&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Acerca de ..."
   ClientHeight    =   5970
   ClientLeft      =   1740
   ClientTop       =   1680
   ClientWidth     =   5460
   Icon            =   "Acerca.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   398
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   364
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox picDraw 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H00C0FFFF&
      Height          =   5970
      Left            =   0
      ScaleHeight     =   396
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   22
      TabIndex        =   3
      Top             =   0
      Width           =   360
   End
   Begin VB.CommandButton cmd 
      Caption         =   "&Aceptar"
      Default         =   -1  'True
      Height          =   375
      Left            =   4425
      TabIndex        =   0
      Top             =   5445
      Width           =   915
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Component Cleaner fue analizado con :"
      ForeColor       =   &H8000000E&
      Height          =   195
      Left            =   495
      TabIndex        =   8
      Top             =   4965
      Width           =   2790
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Project Explorer"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   195
      Left            =   3480
      MouseIcon       =   "Acerca.frx":030A
      MousePointer    =   99  'Custom
      TabIndex        =   7
      Tag             =   "http://www.vbsoftware.cl/vbpexplorer.html"
      Top             =   4965
      Width           =   1230
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   585
      Picture         =   "Acerca.frx":0614
      Top             =   105
      Width           =   480
   End
   Begin VB.Label lblProduct 
      BackStyle       =   0  'Transparent
      Caption         =   "Component Cleaner Home Page"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   195
      Left            =   480
      MouseIcon       =   "Acerca.frx":091E
      MousePointer    =   99  'Custom
      TabIndex        =   6
      Tag             =   "http://www.vbsoftware.cl/ccleaner.html"
      Top             =   5295
      Width           =   2355
   End
   Begin VB.Label lblURL 
      BackStyle       =   0  'Transparent
      Caption         =   "http://www.vbsoftware.cl"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   195
      Left            =   495
      MouseIcon       =   "Acerca.frx":0C28
      MousePointer    =   99  'Custom
      TabIndex        =   5
      Tag             =   "http://www.vbsoftware.cl"
      Top             =   5745
      Width           =   2370
   End
   Begin VB.Label lblCopyright 
      BackStyle       =   0  'Transparent
      Caption         =   "Copyright © 2000-2002 Luis Núñez Ibarra"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   195
      Left            =   480
      MouseIcon       =   "Acerca.frx":0F32
      MousePointer    =   99  'Custom
      TabIndex        =   4
      Tag             =   "http://www.vbsoftware.cl/autor.html"
      Top             =   5520
      Width           =   3105
   End
   Begin VB.Label lblGlosa 
      BackStyle       =   0  'Transparent
      Caption         =   "Limpiador de componentes y referencias."
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   810
      Left            =   1110
      TabIndex        =   2
      Top             =   315
      Width           =   4095
   End
   Begin VB.Label lblDescrip 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Explora , Documenta , Respalda , Visualiza , Limpia , Optimiza aplicaciones creadas con Visual Basic 3,4,5,6."
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFFF&
      Height          =   585
      Left            =   645
      TabIndex        =   1
      Top             =   900
      Width           =   4770
      WordWrap        =   -1  'True
   End
End
Attribute VB_Name = "frmAcerca"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'Private m_cT As New cTitleBar
Private mGradient As New clsGradient






Private Sub cmd_Click()
    
    Unload Me
    
End Sub


Private Sub Form_Load()

    CenterWindow hwnd
    
    Dim Msg As String
    
    Msg = "Creado por Luis Núñez Ibarra." & vbNewLine
    Msg = Msg & "Todos los derechos reservados." & vbNewLine
    Msg = Msg & "Santiago de Chile 2000-2002" & vbNewLine & vbNewLine
    Msg = Msg & "Limpia todas las referencias a archivos dll , ocx y exe activex del registro "
    Msg = Msg & "de windows de una manera gráfica y te permite eliminar todas aquellas entradas que existan." & vbNewLine & vbNewLine
    Msg = Msg & "Se distribuye libre de cargo alguno bajo el término de distribución postcardware." & vbNewLine & vbNewLine
    Msg = Msg & "Si le gusta este software apreciaria mucho que me enviara una postal de su "
    Msg = Msg & "ciudad a la siguiente dirección : " & vbNewLine & vbNewLine
    Msg = Msg & "        Avda Vicuña Mackenna 7000" & vbNewLine
    Msg = Msg & "        Depto 204-B" & vbNewLine
    Msg = Msg & "        Santiago de Chile" & vbNewLine & vbNewLine
    Msg = Msg & "vbsoftware no se hace responsable por algún daño ocasionado "
    Msg = Msg & "por el uso de esta aplicación." & vbNewLine & vbNewLine
    
    lblDescrip.Caption = Msg
    lblURL.Tag = C_WEB_PAGE
            
    With mGradient
        .Angle = 90 '.Angle
        .Color1 = 16744448
        .Color2 = 0
        .Draw picDraw
    End With
        
    Call FontStuff(App.Title & " " & App.Major & "." & App.Minor & "." & App.Revision, picDraw)
    
    picDraw.Refresh
                
End Sub


Private Sub Form_Unload(Cancel As Integer)

    If Not gbInicio Then
        gbInicio = True
        frmMain.Show
    End If
        
    Set frmAcerca = Nothing
    
End Sub


Private Sub Label4_Click()
    pShell hwnd, Label4.Tag
End Sub

Private Sub lblCopyright_Click()
    pShell lblCopyright.Tag, hwnd
End Sub

Private Sub lblProduct_Click()
    pShell C_WEB_PAGE_PE, hwnd
End Sub


Private Sub lblURL_Click()
    pShell C_WEB_PAGE, hwnd
End Sub


