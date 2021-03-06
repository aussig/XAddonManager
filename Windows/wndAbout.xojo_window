#tag Window
Begin Window wndAbout
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   300
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
   Placement       =   2
   Resizeable      =   False
   Title           =   "#kWindowTitle"
   Visible         =   True
   Width           =   276
   Begin Timer Timer1
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   2
      Period          =   50
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin Canvas cnvAboutText
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   193
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   87
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   236
   End
   Begin Canvas cnvLogo
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   64
      HelpTag         =   "#App.kHTVisitWebsite"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   106
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   11
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   64
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  yScroll = cnvAboutText.height + 20
		  
		  dim parameters() as string = array(App.kApplicationName)
		  me.title = App.processParameterizedString(kWindowTitle, parameters)
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			me.close
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Property, Flags = &h0
		yScroll As Integer = 0
	#tag EndProperty


	#tag Constant, Name = kAboutBoxContents, Type = String, Dynamic = True, Default = \"XAddonManager v${1} Copyright \xC2\xA9 2019 Austin Goudge (austin@goudges.com)\n\nMany thanks go to:\n\nSergio Santagada for allowing the icon to be based on his X-Plane\xC2\xAE icon artwork\n\nFabian Piedras for the Spanish translation\n\nOlivier Faivre for the French translation\n\nNicola Altafini for the Italian translation\n\nJordi Sayol for the Catalan translation\n\nDavid Gluck for the German translation\n\n\nThis software uses Thomas Tempelmann\'s Zip Package (www.tempel.org)\x2C Kevin Ballard\'s XMLDictionary module (www.tildesoft.com) and icons from FAMFAMFAM (http://www.famfamfam.com/lab/icons/silk/)", Scope = Private
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"XAddonManager v${1} Copyright \xC2\xA9 2019 Austin Goudge (austin@goudges.com)\n\nMoltes gr\xC3\xA0cies per a:\n\nSergio Santagada per permetre que l\'icona estigui basada en la seva icona de l\'X-Plane\xC2\xAE\n\nFabian Piedras per la traducci\xC3\xB3 al Castell\xC3\xA0\n\nOlivier Faivre per la traducci\xC3\xB3 al Franc\xC3\xA8s\n\nNicola Altafini per la traducci\xC3\xB3 a l\'Itali\xC3\xA0\n\nJordi Sayol per la traducci\xC3\xB3 al Catal\xC3\xA0\n\nDavid Gluck per la traducci\xC3\xB3 al Alemany\n\nAquest programari usa el Zip Package de Thomas Tempelmann (www.tempel.org) i el m\xC3\xB2dul XMLDictionary de Kevin Ballard (www.tildesoft.com) and icons from FAMFAMFAM (http://www.famfamfam.com/lab/icons/silk/)"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"XAddonManager v${1} Copyright \xC2\xA9 2019 Austin Goudge (austin@goudges.com)\n\nGrazie infinite a:\nSergio Santagada per aver permesso che l\'icona sia basata sulla grafica di X-Plane\xC2\xAE \n\nFabian Piedras per la traduzione Spagnola\n\nOlivier Faivre per la traduzione Francese\n\nNicola Altafini per la traduzione Italiana\n\nJordi Sayol per la traduzione Catalana\n\nDavid Gluck per la traduzione Tedesca\n\nQuesto software usa il Thomas Tempelmann\'s Zip Package (www.tempel.org) ed ilKevin Ballard\'s XMLDictionary module (www.tildesoft.com) and icons from FAMFAMFAM (http://www.famfamfam.com/lab/icons/silk/)"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"XAddonManager v${1} Copyright \xC2\xA9 2019 Austin Goudge (austin@goudges.com)\n\nMerci \xC3\xA0:\n\nSergio Santagada pour m\'avoir autoris\xC3\xA9 \xC3\xA0 utiliser la base de son travail pour l\'incone\n\nFabian pour sa traduction en esapgnol\n\nOlivier Faivre pour sa traduction en fran\xC3\xA7ais\n\nNicola Altafini pour sa traduction en italien\n\nEp\xC3\xADleg pour sa traduction en catalan\n\nDavid Gluck pour sa traduction en allemand\n\nCe logiciel utilise Zip Package (www.tempel.org) de Thomas Tempelmann\'s  et and  XMLDictionary module (www.tildesoft.com) de Kevin Ballard and icons from FAMFAMFAM (http://www.famfamfam.com/lab/icons/silk/)"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"XAddonManager v${1} Copyright \xC2\xA9 2019 Austin Goudge (austin@goudges.com)\n\nMuchas gracias a:\n\nSergio Santagada por autorizar a que nuestro \xC3\xADcono se base en su \xC3\xADcono de X-Plane\xC2\xAE\n\nFabian Piedras por la traducci\xC3\xB3n al castellano\n\nOlivier Faivre  por la traducci\xC3\xB3n al franc\xC3\xA9s\n\nNicola Altafini  por la traducci\xC3\xB3n al italiano\n\nEp\xC3\xADleg  por la traducci\xC3\xB3n al catal\xC3\xA1n\n\nspasm_dtc  por la traducci\xC3\xB3n al alem\xC3\xA1n\n\nEste software utiliza el Zip Package de Thomas Tempelmann (www.tempel.org) y el m\xC3\xB3dulo XMLDictionary de Kevin Ballard (www.tildesoft.com)"
	#tag EndConstant

	#tag Constant, Name = kWindowTitle, Type = String, Dynamic = True, Default = \"About ${1}", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"A proposito di ${1}"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"A Propos ${1}"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Quant a ${1}"
	#tag EndConstant


#tag EndWindowCode

#tag Events Timer1
	#tag Event
		Sub Action()
		  yScroll = yScroll - 1
		  
		  if yScroll <= -300 then
		    yScroll = cnvAboutText.height + 20
		  end if
		  
		  cnvAboutText.refresh(true)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnvAboutText
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.textSize = 9
		  if Window(0) <> wndAbout then
		    g.foreColor = &c888888
		  end if
		  
		  dim parameters() as string = array(App.shortVersion)
		  g.drawString(App.processParameterizedString(kAboutBoxContents, parameters), 0, yScroll, me.width)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnvLogo
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  showURL(App.kURLWebsite)
		End Function
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.DrawPicture(imgIcon, 0, 0, imgIcon.Width * 0.5, imgIcon.Height * 0.5, 0, 0, imgIcon.Width, imgIcon.Height)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="yScroll"
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
