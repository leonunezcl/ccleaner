VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMain 
   Caption         =   "Component Cleaner"
   ClientHeight    =   5715
   ClientLeft      =   2625
   ClientTop       =   2220
   ClientWidth     =   7200
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   381
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   480
   WindowState     =   2  'Maximized
   Begin VB.DirListBox Dir1 
      Height          =   540
      Left            =   5580
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   480
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.FileListBox File1 
      Height          =   480
      Left            =   5580
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   1065
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.PictureBox picMain 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H00C0FFFF&
      Height          =   4770
      Left            =   15
      ScaleHeight     =   316
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   22
      TabIndex        =   3
      Top             =   630
      Width           =   360
   End
   Begin MSComctlLib.ListView lview 
      Height          =   4530
      Left            =   540
      TabIndex        =   2
      Top             =   720
      Width           =   6645
      _ExtentX        =   11721
      _ExtentY        =   7990
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      Checkboxes      =   -1  'True
      FullRowSelect   =   -1  'True
      _Version        =   393217
      Icons           =   "imlMain"
      SmallIcons      =   "imlMain"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   5
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Sel"
         Object.Width           =   5292
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Nombre"
         Object.Width           =   3969
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "GUID"
         Object.Width           =   6615
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Alignment       =   2
         SubItemIndex    =   3
         Text            =   "Versión"
         Object.Width           =   1323
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "Existe ?"
         Object.Width           =   1587
      EndProperty
   End
   Begin MSComctlLib.StatusBar stbMain 
      Align           =   2  'Align Bottom
      Height          =   300
      Left            =   0
      TabIndex        =   1
      Top             =   5415
      Width           =   7200
      _ExtentX        =   12700
      _ExtentY        =   529
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   2
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   8819
            MinWidth        =   8819
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5292
            MinWidth        =   5292
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList imlMain 
      Left            =   90
      Top             =   825
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   14
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":030A
            Key             =   ""
            Object.Tag             =   "&Registrar"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":062E
            Key             =   ""
            Object.Tag             =   "&DesRegistrar"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0742
            Key             =   ""
            Object.Tag             =   "&Imprimir"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":089E
            Key             =   ""
            Object.Tag             =   "&Salir"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0CF2
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0E4E
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0FAA
            Key             =   ""
            Object.Tag             =   "&Actualizar"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1106
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":12E2
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":143E
            Key             =   ""
            Object.Tag             =   "&Configurar Path"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1758
            Key             =   ""
            Object.Tag             =   "Configurar &Instalación Componentes/Referencias"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1A72
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1D8C
            Key             =   ""
            Object.Tag             =   "&Indice"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":20A6
            Key             =   ""
            Object.Tag             =   "&Limpiar"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar tlbMain 
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
      AllowCustomize  =   0   'False
      Appearance      =   1
      Style           =   1
      ImageList       =   "imlMain"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   10
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   1
            Style           =   3
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "cmdLimpiar"
            Object.ToolTipText     =   "Limpiar componentes"
            ImageIndex      =   14
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "cmdActualizar"
            Object.ToolTipText     =   "Actualizar lista de archivos"
            ImageIndex      =   7
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "cmdImprimir"
            Object.ToolTipText     =   "Imprimir archivos"
            ImageIndex      =   3
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "cmdNet"
            Object.ToolTipText     =   "Ir al sitio web de vbsoftware"
            ImageIndex      =   12
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "cmdAyuda"
            Object.ToolTipText     =   "Ayuda de la aplicación"
            ImageIndex      =   13
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "cmdSalir"
            Object.ToolTipText     =   "Salir"
            ImageIndex      =   4
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuArchivo 
      Caption         =   "&Archivo"
      Begin VB.Menu mnuArchivo_Registrar 
         Caption         =   "|Limpiar archivos seleccionados|&Limpiar"
      End
      Begin VB.Menu mnuArchivo_sep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuArchivo_ConfImpresora 
         Caption         =   "|Configurar Impresora|&Configurar Impresora"
      End
      Begin VB.Menu mnuArchivo_Imprimir 
         Caption         =   "|Imprimir datos de los componentes|&Imprimir"
         Shortcut        =   ^P
      End
      Begin VB.Menu mnuArchivo_sep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuArchivo_Salir 
         Caption         =   "|Salir de la aplicación|&Salir"
      End
   End
   Begin VB.Menu mnuEdicion 
      Caption         =   "&Edición"
      Begin VB.Menu mnuEdicion_SelTodos 
         Caption         =   "|Seleccionar todos los archivos|&Seleccionar todos"
         Shortcut        =   ^A
      End
      Begin VB.Menu mnuEdicion_DesSelTodos 
         Caption         =   "|DesSeleccionar todos los archivos|&DesSeleccionar Todos"
      End
   End
   Begin VB.Menu mnuOpciones 
      Caption         =   "&Opciones"
      Begin VB.Menu mnuOpciones_Path 
         Caption         =   "|Configurar path donde se encuentran los componentes|&Configurar Path"
      End
   End
   Begin VB.Menu mnuAyuda 
      Caption         =   "A&yuda"
      Begin VB.Menu mnuAyuda_Indice 
         Caption         =   "|Indice de contenidos de Component Cleaner|&Indice"
      End
      Begin VB.Menu mnuAyuda_sep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuAyuda_Acerca 
         Caption         =   "|Información de Copyright de la aplicación|Acerca &de ..."
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mGradient As New clsGradient
Private clsXmenu As New CXtremeMenu
Private WithEvents MyHelpCallBack As HelpCallBack
Attribute MyHelpCallBack.VB_VarHelpID = -1

