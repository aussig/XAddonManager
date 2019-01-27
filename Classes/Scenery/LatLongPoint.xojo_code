#tag Class
Protected Class LatLongPoint
	#tag Method, Flags = &h0
		Sub Constructor(latitude as Double, longitude as Double)
		  pLatitude = latitude
		  pLongitude = longitude
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getDistanceFrom(latitude as double, longitude as double) As double
		  return sqrt(abs(latitude - pLatitude) ^ 2 + abs(longitude - pLongitude) ^ 2)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		pLatitude As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		pLongitude As Double
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
			Name="pLatitude"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="pLongitude"
			Group="Behavior"
			Type="Double"
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
