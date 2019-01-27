#tag Class
Protected Class AptDatParseThread
Inherits Thread
	#tag Event
		Sub Run()
		  pXPlaneFolderItem.pAirportData = new AirportDataSceneryObject(pAptDatFolderItem)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(xPlaneFolderItem as XPlaneFolderItem, aptDatFolderItem as FolderItem)
		  pXPlaneFolderItem = xPlaneFolderItem
		  pAptDatFolderItem = aptDatFolderItem
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private pAptDatFolderItem As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pXPlaneFolderItem As XPlaneFolderItem
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