Private cRM As New cRegistry
Private cRR As New cRegistry

Private cTLI As TypeLibInfo
Private cClases As CoClasses
Private cClasesInfo As CoClassInfo
Private cClasesInterfaces  As Interfaces
Private cClasesInterInfo As InterfaceInfo
Private cInterfaces  As Interfaces
Private cInterfaceInfo  As InterfaceInfo
Private cTypeInfos As TypeInfos
Private cTypeInfo As TypeInfo
'actualizar los componentes
Public Sub Actualizar()

    Call Hourglass(hwnd, True)
    
    Me.Caption = App.Title & " - " & C_PATH
    
    Dir1.Path = C_PATH
    
    stbMain.Panels(1).Text = "Cargando archivos ..."
    
    lview.Visible = False
    lview.Sorted = False
    Call CargaComponentes
    
    stbMain.Panels(1).Text = "VBSoftware 2000-2002"
    
    lview.Visible = True
    
    Call Hourglass(hwnd, False)
    
End Sub

Private Sub Logo()

    With mGradient
        .Angle = 90 '.Angle
        .Color1 = 16744448
        .Color2 = 0
        .Draw picMain
    End With
        
    Call FontStuff(App.Title & " " & App.Major & "." & App.Minor & "." & App.Revision, picMain)
    
    picMain.Refresh
    
End Sub

'limpia los componentes del registro
Private Sub Limpiar()

    Dim Nombre As String
    Dim CLSID As String
    Dim Ver As String
    Dim k As Integer
    Dim total As Integer
    Dim c As Integer
    Dim e As Integer
        
    Call Hourglass(hwnd, True)
        
    Call EnabledControls(Me, False)
    
    'contar los archivos seleccionados
    total = 0
    For k = 1 To lview.ListItems.Count
        If lview.ListItems(k).Checked Then
            total = total + 1
        End If
    Next k
    frmAccion.total = total
        
    frmAccion.Show
    
    c = 1
    'ciclar x los archivos seleccionados
    For k = lview.ListItems.Count To 1 Step -1
        e = DoEvents()
        If lview.ListItems(k).Checked Then
            Nombre = lview.ListItems(k).Text
            CLSID = lview.ListItems(k).SubItems(2)
            Ver = lview.ListItems(k).SubItems(3)
            frmAccion.Label1.Caption = Nombre
            frmAccion.pgb.Value = c
            c = c + 1
            
            'limpiar entrada del registro
            pDeleteEntry C_PATH & "\" & Nombre, CLSID, Ver
                        
            'lview.ListItems.Remove lview.ListItems(k).Key
        End If
    Next k
    
    Unload frmAccion
    
    Call EnabledControls(Me, True)
    
    Call Hourglass(hwnd, False)
    
End Sub


