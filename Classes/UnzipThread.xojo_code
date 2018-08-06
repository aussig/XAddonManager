#tag Class
Protected Class UnzipThread
Inherits Thread
	#tag Event
		Sub Run()
		  pExtractedFolderItem = Addon.extractZipToTemporaryLocation(pZipFolderItem)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub init(folderItem as FolderItem)
		  pZipFolderItem = folderItem
		  pExtractedFolderItem = nil
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		pExtractedFolderItem As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		pZipFolderItem As FolderItem
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
