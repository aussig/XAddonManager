#tag Window
Begin Window wndCreateGroup
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
      Text            =   "#kGroupNameLabel"
      TextAlign       =   2
      TextColor       =   &c000000
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
   Begin TextField fldGroupName
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF
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
      TextColor       =   &c000000
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
      Text            =   "#kCreateGroupLabel"
      TextAlign       =   2
      TextColor       =   &c000000
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
	#tag Constant, Name = kCreateGroupLabel, Type = String, Dynamic = True, Default = \"Create a group containing the currently enabled addons", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Crea un gruppo contenente gli addons correntemente selezionati"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Cr\xC3\xA9er un nouveau groupe contenant les addons actuellement s\xC3\xA9lectionn\xC3\xA9s"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Crea un grup que contingui els complements habilitats actualment"
	#tag EndConstant

	#tag Constant, Name = kGroupNameLabel, Type = String, Dynamic = True, Default = \"Group Name:", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Nome gruppo:"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Nom du groupe:"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Nom del grup:"
	#tag EndConstant

	#tag Constant, Name = kWindowTitle, Type = String, Dynamic = True, Default = \"Create Group", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Crea Gruppo"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Cr\xC3\xA9er un groupe"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Crea un grup"
	#tag EndConstant


#tag EndWindowCode

#tag Events btnCreate
	#tag Event
		Sub Action()
		  wndMain.createGroup(fldGroupName.text)
		  wndCreateGroup.close()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnCancel
	#tag Event
		Sub Action()
		  wndCreateGroup.close()
		End Sub
	#tag EndEvent
#tag EndEvents
