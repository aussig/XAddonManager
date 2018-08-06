#tag Class
Protected Class Preferences
	#tag Method, Flags = &h0
		Sub Constructor()
		  pDictionary = new Dictionary
		  
		  load()
		  
		  // Check for old preferences format and automatically convert to new
		  if (pDictionary.hasKey("XPlanePath")) then upgradePreferences()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getBoolean(key as String) As Boolean
		  // Return a Boolean.  Create it if it doesn't exist.
		  if (not pDictionary.hasKey(key)) then pDictionary.value(key) = false
		  return pDictionary.value(key)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getDictionary(key as string) As Dictionary
		  // Return a Dictionary.  Create it if it doesn't exist.
		  if (not pDictionary.hasKey(key)) then pDictionary.value(key) = new Dictionary()
		  return pDictionary.value(key)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getLastXPlaneFolder() As string
		  return getString(kKeyLastXPlaneFolder)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getString(key as string) As String
		  // Return a String.  Create it if it doesn't exist.
		  if (not pDictionary.hasKey(key)) then pDictionary.value(key) = ""
		  return pDictionary.value(key)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getXPlaneFolderDictionary(xPlanePath as String) As Dictionary
		  // Return a Dictionary containing all the preferences for a particular XPlane® folder.
		  // Create a new one if it doesn't exist yet
		  // We don't initialise any of the contents here because that is done dynamically as items are requested.
		  // This helps to future-proof the preferences structure
		  
		  dim xPlaneFoldersDictionary as Dictionary = getDictionary(kKeyXPlaneFolders)
		  
		  if (not xPlaneFoldersDictionary.hasKey(xPlanePath)) then xPlaneFoldersDictionary.value(xPlanePath) = new Dictionary()
		  return xPlaneFoldersDictionary.value(xPlanePath)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getXPlanePaths() As String()
		  // Get all the XPlane folder paths we know about in the preferences.  See the class notes for a description of the
		  // preferences structure.
		  
		  dim xPlaneFoldersDictionary as Dictionary = getDictionary(kKeyXPlaneFolders)
		  
		  dim paths() as String
		  dim keys() as variant = xPlaneFoldersDictionary.keys()
		  
		  for each key as String in keys
		    paths.append(key)
		  next
		  
		  return paths
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isAirportSearchEnabled() As boolean
		  return getBoolean(kKeyAirportSearchEnabled)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub load()
		  dim prefsFile as FolderItem = SpecialFolder.Preferences.Child(App.kApplicationName + ".plist")
		  if (prefsFile.exists()) then
		    dim result as Boolean = pDictionary.loadXML(prefsFile)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub save()
		  dim prefsFile as FolderItem = SpecialFolder.Preferences.Child(App.kApplicationName + ".plist")
		  dim result as Boolean = pDictionary.saveXML(prefsFile, true)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub set(key as String, value as Variant)
		  // Sets a preferences value.
		  pDictionary.value(key) = value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setAirportSearchEnabled(enabled as boolean)
		  set(kKeyAirportSearchEnabled, enabled)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setLastXPlaneFolder(folderPath as String)
		  set(kKeyLastXPlaneFolder, folderPath)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub upgradePreferences()
		  // The old format just used a flat top-level structure.
		  dim oldPreferencesDictionary as Dictionary = pDictionary
		  
		  // Clear the preferences Dictionary
		  pDictionary = new Dictionary()
		  
		  // Create an entry for the previous X-Plane folder
		  setLastXPlaneFolder(oldPreferencesDictionary.value("XPlanePath"))
		  
		  // Create a Dictionary for the previous X-Plane folder
		  dim xPlaneFolderDictionary as Dictionary = getXPlaneFolderDictionary(oldPreferencesDictionary.value("XPlanePath"))
		  
		  // Create the scenery packages dictionary inside the X-Plane Dictionary
		  dim sceneryPackagesDictionary as new Dictionary()
		  xPlaneFolderDictionary.value(CustomSceneryPackage.kPreferencesKey) = sceneryPackagesDictionary
		  
		  // All the old keys were used to determine whether scenery packages were shown on the map (except the 'XPlanePath' key ofc)
		  dim keys() as variant = oldPreferencesDictionary.keys()
		  for each key as String in keys
		    if (key = "XPlanePath") then continue
		    
		    // Each old key starts with 'cpkg_show_' and is followed by the scenery package name.
		    dim sceneryPackageDictionary as new Dictionary()
		    sceneryPackageDictionary.value(CustomSceneryPackage.kPreferencesKeyShowOnMap) = oldPreferencesDictionary.value(key)
		    sceneryPackagesDictionary.value(key.mid(11)) = sceneryPackageDictionary
		  next
		  
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Structure of pDictionary
		
		'xplane_folders' => Dictionary
		  '/Applications/X-Plane' => Dictionary
		    'custom_scenery_packages' => Dictionary
		      'EGCV Sleap' => Dictionary
		        'show_on_map' => Boolean
		    'groups' => Dictionary
		'last_xplane_folder' => String
		'airport_search_enabled' => Boolean
	#tag EndNote


	#tag Property, Flags = &h21
		Private pDictionary As Dictionary
	#tag EndProperty


	#tag Constant, Name = kKeyAirportSearchEnabled, Type = String, Dynamic = False, Default = \"airport_search_enabled", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kKeyLastXPlaneFolder, Type = String, Dynamic = False, Default = \"last_xplane_folder", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kKeyXPlaneFolders, Type = String, Dynamic = False, Default = \"xplane_folders", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
