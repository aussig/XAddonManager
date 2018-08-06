#tag Class
Protected Class AddOn
Implements AddonInterface
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(name as String, folderItem as FolderItem, enabled as Boolean, xPlaneFolder as XPlaneFolderItem)
		  pName = name
		  pFolderItem = folderItem
		  pEnabled = enabled
		  pXPlaneFolder = xPlaneFolder
		  
		  me.loadState()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub delete()
		  dim parameters() as String
		  if pEnabled then
		    parameters.append(wndMain.kEnabled)
		  else
		    parameters.append(wndMain.kDisabled)
		  end if
		  parameters.append(pName)
		  
		  if App.displayMessage(App.processParameterizedString(wndMain.kConfirmDelete, parameters), "", MessageDialog.GraphicQuestion, App.kDontDelete, App.kDelete, "", wndMain) = 2 then
		    pFolderItem.moveFileTo(SpecialFolder.Trash)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  saveState()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub doubleClicked()
		  // Default behaviour is to launch our folderItem or parent folder if it's a file
		  if (pFolderItem.Directory) then
		    pFolderItem.launch()
		  else
		    pFolderItem.parent.launch()
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enable(enable as Boolean)
		  pEnabled = enable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub expandListBoxEntry(listBox as ListBox, clickedRow as Integer)
		  // Part of the AddonInterface interface.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function extractZipToTemporaryLocation(folderItem as FolderItem) As FolderItem
		  dim unzippedFolderItem as FolderItem
		  dim zar as ZipArchive
		  dim f as FolderItem, e as ZipEntry, i as Integer
		  dim packageName as string = folderItem.name.left(folderItem.name.len - 4)
		  
		  App.MouseCursor= System.Cursors.Wait
		  
		  // First, get a uniquely named temporary folderItem.  Unfortunately, this creates a file and we need a folder,
		  // so grab its name, delete it and then create a folder with the same name.
		  unzippedFolderItem  = getTemporaryFolderItem()
		  dim tempFolder as FolderItem = unzippedFolderItem.parent
		  dim tempSubfolderName as string = unzippedFolderItem.name
		  unzippedFolderItem.delete()
		  unzippedFolderItem = tempFolder.child(tempSubfolderName)
		  unzippedFolderItem.createAsFolder()
		  
		  // Next create a folder with the same name as the zip, but without the file extension.  We use this as the
		  // container for the zip extraction so it has a sensible name if we want to move it into the Custom
		  // Scenery folder.
		  unzippedFolderItem = unzippedFolderItem.child(packageName)
		  unzippedFolderItem.createAsFolder()
		  
		  zar = new ZipArchive
		  
		  if not zar.Open(folderItem, false) then
		    App.MouseCursor= System.Cursors.StandardPointer
		    return nil
		  end
		  
		  dim path() as String
		  
		  for i = 1 to zar.EntryCount
		    e = zar.Entry(i)
		    
		    // Exclude some rubbish files - The last item in the array populated by e.getPath() is the file/folder name
		    e.getPath(path)
		    if ubound(path) > 0 and path(ubound(path)) = ".DS_Store" or path(ubound(path)).left(2) = "._" or path(ubound(path)) = "Thumbs.db" then continue
		    
		    f = e.MakeDestination(unzippedFolderItem, false)
		    
		    // Extract, but not MacBinary files
		    if not e.Extract(f, false, true, false, false) then
		      App.MouseCursor= System.Cursors.StandardPointer
		      return nil
		    end
		  next
		  
		  if not zar.Close() then
		    App.MouseCursor= System.Cursors.StandardPointer
		    return nil
		  end
		  
		  App.MouseCursor= System.Cursors.StandardPointer
		  
		  return unzippedFolderItem
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getXPlaneFolderPreferencesKey() As String
		  // Return empty because by default we don't want to store anything in preferences. Subclass should override this
		  // to specify the key to access preferences for that type of addon in the XPlaneFolderItem's preferences Dictionary
		  // if it needs to store preferences
		  return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function isValid(folderItem as FolderItem) As boolean
		  // This method should be called first by all subclasses, it is used to filter out commonly bad files
		  // Return false if invalid, true if the subclass should do its own checks
		  
		  // Hidden files and folders are rejected and files or folders beginning '-'
		  if folderItem.name.left(1) = "." or folderItem.name.left(1) = "-" then return false
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub loadState()
		  dim xPlaneFolderPreferencesKey as String = me.getXPlaneFolderPreferencesKey()
		  
		  // If the key is empty then this type of addon doesn't store state
		  if (xPlaneFolderPreferencesKey = "") then return
		  
		  // The individual addon's Dictionary is always stored using the addon name as the key
		  dim addonDictionary as Dictionary = pXPlaneFolder.getPreferencesDictionary(xPlaneFolderPreferencesKey, me.pName)
		  
		  me.retrieveStateFromDictionary(addonDictionary)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub moveItem(enable as Boolean, destinationParent as FolderItem, swapDestinationParent as FolderItem)
		  if destinationParent.child(pFolderItem.name).exists then
		    dim swapPackage as FolderItem = destinationParent.child(pFolderItem.name)
		    dim parameters() as string = array(pFolderItem.name)
		    
		    // Temporarily move the swap package to the X-Plane folder
		    swapPackage.moveFileTo(App.pXPlaneFolder.child(swapPackage.name))
		    // Hmm, have to do this next line because RB doesn't seem to update the folderItem correctly when moving it.  Reassign the moved item.
		    swapPackage = App.pXPlaneFolder.child(swapPackage.name)
		    
		    // Move our package
		    pFolderItem.moveFileTo(destinationParent.child(pFolderItem.name))
		    // Hmm, have to do this next line because RB doesn't seem to update the folderItem correctly when moving it.  Reassign the moved item to the class property
		    pFolderItem = destinationParent.child(pFolderItem.name)
		    
		    // Move the swapped package
		    swapPackage.moveFileTo(swapDestinationParent.child(swapPackage.name))
		    
		    if enable then
		      dim result as Integer = App.displayMessage(App.processParameterizedString(wndMain.kEnabledItemSwapped, parameters), "", MessageDialog.GraphicCaution, App.kOk, "", "", wndMain)
		    else
		      dim result as Integer = App.displayMessage(App.processParameterizedString(wndMain.kDisabledItemSwapped, parameters), "", MessageDialog.GraphicCaution, App.kOk, "", "", wndMain)
		    end if
		  else
		    // Move our package
		    pFolderItem.moveFileTo(destinationParent.child(pFolderItem.name))
		    // Hmm, have to do this next line because RB doesn't seem to update the folderItem correctly when moving it.  Reassign the moved item to the class property
		    pFolderItem = destinationParent.child(pFolderItem.name)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub populateListBoxEntry(listBox as ListBox, addAsFolder as boolean = false)
		  // Part of the AddonInterface interface.
		  if addAsFolder then
		    listBox.AddFolder(pName)
		  else
		    listBox.AddRow(pName)
		  end if
		  listBox.cellCheck(listBox.lastIndex, listBox.columnCount - 1) = pEnabled
		  listBox.cellTag(listBox.lastIndex, 0) = me
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub retrieveStateFromDictionary(state as Dictionary)
		  // Set up the state of the class from a Dictionary
		  // Superclass has no state, subclasses should override
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub saveState()
		  dim xPlaneFolderPreferencesKey as String = me.getXPlaneFolderPreferencesKey()
		  
		  // If the key is nil then this type of addon doesn't store state
		  if (xPlaneFolderPreferencesKey = "") then return
		  
		  // The individual addon's Dictionary is always stored using the addon name as the key
		  dim addonDictionary as Dictionary = pXPlaneFolder.getPreferencesDictionary(xPlaneFolderPreferencesKey, me.pName)
		  
		  me.storeStateToDictionary(addonDictionary)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function searchForAddon(folderItem as FolderItem, addonType as String) As folderItem
		  // This is a depth-first recursive search
		  
		  // Have to pass in the class name because static (shared) methods are not overridden by subclasses, so we can't just
		  // call isValid() because Addon.isValid() will be called and return false
		  select case addonType
		  case "CustomSceneryPackage"
		    if CustomSceneryPackage.isValid(folderItem) then return folderItem
		  case "Aircraft"
		    if Aircraft.isValid(folderItem) then return folderItem
		  case "Plugin"
		    if Plugin.isValid(folderItem) then return folderItem
		  case "CSL"
		    if CSL.isValid(folderItem) then return folderItem
		  end select
		  
		  // Next check the children
		  if folderItem.Directory then
		    dim i as integer
		    for i = 1 to folderItem.count
		      dim subSearchFolderItem as FolderItem = searchForAddon(folderItem.trueItem(i), addonType)
		      if subSearchFolderItem <> nil then return subSearchFolderItem
		    next
		  end if
		  
		  // Give up
		  return nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub storeStateToDictionary(state as Dictionary)
		  // Store the state for the addon in a Dictionary
		  // Superclass has no state, subclasses should add their state to the Dictionary before returning it
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		pEnabled As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		pFolderItem As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		pName As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected pXPlaneFolder As XPlaneFolderItem
	#tag EndProperty


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
			Name="pEnabled"
			Group="Behavior"
			InitialValue="true"
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
