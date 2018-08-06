#tag Class
Protected Class Plugin
Inherits AddOn
	#tag Method, Flags = &h0
		Shared Function checkXPlaneFolder(folderItem as FolderItem) As Boolean
		  return folderItem <> nil and folderItem.child("Resources").exists and folderItem.child("Resources").child("plugins").exists
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enable(enable as boolean)
		  if enable <> pEnabled then
		    super.enable(enable)
		    
		    dim destinationParent as FolderItem = Plugin.getRootFolder(enable)
		    dim swapDestinationParent as FolderItem = Plugin.getRootFolder(not enable)
		    
		    moveItem(enable, destinationParent, swapDestinationParent)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function getInstance(name as String, folderItem as FolderItem, enabled as Boolean, xPlaneFolder as XPlaneFolderItem) As Plugin
		  // Creates an instance of a Plugin.  Detects special plugin subclasses and will return one of those if applicable.
		  if (PythonInterfacePlugin.isValid(folderItem)) then
		    return new PythonInterfacePlugin(name, folderItem, enabled, xPlaneFolder)
		  else
		    return new Plugin(name, folderItem, enabled, xPlaneFolder)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function getRootFolder(enabledVersion as boolean = true) As FolderItem
		  if (enabledVersion) then
		    return App.pXPlaneFolder.child("Resources").child("plugins")
		  else
		    return App.pXPlaneFolder.child("Resources").child("plugins (disabled)")
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub initialiseXPlaneFolder()
		  dim disabledFolder as FolderItem
		  
		  disabledFolder = Plugin.getRootFolder(false)
		  if (not disabledFolder.exists) then
		    disabledFolder.createAsFolder()
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub install(folderItem as FolderItem)
		  // We are passed the actual plugin (be it a file or a folder containing a fat plugin).  However, we need to install
		  // everything in the PARENT folder so that we grab any additional resources that may be needed by the plugin
		  dim i as integer
		  
		  dim parentFolderItem as FolderItem = folderItem.Parent
		  
		  // Check whether any items with the same names exist first
		  for i = 1 to parentFolderItem.count
		    dim subItem as FolderItem = parentFolderItem.trueItem(i)
		    if Plugin.getRootFolder().child(subItem.name).exists or Plugin.getRootFolder(false).child(subItem.name).exists then
		      dim parameters() as string = array(subItem.name)
		      dim result as Integer = App.displayMessage(App.processParameterizedString(wndMain.kErrorItemWithSameNameExists, parameters), "", MessageDialog.GraphicCaution, App.kOk, "", "", wndMain)
		      return
		    end if
		  next
		  
		  // Copy the files and folders
		  for i = 1 to parentFolderItem.count
		    parentFolderItem.trueItem(i).copyFileTo(Plugin.getRootFolder())
		  next
		  // And delete
		  parentFolderItem.delete()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function isValid(folderItem as FolderItem) As boolean
		  if Addon.isValid(folderItem) = false then return false
		  
		  // Check for a fat plugin
		  if  folderItem.Directory and ((TargetMacOS and folderItem.child("mac.xpl").exists) or (TargetLinux and folderItem.child("lin.xpl").exists) or (TargetWin32 and folderItem.child("win.xpl").exists)) then
		    return true
		  end if
		  
		  // If not fat, then it must have a file extension
		  if folderItem.name.right(4) <> ".xpl" then return false
		  
		  // Only Mac could be a directory
		  if folderItem.Directory and not TargetMacOS then return false
		  
		  dim pluginFolderItem as FolderItem
		  if folderItem.Directory then
		    // Mac plugin that is a folder (Mac Package)
		    if (folderItem.child("Contents").exists()) then
		      pluginFolderItem = folderItem.child("Contents").child("MacOS").item(1)
		    else
		      return false
		    end if
		  else
		    // A simple file
		    pluginFolderItem = folderItem
		  end if
		  
		  if pluginFolderItem = nil then return false
		  
		  dim bs as BinaryStream = BinaryStream.open(pluginFolderItem, false)
		  if bs = nil then return false
		  
		  dim header as String = Utilities.binToHex(bs.Read(8), "")
		  
		  if TargetMacOS then
		    return header = kMacHeader
		  elseif TargetLinux then
		    return header = kLinuxHeader
		  elseif TargetWin32 then
		    return header = kWindowsHeader
		  else
		    return false
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub populateListBoxEntry(listBox as ListBox, addAsFolder as boolean = false)
		  // Part of the AddonInterface interface.
		  super.populateListBoxEntry(listBox, addAsFolder)
		  
		  listBox.RowPicture(listBox.LastIndex) = imgPlugin
		End Sub
	#tag EndMethod


	#tag Constant, Name = kLinuxHeader, Type = String, Dynamic = False, Default = \"7F454C4601010100", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMacHeader, Type = String, Dynamic = False, Default = \"CAFEBABE00000002", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowsHeader, Type = String, Dynamic = False, Default = \"4D5A900003000000", Scope = Public
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
