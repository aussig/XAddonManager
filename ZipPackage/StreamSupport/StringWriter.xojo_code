#tag Class
Protected Class StringWriter
Implements SeqDataOutputStream
	#tag Method, Flags = &h21
		Private Sub allocSpace(space as Int64)
		  if space > mBuffer.Size then
		    dim sizeToAdd as Int64 = Max (mBuffer.Size \ 2, 65636)
		    PreAllocate mBuffer.Size + sizeToAdd
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearError()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Close() As Boolean
		  if not mOpened then
		    return true
		  end
		  if mBuffer.Size <> mWritten then
		    mBuffer.Size = mWritten
		  end
		  mOpened = false
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Constructor.
		  
		  mBuffer = new MemoryBlock(0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  call me.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Flush() As Boolean
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetErrorDescription(ByRef code As Integer, ByRef msg As String)
		  code = 0
		  msg = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open() As Boolean
		  mWritten = 0
		  mOpened = true
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PreAllocate(count as UInt64)
		  if mBuffer.Size < count then
		    mBuffer.Size = count
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Skip(count As UInt64) As Boolean
		  if not mOpened then
		    raise new RuntimeException // did you forget to call Open()?
		  end
		  mWritten = mWritten + count
		  allocSpace mWritten
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Write(data As String) As Boolean
		  if not mOpened then
		    raise new RuntimeException // did you forget to call Open()?
		  end
		  dim n as Int64 = LenB(data)
		  dim newLen as Int64 = mWritten + n
		  allocSpace newLen
		  mBuffer.StringValue(mWritten,n) = data
		  mWritten = newLen
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WrittenData() As MemoryBlock
		  return mBuffer
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mBuffer As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOpened As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWritten As UInt64
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