'limpia la entrada del registro
Private Sub pDeleteEntry(ByVal Archivo As String, ByVal CLSID As String, ByVal Ver As String)

    On Error Resume Next
    
    Dim k As Integer
    Dim c As Integer
    Dim t As Integer
    
    'obtener info del archivo
    Set cTLI = TLI.TypeLibInfoFromFile(Archivo)
    cTLI.UnRegister
    
    'eliminar info del archivo
    'HKEY_LOCAL_MACHINE\Software\CLASSES\TypeLib\{B2BDDCF0-A77B-11D5-8F58-0080C8F703B4}\1.1\HELPDIR
    cRM.ClassKey = HKEY_LOCAL_MACHINE
    cRM.SectionKey = "Software\CLASSES\TypeLib\" & cTLI.Guid & "\" & Ver & "\HELPDIR"
    cRM.DeleteKey
        
    'HKEY_LOCAL_MACHINE\Software\CLASSES\TypeLib\{B2BDDCF0-A77B-11D5-8F58-0080C8F703B4}\1.1\FLAGS
    cRM.SectionKey = "Software\CLASSES\TypeLib\" & cTLI.Guid & "\" & Ver & "\FLAGS"
    cRM.DeleteKey
    
    'HKEY_LOCAL_MACHINE\Software\CLASSES\TypeLib\{B2BDDCF0-A77B-11D5-8F58-0080C8F703B4}\1.1\0\win32
    cRM.SectionKey = "Software\CLASSES\TypeLib\" & cTLI.Guid & "\" & Ver & "\" & cTLI.LCID & "\win32"
    cRM.DeleteKey
    
    'HKEY_LOCAL_MACHINE\Software\CLASSES\TypeLib\{B2BDDCF0-A77B-11D5-8F58-0080C8F703B4}\1.1\0
    cRM.SectionKey = "Software\CLASSES\TypeLib\" & cTLI.Guid & "\" & Ver & "\" & cTLI.LCID
    cRM.DeleteKey
    
    'HKEY_LOCAL_MACHINE\Software\CLASSES\TypeLib\{B2BDDCF0-A77B-11D5-8F58-0080C8F703B4}\1.1
    cRM.SectionKey = "Software\CLASSES\TypeLib\" & cTLI.Guid & "\" & Ver
    cRM.DeleteKey
    
    'HKEY_LOCAL_MACHINE\Software\CLASSES\TypeLib\{B2BDDCF0-A77B-11D5-8F58-0080C8F703B4}
    cRM.SectionKey = "Software\CLASSES\TypeLib\" & cTLI.Guid
    cRM.DeleteKey
                    
    'HKEY_CLASSES_ROOT\TypeLib\{B2BDDCF0-A77B-11D5-8F58-0080C8F703B4}\1.1\HELPDIR
    cRR.ClassKey = HKEY_CLASSES_ROOT
    cRR.SectionKey = "TypeLib\" & cTLI.Guid & "\" & Ver & "\HELPDIR"
    cRR.DeleteKey
    
    'HKEY_CLASSES_ROOT\TypeLib\{B2BDDCF0-A77B-11D5-8F58-0080C8F703B4}\1.1\FLAGS
    cRR.SectionKey = "TypeLib\" & cTLI.Guid & "\" & Ver & "\FLAGS"
    cRR.DeleteKey
    
    'HKEY_CLASSES_ROOT\TypeLib\{B2BDDCF0-A77B-11D5-8F58-0080C8F703B4}\1.1\0\win32
    cRR.SectionKey = "TypeLib\" & cTLI.Guid & "\" & Ver & "\" & cTLI.LCID & "\win32"
    cRR.DeleteKey
    
    'HKEY_CLASSES_ROOT\TypeLib\{B2BDDCF0-A77B-11D5-8F58-0080C8F703B4}\1.1\0
    cRR.SectionKey = "TypeLib\" & cTLI.Guid & "\" & Ver & "\" & cTLI.LCID
    cRR.DeleteKey
    
    'HKEY_CLASSES_ROOT\TypeLib\{B2BDDCF0-A77B-11D5-8F58-0080C8F703B4}\1.1
    cRR.SectionKey = "TypeLib\" & cTLI.Guid & "\" & Ver
    cRR.DeleteKey
    
    'HKEY_CLASSES_ROOT\TypeLib\{B2BDDCF0-A77B-11D5-8F58-0080C8F703B4}
    cRR.SectionKey = "TypeLib\" & cTLI.Guid
    cRR.DeleteKey
                
    Set cInterfaces = cTLI.Interfaces
        
    'eliminar las interfaces
    For c = 1 To cInterfaces.Count
        Set cInterfaceInfo = cInterfaces.Item(c)
                        
        'HKEY_LOCAL_MACHINE\Software\CLASSES\Interface\{00FA5384-E5A4-11D5-B914-00A0CC2C77FD}\TypeLib
        cRM.ClassKey = HKEY_LOCAL_MACHINE
        cRM.SectionKey = "Software\CLASSES\Interface\" & cInterfaceInfo.Guid & "\TypeLib"
        cRM.DeleteKey
        
        'HKEY_LOCAL_MACHINE\Software\CLASSES\Interface\{00FA5384-E5A4-11D5-B914-00A0CC2C77FD}\ProxyStubClsid32
        cRM.SectionKey = "Software\CLASSES\Interface\" & cInterfaceInfo.Guid & "\ProxyStubClsid32"
        cRM.DeleteKey
        
        'HKEY_LOCAL_MACHINE\Software\CLASSES\Interface\{00FA5384-E5A4-11D5-B914-00A0CC2C77FD}\ProxyStubClsid
        cRM.SectionKey = "Software\CLASSES\Interface\" & cInterfaceInfo.Guid & "\ProxyStubClsid"
        cRM.DeleteKey
        
        'HKEY_LOCAL_MACHINE\Software\CLASSES\Interface\{00FA5384-E5A4-11D5-B914-00A0CC2C77FD}
        cRM.SectionKey = "Software\CLASSES\Interface\" & cInterfaceInfo.Guid
        cRM.DeleteKey
                                                
        cRR.ClassKey = HKEY_CLASSES_ROOT
                
        'HKEY_CLASSES_ROOT\Interface\{00FA5384-E5A4-11D5-B914-00A0CC2C77FD}\TypeLib
        cRR.SectionKey = "Interface\" & cInterfaceInfo.Guid & "\TypeLib"
        cRR.DeleteKey
        
        'HKEY_CLASSES_ROOT\Interface\{00FA5384-E5A4-11D5-B914-00A0CC2C77FD}\ProxyStubClsid32
        cRR.SectionKey = "Interface\" & cInterfaceInfo.Guid & "\ProxyStubClsid32"
        cRR.DeleteKey
        
        'HKEY_CLASSES_ROOT\Interface\{00FA5384-E5A4-11D5-B914-00A0CC2C77FD}\ProxyStubClsid
        cRR.SectionKey = "Interface\" & cInterfaceInfo.Guid & "\ProxyStubClsid"
        cRR.DeleteKey
        
        'HKEY_CLASSES_ROOT\Interface\{00FA5384-E5A4-11D5-B914-00A0CC2C77FD}
        cRR.SectionKey = "Interface\" & cInterfaceInfo.Guid
        cRR.DeleteKey
    Next c
    
    Set cClases = cTLI.CoClasses
        
    'sacar las clases del archivo
    For k = 1 To cClases.Count
        'ciclar x la info de la clase
        Set cClasesInfo = cClases.Item(k)
                
        cRM.ClassKey = HKEY_LOCAL_MACHINE
        
        'HKEY_LOCAL_MACHINE\Software\CLASSES\RSPrimas.RSFncsDLL\Clsid
        cRM.SectionKey = "Software\CLASSES\" & cTLI.Name & "." & cClasesInfo.Name & "\Clsid"
        cRM.DeleteKey
            
        'HKEY_LOCAL_MACHINE\Software\CLASSES\RSPrimas.RSFncsDLL
        cRM.SectionKey = "Software\CLASSES\" & cTLI.Name & "." & cClasesInfo.Name
        cRM.DeleteKey
        
        'HKEY_LOCAL_MACHINE\Software\CLASSES\CLSID\{B2BDDCF6-A77B-11D5-8F58-0080C8F703B4}\VERSION
        cRM.SectionKey = "Software\CLASSES\CLSID\" & cClasesInfo.Guid & "\VERSION"
        cRM.DeleteKey
        
        'HKEY_LOCAL_MACHINE\Software\CLASSES\CLSID\{B2BDDCF6-A77B-11D5-8F58-0080C8F703B4}\TypeLib
        cRM.SectionKey = "Software\CLASSES\CLSID\" & cClasesInfo.Guid & "\TypeLib"
        cRM.DeleteKey
        
        cRM.SectionKey = "Software\CLASSES\CLSID\" & cClasesInfo.Guid & "\ToolboxBitmap32"
        cRM.DeleteKey
                        
        'HKEY_LOCAL_MACHINE\Software\CLASSES\CLSID\{B2BDDCF6-A77B-11D5-8F58-0080C8F703B4}\Programmable
        cRM.SectionKey = "Software\CLASSES\CLSID\" & cClasesInfo.Guid & "\Programmable"
        cRM.DeleteKey
        
        'HKEY_LOCAL_MACHINE\Software\CLASSES\CLSID\{B2BDDCF6-A77B-11D5-8F58-0080C8F703B4}\ProgID
        cRM.SectionKey = "Software\CLASSES\CLSID\" & cClasesInfo.Guid & "\ProgID"
        cRM.DeleteKey
        
        cRM.SectionKey = "Software\CLASSES\CLSID\" & cClasesInfo.Guid & "\MiscStatus\1"
        cRM.DeleteKey
        
        cRM.SectionKey = "Software\CLASSES\CLSID\" & cClasesInfo.Guid & "\MiscStatus"
        cRM.DeleteKey
        
        'HKEY_LOCAL_MACHINE\Software\CLASSES\CLSID\{B2BDDCF6-A77B-11D5-8F58-0080C8F703B4}\InprocServer32
        cRM.SectionKey = "Software\CLASSES\CLSID\" & cClasesInfo.Guid & "\InprocServer32"
        cRM.DeleteKey
        
        'HKEY_LOCAL_MACHINE\Software\CLASSES\CLSID\{B2BDDCF6-A77B-11D5-8F58-0080C8F703B4}\Implemented Categories
        cRM.SectionKey = "Software\CLASSES\CLSID\" & cClasesInfo.Guid & "\Implemented Categories"
        cRM.DeleteKey
        
        cRM.SectionKey = "Software\CLASSES\CLSID\" & cClasesInfo.Guid & "\Control"
        cRM.DeleteKey
        
        'HKEY_LOCAL_MACHINE\Software\CLASSES\CLSID\{B2BDDCF6-A77B-11D5-8F58-0080C8F703B4}
        cRM.SectionKey = "Software\CLASSES\CLSID\" & cClasesInfo.Guid
        cRM.DeleteKey
                        
        cRR.ClassKey = HKEY_CLASSES_ROOT
                
        'HKEY_CLASSES_ROOT\RSPrimas.RSFncsDLL\Clsid\{B2BDDCF6-A77B-11D5-8F58-0080C8F703B4}
        cRR.SectionKey = cTLI.Name & "." & cClasesInfo.Name & "\Clsid\" & cClasesInfo.Guid
        cRR.DeleteKey
        
        'HKEY_CLASSES_ROOT\RSPrimas.RSFncsDLL
        cRR.SectionKey = cTLI.Name & "." & cClasesInfo.Name
        cRR.DeleteKey
        
        'HKEY_CLASSES_ROOT\CLSID\{B2BDDCF6-A77B-11D5-8F58-0080C8F703B4}\VERSION
        cRR.SectionKey = "CLSID\" & cClasesInfo.Guid & "\VERSION"
        cRR.DeleteKey
        
        'HKEY_CLASSES_ROOT\CLSID\{B2BDDCF6-A77B-11D5-8F58-0080C8F703B4}\TypeLib
        cRR.SectionKey = "CLSID\" & cClasesInfo.Guid & "\TypeLib"
        cRR.DeleteKey
        
        cRR.SectionKey = "CLSID\" & cClasesInfo.Guid & "\ToolboxBitmap32"
        cRR.DeleteKey
        
        'HKEY_CLASSES_ROOT\CLSID\{B2BDDCF6-A77B-11D5-8F58-0080C8F703B4}\Programmable
        cRR.SectionKey = "CLSID\" & cClasesInfo.Guid & "\Programmable"
        cRR.DeleteKey
        
        'HKEY_CLASSES_ROOT\CLSID\{B2BDDCF6-A77B-11D5-8F58-0080C8F703B4}\ProgID
        cRR.SectionKey = "CLSID\" & cClasesInfo.Guid & "\ProgID"
        cRR.DeleteKey
        
        cRR.SectionKey = "CLSID\" & cClasesInfo.Guid & "\MiscStatus\1"
        cRR.DeleteKey
        
        cRR.SectionKey = "CLSID\" & cClasesInfo.Guid & "\MiscStatus"
        cRR.DeleteKey
        
        'HKEY_CLASSES_ROOT\CLSID\{B2BDDCF6-A77B-11D5-8F58-0080C8F703B4}\InprocServer32
        cRR.SectionKey = "CLSID\" & cClasesInfo.Guid & "\InprocServer32"
        cRR.DeleteKey
        
        'HKEY_CLASSES_ROOT\CLSID\{B2BDDCF6-A77B-11D5-8F58-0080C8F703B4}\Implemented Categories
        cRR.SectionKey = "CLSID\" & cClasesInfo.Guid & "\Implemented Categories"
        cRR.DeleteKey
        
        cRR.SectionKey = "CLSID\" & cClasesInfo.Guid & "\Control"
        cRR.DeleteKey
        
        'HKEY_CLASSES_ROOT\CLSID\{B2BDDCF6-A77B-11D5-8F58-0080C8F703B4}
        cRR.SectionKey = "CLSID\" & cClasesInfo.Guid
        cRR.DeleteKey
                                                                                                                                                       
        Set cClasesInterfaces = cClasesInfo.Interfaces
        
        'ciclar x las interfaces
        For c = cClasesInterfaces.Count To 1 Step -1
            Set cClasesInterInfo = cClasesInterfaces.Item(c)
                                    
            cRM.ClassKey = HKEY_LOCAL_MACHINE
            
            'HKEY_LOCAL_MACHINE\Software\CLASSES\Interface\{00FA5384-E5A4-11D5-B914-00A0CC2C77FD}\TypeLib
            cRM.SectionKey = "Software\CLASSES\Interface\" & cInterfaceInfo.Guid & "\TypeLib"
            cRM.DeleteKey
        
            'HKEY_LOCAL_MACHINE\Software\CLASSES\Interface\{00FA5384-E5A4-11D5-B914-00A0CC2C77FD}\ProxyStubClsid32
            cRM.SectionKey = "Software\CLASSES\Interface\" & cInterfaceInfo.Guid & "\ProxyStubClsid32"
            cRM.DeleteKey
            
            'HKEY_LOCAL_MACHINE\Software\CLASSES\Interface\{00FA5384-E5A4-11D5-B914-00A0CC2C77FD}\ProxyStubClsid
            cRM.SectionKey = "Software\CLASSES\Interface\" & cInterfaceInfo.Guid & "\ProxyStubClsid"
            cRM.DeleteKey
            
            'HKEY_LOCAL_MACHINE\Software\CLASSES\Interface\{00FA5384-E5A4-11D5-B914-00A0CC2C77FD}
            cRM.SectionKey = "Software\CLASSES\Interface\" & cInterfaceInfo.Guid
            cRM.DeleteKey
            
            cRR.ClassKey = HKEY_CLASSES_ROOT
            
            'HKEY_CLASSES_ROOT\Interface\{00FA5384-E5A4-11D5-B914-00A0CC2C77FD}\TypeLib
            cRR.SectionKey = "Interface\" & cInterfaceInfo.Guid & "\TypeLib\Version"
            cRR.DeleteKey
            
            cRR.SectionKey = "Interface\" & cInterfaceInfo.Guid & "\TypeLib\(Predeterminado)"
            cRR.DeleteKey
                        
            cRR.SectionKey = "Interface\" & cInterfaceInfo.Guid & "\TypeLib"
            cRR.DeleteKey
            
            'HKEY_CLASSES_ROOT\Interface\{00FA5384-E5A4-11D5-B914-00A0CC2C77FD}\ProxyStubClsid32
            cRR.SectionKey = "Interface\" & cInterfaceInfo.Guid & "\ProxyStubClsid32"
            cRR.DeleteKey
            
            'HKEY_CLASSES_ROOT\Interface\{00FA5384-E5A4-11D5-B914-00A0CC2C77FD}\ProxyStubClsid
            cRR.SectionKey = "Interface\" & cInterfaceInfo.Guid & "\ProxyStubClsid"
            cRR.DeleteKey
                        
            'HKEY_CLASSES_ROOT\Interface\{00FA5384-E5A4-11D5-B914-00A0CC2C77FD}
            cRR.SectionKey = "Interface\" & cInterfaceInfo.Guid
            cRR.DeleteKey
        Next c
    Next k
        
    Set cTLI = Nothing
    
    Err = 0
    
