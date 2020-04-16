Attribute VB_Name = "mMain"
Option Explicit

Public Ini As New CIni
Public gsInforme As String
Private cTLI As TypeLibInfo
Public cRegistro As New cRegistry
Private itmx As ListItem
Public C_PATH As String
Public gbInicio As Boolean
Public glbInstallInterno As Boolean
Public glbInstallSilent As Boolean

Public Const C_RELEASE = "22/01/2002"
Public Const C_WEB_PAGE = "http://www.vbsoftware.cl/"
Public Const C_WEB_PAGE_PE = "http://www.vbsoftware.cl/ccleaner.html"
Public Const C_EMAIL = "lnunez@vbsoftware.cl"

Public Const WM_SETREDRAW = &HB
Private Const OF_EXIST = &H4000
Private Const OFS_MAXPATHNAME = 256
Private Const IDC_WAIT = 32514&
Private Const IDC_ARROW = 32512&
Private Const GWL_WNDPROC = (-4)
Public Const HWND_TOPMOST = -1
Public Const HWND_NOTOPMOST = -2
Public Const SWP_NOMOVE = &H2
Public Const SWP_NOSIZE = &H1
Public Const SWP_NOZORDER = &H4
Public Const SWP_NOACTIVATE = &H10
Public Const SWP_SHOWWINDOW = &H40
Public Const C_INI = "CCLEANER.INI"

Private KeyRegistro As String
Private PathRegistro As String
Private MayorV As Variant 'As Integer
Private MenorV As Variant 'As Integer
Private P1 As Integer
Private P2 As Integer
Private sArchivo As String

Private Type OFSTRUCT
    cBytes As Byte
    fFixedDisk As Byte
    nErrCode As Integer
    Reserved1 As Integer
    Reserved2 As Integer
    szPathName(OFS_MAXPATHNAME) As Byte
End Type

Private Type FILETIME
    dwLowDateTime As Long
    dwHighDateTime As Long
End Type

Private Type SYSTEMTIME
    wYear As Integer
    wMonth As Integer
    wDayOfWeek As Integer
    wDay As Integer
    wHour As Integer
    wMinute As Integer
    wSecond As Integer
    wMilliseconds As Integer
End Type

Private Type LOGFONT
  lfHeight As Long
  lfWidth As Long
  lfEscapement As Long
  lfOrientation As Long
  lfWeight As Long
  lfItalic As Byte
  lfUnderline As Byte
  lfStrikeOut As Byte
  lfCharSet As Byte
  lfOutPrecision As Byte
  lfClipPrecision As Byte
  lfQuality As Byte
  lfPitchAndFamily As Byte
' lfFaceName(LF_FACESIZE) As Byte 'THIS WAS DEFINED IN API-CHANGES MY OWN
  lfFaceName As String * 33
End Type

Public Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

Public Enum SysMet
    SM_CXSCREEN = 0
    SM_CYSCREEN = 1
    SM_CXVSCROLL = 2
    SM_CYHSCROLL = 3
    SM_CYCAPTION = 4
    SM_CXBORDER = 5
    SM_CYBORDER = 6
    SM_CXDLGFRAME = 7
    SM_CYDLGFRAME = 8
    SM_CYVTHUMB = 9
    SM_CXHTHUMB = 10
    SM_CXICON = 11
    SM_CYICON = 12
    SM_CXCURSOR = 13
    SM_CYCURSOR = 14
    SM_CYMENU = 15
    SM_CXFULLSCREEN = 16
    SM_CYFULLSCREEN = 17
    SM_CYKANJIWINDOW = 18
    SM_MOUSEPRESENT = 19
    SM_CYVSCROLL = 20
    SM_CXHSCROLL = 21
    SM_DEBUG = 22
    SM_SWAPBUTTON = 23
    SM_RESERVED1 = 24
    SM_RESERVED2 = 25
    SM_RESERVED3 = 26
    SM_RESERVED4 = 27
    SM_CXMIN = 28
    SM_CYMIN = 29
    SM_CXSIZE = 30
    SM_CYSIZE = 31
    SM_CXFRAME = 32
    SM_CYFRAME = 33
    SM_CXMINTRACK = 34
    SM_CYMINTRACK = 35
    SM_CXDOUBLECLK = 36
    SM_CYDOUBLECLK = 37
    SM_CXICONSPACING = 38
    SM_CYICONSPACING = 39
    SM_MENUDROPALIGNMENT = 40
    SM_PENWINDOWS = 41
    SM_DBCSENABLED = 42
    SM_CMOUSEBUTTONS = 43
    SM_CMETRICS = 44
