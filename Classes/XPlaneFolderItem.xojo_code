#tag Class
Protected Class XPlaneFolderItem
Inherits FolderItem
	#tag Method, Flags = &h0
		Sub Constructor(folderItem as FolderItem)
		  super.FolderItem(folderItem)
		  
		  // Get the Dictionary in which to store and retrieve preferences for this x-plane folder.
		  pPreferencesDictionary = App.pPreferences.getXPlaneFolderDictionary(folderItem.absolutePath)
		  
		  // Parse the X-Plane apt.dat
		  dim aptDatFolderItem as FolderItem = folderItem.child("Resources").child("default scenery").child("default apt dat").child("Earth nav data").child("apt.dat")
		  dim aptDatParseThread as AptDatParseThread = new AptDatParseThread(me, aptDatFolderItem)
		  aptDatParseThread.run()
		  App.pPreferences.setAirportSearchEnabled(true)
		  
		  exception e as NilObjectException
		    // If the aptDat structure is not correct, this will be thrown
		    msgbox("Cannot locate X-Plane default apt.dat file, search by airport code will be disabled")
		    App.pPreferences.setAirportSearchEnabled(false)
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deletePreferencesDictionary(containerKey as String, key as String)
		  // Delete a dictionary from within a container dictionary in our preferences dictionary.
		  dim containerDictionary as Dictionary = getPreferencesContainerDictionary(containerKey)
		  
		  if (containerDictionary.hasKey(key)) then containerDictionary.remove(key)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPreferencesContainerDictionary(containerKey as String) As Dictionary
		  // Get a dictionary from our preferences dictionary.
		  if (not pPreferencesDictionary.hasKey(containerKey)) then pPreferencesDictionary.value(containerKey) = new Dictionary()
		  return pPreferencesDictionary.value(containerKey)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPreferencesDictionary(containerKey as String, key as String) As Dictionary
		  // Get a dictionary from within a container dictionary in our preferences dictionary.  If either the
		  // container dictionary or the individual dictionary within it don't exist, then create them.
		  dim containerDictionary as Dictionary = getPreferencesContainerDictionary(containerKey)
		  
		  if (not containerDictionary.hasKey(key)) then containerDictionary.value(key) = new Dictionary()
		  return containerDictionary.value(key)
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		pAirportData As AirportDataSceneryObject
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pPreferencesDictionary As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="NativePath"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Length"
			Group="Behavior"
			Type="Uint64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AbsolutePath"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alias"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Directory"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Exists"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExtensionVisible"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Group"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsReadable"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsWriteable"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastErrorCode"
			Group="Behavior"
			InitialValue="0"
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
			Name="Locked"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MacCreator"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MacDirID"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MacType"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MacVRefNum"
			Group="Behavior"
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
			Name="Owner"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ResourceForkLength"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShellPath"
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
		#tag ViewProperty
			Name="Type"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="URLPath"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
