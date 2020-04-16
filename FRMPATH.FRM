VERSION 5.00
Begin VB.Form frmPath 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Configurar Path"
   ClientHeight    =   2145
   ClientLeft      =   2310
   ClientTop       =   2715
   ClientWidth     =   7260
   Icon            =   "frmPath.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2145
   ScaleWidth      =   7260
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmd 
      Caption         =   "&Examinar"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   2
      Left            =   5925
      TabIndex        =   5
      Top             =   555
      Width           =   1215
   End
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
      Height          =   405
      Index           =   1
      Left            =   5925
      TabIndex        =   3
      Top             =   990
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
      Height          =   405
      Index           =   0
      Left            =   5925
      TabIndex        =   2
      Top             =   120
      Width           =   1215
   End
   Begin VB.Frame fra 
      Caption         =   "Path actual"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2040
      Left            =   60
      TabIndex        =   0
      Top             =   30
      Width           =   5775
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "Para seleccionar un nuevo path haga clic en el boton examinar."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   120
         TabIndex        =   4
         Top             =   300
         Width           =   5550
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Label1"
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   555
         Width           =   5550
         WordWrap        =   -1  'True
      End
   End
End
Attribute VB_Name = "frmPath"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Type BrowseInfo
    hWndOwner As Long
    pIDLRoot As Long
    pszDisplayName As Long
    lpszTitle As Long
    ulFlags As Long
    lpfnCallback As Long
    lParam As Long
    iImage As Long
End Type
Const BIF_RETURNONLYFSDIRS = 1
Const MAX_PATH = 260
Private Declare Sub CoTaskMemFree Lib "ole32.dll" (ByVal hMem As Long)
Private Declare Function lstrcat Lib "kernel32" Alias "lstrcatA" (ByVal lpString1 As String, ByVal lpString2 As String) As Long
Private Declare Function SHBrowseForFolder Lib "shell32" (lpbi As BrowseInfo) As Long
Private Declare Function SHGetPathFromIDList Lib "shell32" (ByVal pidList As Long, ByVal lpBuffer As String) As Long

Private Sub ConfigurarPath()

    Dim iNull As Integer, lpIDList As Long, lResult As Long
    Dim sPath As String, udtBI As BrowseInfo

    With udtBI
        'Set the owner window
        .hWndOwner = Me.hwnd
        'lstrcat appends the two strings and returns the memory address
        .lpszTitle = lstrcat("C:\", "")
        'Return only if the user selected a directory
        .ulFlags = BIF_RETURNONLYFSDIRS
    End With

    'Show the 'Browse for folder' dialog
    lpIDList = SHBrowseForFolder(udtBI)
    If lpIDList Then
        sPath = String$(MAX_PATH, 0)
        'Get the path from the IDList
        SHGetPathFromIDList lpIDList, sPath
        'free the block of memory
        CoTaskMemFree lpIDList
        iNull = InStr(sPath, vbNullChar)
        If iNull Then
            sPath = Left$(sPath, iNull - 1)
        End If
    End If

    If Right$(sPath, 1) <> "\" Then sPath = sPath & "\"
    Label1.Caption = sPath

End Sub

Private Sub cmd_Click(Index As Integer)

    If Index = 2 Then
        Call ConfigurarPath
    ElseIf Index = 0 Then
        If Len(Label1.Caption) > 0 Then
            C_PATH = Label1.Caption
            If Right$(C_PATH, 1) <> "\" Then
                C_PATH = C_PATH & "\"
            End If
            Call Ini.Grabar(C_INI, "general", "path", C_PATH)
            Call frmMain.Actualizar
        End If
    Else
        Unload Me
    End If
    
End Sub

Private Sub Form_Load()

    CenterWindow hwnd
    
    Label1.Caption = C_PATH
    
End Sub

Private Sub Form_Unload(Cancel As Integer)

    Set frmPath = Nothing
    
End Sub


