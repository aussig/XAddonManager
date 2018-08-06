#tag Class
Protected Class AircraftFolder
Inherits AddOn
	#tag Method, Flags = &h0
		Sub displayDetails(iconCanvas as Canvas)
		  iconCanvas.backdrop = new Picture(1, 1, 1)
		  
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
		Shared Function isValid(folderItem as FolderItem) As boolean
		  if AddOn.isValid(folderItem) = false then return false
		  
		  // It's a valid aircraft container folder if it's a directory and not a special aircraft subfolder
		  // We have to omit special folders in case we are inside an aircraft folder that has multiple .acf files
		  
		  return folderItem.Directory _
		  and folderItem.name <> "airfoils" _
		  and folderItem.name <> "cockpit" _
		  and folderItem.name <> "objects" _
		  and folderItem.name <> "plugins" _
		  and folderItem.name <> "sounds" _
		  and folderItem.name <> "weapons"
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub populateListBoxEntry(listBox as ListBox)
		  // Part of the AddonInterface interface.
		  super.populateListBoxEntry(listBox, true)
		  
		  listBox.RowPicture(listBox.LastIndex) = imgFolder
		End Sub
	#tag EndMethod


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
