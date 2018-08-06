#tag Interface
Protected Interface SeqDataInputStream
	#tag Method, Flags = &h0
		Sub ClearError()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EOF() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetErrorDescription(ByRef code as Integer, ByRef msg as String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HadError() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(count as Integer) As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Skip(count as UInt64) As Boolean
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		
		This Interface defines functions for sequentially reading data from
		binary streams.
		
		While it currently only defines one string-reading function, it could
		well be extended to support reading of all of RB's data types, such as
		ReadBoolean, ReadPString, etc., just like the ones that the RB class
		BinaryStream contains.
	#tag EndNote

	#tag Note, Name = Documentation
		
		Open () as Boolean
		
		  Shall be called once before any Read... calls. Shall return FALSE if
		  an error condition has arised (but not if there is just no data to
		  read because the stream is already empty). Shall return TRUE
		  otherwise.
		
		Close ()
		
		  Shall be called after all Read... calls have been performed. Allows
		  the called to close the stream.
		
		Read (count as Integer) as String
		
		  Reads "count" bytes from the input stream and returns them as a
		  string. If less than the requested amount of data is available, that
		  lesser amount shall be returned. If an error has occured or if no more
		  data is available, an empty string shall be returned.
		
		  The caller is responsible for making sure that he has received as much
		  data as expected, for instance by checking the length of the returned
		  data with the LenB() function. If the amount is less than what was
		  requested, then the caller should check whether it was due to an error
		  or because no more data is available with the two functions EOF() and
		  Error().
		
		Skip (count as Integer) as Boolean
		
		  Similar to Read, but does not return the amount of data that's been
		  read or skipped. Returns TRUE if the skip was successful, FALSE if
		  not as many bytes could be skipped, which means that it might have
		  reached the end of the stream or that an error has occured.
		
		EOF () as Boolean
		
		  Shall return TRUE if there is no more data available to read from the
		  input stream.
		
		HadError () as Boolean
		
		  Shall return TRUE if an error condition has arisen since any of the
		  past calls to Open and Read, unless ClearError was called since an
		  error had occured.
		
		GetErrorDescription (ByRef code as Integer, ByRef msg as String)
		
		  If an error had occured since the call to Open, the called shall set
		  'code' to a non-zero value, and the 'msg' string to a descriptive
		  message that could be shown to a user (for debugging, mostly). It is
		  recommended to set 'code' to -1 to flag a "unspecific error". If no
		  error condition exists, 'code' shall be set to 0 and 'msg' to an empty
		  string.
		
		ClearError ()
		
		  Sets the error state to "no error"
	#tag EndNote


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
End Interface
#tag EndInterface