End Sub


Private Sub Dir1_Change()
    File1.Path = Dir1.Path
End Sub

Private Sub Form_Load()

    Dim valor As Variant
    
    Set MyHelpCallBack = New HelpCallBack
    
    Call clsXmenu.Install(hwnd, MyHelpCallBack, Me.imlMain)
    Call clsXmenu.FontName(hwnd, "Tahoma")
    
    C_PATH = Ini.Leer("general", "path", C_INI)
    
    If C_PATH = "" Then
        C_PATH = WinSystemDir() & "\"
        Call Ini.Grabar(C_INI, "general", "path", C_PATH)
    End If
            
    valor = Ini.Leer("general", "instalar", C_INI)
    If valor = "" Then
        glbInstallInterno = True
    ElseIf valor = "1" Then
        glbInstallInterno = True
    ElseIf valor = "0" Then
        glbInstallInterno = False
    Else
        glbInstallInterno = True
    End If
                        
    valor = Ini.Leer("general", "instalar_s", C_INI)
    If valor = "" Then
        glbInstallSilent = True
    ElseIf valor = "1" Then
        glbInstallSilent = True
    ElseIf valor = "0" Then
        glbInstallSilent = False
    Else
        glbInstallSilent = True
    End If
       
    Call Actualizar
    
End Sub

