#tag Class
Protected Class Airport
	#tag Method, Flags = &h0
		Sub Constructor(code as String, name as String, latitude as double, longitude as double)
		  pCode = code
		  pName = name
		  pLatLong = new LatLongPoint(latitude, longitude)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getDistanceFrom(latitude as double, longitude as double) As double
		  return pLatLong.getDistanceFrom(latitude, longitude)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		pCode As String
	#tag EndProperty

	#tag Property, Flags = &h0
		pLatLong As LatLongPoint
	#tag EndProperty

	#tag Property, Flags = &h0
		pName As String
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
			Name="pCode"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
