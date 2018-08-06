#tag Class
Protected Class SymlinkReader
Implements SeqDataInputStream
	#tag Method, Flags = &h0
		Sub ClearError()
		  me.error = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  mOpened = false
		  mSymlinkData = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(f as TTsFolderItem)
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
		  return not mOpened or mReadOfs >= mSymlinkData.Size
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
		  if mOpened then
		    return true
		  end
		  
		  soft declare function readlink lib SystemLib (path as CString, outbuf as Ptr, bufsize as Integer) as Integer
		  
		  try
		    dim res as Integer
		    dim buf as new MemoryBlock(PATH_MAX)
		    res = readlink (f.UnixPath, buf, buf.Size)
		    if res >= 0 then
		      mOpened = true
		      mReadOfs = 0
		      mSymlinkData = buf.StringValue(0, res)
		    else
		      break
		    end
		  catch
		    // oops, function not available?
		    break
		  end
		  
		  me.error = not mOpened
		  return mOpened
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(count As Integer) As String
		  if not mOpened then
		    raise new RuntimeException // did you forget to call Open()?
		  end
		  
		  dim remain as Integer
		  remain = mSymlinkData.Size - mReadOfs
		  if count > remain then count = remain
		  dim ofs as Integer
		  ofs = mReadOfs
		  mReadOfs = mReadOfs + count
		  return mSymlinkData.StringValue (ofs, count)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Skip(count As UInt64) As Boolean
		  if not mOpened then
		    raise new RuntimeException // did you forget to call Open()?
		  end
		  
		  dim newpos, len as UInt64
		  len = mSymlinkData.Size
		  newpos = mReadOfs + count
		  if newpos > len then
		    // wants to skip more than available
		    return false
		  end
		  mReadOfs = newpos
		  return true
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected error As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected f As TTsFolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mOpened As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mReadOfs As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mSymlinkData As MemoryBlock
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
