#tag ClassProtected Class ZipExtraField	#tag Method, Flags = &h0		Function AsData() As String		  // Internal function		  // Returns the extra field as a string. Used by ZipArchive.Add... methods		  		  if me.data <> nil then		    return me.data.StringValue(0,me.data.Size)		  else		    return ""		  end		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub Constructor(privDat as ZipArchiveData, fieldData as String)		  // Constructor, for internal use only		  // "fieldData" is the entire set of bytes that'll be stored in the extras field		  		  dim c, len, i, n as Integer, mb as MemoryBlock		  		  me.d = privDat		  me.zpit_rec = -1 // nonexistent		  		  len = LenB(fieldData)		  if len > 0 then		    mb = new MemoryBlock(len)		    if mb = nil then		      raise new OutOfMemoryException		    end		    mb.LittleEndian = true // this is the default!		    mb.StringValue(0,len) = fieldData		    me.data = mb		    		    // see if we have a ZPIT record in there		    i = 0		    while (i+4) < len		      n = mb.UInt16Value(i+2)		      if n <= 0 or (i+n+4) > len then		        exit		      end		      if n >= 12 then		        if mb.UInt32Value(i+4) = &H5449505A then // "ZPIT"		          c = mb.UInt16Value(i) // signature		          if c = &H2605 or c = &H2705 then		            // found it		            me.zpit_rec = i		          end		        end		      end		      i = i + n + 4		    wend		    		    if me.zpit_rec < 0 then		      // see if we have a UX record as used by Mac OS X in there (i.e. at offset 0 and nothing else besides it)		      if mb.Size = 12 then		        if mb.UInt32Value(0) = &H00085855 then		          me.hasUXonly = true		          me.accTime = mb.Int32Value(4)		          me.modTime = mb.Int32Value(8)		        end		      end		    end		    		  end		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function GetTypeCreatorName(ByRef type as String, ByRef creator as String, ByRef name as String) As Boolean		  // Returns TRUE if the archive contains a ZipIt-compatible information about the file's		  //   Type and Creator codes, and an optional original Macintosh file name (in case the		  //   entry's normal name had to be modified to meet DOS naming conventions when it		  //   was stored). If this name is available, it is returned with the other information, otherwise		  //   it will be set to an empty string.		  // Returns FALSE if no such information is stored in the Extra Field. Be aware that		  //   an archive created by ZipIt (http://www.maczipit.com) may contain Type & Creator		  //   information also in a second place, which is inside the optional MacBinary header in		  //   case the file was stored as "Mac-only". The information from such a MacBinary		  //   header is not detected by this function.		  		  dim ofs, c, l, i as Integer, mb as MemoryBlock		  mb = me.data		  i = me.zpit_rec		  if mb <> nil and i >= 0 then		    c = mb.UInt16Value(i) // signature		    l = mb.UInt16Value(i+2) // length		    if (c = &H2605 and l >= 13) or (c = &H2705 and l >= 12) then		      if c = &H2605 then		        name = mb.PString(i+8)		        ofs = LenB(name)+1		      else		        name = ""		      end		      type = mb.StringValue(i+8+ofs, 4)		      creator = mb.StringValue(i+12+ofs, 4)		      name = me.d.decodeFromZip(name)		      return true		    end		  end		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function GetUnixTimes(ByRef accTime as Integer, ByRef modTime as Integer) As Boolean		  // The values use unix time, which counts the seconds since 1 January 1970 00:00:00		  // Also, they're in UTC (GMT normalized)		  if me.accTime <> 0 then		    accTime = me.accTime		    modTime = me.modTime		    return true		  end		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function IsLocked() As Boolean		  // Returns TRUE if the items are read-only.		  // This is the case once this object has been added with a file to an archive		  		  return me.locked		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function IsUnixType1Only() As Boolean		  return me.hasUXonly		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub Lock()		  // Locks this object. Is called internally once this obj gets added to an archive		  		  me.locked = true		End Sub	#tag EndMethod	#tag Note, Name = If you want to make changes				If you should want to add Set... functions here to expand the features of what		can be stored in this Extra Field, make sure you do not allow any changes		be made if "me.locked" is TRUE, or it would lead to inconsistent archives.				The better way to handle this is to have the user instantiate an object		of this class, and preferrably provide all information right in the		constructor, so that no one gets the idea to try and add information later		when it's not OK any more.	#tag EndNote	#tag Property, Flags = &h1		Protected accTime As Integer	#tag EndProperty	#tag Property, Flags = &h1		Protected d As ZipArchiveData	#tag EndProperty	#tag Property, Flags = &h1		Protected data As MemoryBlock	#tag EndProperty	#tag Property, Flags = &h1		Protected hasUXonly As Boolean	#tag EndProperty	#tag Property, Flags = &h1		Protected locked As Boolean	#tag EndProperty	#tag Property, Flags = &h1		Protected modTime As Integer	#tag EndProperty	#tag Property, Flags = &h1		Protected zpit_rec As Integer	#tag EndProperty	#tag ViewBehavior		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			Type="Integer"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			Type="Integer"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			Type="String"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			Type="String"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			Type="Integer"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass