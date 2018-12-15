Attribute VB_Name = "MISCSHOP"
Option Explicit

Private Type OSVERSIONINFO
  dwOSVersionInfoSize As Long
  dwMajorVersion As Long
  dwMinorVersion As Long
  dwBuildNumber As Long
  dwPlatformId As Long
  szCSDVersion As String * 128
End Type
Private Const SW_RESTORE& = 9
Private Declare Function FindWindow& Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String)
Private Declare Function ShowWindow& Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long)
Private Declare Function GetClassName& Lib "user32" Alias "GetClassNameA" (ByVal hwnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long)
Private Declare Function SetForegroundWindow& Lib "user32" (ByVal hwnd As Long)
Private Declare Function IsIconic& Lib "user32" (ByVal hwnd As Long)
Private Declare Function GetVersionEx& Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As OSVERSIONINFO)

Public STRRUTA As Variant
Public VARLENGUAJE As Variant
Public STRNOMBREPROYECTO As String
Public SNGVERSIONPLANTILLA As Single
Public STRPLANTILLAELEGIDA As String
Public BOLESPLANTILLAORIGINAL As Boolean
#If MANAGER = True Then
Public TWSHSERVIDOR As New TINYWEBSERVERHANDLER
#End If
Public Function ACTIVARYRESTAURARINSTANCIAPREVIA(ByRef FRMVENTANADELAAPLICACIONACTUAL As Form) As Boolean
  Dim STRCLASE As String * 256
  Dim STRCLASE2 As String
  Dim LNGHANDLEVENTANA As Long
  Dim STRNOMBREVENTANA As String
  Dim RETVAL As Long
  RETVAL = GetClassName(FRMVENTANADELAAPLICACIONACTUAL.hwnd, STRCLASE, Len(STRCLASE))
  If RETVAL = 0 Then
    ACTIVARYRESTAURARINSTANCIAPREVIA = False
    Exit Function
  End If
  STRCLASE2 = Mid(STRCLASE, 1, RETVAL)
  STRNOMBREVENTANA = FRMVENTANADELAAPLICACIONACTUAL.Caption
  FRMVENTANADELAAPLICACIONACTUAL.Caption = ""
  LNGHANDLEVENTANA = FindWindow(STRCLASE2, STRNOMBREVENTANA)
  If LNGHANDLEVENTANA = 0 Then
    ACTIVARYRESTAURARINSTANCIAPREVIA = False
    Exit Function
  End If
  If IsIconic(LNGHANDLEVENTANA) <> 0 Then
    If ShowWindow(LNGHANDLEVENTANA, SW_RESTORE) = 0 Then
      ACTIVARYRESTAURARINSTANCIAPREVIA = False
      Exit Function
    End If
  End If
  If SetForegroundWindow(LNGHANDLEVENTANA) = 0 Then
    ACTIVARYRESTAURARINSTANCIAPREVIA = False
    Exit Function
  End If
  ACTIVARYRESTAURARINSTANCIAPREVIA = True
End Function

 Function ESWINDOWSNT() As Byte
  Dim OVISISTEMAACTUAL As OSVERSIONINFO
  Dim RETVAL As Long
  
  OVISISTEMAACTUAL.dwOSVersionInfoSize = Len(OVISISTEMAACTUAL)
  RETVAL = GetVersionEx(OVISISTEMAACTUAL)
  If RETVAL = 0 Then
    ESWINDOWSNT = 0
    Exit Function
  ElseIf OVISISTEMAACTUAL.dwPlatformId <> 2 Then
    ESWINDOWSNT = 1
    Exit Function
  Else
    ESWINDOWSNT = 2
    Exit Function
  End If
End Function

Function MSGERRORES(ByVal INTNUMERODEERROR As Integer) As String

  Dim STRMENSAJES(6) As String
  STRMENSAJES(0) = "No se ha podido determinar la versión de Windows esta corriedo el programa"
  STRMENSAJES(1) = "Este programa solo puede funcionar en las vesiones de Windows NT/2000/XP o superior"
  STRMENSAJES(2) = "No se ha podido restaurar una instancia previa de la aplicación"
  STRMENSAJES(3) = "Faltan archivos centrales de la aplicación"
  STRMENSAJES(4) = "La integridad del archivo de configuración no es válida"
  STRMENSAJES(5) = "No se puede cargar el lenguaje por defecto"
  STRMENSAJES(6) = "La resolución mínima para ejecutar este programa es de 1024X768 pixels"
  MSGERRORES = STRMENSAJES(INTNUMERODEERROR)

End Function

Function CARGARLENGUAJE(ByVal STRLENGUAJE As String, ByRef FLBLENGUAJE As FileListBox) As Boolean

  Dim BOLRETVAL As Boolean
  Dim LNGARCHIVO As New LANGUAGEARCHIVES
  Dim I As Integer
  Dim Z As Integer
  BOLRETVAL = False
  LNGARCHIVO.EntriesNumber = NUMERO_DE_ENTRADAS_DEL_ARCHIVO_DE_LENGUAJE

  For I = 0 To FLBLENGUAJE.ListCount - 1
    If LNGARCHIVO.LoadArchive(STRRUTA & "LENGUAJE\" & FLBLENGUAJE.List(I)) = 0 Then
    
      If UCase(LNGARCHIVO.GetValue("lenguaje")) = UCase(STRLENGUAJE) Then
        VARLENGUAJE = LNGARCHIVO.Keys()
        For Z = 1 To UBound(VARLENGUAJE)
          VARLENGUAJE(Z - 1) = LNGARCHIVO.GetValue(VARLENGUAJE(Z))
        Next Z
        ReDim Preserve VARLENGUAJE(UBound(VARLENGUAJE) - 1)
        CARGARLENGUAJE = True
        Exit Function
      End If
    
    End If
   
  
  Next I
  CARGARLENGUAJE = False
End Function

Function OBTENERLENGUAJESDISPONIBLES(ByVal STRLENGUAJEAEXCLUIR, ByRef FLBLENGUAJE As FileListBox)

  Dim HASLISTALENGUAJE As New HASHARCHIVES
  Dim LNGARCHIVO As New LANGUAGEARCHIVES
  Dim I As Integer
  
  LNGARCHIVO.EntriesNumber = NUMERO_DE_ENTRADAS_DEL_ARCHIVO_DE_LENGUAJE
  HASLISTALENGUAJE.HashArchivesType = False
  For I = 0 To FLBLENGUAJE.ListCount - 1
    If LNGARCHIVO.LoadArchive(STRRUTA & "LENGUAJE\" & FLBLENGUAJE.List(I)) = 0 Then
      If UCase(LNGARCHIVO.GetValue("lenguaje")) <> STRLENGUAJEAEXCLUIR Then
        HASLISTALENGUAJE.Add LNGARCHIVO.GetValue("lenguaje"), "SI"
      End If
    End If
  Next I
  OBTENERLENGUAJESDISPONIBLES = HASLISTALENGUAJE.Keys
End Function