Private Sub Form_Resize()

    If WindowState <> vbMinimized Then
        picMain.Left = 0
        picMain.Top = tlbMain.Height + 1
        picMain.Height = ScaleHeight - tlbMain.Height - stbMain.Height
        
        lview.Left = picMain.width '+ 1
        lview.Top = tlbMain.Height + 1
        lview.Height = ScaleHeight - tlbMain.Height - stbMain.Height
        lview.width = ScaleWidth - picMain.width
        
        Call Logo
    End If
    
End Sub


Private Sub lview_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)

    If lview.SortOrder = lvwAscending Then
        lview.SortOrder = lvwDescending
    Else
        lview.SortOrder = lvwAscending
    End If
    
    lview.SortKey = ColumnHeader.Index - 1
    
    lview.Sorted = True
    
End Sub


Private Sub mnuArchivo_ConfImpresora_Click()
    
    Call ConfigurarPagina
    
End Sub

Private Sub ConfigurarPagina()

    Dim cc As New GCommonDialog
    
    Call cc.VBPageSetupDlg(hwnd)
    
    Set cc = Nothing
    
End Sub

Private Sub mnuArchivo_Imprimir_Click()
    frmImprimir.Show vbModal
End Sub

Private Sub mnuArchivo_Registrar_Click()
    
    Dim Msg As String
    
    Msg = "Confirma limpiar archivo(s)."
    
    If Confirma(Msg) = vbYes Then
        Call Limpiar
        MsgBox "Limpieza realizada con éxito!", vbInformation
    End If
    
