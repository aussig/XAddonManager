#tag Class
Protected Class FileWriter
Implements SeqDataOutputStream
	#tag Method, Flags = &h0
		Sub ClearError()
		  me.error = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Close() As Boolean
		  if me.bs = nil then
		    return true
		  end
		  if me.bs.Length <> me.written then
		    if me.bs.Length <> mPreAllocated then
		      me.error = true
		    end if
		    me.bs.Length = me.written
		  end
		  me.bs.Close
		  me.bs = nil
		  return not me.error
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(f as FolderItem)
		  // Constructor.
		  // Pass a FolderItem to designate the file the stream should write to
		  
		  me.f = f
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  if me.Close then
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Flush() As Boolean
		  if me.bs = nil then
		    raise new RuntimeException // did you forget to call Open()?
		  end
		  bs.Flush
		  if me.bs.Length <> me.written then
		    me.error = true
		  end
		  return not me.error
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetErrorDescription(ByRef code As Integer, ByRef msg As String)
		  if me.error then
		    code = -1
		    msg = "open or write error"
		  else
		    code = 0
		    msg = ""
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open() As Boolean
		  if me.bs <> nil then
		    return true
		  end
		  if not f.exists then
		    #if RBVersion >= 2012
		      me.bs = BinaryStream.Create(f)
		    #else
		      me.bs = f.CreateBinaryFile("")
		    #endif
		  else
		    #if RBVersion >= 2012
		      me.bs = BinaryStream.Open(f, true)
		    #else
		      me.bs = f.OpenAsBinaryFile(true)
		    #endif
		  end
		  if me.bs <> nil then
		    me.bs.Length = 0
		  end
		  me.error = (me.bs = nil) or (me.bs.Length > 0)
		  return not me.error
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PreAllocate(count as UInt64)
		  if me.bs = nil or count < 0 then
		    raise new RuntimeException // did you forget to call Open()?
		  end
		  mPreAllocated = count
		  if me.bs.Length < count then
		    me.bs.Length = count
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Skip(count As UInt64) As Boolean
		  if me.bs = nil then
		    raise new RuntimeException // did you forget to call Open()?
		  end
		  me.written = me.written + count
		  if me.bs.Length < me.written then
		    me.bs.Length = me.written
		  end
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Write(data As String) As Boolean
		  if me.bs = nil then
		    raise new RuntimeException // did you forget to call Open()?
		  end
		  me.written = me.written + LenB(data)
		  me.bs.Write data
		  return true
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

	#tag Property, Flags = &h21
		Private mPreAllocated As Int64
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected written As UInt64
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
