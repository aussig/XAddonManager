#tag WindowBegin Window wndAbout   BackColor       =   &hFFFFFF   Backdrop        =   ""   BalloonHelp     =   ""   CloseButton     =   "True"   Composite       =   "True"   Frame           =   0   FullScreen      =   "False"   HasBackColor    =   "False"   Height          =   300   ImplicitInstance=   "True"   LiveResize      =   "True"   MacProcID       =   0   MaxHeight       =   32000   MaximizeButton  =   "False"   MaxWidth        =   32000   MenuBar         =   ""   MenuBarVisible  =   "True"   MinHeight       =   64   MinimizeButton  =   "True"   MinWidth        =   64   Placement       =   2   Resizeable      =   "False"   Title           =   "Untitled"   Visible         =   "True"   Width           =   276   Begin Timer Timer1      BehaviorIndex   =   0      Enabled         =   True      Height          =   32      Index           =   -2147483648      InitialParent   =   ""      Left            =   366      Mode            =   2      Period          =   50      Scope           =   0      TabIndex        =   0      TabPanelIndex   =   0      Top             =   2      Visible         =   True      Width           =   32      BehaviorIndex   =   0   End   Begin Canvas cnvAboutText      AcceptFocus     =   ""      AcceptTabs      =   ""      AutoDeactivate  =   "True"      Backdrop        =   ""      BehaviorIndex   =   1      Enabled         =   True      EraseBackground =   "True"      Height          =   193      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   20      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabIndex        =   1      TabPanelIndex   =   0      Top             =   87      UseFocusRing    =   "True"      Visible         =   True      Width           =   236      BehaviorIndex   =   1   End   Begin Canvas Canvas1      AcceptFocus     =   ""      AcceptTabs      =   ""      AutoDeactivate  =   "True"      Backdrop        =   1638712966      BehaviorIndex   =   2      Enabled         =   True      EraseBackground =   "True"      Height          =   64      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   106      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabIndex        =   2      TabPanelIndex   =   0      Top             =   11      UseFocusRing    =   "False"      Visible         =   True      Width           =   64      BehaviorIndex   =   2   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Sub Open()		  yScroll = cnvAboutText.height + 20		End Sub	#tag EndEvent#tag MenuHandler		Function FileClose() As Boolean Handles FileClose.Action			me.close			Return True					End Function#tag EndMenuHandler	#tag Property, Flags = &h0		yScroll As Integer = 0	#tag EndProperty	#tag Constant, Name = kAboutBoxContents, Type = String, Dynamic = True, Default = \"XAddonManager v${1} Copyright \xC2\xA92008 Austin Goudge (austin@goudges.com)\r\rMany thanks go to:\r\rSergio Santagada for allowing the icon to be based on his X-Plane\xC2\xAE icon artwork\r\rFabian Piedras for the Spanish translation\r\rOlivier Faivre for the French translation\r\rNicola Altafini for the Italian translation\r\rJordi Sayol for the Catalan translation\r\rDavid Gluck for the German translation\r\r\rThis software uses Thomas Tempelmann\'s Zip Package (www.tempel.org)\x2C Kevin Ballard\'s XMLDictionary module (www.tildesoft.com) and icons from FAMFAMFAM (http://www.famfamfam.com/lab/icons/silk/)", Scope = Public		#Tag Instance, Platform = Any, Language = ca, Definition  = \"XAddonManager v${1} Copyright \xC2\xA92008 Austin Goudge (austin@goudges.com)\r\rMoltes gr\xC3\xA0cies per a:\r\rSergio Santagada per permetre que l\'icona estigui basada en la seva icona de l\'X-Plane\xC2\xAE\r\rFabian Piedras per la traducci\xC3\xB3 al Castell\xC3\xA0\r\rOlivier Faivre per la traducci\xC3\xB3 al Franc\xC3\xA8s\r\rNicola Altafini per la traducci\xC3\xB3 a l\'Itali\xC3\xA0\r\rJordi Sayol per la traducci\xC3\xB3 al Catal\xC3\xA0\r\rDavid Gluck per la traducci\xC3\xB3 al Alemany\r\rAquest programari usa el Zip Package de Thomas Tempelmann (www.tempel.org) i el m\xC3\xB2dul XMLDictionary de Kevin Ballard (www.tildesoft.com) and icons from FAMFAMFAM (http://www.famfamfam.com/lab/icons/silk/)"		#Tag Instance, Platform = Any, Language = it, Definition  = \"XAddonManager v${1} Copyright \xC2\xA92008 Austin Goudge (austin@goudges.com)\r\rGrazie infinite a:\rSergio Santagada per aver permesso che l\'icona sia basata sulla grafica di X-Plane\xC2\xAE \r\rFabian Piedras per la traduzione Spagnola\r\rOlivier Faivre per la traduzione Francese\r\rNicola Altafini per la traduzione Italiana\r\rJordi Sayol per la traduzione Catalana\r\rDavid Gluck per la traduzione Tedesca\r\rQuesto software usa il Thomas Tempelmann\'s Zip Package (www.tempel.org) ed ilKevin Ballard\'s XMLDictionary module (www.tildesoft.com) and icons from FAMFAMFAM (http://www.famfamfam.com/lab/icons/silk/)"		#Tag Instance, Platform = Any, Language = fr, Definition  = \"XAddonManager v${1} Copyright \xC2\xA92008 Austin Goudge (austin@goudges.com)\r\rMerci \xC3\xA0:\r\rSergio Santagada pour m\'avoir autoris\xC3\xA9 \xC3\xA0 utiliser la base de son travail pour l\'incone\r\rFabian pour sa traduction en esapgnol\r\rOlivier Faivre pour sa traduction en fran\xC3\xA7ais\r\rNicola Altafini pour sa traduction en italien\r\rEp\xC3\xADleg pour sa traduction en catalan\r\rDavid Gluck pour sa traduction en allemand\r\rCe logiciel utilise Zip Package (www.tempel.org) de Thomas Tempelmann\'s  et and  XMLDictionary module (www.tildesoft.com) de Kevin Ballard and icons from FAMFAMFAM (http://www.famfamfam.com/lab/icons/silk/)"		#Tag Instance, Platform = Any, Language = es, Definition  = \"XAddonManager v${1} Copyright \xC2\xA92008 Austin Goudge (austin@goudges.com)\r\rMuchas gracias a:\r\rSergio Santagada por autorizar a que nuestro \xC3\xADcono se base en su \xC3\xADcono de X-Plane\xC2\xAE\r\rFabian Piedras por la traducci\xC3\xB3n al castellano\r\rOlivier Faivre  por la traducci\xC3\xB3n al franc\xC3\xA9s\r\rNicola Altafini  por la traducci\xC3\xB3n al italiano\r\rEp\xC3\xADleg  por la traducci\xC3\xB3n al catal\xC3\xA1n\r\rspasm_dtc  por la traducci\xC3\xB3n al alem\xC3\xA1n\r\rEste software utiliza el Zip Package de Thomas Tempelmann (www.tempel.org) y el m\xC3\xB3dulo XMLDictionary de Kevin Ballard (www.tildesoft.com)"	#tag EndConstant#tag EndWindowCode#tag Events Timer1	#tag Event		Sub Action()		  yScroll = yScroll - 1		  		  if yScroll <= -300 then		    yScroll = cnvAboutText.height + 20		  end if		  		  cnvAboutText.refresh		  		End Sub	#tag EndEvent#tag EndEvents#tag Events cnvAboutText	#tag Event		Sub Paint(g As Graphics)		  g.textSize = 9		  if Window(0) <> wndAbout then		    g.foreColor = &c888888		  end if		  		  dim parameters() as string = array(App.shortVersion)		  g.drawString(App.processParameterizedString(kAboutBoxContents, parameters), 0, yScroll, me.width)		End Sub	#tag EndEvent#tag EndEvents