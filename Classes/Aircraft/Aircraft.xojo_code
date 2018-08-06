#tag Class
Protected Class Aircraft
Inherits AddOn
	#tag Method, Flags = &h0
		Shared Function checkXPlaneFolder(folderItem as FolderItem) As Boolean
		  return folderItem <> nil and folderItem.child("Aircraft").exists
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(name as String, folderItem as FolderItem, enabled as Boolean, xPlaneFolder as XPlaneFolderItem)
		  if folderItem.directory then
		    // Calling the overridden superclass constructor using the folder name
		    Super.Constructor(name, folderItem, enabled, xPlaneFolder)
		    
		    // The Aircraft refers to a folder containing a single .acf
		    pAircraftContainerFolderItem = folderItem
		    
		    dim i as integer
		    for i = 1 to folderItem.count
		      if Addon.isValid(folderItem.trueItem(i)) and folderItem.trueItem(i).name.right(4) = ".acf" then
		        pAircraftFolderItem = folderItem.trueItem(i)
		        pAcfStem = pAircraftFolderItem.name.left(pAircraftFolderItem.name.len() - 4)
		        exit for
		      end if
		    next
		  else
		    // The Aircraft refers to the .acf file, which will be in a directory with one or more other .acf files
		    pAircraftFolderItem = folderItem
		    pAircraftContainerFolderItem = pAircraftFolderItem.parent
		    pAcfStem = pAircraftFolderItem.name.left(pAircraftFolderItem.name.len() - 4)
		    
		    // Calling the overridden superclass constructor using the stem
		    Super.Constructor(pAcfStem, folderItem, enabled, xPlaneFolder)
		  end if
		  
		  // Get the icon if present
		  dim iconFolderItem as FolderItem = pAircraftContainerFolderItem.child(pAcfStem + "_icon.png")
		  if iconFolderItem.exists() then
		    pIconPicture = Picture.open(iconFolderItem)
		  else
		    iconFolderItem = pAircraftContainerFolderItem.child("plane.jpg")
		    if iconFolderItem.exists() then
		      pIconPicture = Picture.open(iconFolderItem)
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub displayDetails(iconCanvas as Canvas)
		  if pIconPicture <> nil then
		    iconCanvas.backdrop = new Picture(iconCanvas.width, iconCanvas.height, 32)
		    iconCanvas.backdrop.graphics.drawPicture(pIconPicture, 0, 0, iconCanvas.width, iconCanvas.height, 0, 0, pIconPicture.width, pIconPicture.height)
		  else
		    iconCanvas.backdrop = new Picture(1, 1, 1)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub expandListBoxEntry(listBox as ListBox, clickedRow as Integer)
		  // Part of the AddonInterface interface.
		  super.expandListBoxEntry(listBox, clickedRow)
		  
		  dim i as integer
		  
		  for i = 1 to me.pFolderItem.count
		    dim folderItem as FolderItem = me.pFolderItem.Item(i)
		    
		    if Aircraft.isValid(folderItem) then
		      // It's a valid Aircraft
		      dim aircraft as new Aircraft(folderItem.Name, folderItem, true, App.pXPlaneFolder)
		      aircraft.populateListBoxEntry(listBox)
		    elseif AircraftFolder.isValid(folderItem) then
		      // It's a valid AircraftFolder
		      dim aircraftFolder as new AircraftFolder(folderItem.Name, folderItem, true, App.pXPlaneFolder)
		      aircraftFolder.populateListBoxEntry(listBox)
		    else
		      // Don't display anything else
		    End if
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function getRootFolder(enabledVersion as boolean = true) As FolderItem
		  if (enabledVersion) then
		    return App.pXPlaneFolder.child("Aircraft")
		  else
		    return App.pXPlaneFolder.child("Aircraft (disabled)")
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function goodwayEnabled() As Boolean
		  return pAircraftContainerFolderItem.child("plane.txt").exists()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function has3dCockpit() As Boolean
		  return pAircraftContainerFolderItem.child(pAcfStem + "_cockpit.obj").exists() or _
		  pAircraftContainerFolderItem.child(pAcfStem + "_COCKPIT.obj").exists() or _
		  pAircraftContainerFolderItem.child(pAcfStem + "_cockpit_INN.obj").exists() or _
		  pAircraftContainerFolderItem.child(pAcfStem + "_COCKPIT_INN.obj").exists() or _
		  pAircraftContainerFolderItem.child(pAcfStem + "_cockpit_OUT.obj").exists() or _
		  pAircraftContainerFolderItem.child(pAcfStem + "_COCKPIT_OUT.obj").exists()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function hasAirfoils() As Boolean
		  return pAircraftContainerFolderItem.child("airfoils").exists() or pAircraftContainerFolderItem.child("Airfoils").exists()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function hasPlugins() As Boolean
		  return pAircraftContainerFolderItem.child("plugins").exists() or pAircraftContainerFolderItem.child("Plugins").exists()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function hasSounds() As Boolean
		  return pAircraftContainerFolderItem.child("sounds").exists() or pAircraftContainerFolderItem.child("Sounds").exists()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function hasWeapons() As Boolean
		  return pAircraftContainerFolderItem.child("weapons").exists() or pAircraftContainerFolderItem.child("Weapons").exists()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub initialiseXPlaneFolder()
		  dim disabledFolder as FolderItem
		  
		  disabledFolder = Aircraft.getRootFolder(false)
		  if (not disabledFolder.exists) then
		    disabledFolder.createAsFolder()
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub install(folderItem as FolderItem, destinationFolderItem as FolderItem)
		  // Check whether an item with the same name exists first
		  if destinationFolderItem.child(folderItem.name).exists then
		    dim parameters() as string = array(folderItem.name)
		    dim result as Integer = App.displayMessage(App.processParameterizedString(wndMain.kErrorItemWithSameNameExists, parameters), "", MessageDialog.GraphicCaution, App.kOk, "", "", wndMain)
		    return
		  end if
		  
		  // Move the folder
		  folderItem.moveFileTo(destinationFolderItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function isValid(folderItem as FolderItem) As boolean
		  // Check for common invalid filenames
		  if Addon.isValid(folderItem) = false then return false
		  
		  if folderItem.Directory then
		    // It's a valid aircraft if it's a directory and has ONE file with a .acf extension in it
		    dim i, acfCount as integer = 0
		    for i = 1 to folderItem.count
		      if Addon.isValid(folderItem.trueItem(i)) and folderItem.trueItem(i).name.right(4) = ".acf" then acfCount = acfCount + 1
		    next
		    
		    if acfCount = 1 then
		      return true
		    else
		      return false
		    end if
		  else
		    // It's also a valid aircraft if it has a ".acf" extension (note that we will have got past the directory check when the parent item was checked,
		    // so we can assume that we're not the only .acf in this folder)
		    return folderItem.name.right(4) = ".acf"
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub populateListBoxEntry(listBox as ListBox)
		  // Part of the AddonInterface interface.
		  super.populateListBoxEntry(listBox, pFolderItem.directory)
		  
		  if has3dCockpit() then
		    listBox.cell(listBox.lastIndex, 1) = "✓"
		  end if
		  if hasAirfoils() then
		    listBox.cell(listBox.lastIndex, 2) = "✓"
		  end if
		  if hasSounds() then
		    listBox.cell(listBox.lastIndex, 3) = "✓"
		  end if
		  if hasWeapons() then
		    listBox.cell(listBox.lastIndex, 4) = "✓"
		  end if
		  if hasPlugins() then
		    listBox.cell(listBox.lastIndex, 5) = "✓"
		  end if
		  if goodwayEnabled() then
		    listBox.cell(listBox.lastIndex, 6) = "✓"
		  end if
		  
		  listBox.RowPicture(listBox.LastIndex) = imgAircraft
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private pAcfStem As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pAircraftContainerFolderItem As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pAircraftFolderItem As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pIconPicture As Picture
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
