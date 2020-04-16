VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmAccion 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Form1"
   ClientHeight    =   1200
   ClientLeft      =   2160
   ClientTop       =   3270
   ClientWidth     =   4695
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmAccion.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1200
   ScaleWidth      =   4695
   ShowInTaskbar   =   0   'False
   Begin VB.Frame fra 
      Caption         =   "Accion"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1080
      Left            =   45
      TabIndex        =   0
      Top             =   45
      Width           =   4605
      Begin MSComctlLib.ProgressBar pgb 
         Height          =   345
         Left            =   90
         TabIndex        =   2
         Top             =   600
         Width           =   4425
         _ExtentX        =   7805
         _ExtentY        =   609
         _Version        =   393216
         Appearance      =   1
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "lblArchivo"
         Height          =   195
         Left            =   105
         TabIndex        =   1
         Top             =   300
         Width           =   4395
      End
   End
End
Attribute VB_Name = "frmAccion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public total As Integer

Private Sub Form_Activate()
    Me.Refresh
End Sub

Private Sub Form_Load()

    Dim ret As Long
    Dim x As Integer
    Dim y As Integer
    Dim wRect As RECT
    
    Call CenterWindow(hwnd)
        
    Me.Caption = "Limpiando archivos ..."
    fra.Caption = "Limpiando"
        
    pgb.Min = 1
    
    If total = 1 Then total = 2
    pgb.Max = total
        
    ret = GetWindowRect(hwnd, wRect)
    
    x = (GetSystemMetrics(SM_CXSCREEN) - (wRect.Right - wRect.Left)) / 2
    y = (GetSystemMetrics(SM_CYSCREEN) - (wRect.Bottom - wRect.Top + GetSystemMetrics(SM_CYCAPTION))) / 2
    
    ret = SetWindowPos(hwnd, HWND_TOPMOST, x, y, 0, 0, SWP_NOSIZE Or SWP_NOZORDER)
    
End Sub
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

    Dim ret As Long
    
    ret = SetWindowPos(hwnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOZORDER)
    
End Sub


Private Sub Form_Unload(Cancel As Integer)

    Set frmAccion = Nothing
    
End Sub


