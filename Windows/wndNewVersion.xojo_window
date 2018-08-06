#tag Window
Begin Window wndNewVersion
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   404
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   404
   MinimizeButton  =   True
   MinWidth        =   409
   Placement       =   0
   Resizeable      =   True
   Title           =   "#kWindowTitle"
   Visible         =   True
   Width           =   409
   Begin HTMLViewer htmlReleaseNotes
      AutoDeactivate  =   True
      ControlOrder    =   ""
      Enabled         =   True
      Height          =   293
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   18
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Renderer        =   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   91
      Transparent     =   True
      Visible         =   True
      Width           =   371
   End
   Begin Label txtTitle
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   18
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "dynamic"
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   18
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   371
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#kClickToVisitWebsite"
      Default         =   False
      Enabled         =   True
      Height          =   29
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   18
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   50
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   251
   End
   Begin HTTPSocket sckReleaseNotesFetcher
      Address         =   ""
      BytesAvailable  =   0
      BytesLeftToSend =   0
      Enabled         =   True
      Handle          =   0
      httpProxyAddress=   ""
      httpProxyPort   =   0
      Index           =   -2147483648
      IsConnected     =   False
      LastErrorCode   =   0
      LocalAddress    =   ""
      LockedInPosition=   False
      Port            =   80
      RemoteAddress   =   ""
      Scope           =   0
      TabPanelIndex   =   0
      yield           =   False
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub EnableMenuItems()
		  FileClose.enable
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  sckReleaseNotesFetcher.get(App.kURLReleaseNotes)
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			me.close
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub setTitle(currentVersion as String, newVersion as String)
		  dim parameters() as string = array(newVersion, currentVersion)
		  txtTitle.text = App.processParameterizedString(kNewVersionAvailable, parameters)
		End Sub
	#tag EndMethod


	#tag Constant, Name = kClickToVisitWebsite, Type = String, Dynamic = True, Default = \"Click to visit the website to download it", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Clicca per visitare la pagina web per il download"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Cliquez pour aller sur le site pour la t\xC3\xA9l\xC3\xA9charger"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Clica per visitar el lloc web per a descarregar-lo"
	#tag EndConstant

	#tag Constant, Name = kNewVersionAvailable, Type = String, Dynamic = True, Default = \"Version ${1} is now available\x2C your current version is ${2}", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"\xC3\x88 disponibile la versione ${1}\x2C la tua versione attualmente \xC3\xA8 la ${2}"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Version ${1} disponible\x2C votre version actuelle est${2}"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"La versi\xC3\xB3 ${1} est\xC3\xA0 disponible\x2C la vostra versi\xC3\xB3 actual \xC3\xA9s ${2}"
	#tag EndConstant

	#tag Constant, Name = kWindowTitle, Type = String, Dynamic = True, Default = \"New Version Available", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Nuova versione disponibile"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Nouvelle version disponible"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Nova versi\xC3\xB3 disponible"
	#tag EndConstant


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  showURL(App.kURLWebsite)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events sckReleaseNotesFetcher
	#tag Event
		Sub PageReceived(url as string, httpStatus as integer, headers as internetHeaders, content as string)
		  dim html as string
		  
		  if (httpStatus = 200) then
		    html = content
		  else
		    html = "<p>Release notes not currently available</p>"
		  end if
		  
		  // Must create a temporary *file* to pass to the loadPage method.  Only required for Macs.
		  dim f as FolderItem = getTemporaryFolderItem()
		  htmlReleaseNotes.LoadPage(html, f)
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
