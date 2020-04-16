VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmReporte 
   Caption         =   "Informe de Componentes y Referencias"
   ClientHeight    =   5715
   ClientLeft      =   1845
   ClientTop       =   2085
   ClientWidth     =   7200
   Icon            =   "frmReporte.frx":0000
   LinkTopic       =   "Form1"
   MinButton       =   0   'False
   ScaleHeight     =   5715
   ScaleWidth      =   7200
   WindowState     =   2  'Maximized
   Begin MSComctlLib.ImageList iml 
      Left            =   1635
      Top             =   915
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   2
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmReporte.frx":030A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmReporte.frx":041E
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin RichTextLib.RichTextBox rtb 
      Height          =   750
      Left            =   45
      TabIndex        =   1
      Top             =   765
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   1323
      _Version        =   393217
      Enabled         =   -1  'True
      ScrollBars      =   2
      TextRTF         =   $"frmReporte.frx":0532
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSComctlLib.Toolbar tbr 
      Align           =   1  'Align Top
      Height          =   360
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7200
      _ExtentX        =   12700
      _ExtentY        =   635
      ButtonWidth     =   609
      ButtonHeight    =   582
      Appearance      =   1
      Style           =   1
      ImageList       =   "iml"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   2
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "cmdImprimir"
            Object.ToolTipText     =   "Imprimir"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "cmdGrabar"
            Object.ToolTipText     =   "Grabar"
            ImageIndex      =   2
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "frmReporte"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public tipo As Integer

Private Sub CargaInforme()

    Dim itmx As ListItem
    Dim k As Integer
    
    gsInforme = "Informe de Componentes y Referencias"
    gsInforme = gsInforme & vbNewLine & vbNewLine
    
    If tipo = 0 Then    'detallado
        For k = 1 To frmMain.lview.ListItems.Count
            Set itmx = frmMain.lview.ListItems(k)
            gsInforme = gsInforme & "Archivo     : " & frmMain.lview.ListItems(k).Text & vbNewLine
            gsInforme = gsInforme & "Clase       : " & itmx.SubItems(1) & vbNewLine
            gsInforme = gsInforme & "Clase       : " & itmx.SubItems(2) & vbNewLine
            gsInforme = gsInforme & "Descripción : " & itmx.SubItems(3) & vbNewLine
            gsInforme = gsInforme & "GUID        : " & itmx.SubItems(4) & vbNewLine
            gsInforme = gsInforme & "V. Mayor    : " & itmx.SubItems(5) & vbNewLine
            gsInforme = gsInforme & "V. Menor    : " & itmx.SubItems(6) & vbNewLine
            gsInforme = gsInforme & "Tamaño      : " & itmx.SubItems(7) & vbNewLine
            gsInforme = gsInforme & "Fecha       : " & itmx.SubItems(8) & vbNewLine & vbNewLine
        Next k
    Else                'resumido
        For k = 1 To frmMain.lview.ListItems.Count
            gsInforme = gsInforme & frmMain.lview.ListItems(k).Text
            gsInforme = gsInforme & vbNewLine
        Next k
    End If
    
    rtb.Text = gsInforme
    
    Call ColorReporte(Me.rtb, "Informe de Componentes y Referencias", True)
    
    If tipo = 0 Then
        Call ColorReporte(Me.rtb, "Archivo     : ")
        Call ColorReporte(Me.rtb, "Clase       : ")
        Call ColorReporte(Me.rtb, "Descripción : ")
        Call ColorReporte(Me.rtb, "GUID        : ")
        Call ColorReporte(Me.rtb, "V. Mayor    : ")
        Call ColorReporte(Me.rtb, "V. Menor    : ")
        Call ColorReporte(Me.rtb, "Tamaño      : ")
        Call ColorReporte(Me.rtb, "Fecha       : ")
    End If
    
End Sub

Private Function Grabar() As Boolean

    On Local Error GoTo ErrorGrabarReporte
    
    Dim Archivo As String
    Dim Msg As String
    Dim Glosa As String
    Dim cc As New GCommonDialog
    Dim ret As Boolean
    
    ret = False
    
    Glosa = "Archivos de texto (*.txt)|*.txt|"
    Glosa = Glosa & "Archivos de texto enriquecido (*.RTF)|*.RTF|"
    Glosa = Glosa & "Todos los archivos (*.*)|*.*"
    
    If cc.VBGetSaveFileName(Archivo, , , Glosa, , App.Path, "Guardar reporte como ...", "rtb", Me.hwnd) Then
        If Archivo <> "" Then
            If InStr(Archivo, ".") = 0 Then
                Archivo = Archivo & ".rtf"
                Call rtb.SaveFile(Archivo, rtfRTF)
            ElseIf UCase$(Right$(Archivo, 3)) = "rtb" Then
                Call rtb.SaveFile(Archivo, rtfText)
            ElseIf UCase$(Right$(Archivo, 3)) = "RTF" Then
                Call rtb.SaveFile(Archivo, rtfRTF)
            Else
                Call rtb.SaveFile(Archivo, rtfText)
            End If
            
            ret = True
        End If
    End If
            
    GoTo SalirGrabarReporte
    
ErrorGrabarReporte:
    ret = False
    MsgBox "GrabarReporte : " & Err & " " & Error$, vbCritical
    Resume SalirGrabarReporte
    
SalirGrabarReporte:
    Grabar = ret
    Err = 0
    Set cc = Nothing
    
End Function

Private Function Imprimir() As Boolean

    On Local Error GoTo ErrorImprimir
    
    Dim ret As Boolean
    
    Call Hourglass(hwnd, False)
    
    Call rtb.SelPrint(Printer.hdc)
            
    ret = True
    
    GoTo SalirImprimir
    
ErrorImprimir:
    ret = False
    MsgBox "Imprimir : " & Err & " " & Error$, vbCritical
    Printer.KillDoc
    Resume SalirImprimir
    
SalirImprimir:
    Call Hourglass(hwnd, True)
    Imprimir = ret
    Err = 0
    
End Function

Private Sub Form_Load()

    Call Hourglass(hwnd, True)
    
    Call CargaInforme
    
    Call Hourglass(hwnd, False)
        
End Sub

Private Sub Form_Resize()

    If WindowState <> vbMinimized Then
        rtb.Left = 0
        rtb.Top = tbr.Height + 30
        rtb.width = ScaleWidth
        rtb.Height = ScaleHeight - tbr.Height
    End If
    
End Sub


Private Sub Form_Unload(Cancel As Integer)

    Set frmReporte = Nothing
    
End Sub

Private Sub tbr_ButtonClick(ByVal Button As MSComctlLib.Button)

    If Button.Key = "cmdImprimir" Then
        If Imprimir() Then
            MsgBox "Informe impreso con éxito!", vbInformation
        End If
    Else
        If Grabar() Then
            MsgBox "Archivo grabado con éxito!", vbInformation
        End If
    End If
    
End Sub

