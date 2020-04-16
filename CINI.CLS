VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CIni"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'Declaración de API's
Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" _
(ByVal lpApplicationName As Any, ByVal lpKeyName As Any, ByVal lpDefault As String, _
ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long

Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" _
(ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long

'graba valor a archivo ini
Public Sub Grabar(ByVal ArchivoIni As String, ByVal Seccion As String, ByVal LLave As String, ByVal valor)

    Dim Ret As Long
    
    Ret = WritePrivateProfileString(Seccion, LLave, CStr(valor), ArchivoIni)
    
End Sub
'leer valor desde archivo ini
Public Function Leer(ByVal Seccion As String, ByVal LLave As String, ByVal ArchivoIni As String) As String

    Dim lret As Long
    Dim Ret As String
    
    Dim Buffer As String
    
    Buffer = String$(255, " ")
    
    lret = GetPrivateProfileString(Seccion, LLave, "", Buffer, Len(Buffer), ArchivoIni)
    
    Buffer = Trim$(Buffer)
    Ret = Left$(Buffer, Len(Buffer) - 1)
    
    Leer = Ret
    
End Function

