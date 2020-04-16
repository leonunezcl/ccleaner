VERSION 5.00
Begin VB.Form frmImprimir 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Imprimir"
   ClientHeight    =   1545
   ClientLeft      =   3435
   ClientTop       =   3600
   ClientWidth     =   3705
   Icon            =   "frmImprimir.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1545
   ScaleWidth      =   3705
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmd 
      Caption         =   "&Salir"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Index           =   1
      Left            =   2040
      TabIndex        =   4
      Top             =   1080
      Width           =   1215
   End
   Begin VB.CommandButton cmd 
      Caption         =   "&Aceptar"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Index           =   0
      Left            =   435
      TabIndex        =   3
      Top             =   1065
      Width           =   1215
   End
   Begin VB.Frame fra 
      Caption         =   "Imprimir"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   900
      Left            =   90
      TabIndex        =   0
      Top             =   75
      Width           =   3540
      Begin VB.OptionButton opt 
         Caption         =   "Resumido"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   1
         Left            =   1950
         TabIndex        =   2
         Top             =   360
         Width           =   1230
      End
      Begin VB.OptionButton opt 
         Caption         =   "Detallado"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   0
         Left            =   300
         TabIndex        =   1
         Top             =   360
         Value           =   -1  'True
         Width           =   1275
      End
   End
End
Attribute VB_Name = "frmImprimir"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmd_Click(Index As Integer)

    If Index = 0 Then
        If opt(0).Value Then
            frmReporte.tipo = 0
        Else
            frmReporte.tipo = 1
        End If
        frmReporte.Show vbModal
    Else
        Unload Me
    End If
    
End Sub

Private Sub Form_Load()

    CenterWindow hwnd
    
End Sub

Private Sub Form_Unload(Cancel As Integer)

    Set frmImprimir = Nothing
    
End Sub