End Sub

Private Sub mnuArchivo_Salir_Click()
    Unload Me
End Sub


Private Sub mnuAyuda_Acerca_Click()
    frmAcerca.Show vbModal
End Sub

Private Sub mnuEdicion_DesSelTodos_Click()

    Dim k As Integer
    
    Call Hourglass(hwnd, True)
    
    For k = 1 To lview.ListItems.Count
        lview.ListItems(k).Checked = False
    Next k
    
    Call Hourglass(hwnd, False)
    
End Sub

Private Sub mnuEdicion_SelTodos_Click()

    Dim k As Integer
    
    Call Hourglass(hwnd, True)
    
    For k = 1 To lview.ListItems.Count
        lview.ListItems(k).Checked = True
    Next k
    
    Call Hourglass(hwnd, False)
    
End Sub

Private Sub mnuOpciones_Path_Click()
    frmPath.Show vbModal
End Sub

Private Sub MyHelpCallBack_MenuHelp(ByVal MenuText As String, ByVal MenuHelp As String, ByVal Enabled As Boolean)
    stbMain.Panels(1).Text = MenuHelp
End Sub

Private Sub tlbMain_ButtonClick(ByVal Button As MSComctlLib.Button)

    Select Case Button.Key
        Case "cmdLimpiar"
            mnuArchivo_Registrar_Click
        Case "cmdActualizar"
            Call Actualizar
        Case "cmdImprimir"
            mnuArchivo_Imprimir_Click
        Case "cmdSalir"
            Call mnuArchivo_Salir_Click
    End Select
    
End Sub

