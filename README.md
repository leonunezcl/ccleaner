# Programa
Component Cleaner - Limpia librerias y controles ActiveX

# Autor
Luis Leonardo Nuñez Ibarra. Año 2000 - 2003. email : leo.nunez@gmail.com. 

Chileno, casado , tengo 2 hijos. Aficionado a los videojuegos y el tenis de mesa. Mi primer computador fue un Talent MSX que me compro mi papa por alla por el año 1985. En el di mis primeros pasos jugando juegos como Galaga y PacMan y luego programando en MSX-BASIC. 

En la actualidad mi area de conocimiento esta referida a las tecnologias .NET con mas de 15 años de experiencia desarrollando varias paginas web usando asp.net con bases de datos sql server y Oracle. Integrador de tecnologias, desarrollo de servicios, aplicaciones de escritorio.

# Tipo de Proyecto
Component Cleaner es una aplicación que se encarga de instalar/desinstalar controles y librerias activex. Para esto se ocupa la libreria TLBINF32.DLL la cual ayuda a obtener la información de las librerias desde el registro de windows.

# Prologo
Regala un pescado a un hombre y le darás alimento para un día, enseñale a pescar y lo alimentarás para el resto de su vida (Proverbio Chino)

# Historia
Este utilitario nace de la necesidad de tener una aplicacion con la cual instalar y desinstalar librerias y controles activex de una forma mas amigable. Dado este escenario es que decidi construir este utilitario el cual lee todas las librerias activex del directorio windows\system y verifica su estado. La información se extrae usando la libreria TLBINF32.DLL.

# Archivos Necesarios
Este proyecto ocupa 5 componentes ActiveX 

- Reference=*\G{00020430-0000-0000-C000-000000000046}#2.0#0#C:\WINDOWS\SYSTEM\StdOle2.tlb#OLE Automation
- Reference=*\G{8B217740-717D-11CE-AB5B-D41203C10000}#1.0#0#C:\WINDOWS\SYSTEM\TLBINF32.DLL#TypeLib Information
- Reference=*\G{69EDFBA5-9FEC-11D5-89A4-F0FAEF3C8033}#1.0#0#C:\WINDOWS\SYSTEM\PVB_XMENU.DLL#PVB6 ActiveX DLL - Menu With Bitmaps !
- Object={831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0; MSCOMCTL.OCX
- Object={3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0; RICHTX32.OCX

El archivo PVB_XMENU.DLL es un componente customizado para que los menus se puedan aplicar iconos y ayuda al momento de selección.

# Registro de los componentes ActiveX
Se debe realizar desde la linea de comando de windows regsvr32.exe [nombre del componente]
Para windows 10 necesitaras instalar con permisos de administrador. 

