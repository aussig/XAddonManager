#tag Class
Protected Class ZLibStream
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  // You can not use this class directly - you need to use ZLibInflator or ZLibDeflator!
		  
		  call IsZLibAvailable(true) // raises exception if zlib not available
		  
		  mStream.opaque = 1
		  mBuffer = new MemoryBlock (&h10000) // This size is arbitrary. Feel free to change it
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(writer as WriteProc)
		  me.Constructor()
		  mWriter = writer
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CRC32(mb as MemoryBlock) As UInt32
		  return crc32 (crc32(0,nil,0), mb, mb.Size)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CRC32(crc as UInt32, buf as Ptr, len as UInt32) As UInt32
		  call IsZLibAvailable(true)
		  
		  soft declare function crc32 lib libz_path (crc as UInt32, buf as Ptr, len as UInt32) as UInt32
		  
		  return crc32 (crc, buf, len)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function IsZLibAvailable(raiseExceptionIfNotAvail as Boolean = false) As Boolean
		  if gLibAvailable then return true
		  
		  if not gLibChecked then
		    gLibChecked = true
		    gLibAvailable = System.IsFunctionAvailable ("zlibVersion", libz_path)
		    if not gLibAvailable then
		      System.DebugLog ("ZLibStream fatal error: zlib library is missing at "+libz_path)
		    end
		  end if
		  if not gLibAvailable and raiseExceptionIfNotAvail then
		    raise new ZLibStreamException (nil, -1)
		  end if
		  return gLibAvailable
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Message() As String
		  return mStream.msg
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Reset()
		  mStream.opaque = mStream.opaque + 1 // for debugging, mostly
		  mStream.avail_in = 0
		  mStream.next_in = nil
		  mStream.avail_out = 0
		  mStream.total_in = 0
		  mStream.total_out = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Version() As String
		  // Returns the version of the used zlib code.
		  // Returns an empty string if the zlib library (DLL) is not available
		  
		  if IsZLibAvailable(false) then
		    soft declare function zlibVersion lib libz_path () as CString
		    return zLibVersion
		  end if
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Function WriteProc(buf as Ptr, len as UInt32, ByRef hint as Variant) As Boolean
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Sub _SelfTest()
		  // does some tests to verify that it works
		  
		  if IsZLibAvailable(false) then
		    
		    call Version
		    
		    dim zd as new ZLibDeflator (AddressOf _SelfTestWriter, 9)
		    dim zi as new ZLibInflator (AddressOf _SelfTestWriter)
		    
		    dim v as Variant
		    dim sin as MemoryBlock
		    
		    // compress in two parts:
		    sin = "abcd"
		    if not zd.Deflate (sin, sin.Size, ZLibStream.FlushCode.NO_FLUSH, v) then
		      #if TargetHasGUI
		        MsgBox "Deflate 1 failed"
		      #else
		        break
		      #endif
		    end
		    sin = "ef"
		    if not zd.Deflate (sin, sin.Size, ZLibStream.FlushCode.FINISH, v) then
		      #if TargetHasGUI
		        MsgBox "Deflate 2 failed"
		      #else
		        break
		      #endif
		    end
		    
		    // uncompress in two parts:
		    dim l as UInt32, f as Boolean
		    dim compressedData as String = v.StringValue
		    sin = compressedData.LeftB(5)
		    v = ""
		    if not zi.Inflate (sin, sin.Size, l, f, v) or f then
		      #if TargetHasGUI
		        MsgBox "Inflate 1 failed"
		      #else
		        break
		      #endif
		    end
		    if zi.IsFinished or zi.HadDataError then
		      #if TargetHasGUI
		        MsgBox "Inflate 1 - error or EOF"
		      #else
		        break
		      #endif
		    end
		    sin = compressedData.MidB(6)
		    if not zi.Inflate (sin, sin.Size, l, f, v) or not f then
		      #if TargetHasGUI
		        MsgBox "Inflate 2 failed"
		      #else
		        break
		      #endif
		    end
		    
		    if not zi.IsFinished then
		      #if TargetHasGUI
		        MsgBox "Inflate 2 - not EOF"
		      #else
		        break
		      #endif
		    end
		    if zi.HadDataError then
		      #if TargetHasGUI
		        MsgBox "Inflate 2 - error"
		      #else
		        break
		      #endif
		    end
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function _SelfTestWriter(buf as Ptr, len as UInt32, ByRef hint as Variant) As Boolean
		  dim s as String = hint
		  dim mb as MemoryBlock = buf
		  s = s + mb.StringValue(0,len)
		  hint = s
		  return true
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is a base class for ZLibDeflator and ZLibInflator, to perform zlib
		compression and decompression.
		
		For docs on the used zlib functions see: http://www.zlib.net/manual.html
		
	#tag EndNote

	#tag Note, Name = Read here for MS Windows
		While Mac OS X and Linux already have the necessary zlib-library installed,
		you will need to get it separately for use under Windows.
		
		Get the compiled (pre-built) DLL from here:
		
		http://www.zlib.net/
		
		Then copy the zlib1.dll file to your app's "Libs" folder
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private Shared gLibAvailable As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared gLibChecked As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mBuffer As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mStream As z_stream_s
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mWriter As WriteProc
	#tag EndProperty


	#tag Constant, Name = Header1, Type = Double, Dynamic = False, Default = \"&h78", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Header2, Type = Double, Dynamic = False, Default = \"&h9C", Scope = Public
	#tag EndConstant

	#tag Constant, Name = libz_path, Type = String, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"zlib1.dll"
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"/usr/lib/libz.dylib"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"libz.so.1"
	#tag EndConstant

	#tag Constant, Name = Z_DATA_ERROR, Type = Double, Dynamic = False, Default = \"-3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Z_DEFLATED, Type = Double, Dynamic = False, Default = \"8", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Z_NEED_DICT, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Z_STREAM_END, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Z_STREAM_ERROR, Type = Double, Dynamic = False, Default = \"-2", Scope = Protected
	#tag EndConstant


	#tag Structure, Name = z_stream_s, Flags = &h1, Attributes = \"StructureAlignment \x3D 1"
		next_in as Ptr
		  avail_in as UInt32
		  total_in as UInt32
		  next_out as Ptr
		  avail_out as UInt32
		  total_out as UInt32
		  msg as CString
		  state as Ptr
		  zalloc as Ptr
		  zfree as Ptr
		  opaque as UInt32
		  data_type as Int32
		  adler as UInt32
		reserved as UInt32
	#tag EndStructure


	#tag Enum, Name = FlushCode, Type = Integer, Flags = &h0
		NO_FLUSH
		  PARTIAL_FLUSH
		  SYNC_FLUSH
		  FULL_FLUSH
		  FINISH
		BLOCK
	#tag EndEnum


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
