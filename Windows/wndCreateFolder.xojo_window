#tag Window
Begin Window wndCreateFolder
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   8
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   123
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   False
   Title           =   "#kWindowTitle"
   Visible         =   True
   Width           =   425
   Begin Label StaticText1
      AutoDeactivate  =   True
      BehaviorIndex   =   0
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   54
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kFolderNameLabel"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   47
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   111
   End
   Begin PushButton btnCreate
      AutoDeactivate  =   True
      BehaviorIndex   =   1
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#App.kCreate"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   317
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   83
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   88
   End
   Begin TextField fldFolderName
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   
      BehaviorIndex   =   2
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   177
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Multiline       =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   "True"
      Styled          =   ""
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   228
   End
   Begin PushButton btnCancel
      AutoDeactivate  =   True
      BehaviorIndex   =   3
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "#App.kCancel"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   217
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   83
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   88
   End
   Begin Label StaticText2
      AutoDeactivate  =   True
      BehaviorIndex   =   4
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kCreateFolderLabel"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   385
   End
End
#tag EndWindow

#tag WindowCode
	#tag Constant, Name = kCreateFolderLabel, Type = String, Dynamic = True, Default = \"Create a folder inside the currently selected folder", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Crea una cartella dentro quella selezionata"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Cr\xC3\xA9er un dossier dans le dossier s\xC3\xA9lectionn\xC3\xA9"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Crea una carpeta dins de la carpeta seleccionada actualment"
	#tag EndConstant

	#tag Constant, Name = kFolderNameLabel, Type = String, Dynamic = True, Default = \"Folder Name:", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Nome Cartella:"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Nom du dossier :"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Nom de la carpeta:"
	#tag EndConstant

	#tag Constant, Name = kWindowTitle, Type = String, Dynamic = True, Default = \"Create Folder", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Crea Cartella"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Cr\xC3\xA9er un dossier"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Crea una carpeta"
	#tag EndConstant


#tag EndWindowCode

#tag Events btnCreate
	#tag Event
		Sub Action()
		  wndMain.createAircraftFolder(fldFolderName.text)
		  wndCreateFolder.close()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnCancel
	#tag Event
		Sub Action()
		  wndCreateFolder.close()
		End Sub
	#tag EndEvent
#tag EndEvents
