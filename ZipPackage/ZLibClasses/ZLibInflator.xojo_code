#tag Class
Protected Class ZLibInflator
Inherits ZLibStream
Implements IStreamReader
	#tag Method, Flags = &h0
		Sub Constructor(reader as Readable)
		  me.Constructor(WriteProc(nil))
		  mReader = reader
		  mBuffer = nil // we're not using a pre-allocated buffer in this mode
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(writer as WriteProc)
		  super.Constructor(writer)
		  
		  soft declare function inflateInit_ lib libz_path (ByRef stream as z_stream_s, version as CString, stream_size as Integer) as Integer
		  
		  dim err as Integer
		  err = inflateInit_ (mStream, Version(), mStream.Size)
		  if err <> 0 then
		    raise new ZLibStreamException (me, err)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CRC() As Integer
		  return me.mCRC
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  if IsZLibAvailable(false) then
		    soft declare sub inflateEnd lib libz_path (ByRef stream as z_stream_s)
		    inflateEnd mStream
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnableCRCCalculation()
		  mCalcCRC = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HadDataError() As Boolean
		  return mDataError
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Inflate(input as Ptr, len as UInt32, ByRef consumedOut as UInt32, ByRef finished as Boolean, ByRef hint as Variant) As Boolean
		  // This function takes a specific amount of input data and attempts to uncompress all of it
		  
		  soft declare function inflate lib libz_path (ByRef stream as z_stream_s, flush as Integer) as Integer
		  
		  dim result as Integer
		  
		  if len = 0 then
		    
		    consumedOut = 0
		    finished = false
		    
		  else
		    
		    mStream.next_in = input
		    mStream.avail_in = len
		    
		    do
		      mStream.next_out = mBuffer
		      mStream.avail_out = mBuffer.Size
		      
		      result = inflate (mStream, 0)
		      if result = Z_STREAM_ERROR then
		        raise new ZLibStreamException (me, result)
		      end
		      
		      dim written as UInt32 = mBuffer.Size - mStream.avail_out
		      if written > 0 then
		        if not mWriter.Invoke (mBuffer, written, hint) then
		          // cancelled
		          consumedOut = len - mStream.avail_in
		          finished = false
		          return false
		        end
		      end
		    loop until mStream.avail_out <> 0 or result <> 0
		    
		    consumedOut = len - mStream.avail_in
		    finished = (result = Z_STREAM_END)
		    
		  end // if len > 0 else
		  
		  return finished or result = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFinished() As Boolean
		  return mFinished
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As Integer
		  // Part of the IStreamReader interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(amount as Integer) As String
		  // Part of the IStreamReader interface.
		  
		  // This function returns a specific amount of uncompressed data
		  
		  dim mb as new MemoryBlock (amount)
		  dim n as UInt32 = Read (mb, mb.Size)
		  if n = mb.Size then
		    return mb
		  elseif n = 0 then
		    return ""
		  else
		    return mb.StringValue(0,n)
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(readBuf as Ptr, amount as UInt32, chunkSize as UInt32 = 0) As UInt32
		  // This function returns a specific amount of uncompressed data
		  
		  soft declare function inflate lib libz_path (ByRef stream as z_stream_s, flush as Integer) as Integer
		  
		  if chunkSize <= 0 then
		    chunkSize = 4096 // could be increased for better performance, maybe
		  end
		  
		  dim totalOutBefore as UInt32 = mStream.total_out
		  dim result as Integer
		  
		  if amount > 0 then
		    
		    mStream.next_out = readBuf
		    mStream.avail_out = amount
		    
		    do
		      if mStream.avail_in = 0 then
		        mStream.avail_in = chunkSize
		        mBuffer = mReader.Read (mStream.avail_in)
		        mStream.next_in = mBuffer
		      end
		      
		      result = inflate (mStream, Integer(FlushCode.SYNC_FLUSH))
		      if result = Z_STREAM_ERROR then
		        raise new ZLibStreamException (me, result)
		      end
		    loop until mStream.avail_out = 0 or result <> 0
		    
		    if result < 0 and result <> Z_DATA_ERROR then break
		    
		  end // if len > 0 else
		  
		  if result = Z_STREAM_END then
		    mFinished = true
		  elseif result = Z_DATA_ERROR then
		    mFinished = true
		    mDataError = true
		  end
		  
		  amount = mStream.total_out - totalOutBefore
		  
		  if mCalcCRC and amount > 0 then
		    mCRC = CRC32(mCRC, readBuf, amount)
		  end
		  
		  return amount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  soft declare sub inflateReset lib libz_path (ByRef stream as z_stream_s)
		  
		  inflateReset mStream
		  
		  super.Reset
		  
		  mFinished = false
		  mDataError = false
		  mCalcCRC = false
		  mCRC = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TotalIn() As UInt32
		  return mStream.total_in
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This class is used to uncompress zlib-compressed data
		
		You can use it in either of two modes:
		
		1.
		Use Read() to fetch pre-determined amounts of uncompressed data
		from a compressed stream. For this mode, use Constructor(Readable).
		
		2.
		Use Inflate() to pass compressed data and have it passed to a Write
		function that was specified by using Constructor(WriteProc).
		
		Note: Inflate() and Read() can not be mixed!
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private mCalcCRC As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCRC As UInt32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDataError As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFinished As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReader As Readable
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
