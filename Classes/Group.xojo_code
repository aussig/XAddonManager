#tag Class
Protected Class Group
	#tag Method, Flags = &h0
		Sub Constructor(name as String, xPlaneFolder as XPlaneFolderItem)
		  pName = name
		  pXPlaneFolder = xPlaneFolder
		  
		  me.loadState()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub deleteGroup(groupName as String, xPlaneFolder as XPlaneFolderItem)
		  xPlaneFolder.deletePreferencesDictionary(kPreferencesKey, groupName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub getAddonState(window as wndMain)
		  dim i as Integer
		  
		  pSceneryPackages = new Dictionary()
		  pPlugins = new Dictionary()
		  pCSLs = new Dictionary()
		  
		  for i = 0 to window.lstCustomSceneryPackages.listCount - 1
		    dim customSceneryPackage as CustomSceneryPackage = window.lstCustomSceneryPackages.cellTag(i, 0)
		    pSceneryPackages.value(customSceneryPackage.pName) = customSceneryPackage.pEnabled
		  next
		  
		  for i = 0 to window.lstPlugins.listCount - 1
		    dim plugin as Plugin = window.lstPlugins.cellTag(i, 0)
		    pPlugins.value(plugin.pName) = plugin.pEnabled
		  next
		  
		  if CSL.pAddonClassEnabled then
		    for i = 0 to window.lstCSLs.listCount - 1
		      dim csl as CSL = window.lstCSLs.cellTag(i, 0)
		      pCSLs.value(csl.pName) = csl.pEnabled
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function getGroups(xPlaneFolder as XPlaneFolderItem) As Group()
		  dim groupsContainerDictionary as Dictionary = xPlaneFolder.getPreferencesContainerDictionary(kPreferencesKey)
		  dim i as Integer
		  dim result() as Group
		  
		  for each key as string in groupsContainerDictionary.keys()
		    dim group as Group = new Group(key, xPlaneFolder)
		    result.append(group)
		  next
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub loadState()
		  // The individual addon's Dictionary is always stored using the addon name as the key
		  dim groupDictionary as Dictionary = pXPlaneFolder.getPreferencesDictionary(kPreferencesKey, me.pName)
		  
		  me.retrieveStateFromDictionary(groupDictionary)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub populatePopupMenuEntry(popupMenu as PopupMenu)
		  popupMenu.AddRow(pName)
		  popupMenu.rowTag(popupMenu.listCount - 1) = me
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub retrieveStateFromDictionary(state as Dictionary)
		  // Set up the state of the class from a Dictionary
		  
		  if (not state.hasKey(kPreferencesKeyCSLs)) then state.value(kPreferencesKeyCSLs) = new Dictionary()
		  pCSLs = state.value(kPreferencesKeyCSLs)
		  
		  if (not state.hasKey(kPreferencesKeyPlugins)) then state.value(kPreferencesKeyPlugins) = new Dictionary()
		  pPlugins = state.value(kPreferencesKeyPlugins)
		  
		  if (not state.hasKey(kPreferencesKeySceneryPackages)) then state.value(kPreferencesKeySceneryPackages) = new Dictionary()
		  pSceneryPackages = state.value(kPreferencesKeySceneryPackages)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub saveState()
		  // The individual addon's Dictionary is always stored using the addon name as the key
		  dim groupDictionary as Dictionary = pXPlaneFolder.getPreferencesDictionary(kPreferencesKey, me.pName)
		  
		  me.storeStateToDictionary(groupDictionary)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setAddonState(window as wndMain)
		  dim i as Integer
		  
		  for i = 0 to window.lstCustomSceneryPackages.listCount - 1
		    dim customSceneryPackage as CustomSceneryPackage = window.lstCustomSceneryPackages.cellTag(i, 0)
		    if (pSceneryPackages.hasKey(customSceneryPackage.pName)) then customSceneryPackage.enable(pSceneryPackages.value(customSceneryPackage.pName))
		  next
		  
		  for i = 0 to window.lstPlugins.listCount - 1
		    dim plugin as Plugin = window.lstPlugins.cellTag(i, 0)
		    if (pPlugins.hasKey(plugin.pName)) then plugin.enable(pPlugins.value(plugin.pName))
		  next
		  
		  if CSL.pAddonClassEnabled then
		    for i = 0 to window.lstCSLs.listCount - 1
		      dim csl as CSL = window.lstCSLs.cellTag(i, 0)
		      if (pCSLs.hasKey(csl.pName)) then csl.enable(pCSLs.value(csl.pName))
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub storeStateToDictionary(state as Dictionary)
		  // Store the state for the group in a Dictionary
		  
		  state.value(kPreferencesKeyCSLs) = pCSLs
		  state.value(kPreferencesKeyPlugins) = pPlugins
		  state.value(kPreferencesKeySceneryPackages) = pSceneryPackages
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected pCSLs As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		pDirty As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		pName As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected pPlugins As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected pSceneryPackages As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected pXPlaneFolder As XPlaneFolderItem
	#tag EndProperty


	#tag Constant, Name = kPreferencesKey, Type = String, Dynamic = False, Default = \"groups", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPreferencesKeyCSLs, Type = String, Dynamic = False, Default = \"csls", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPreferencesKeyPlugins, Type = String, Dynamic = False, Default = \"plugins", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPreferencesKeySceneryPackages, Type = String, Dynamic = False, Default = \"scenery_packages", Scope = Private
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
			Name="pDirty"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="pName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