End Enum

Private Declare Function CreateFontIndirect Lib "gdi32" Alias "CreateFontIndirectA" (lpLogFont As LOGFONT) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Public Declare Function GetWindowRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
Public Declare Function GetSystemMetrics Lib "user32" (ByVal nIndex As Long) As Long
Public Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Function SetCapture Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function SetCursor Lib "user32" (ByVal hCursor As Long) As Long
Private Declare Function LoadCursor Lib "user32" Alias "LoadCursorA" (ByVal hInstance As Long, lpCursorName As Any) As Long
Private Declare Sub ReleaseCapture Lib "user32" ()
Private Declare Function OpenFile Lib "kernel32" (ByVal lpFileName As String, lpReOpenBuff As OFSTRUCT, ByVal wStyle As Long) As Long
Private Declare Function GetFileSize Lib "kernel32" (ByVal hFile As Long, lpFileSizeHigh As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function GetFileTime Lib "kernel32" (ByVal hFile As Long, lpCreationTime As FILETIME, lpLastAccessTime As FILETIME, lpLastWriteTime As FILETIME) As Long
Private Declare Function FileTimeToSystemTime Lib "kernel32" (lpFileTime As FILETIME, lpSystemTime As SYSTEMTIME) As Long
Private Declare Function FileTimeToLocalFileTime Lib "kernel32" (lpFileTime As FILETIME, lpLocalFileTime As FILETIME) As Long
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" _
(ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" ( _
    lpvDest As Any, lpvSource As Any, ByVal cbCopy As Long)
Private Declare Sub InvalidateRect Lib "user32" (ByVal hwnd As Long, ByVal t As Long, ByVal bErase As Long)
Private Declare Sub ValidateRect Lib "user32" (ByVal hwnd As Long, ByVal t As Long)
Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Public Function WinSystemDir() As String

    Dim sSave As String, Ret As Long
    
    sSave = Space(255)
    
    Ret = GetSystemDirectory(sSave, 255)
    
    sSave = Left$(sSave, Ret)
    
    WinSystemDir = sSave
    
End Function
Public Sub EnabledControls(ByVal frm As Form, ByVal bEnabled As Boolean)

    Dim k As Integer
    Dim c As Integer
    Dim oControl As Control
    
    With frm
        For k = 1 To .Controls.Count - 1
            If TypeOf .Controls(k) Is Menu Then
                Set oControl = .Controls(k)
                
                If oControl.Caption <> "-" Then
                    oControl.Enabled = bEnabled
                End If
            ElseIf TypeOf .Controls(k) Is Toolbar Then
                Set oControl = .Controls(k)
                
                For c = 1 To oControl.Buttons.Count
                    oControl.Buttons(c).Enabled = bEnabled
                Next c
            End If
        Next k
    End With
    
    Set oControl = Nothing
    
End Sub
Sub CenterWindow(ByVal hwnd As Long)

    Dim wRect As RECT
    
    Dim x As Integer
    Dim y As Integer

    Dim Ret As Long
    
    Ret = GetWindowRect(hwnd, wRect)
    
    x = (GetSystemMetrics(SM_CXSCREEN) - (wRect.Right - wRect.Left)) / 2
    y = (GetSystemMetrics(SM_CYSCREEN) - (wRect.Bottom - wRect.Top + GetSystemMetrics(SM_CYCAPTION))) / 2
    
    Ret = SetWindowPos(hwnd, vbNull, x, y, 0, 0, SWP_NOSIZE Or SWP_NOZORDER)
    
End Sub

Public Sub FontStuff(ByVal Titulo As String, picDraw As PictureBox)
    
    On Error GoTo GetOut
    Dim f As LOGFONT, hPrevFont As Long, hFont As Long, FontName As String
    Dim FONTSIZE As Integer
    FONTSIZE = 10 'Val(txtSize.Text)
    
    f.lfEscapement = 10 * 90 'Val(txtDegree.Text) 'rotation angle, in tenths
    FontName = "Tahoma" + Chr$(0) 'null terminated
    f.lfFaceName = FontName
    f.lfHeight = (FONTSIZE * -20) / Screen.TwipsPerPixelY
    hFont = CreateFontIndirect(f)
    hPrevFont = SelectObject(picDraw.hdc, hFont)
    
    picDraw.CurrentX = 3
    'picDraw.CurrentY = 310
    
    picDraw.CurrentY = picDraw.Height - 10
    picDraw.Print Titulo
    
    '  Clean up, restore original font
    hFont = SelectObject(picDraw.hdc, hPrevFont)
    DeleteObject hFont
    
    Exit Sub
GetOut:
    Exit Sub

End Sub

Public Function Confirma(ByVal Msg As String) As Integer
    Confirma = MsgBox(Msg, vbQuestion + vbYesNo + vbDefaultButton2)
End Function
Public Sub ColorReporte(rtb As Control, ByVal sSearch As String, Optional bUnderline As Boolean = False, Optional ByVal bItalic As Boolean = False)

    Dim lWhere, lPos As Long
    Dim sTmp As String
    Dim Sql As String
        
    lPos = 1
        
    Sql = rtb.Text
    
    Do While lPos < Len(Sql)
        
        sTmp = Mid(Sql, lPos, Len(Sql))
        
        lWhere = InStr(sTmp, sSearch)
        lPos = lPos + lWhere
        
        If lWhere Then   ' If found,
            
            rtb.SelStart = lPos - 2
            rtb.SelLength = Len(sSearch)
            
            'If Not rtb.SelBold Then
                rtb.SelBold = True
                rtb.SelUnderline = bUnderline
                rtb.SelItalic = bItalic
            'End If
            rtb.SelLength = 0
            rtb.SelBold = False
            rtb.SelUnderline = False
            rtb.SelItalic = False
        Else
            Exit Do
        End If
    Loop
    
End Sub


'obtener la fecha de creacion del archivo
Public Function VBGetFileTime(ByVal Archivo As String) As String

    Dim Ret As String
    Dim lngHandle As Long
    Dim Ft1 As FILETIME, Ft2 As FILETIME, SysTime As SYSTEMTIME
    Dim Fecha As String
    Dim Hora As String
    
    Dim of As OFSTRUCT
    
    lngHandle = OpenFile(Archivo, of, 0&)
    
    GetFileTime lngHandle, Ft1, Ft1, Ft2
    
    FileTimeToLocalFileTime Ft2, Ft1
    
    FileTimeToSystemTime Ft1, SysTime
    
    CloseHandle lngHandle
    
    Fecha = Format(Trim(Str$(SysTime.wDay)), "00") & "/" & Format(Trim$(Str$(SysTime.wMonth)), "00") + "/" + LTrim(Str$(SysTime.wYear))
    Hora = Format(Trim(Str$(SysTime.wHour)), "00") & ":" & Format(Trim$(Str$(SysTime.wMinute)), "00") + ":" + LTrim(Str$(SysTime.wSecond))
    
    VBGetFileTime = Fecha & " " & Hora
    
End Function

'carga los componentes y referencias
Public Sub CargaComponentes()

    On Local Error Resume Next
    
    Dim k As Integer
    Dim Archivo As String
    Dim ArchivoP As String
    Dim sArchivo As String
    Dim Okey As Boolean
    Dim Icono As Integer
    Dim e As Long
    Dim sGUID As String
    Dim errOK As Long
    Dim sName As String, sSection As String
    Dim sValor As String
    Dim i As Integer
    Dim c As Integer
    
    frmMain.lview.ListItems.Clear
    Call SendMessage(frmMain.lview.hwnd, WM_SETREDRAW, False, 0&)
    
    i = 1
    c = 1
    With frmMain
        .File1.Refresh
        For k = 0 To .File1.ListCount - 1
                        
            Archivo = LCase$(.File1.List(k))
            ArchivoP = C_PATH & Archivo
            If InStr(Archivo, ".") Then
                Okey = False
                
                If LCase$(Right$(Archivo, 3)) = "dll" Or LCase$(Right$(Archivo, 3)) = "tlb" Then
                    Okey = True
                    Icono = 5
                ElseIf LCase$(Right$(Archivo, 3)) = "ocx" Then
                    Okey = True
                    Icono = 6
                ElseIf LCase$(Right$(Archivo, 3)) = "exe" Then
                    Okey = True
                    Icono = 9
                End If
                                                
                If Okey Then
                
                    ValidateRect .lview.hwnd, 0&
                    
                    On Local Error Resume Next
                    
                    Set cTLI = TLI.TypeLibInfoFromFile(ArchivoP)
                                        
                    If Err = 0 Then
                        .lview.ListItems.Add , "k" & c, Archivo, Icono, Icono
                                            
                        Call frmMain.lview.ListItems.Add(, "k" & c, , Icono, Icono)
                        frmMain.lview.ListItems(c).Tag = CLng(ObjPtr(cTLI))
                        
                        If Len(cTLI.Name) > 0 Then
                            frmMain.lview.ListItems(c).SubItems(1) = cTLI.Name
                        Else
                            frmMain.lview.ListItems(c).SubItems(1) = cTLI.Guid
                        End If
                                            
                        frmMain.lview.ListItems(c).SubItems(2) = cTLI.Guid
                        frmMain.lview.ListItems(c).SubItems(3) = cTLI.MajorVersion & "." & cTLI.MinorVersion
                                                
                        If FileExists(cTLI.ContainingFile) Then
                            frmMain.lview.ListItems(c).SubItems(4) = "Y"
                        Else
                            frmMain.lview.ListItems(c).SubItems(4) = "N"
                        End If
                        
                        Set cTLI = Nothing
                                            
                        If (i Mod 10) = 0 Then
                            InvalidateRect .lview.hwnd, 0&, 0&
                            i = 0
                        End If
                        
                        i = i + 1
                        c = c + 1
                    End If
                    
                    Err = 0
                End If
            End If
            e = DoEvents()
        Next k
    End With
    
    Call SendMessage(frmMain.lview.hwnd, WM_SETREDRAW, True, 0&)
    
    Err = 0
    
End Sub

Public Function VBArchivoSinPath(ByVal ArchivoConPath As String) As String

    Dim k As Integer
    
    Dim Ret As String
    
    Ret = ""
    
    For k = Len(ArchivoConPath) To 1 Step -1
        If Mid$(ArchivoConPath, k, 1) = "\" Then
            Ret = Mid$(ArchivoConPath, k + 1)
            Exit For
        End If
    Next k
    
    VBArchivoSinPath = Ret
    
End Function
Public Sub Hourglass(hwnd As Long, fOn As Boolean)

    If fOn Then
        Call SetCapture(hwnd)
        Call SetCursor(LoadCursor(0, ByVal IDC_WAIT))
    Else
        Call ReleaseCapture
        Call SetCursor(LoadCursor(0, IDC_ARROW))
    End If
    DoEvents
    
End Sub
'obtener tamaño del archivo
Public Function VBGetFileSize(ByVal Archivo As String) As Long

    Dim lngHandle As Long
    Dim lRet As Long
    Dim Ret As Long
    Dim of As OFSTRUCT
    
    lngHandle = OpenFile(Archivo, of, 0&)
    lRet = GetFileSize(lngHandle, Ret)
    CloseHandle lngHandle
    
    VBGetFileSize = Round((lRet / 1024), 2)
    
End Function
