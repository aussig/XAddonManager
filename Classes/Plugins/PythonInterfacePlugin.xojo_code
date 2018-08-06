#tag Class
Protected Class PythonInterfacePlugin
Inherits Plugin
	#tag Method, Flags = &h0
		Sub Constructor(name as String, folderItem as FolderItem, enabled as Boolean, xPlaneFolder as XPlaneFolderItem)
		  // Calling the overridden superclass constructor.
		  super.Constructor(name, folderItem, enabled, xPlaneFolder)
		  
		  dim i as integer
		  dim pythonScriptsFolderItem as FolderItem = Plugin.getRootFolder().child(kScriptsFolderItemName)
		  
		  if (pythonScriptsFolderItem.exists()) then
		    dim regex as new RegEx
		    dim match as RegExMatch
		    
		    // Pattern for finding Python scripts
		    regex.SearchPattern = kRegexScriptFilename
		    
		    for i = 1 to pythonScriptsFolderItem.count
		      dim scriptFolderItem as FolderItem = pythonScriptsFolderItem.Item(i)
		      
		      match = regex.search(scriptFolderItem.name)
		      if match = nil then continue
		      pScripts.append(match.subExpressionString(1))
		    next
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub expandListBoxEntry(listBox as ListBox, clickedRow as integer)
		  // Part of the AddonInterface interface.
		  super.expandListBoxEntry(listBox, clickedRow)
		  
		  dim i as integer
		  
		  // Show the list of scripts
		  for i = 0 to ubound(pScripts)
		    listBox.AddRow(pScripts(i))
		    listBox.cellTag(listBox.lastIndex, 0) = me
		    // Remove the check box
		    listBox.cellType(listBox.lastIndex, 1) = ListBox.TypeNormal
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function isValid(folderItem as FolderItem) As Boolean
		  return left(folderItem.name, len(kFolderItemName)) = kFolderItemName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub populateListBoxEntry(listBox as ListBox, addAsFolder as boolean = false)
		  // Part of the AddonInterface interface.
		  super.populateListBoxEntry(listBox, true)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		pScripts() As String
	#tag EndProperty


	#tag Constant, Name = kFolderItemName, Type = String, Dynamic = False, Default = \"PythonInterface", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kRegexScriptFilename, Type = String, Dynamic = False, Default = \"^PI_(.*).py$", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kScriptsFolderItemName, Type = String, Dynamic = False, Default = \"PythonScripts", Scope = Private
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
