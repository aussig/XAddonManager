#tag Class
Protected Class CSL
Inherits AddOn
	#tag Method, Flags = &h0
		Shared Function checkXPlaneFolder(folderItem as FolderItem) As Boolean
		  return folderItem <> nil _
		  and folderItem.child("Resources").exists _
		  and folderItem.child("Resources").child("plugins").exists _
		  and folderItem.child("Resources").child("plugins").child("X-Ivap Resources").exists _
		  and folderItem.child("Resources").child("plugins").child("X-Ivap Resources").child("CSL").exists
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enable(enable as boolean)
		  if enable <> pEnabled then
		    super.enable(enable)
		    
		    dim destinationParent as FolderItem = CSL.getRootFolder(enable)
		    dim swapDestinationParent as FolderItem = CSL.getRootFolder(not enable)
		    
		    moveItem(enable, destinationParent, swapDestinationParent)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function getRootFolder(enabledVersion as boolean = true) As FolderItem
		  if (enabledVersion) then
		    return App.pXPlaneFolder.child("Resources").child("plugins").child("X-Ivap Resources").child("CSL")
		  else
		    return App.pXPlaneFolder.child("Resources").child("plugins").child("X-Ivap Resources").child("CSL (disabled)")
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub initialiseXPlaneFolder()
		  // Only create the disabled folder if there is already a CSL folder
		  if CSL.checkXPlaneFolder(App.pXPlaneFolder) then
		    dim disabledFolder as FolderItem
		    
		    disabledFolder = CSL.getRootFolder(false)
		    if (not disabledFolder.exists) then
		      disabledFolder.createAsFolder()
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub install(folderItem as FolderItem)
		  // Check whether an item with the same name exists first
		  if CSL.getRootFolder().child(folderItem.name).exists or CSL.getRootFolder(false).child(folderItem.name).exists then
		    dim parameters() as string = array(folderItem.name)
		    dim result as Integer = App.displayMessage(App.processParameterizedString(wndMain.kErrorItemWithSameNameExists, parameters), "", MessageDialog.GraphicCaution, App.kOk, "", "", wndMain)
		    return
		  end if
		  
		  // Move the folder
		  folderItem.moveFileTo(CSL.getRootFolder())
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function isValid(folderItem as FolderItem) As boolean
		  if Addon.isValid(folderItem) = false then return false
		  
		  // It's a valid CSL if it's a directory and contains a 'xsb_aircraft.txt' file
		  if not folderItem.Directory then return false
		  
		  dim i as integer
		  for i = 1 to folderItem.count
		    if folderItem.trueItem(i).name = "xsb_aircraft.txt" then return true
		  next
		  
		  return false
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Shared pAddonClassEnabled As Boolean = true
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
