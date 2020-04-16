Attribute VB_Name = "mGeneral"
Option Explicit

Public Type POINTAPI
   x As Long
   y As Long
End Type
Private Const DFC_SCROLL = 3
Private Const DFCS_SCROLLSIZEGRIP = &H8&
Private Declare Function DrawFrameControl Lib "user32" (ByVal lhDC As Long, tR As RECT, ByVal eFlag As Long, ByVal eStyle As Long) As Long

Private Declare Function LineTo Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long) As Long
Private Declare Function MoveToEx Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, lpPoint As POINTAPI) As Long
Private Declare Function CreatePen Lib "gdi32" (ByVal nPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
Private Declare Function GetSysColor Lib "user32" (ByVal nIndex As Long) As Long
Private Declare Function GetSysColorBrush Lib "user32" (ByVal nIndex As Long) As Long
Private Const PS_SOLID = 0
Private Declare Function EqualRect Lib "user32" (lpRect1 As RECT, lpRect2 As RECT) As Long
Private Declare Function FillRect Lib "user32" (ByVal hdc As Long, lpRect As RECT, ByVal hBrush As Long) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long

Private Declare Function GetSystemMetrics Lib "user32" (ByVal nIndex As Long) As Long
Private Const SM_CYHSCROLL = 3
Private Const SM_CXVSCROLL = 2

Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Const GWL_STYLE = (-16)
Private Const GWL_EXSTYLE = (-20)
Public Const WS_HSCROLL = &H100000
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Const SWP_NOMOVE = &H2
Private Const SWP_NOACTIVATE = &H10
Private Const SWP_NOOWNERZORDER = &H200      '  Don't do owner Z ordering
Private Const SWP_NOREDRAW = &H8
Private Const SWP_NOSIZE = &H1
Private Const SWP_NOZORDER = &H4
Private Const SWP_FRAMECHANGED = &H20        '  The frame changed: send WM_NCCALCSIZE
Private Const SWP_FORCECALCSIZE = SWP_NOMOVE Or SWP_NOACTIVATE Or SWP_NOOWNERZORDER Or SWP_NOSIZE Or SWP_NOZORDER Or SWP_FRAMECHANGED

Private Declare Function SendMessageLong Lib "user32" Alias "SendMessageA" _
   (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" _
   (ByVal hwndParent As Long, ByVal hwndChildAfter As Long, ByVal lpszClass As String, _
   ByVal lpszWindow As String) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" _
   (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Const EC_LEFTMARGIN = &H1
Private Const EC_RIGHTMARGIN = &H2
Private Const EC_USEFONTINFO = &HFFFF&
Private Const EM_SETMARGINS = &HD3&
Private Const EM_GETMARGINS = &HD4&
Private Const LB_GETHORIZONTALEXTENT = &H193
Private Const LB_SETHORIZONTALEXTENT = &H194
Private Const LB_SETTABSTOPS = &H192

Private Declare Function GetDialogBaseUnits Lib "user32" () As Long


Private Property Get EdithWnd(ByVal ctl As Control) As Long
   If TypeName(ctl) = "ComboBox" Then
      EdithWnd = FindWindowEx(ctl.hwnd, 0, "EDIT", vbNullString)
   ElseIf TypeName(ctl) = "TextBox" Then
      EdithWnd = ctl.hwnd
   End If
End Property
Public Property Let RightMargin(ByVal ctl As Control, ByVal lMargin As Long)
   Dim lhWnd As Long
   lhWnd = EdithWnd(ctl)
   If (lhWnd <> 0) Then
      SendMessageLong lhWnd, EM_SETMARGINS, EC_RIGHTMARGIN, lMargin * &H10000
   End If
End Property
Public Property Get RightMargin(ByVal ctl As Control) As Long
   Dim lhWnd As Long
   lhWnd = EdithWnd(ctl)
   If (lhWnd <> 0) Then
      RightMargin = SendMessageLong(lhWnd, EM_GETMARGINS, 0, 0) \ &H10000
   End If
End Property
Public Property Let LeftMargin(ByVal ctl As Control, ByVal lMargin As Long)
   Dim lhWnd As Long
   lhWnd = EdithWnd(ctl)
   If (lhWnd <> 0) Then
      SendMessageLong lhWnd, EM_SETMARGINS, EC_LEFTMARGIN, lMargin
   End If
End Property
Public Property Get LeftMargin(ByVal ctl As Control) As Long
   Dim lhWnd As Long
   lhWnd = EdithWnd(ctl)
   If (lhWnd <> 0) Then
      LeftMargin = (SendMessageLong(lhWnd, EM_GETMARGINS, 0, 0) And &HFFFF&)
   End If
End Property

Public Sub SizeGrip(ByVal hdc As Long, ByVal x As Long, ByVal y As Long)
Dim tR As RECT
Dim hBr As Long
Static m_tRLast As RECT

   tR.left = x - GetSystemMetrics(SM_CXVSCROLL)
   tR.top = y - GetSystemMetrics(SM_CYHSCROLL)
   tR.right = x
   tR.bottom = y
   If m_tRLast.right - m_tRLast.left > 0 Then
      If Not (EqualRect(m_tRLast, tR) = 1) Then
         hBr = GetSysColorBrush(vbButtonFace And &H1F&)
         FillRect hdc, m_tRLast, hBr
         DeleteObject hBr
      End If
   End If
   DrawFrameControl hdc, tR, DFC_SCROLL, DFCS_SCROLLSIZEGRIP
   LSet m_tRLast = tR
End Sub
Public Sub HorizontalSeparator(ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal width As Long)
Dim tJunk As POINTAPI
Dim hPen As Long
Dim hPenOld As Long

   hPen = CreatePen(PS_SOLID, 1, GetSysColor(vbButtonShadow And &H1F&))
   hPenOld = SelectObject(hdc, hPen)
   MoveToEx hdc, x, y, tJunk
   LineTo hdc, x + width, y
   SelectObject hdc, hPenOld
   DeleteObject hPen
   
   hPen = CreatePen(PS_SOLID, 1, GetSysColor(vb3DHighlight And &H1F&))
   hPenOld = SelectObject(hdc, hPen)
   MoveToEx hdc, x, y + 1, tJunk
   LineTo hdc, x + width, y + 1
   SelectObject hdc, hPenOld
   DeleteObject hPen
   
End Sub
Public Property Get FileExists(ByVal sFile As String) As Boolean
   On Error Resume Next
   sFile = Dir(sFile)
   FileExists = ((Err.Number = 0) And sFile <> "")
   On Error GoTo 0
End Property
Public Function NormalizePath(ByRef sPath As String) As String
   If Len(sPath) > 1 Then
      If Not (StrComp(right$(sPath, 1), "\") = 0) Then
         sPath = sPath & "\"
      End If
   End If
   NormalizePath = sPath
End Function
Public Sub AddStyle(ByVal hWndA As Long, ByVal lStyle As Long)
Dim lS As Long
   lS = GetWindowLong(hWndA, GWL_STYLE)
   lS = lS Or lStyle
   SetWindowLong hWndA, GWL_STYLE, lS
   SetWindowPos hWndA, 0, 0, 0, 0, 0, SWP_FORCECALCSIZE
End Sub
Public Sub SetHorizontalExtent(ByVal hWndA As Long, ByVal iPixels As Integer)
   On Error Resume Next
   SendMessageLong hWndA, LB_SETHORIZONTALEXTENT, iPixels, 0
   Err.Clear
   On Error GoTo 0
End Sub
Public Sub TabStop(ByVal hWndA As Long, lTabPositions() As Long)
Dim lCount As Long
Dim lBaseUnitX As Long
Dim lBaseUnit As Long
Dim lTabDlgUnitPos() As Long
Dim i As Long

   On Error Resume Next
   lCount = UBound(lTabPositions) - LBound(lTabPositions) + 1
   If lCount > 0 Then
      lBaseUnit = GetDialogBaseUnits()
      lBaseUnitX = lBaseUnit And &HFFFF&
      
      ReDim lTabDlgUnitPos(0 To lCount - 1) As Long
      For i = 0 To lCount - 1
         lTabDlgUnitPos(i) = (lTabPositions(i + LBound(lTabPositions)) * 4) / lBaseUnitX
      Next i
      i = SendMessage(hWndA, LB_SETTABSTOPS, lCount, lTabDlgUnitPos(0))
   End If
End Sub
