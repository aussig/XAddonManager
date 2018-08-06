#tag Class
Protected Class FileReader
Implements SeqDataInputStream
	#tag Method, Flags = &h0
		Sub ClearError()
		  me.error = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  if me.bs <> nil then
		    me.bs.Close
		    me.bs = nil
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(f as FolderItem)
		  // Constructor.
		  // Pass a FolderItem to designate the file the stream should read from
		  
		  me.f = f
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  me.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EOF() As Boolean
		  return me.bs = nil or me.bs.EOF
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetErrorDescription(ByRef code As Integer, ByRef msg As String)
		  if me.error then
		    code = -1
		    msg = "open or read error"
		  else
		    code = 0
		    msg = ""
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HadError() As Boolean
		  return me.error
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open() As Boolean
		  if me.bs <> nil then
		    return true
		  end
		  
		  #if RBVersion >= 2012
		    me.bs = BinaryStream.Open(f, false)
		  #else
		    me.bs = f.OpenAsBinaryFile(false)
		  #endif
		  
		  me.error = me.bs = nil
		  return not me.error
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(count As Integer) As String
		  if me.bs = nil then
		    raise new RuntimeException // did you forget to call Open()?
		  end
		  return me.bs.Read(count)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Skip(count As UInt64) As Boolean
		  dim newpos, pos, len as UInt64
		  
		  if me.bs = nil then
		    raise new RuntimeException // did you forget to call Open()?
		  end
		  
		  pos = me.bs.Position
		  len = me.bs.Length
		  newpos = pos + count
		  if newpos > len then
		    // wants to skip more than available
		    return false
		  end
		  me.bs.Position = newpos
		  if me.bs.Position <> newpos then
		    me.error = true
		  end
		  return not me.error
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected bs As BinaryStream
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected error As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected f As FolderItem
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
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
