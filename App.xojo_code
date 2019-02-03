#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  // Must save preferences explicitly (can't do it in the destructor because it's unreliable on Windows)
		  pPreferences.save()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  // Check whether we are running as an administrator.  If not, re-run as admin.  This is only applicable on Windows.
		  #if TargetWindows then
		    if not isUserLocalAdministrator() then
		      msgbox("The application is not running as an administrator. This may cause problems if your X-Plane folder is in a secure location such as 'Program Files'. Re-run as administrator if you encounter problems.")
		    end if
		  #endif
		  
		  // Remove the separator under the help item if we're not on a Mac (no separator needed in Help menu on Windows and Linux)
		  #if not TargetMacOS
		    HelpAboutSeparator.Close
		  #endif
		  
		  // Initialise the Preferences object
		  pPreferences = new Preferences()
		  
		  // For now, just get the last X-Plane folder the user accessed.  We will need to provide a user interface
		  // onto multiple X-Plane folders one day.
		  dim lastXPlaneFolder as String = pPreferences.getLastXPlaneFolder()
		  
		  if (lastXPlaneFolder <> "") then
		    dim lastXPlaneFolderItem as FolderItem = getFolderItem(lastXPlaneFolder, FolderItem.PathTypeAbsolute)
		    if (lastXPlaneFolderItem <> nil) then
		      pXPlaneFolder = new XPlaneFolderItem(lastXPlaneFolderItem)
		    end if
		  end if
		  
		  if (pXPlaneFolder = nil _
		    or not pXPlaneFolder.exists() _
		    or not pXPlaneFolder.directory _
		    or not CustomSceneryPackage.getRootFolder().exists() _
		    or not Aircraft.getRootFolder().exists() _
		    or not Plugin.getRootFolder().exists()) then
		    dim result as Boolean = requestXPlaneFolder(true)
		  end if
		  
		  initialiseXPlaneFolder()
		  
		  wndMain.show()
		  'wndDebug.show()
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  dim fullStackTrace as String
		  dim index as integer = 0
		  
		  fullStackTrace = error.Message + endofline
		  
		  for each item as string in error.Stack
		    fullStackTrace = fullStackTrace + endofline + str(index) + ": " + item
		    index = index + 1
		  next
		  
		  msgbox(fullStackTrace)
		  return true
		End Function
	#tag EndEvent


	#tag MenuHandler
		Function FilePreferences() As Boolean Handles FilePreferences.Action
			wndPreferences.show()
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpAbout() As Boolean Handles HelpAbout.Action
			wndAbout.show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpUserGuide() As Boolean Handles HelpUserGuide.Action
			showURL(kURLUserGuide)
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub checkVersion(version as String)
		  if (App.shortVersion <> version) then
		    wndNewVersion.setTitle(shortVersion, version)
		    wndNewVersion.show
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub debug(message as String, clear as boolean = false)
		  if wndDebug.visible then
		    if clear then wndDebug.fldDebug.text = ""
		    wndDebug.fldDebug.text = wndDebug.fldDebug.text + endofline + message
		    wndDebug.show()
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function displayMessage(message as String, explanation as String, icon as Integer, actionButtonCaption as String, alternateActionButtonCaption as String, cancelButtonCaption as String, parentWindow as Window) As Integer
		  // Icon is one of MessageDialog.GraphicNone | MessageDialog.GraphicNote | MessageDialog.GraphicCaution | MessageDialog.GraphicStop | MessageDialog.GraphicQuestion
		  dim messageDialog as new MessageDialog
		  dim result as MessageDialogButton
		  
		  if (icon <> -1) then messageDialog.icon = icon
		  if (message <> "") then messageDialog.message = message
		  if (explanation <> "") then messageDialog.explanation = explanation
		  
		  if (actionButtonCaption <> "") then
		    messageDialog.ActionButton.Caption = actionButtonCaption
		  end if
		  if (cancelButtonCaption <> "") then
		    messageDialog.CancelButton.Caption = cancelButtonCaption
		    messageDialog.CancelButton.Visible = true
		  end if
		  if (alternateActionButtonCaption <> "") then
		    messageDialog.AlternateActionButton.Caption = alternateActionButtonCaption
		    messageDialog.AlternateActionButton.Visible = true
		  end if
		  
		  if (parentWindow <> nil) then
		    result = messageDialog.ShowModalWithin(parentWindow)
		  else
		    result = messageDialog.ShowModal()
		  end if
		  
		  select case result
		  case messageDialog.ActionButton
		    return 1
		  case messageDialog.AlternateActionButton
		    return 2
		  case messageDialog.CancelButton
		    return 0
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub initialiseXPlaneFolder()
		  Aircraft.initialiseXPlaneFolder()
		  CustomSceneryPackage.initialiseXPlaneFolder()
		  Plugin.initialiseXPlaneFolder()
		  CSL.initialiseXPlaneFolder()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function processParameterizedString(str as String, parameters() as String) As String
		  if ubound(parameters) > -1 then
		    dim i as integer
		    for i = 0 to ubound(parameters)
		      str = str.ReplaceAll("${" + str(i+1) + "}", parameters(i))
		    next
		  end if
		  
		  return str
		  
		  exception err as NilObjectException
		    // Will throw exception if no second parameter passed
		    return str
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function requestXPlaneFolder(require as Boolean) As boolean
		  // Returns true if the user chose a new folder (and require is false)
		  
		  dim dialog as SelectFolderDialog = new SelectFolderDialog()
		  dim xPlaneFolder as FolderItem
		  
		  dialog.title = kLocateXPlaneFolder
		  dialog.promptText = kLocateXPlaneFolder
		  
		  #if TargetWin32
		    dialog.initialDirectory = Volume(0).Child("Program Files")
		  #elseif TargetMacOS
		    dialog.initialDirectory = Volume(0).Child("Applications")
		  #elseif TargetLinux
		    dialog.initialDirectory = Volume(0)
		  #endif
		  
		  while true
		    xPlaneFolder = dialog.showModal()
		    if (xPlaneFolder = nil) then
		      if (require) then
		        dim result as Integer = displayMessage(kErrorNoXPlaneFolderSelected, "", MessageDialog.GraphicCaution, App.kOk, "", "", nil)
		        App.pClosing = true
		        quit
		      else
		        return false
		      end if
		    end if
		    
		    if (not Aircraft.checkXPlaneFolder(xPlaneFolder) _
		      or not CustomSceneryPackage.checkXPlaneFolder(xPlaneFolder) _
		      or not Plugin.checkXPlaneFolder(xPlaneFolder)) then
		      dim result as Integer = displayMessage(kErrorNotXPlaneFolder, "", MessageDialog.GraphicCaution, App.kOk, "", "", nil)
		    else
		      pXPlaneFolder = new XPlaneFolderItem(xPlaneFolder)
		      return true
		    end if
		  wend
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		pClosing As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		pPreferences As Preferences
	#tag EndProperty

	#tag Property, Flags = &h0
		pXPlaneFolder As XPlaneFolderItem
	#tag EndProperty


	#tag Constant, Name = kApplicationName, Type = String, Dynamic = False, Default = \"XAddonManager", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCancel, Type = String, Dynamic = True, Default = \"Cancel", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Cancella"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Annuler"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Cancel\xC2\xB7la"
	#tag EndConstant

	#tag Constant, Name = kCreate, Type = String, Dynamic = True, Default = \"Create", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Crea"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Cr\xC3\xA9er"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Crea"
	#tag EndConstant

	#tag Constant, Name = kDBInfoKeyLastDownload, Type = String, Dynamic = False, Default = \"last_download", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDelete, Type = String, Dynamic = True, Default = \"Delete", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Elimina"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Effacer"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Esborra\'l"
	#tag EndConstant

	#tag Constant, Name = kDeletePrompt, Type = String, Dynamic = True, Default = \"Delete\xE2\x80\xA6", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Suprimeix\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Elimino\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Effacement\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"L\xC3\xB6schen\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Borrar..."
	#tag EndConstant

	#tag Constant, Name = kDontDelete, Type = String, Dynamic = True, Default = \"Don\'t Delete", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Non Eliminare"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Ne pas Effacer"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"No l\'esborris"
	#tag EndConstant

	#tag Constant, Name = kDownloadAndInstall, Type = String, Dynamic = True, Default = \"Download and Install", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDownloadInstallPrompt, Type = String, Dynamic = True, Default = \"Download / Install\xE2\x80\xA6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEdit, Type = String, Dynamic = True, Default = \"&Edit", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Editer"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Editar"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Edita"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Composizion&e"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Bearbeiten"
	#tag EndConstant

	#tag Constant, Name = kEditClear, Type = String, Dynamic = True, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Borrar"
		#Tag Instance, Platform = Windows, Language = es, Definition  = \"&Borrar"
		#Tag Instance, Platform = Linux, Language = es, Definition  = \"&Borrar"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Effacer"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Esborra"
		#Tag Instance, Platform = Windows, Language = ca, Definition  = \"&Esborra"
		#Tag Instance, Platform = Linux, Language = ca, Definition  = \"&Esborra"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&Elimina"
		#Tag Instance, Platform = Windows, Language = it, Definition  = \"&Elimina"
		#Tag Instance, Platform = Linux, Language = it, Definition  = \"&Elimina"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Windows, Language = de, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Linux, Language = de, Definition  = \"&L\xC3\xB6schen"
	#tag EndConstant

	#tag Constant, Name = kEditCopy, Type = String, Dynamic = True, Default = \"&Copy", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Co&pier"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Copiar"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Copia"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&Copia"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Kopieren"
	#tag EndConstant

	#tag Constant, Name = kEditCut, Type = String, Dynamic = True, Default = \"Cu&t", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Co&uper"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"C&ortar"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Re&talla"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&Taglia"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Schneiden"
	#tag EndConstant

	#tag Constant, Name = kEditPaste, Type = String, Dynamic = True, Default = \"&Paste", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Coller"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Pegar"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Enganxa"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&Incolla"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Kleben"
	#tag EndConstant

	#tag Constant, Name = kEditPreferences, Type = String, Dynamic = True, Default = \"Preferences\xE2\x80\xA6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEditSelectAll, Type = String, Dynamic = True, Default = \"Select &All", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Tout s\xC3\xA9lectionner"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Seleccionar &Todo"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Selecciona-ho tot"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Selezion&a Tutto"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Alles ausw\xC3\xA4hlen"
	#tag EndConstant

	#tag Constant, Name = kEditUndo, Type = String, Dynamic = True, Default = \"&Undo", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Annuler"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Deshacer"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Desf\xC3\xA9s"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Ann&ulla"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Undo"
	#tag EndConstant

	#tag Constant, Name = kErrorNotXPlaneFolder, Type = String, Dynamic = True, Default = \"The folder you selected is not a valid X-Plane\xC2\xAE folder\x2C please try again.", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"La carpeta triada no \xC3\xA9s una carpeta v\xC3\xA0lida de l\'X-Plane\xC2\xAE\x2C torneu-ho a provar."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"La cartella che hai selezionato non \xC3\xA8 di X-Plane\xC2\xAE\x2C riprova per favore."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Le dossier que vous avez selectionn\xC3\xA9 n\'est pas un dossier X-Plane\xC2\xAE valide. Reessayez SVP."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Der vo ihnen ausgew\xC3\xA4hlte Ordner ist kein valider X-Plane\xC2\xAE Ordner\x2C versuchen sie es bitte eneut."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"La carpeta que seleccionaste no es una carpeta v\xC3\xA1lida de X-Plane\xC2\xAE\x2C por favor intenta de nuevo."
	#tag EndConstant

	#tag Constant, Name = kErrorNoXPlaneFolderSelected, Type = String, Dynamic = True, Default = \"This program cannot work without knowing where your X-Plane\xC2\xAE folder is located and will now quit.", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Este instalador no puede operar sin saber donde est\xC3\xA1 ubicada su carpeta de X-Plane\xC2\xAE y dejar\xC3\xA1 de ejecutarse."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"L\'installeur ne peut pas fonctionner sans X-Plane\xC2\xAE et va maintenant \xC3\xAAtre ferm\xC3\xA9."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Aquest insta\xC5\x80lador no pot continuar sense saber on \xC3\xA9s la vostra carpeta de l\'X-Plane\xC2\xAE i ara es tancar\xC3\xA0."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Questo programma non pu\xC3\xB2 funzionare senza sapere dove \xC3\xA8 posizionata la cartella di X-Plane\xC2\xAE e verr\xC3\xA0 terminato."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Dieses programm funtioniert ohne validen X-Plane Ordner nicht und wird jetzt abgebrochen."
	#tag EndConstant

	#tag Constant, Name = kFile, Type = String, Dynamic = True, Default = \"&File", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Fichier"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Archivo"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Fitxer"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&Archivio"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Datei"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = True, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Salir"
		#Tag Instance, Platform = Windows, Language = es, Definition  = \"&Salir"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Quitter"
		#Tag Instance, Platform = Windows, Language = fr, Definition  = \"&Quitter"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Surt"
		#Tag Instance, Platform = Windows, Language = ca, Definition  = \"&Surt"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&Chiudi"
		#Tag Instance, Platform = Windows, Language = it, Definition  = \"&Esci"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Verlassen"
		#Tag Instance, Platform = Windows, Language = de, Definition  = \"&Verlassen"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant

	#tag Constant, Name = kGo, Type = String, Dynamic = True, Default = \"Go", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"D\xC3\xA9marrer"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Endavant"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Vai"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Anfangen"
	#tag EndConstant

	#tag Constant, Name = kHelp, Type = String, Dynamic = True, Default = \"&Help", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Ajuda"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&Aiuto"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"A&ide"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Hilfe"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"A&yuda"
	#tag EndConstant

	#tag Constant, Name = kHelpAbout, Type = String, Dynamic = True, Default = \"&About XAddonManager", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Quan a XAddonManager"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&A proposito di XAddonManager"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"A &propos de XAddonManager"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&\xC3\x9Cber XAddonManager"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Acerca de &XAddonManager"
	#tag EndConstant

	#tag Constant, Name = kHelpUserGuide, Type = String, Dynamic = True, Default = \"Online User Guide", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Guide d\'utilisation en ligne"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Guia d\'usuari en l\xC3\xADnia"
	#tag EndConstant

	#tag Constant, Name = kHTVisitWebsite, Type = String, Dynamic = True, Default = \"Visit the XAddonManager website", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Visita il sito web di XAddonManager"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Visiter le site XAddonManager"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Visiteu el lloc web de l\'XAddonManager"
	#tag EndConstant

	#tag Constant, Name = kInstall, Type = String, Dynamic = True, Default = \"Install", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Instal\xC2\xB7la"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Installo"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Installation"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Installieren"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Instalar"
	#tag EndConstant

	#tag Constant, Name = kInstallPrompt, Type = String, Dynamic = True, Default = \"Install\xE2\x80\xA6", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Instal\xC2\xB7la\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Installo\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Installation\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Installieren\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Instalar..."
	#tag EndConstant

	#tag Constant, Name = kLoad, Type = String, Dynamic = True, Default = \"Load", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Carica"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Charger"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Carrega"
	#tag EndConstant

	#tag Constant, Name = kLocateXPlaneFolder, Type = String, Dynamic = True, Default = \"Please locate your X-Plane\xC2\xAE folder", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Por favor localice su carpeta de X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Indiquer le chemin de votre installation X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Trieu la carpeta de l\'X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Per favore localizza la tua cartella principale di X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Orten sie bitte ihren X-Plane\xC2\xAE Ordner"
	#tag EndConstant

	#tag Constant, Name = kMapZoomFactor, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kOk, Type = String, Dynamic = True, Default = \"OK", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"OK"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"OK"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"D\'acord"
	#tag EndConstant

	#tag Constant, Name = kPassword, Type = String, Dynamic = True, Default = \"Password:", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSave, Type = String, Dynamic = True, Default = \"Save", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Salva"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Enregistrer"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Desa"
	#tag EndConstant

	#tag Constant, Name = kURLOrgManifest, Type = String, Dynamic = False, Default = \"http://x-plane.org/pkg_lst/PackageList.xml", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLOrgRegister, Type = String, Dynamic = False, Default = \"http://forums.x-plane.org/index.php\?app\x3Dcore&module\x3Dglobal&section\x3Dregister", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLReleaseNotes, Type = String, Dynamic = False, Default = \"http://xaddonmanager.googlecode.com/svn/trunk/VersionInfo/devreleasenotes.html", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLTempManifest, Type = String, Dynamic = False, Default = \"http://www.opensceneryx.com/XAMPackageList.xml", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLUserGuide, Type = String, Dynamic = False, Default = \"http://code.google.com/p/xaddonmanager/wiki/UserGuide", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLVersion, Type = String, Dynamic = False, Default = \"http://xaddonmanager.googlecode.com/svn/trunk/VersionInfo/devversion.txt", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLWebsite, Type = String, Dynamic = False, Default = \"http://xaddonmanager.googlecode.com", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUserAgent, Type = String, Dynamic = False, Default = \"XAddonManager (like iPhone; en-us)", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUserName, Type = String, Dynamic = True, Default = \"User Name:", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kViewPlotAirports, Type = String, Dynamic = True, Default = \"Plot Packages with Airports", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Afficher les sc\xC3\xA8nes contenant des a\xC3\xA9roports"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Tra\xC3\xA7 paquets amb aeroports"
	#tag EndConstant

	#tag Constant, Name = kViewPlotAll, Type = String, Dynamic = True, Default = \"Plot All", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Afficher tout"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Tra\xC3\xA7 tot"
	#tag EndConstant

	#tag Constant, Name = kViewPlotNone, Type = String, Dynamic = True, Default = \"Plot None", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Pas d\'affichage"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Tra\xC3\xA7 res"
	#tag EndConstant

	#tag Constant, Name = kViewPlotScenery, Type = String, Dynamic = True, Default = \"Plot Packages with Scenery", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Afficher les sc\xC3\xA8nes contenant des d\xC3\xA9cors"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Tra\xC3\xA7 paquets am escenari"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="pClosing"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
