#tag Class
Protected Class LocationalSceneryObject
Inherits SceneryObject
	#tag Method, Flags = &h0
		Sub Constructor(folderItem as FolderItem)
		  super.Constructor(folderItem)
		  
		  dim regex as new RegEx
		  dim match as RegExMatch
		  dim latitude, longitude as Double
		  
		  regex.SearchPattern = "(\+|-)([0-9]*)(\+|-)([0-9]*)\.(dsf|env)"
		  
		  match = regex.search(folderItem.name)
		  
		  if match <> nil then
		    if match.subExpressionString(1) = "-" then
		      latitude = -val(match.subExpressionString(2))
		    else
		      latitude = val(match.subExpressionString(2))
		    end if
		    
		    if match.subExpressionString(3) = "-" then
		      longitude = -val(match.subExpressionString(4))
		    else
		      longitude = val(match.subExpressionString(4))
		    end if
		  end if
		  
		  pLatLong = new LatLongPoint(latitude, longitude)
		  
		  exception err as RegExException
		    MsgBox err.message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getDistanceFrom(latitude as double, longitude as double) As double
		  return pLatLong.getDistanceFrom(latitude, longitude)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getLatitude() As Double
		  return pLatLong.pLatitude
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getLongitude() As Double
		  return pLatLong.pLongitude
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected pLatLong As LatLongPoint
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
