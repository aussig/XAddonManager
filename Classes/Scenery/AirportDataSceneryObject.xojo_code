#tag Class
Protected Class AirportDataSceneryObject
Inherits SceneryObject
	#tag Method, Flags = &h0
		Sub Constructor(folderItem as FolderItem)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(folderItem)
		  
		  dim tis as TextInputStream = TextInputStream.open(folderItem)
		  tis.Encoding = Encodings.ISOLatin1
		  
		  dim rowFromFile as String
		  dim versionRegex as new RegEx
		  dim aptRegex as new RegEx
		  dim rwyRegex as new RegEx
		  dim match as RegExMatch
		  dim fastMatchAptDatAirportLineLen as integer = lenB(kFastMatchAptDatAirportLine)
		  pAirports = new Dictionary
		  
		  // 'I' / 'A'
		  rowFromFile = tis.ReadLine
		  
		  // Search for version line
		  versionRegex.SearchPattern = kRegexAptDatVersionLine
		  do
		    rowFromFile = tis.ReadLine
		    
		    match = versionRegex.search(rowFromFile)
		    if match = nil then continue
		    
		    // Found the version line
		    dim fileVersion as String = match.subExpressionString(1)
		    
		    aptRegex.SearchPattern = kRegexAptDatAirportLine
		    if (val(fileVersion) >= 850) then
		      rwyRegex.SearchPattern = kRegexAptDat850RunwayLine
		    else
		      rwyRegex.SearchPattern = kRegexAptDat715RunwayLine
		    end if
		    
		    // Search for Airport lines
		    do
		      rowFromFile = tis.ReadLine
		      
		      // Fast string comparison before regex - this scans a lot of data and needs to be quick
		      if (rowFromFile.LeftB(fastMatchAptDatAirportLineLen) <> kFastMatchAptDatAirportLine) then continue
		      
		      match = aptRegex.search(rowFromFile)
		      if match = nil then continue
		      
		      // Found an airport line, search for a runway
		      dim aptCode as string = match.subExpressionString(1)
		      dim aptName as string = match.subExpressionString(2)
		      
		      do
		        rowFromFile = tis.ReadLine
		        
		        match = rwyRegex.search(rowFromFile)
		        if match = nil then continue
		        
		        // Found a runway line
		        dim aptLat as double = val(match.subExpressionString(1))
		        dim aptLong as double = val(match.subExpressionString(2))
		        dim airport as Airport = new Airport(aptCode, aptName, aptLat, aptLong)
		        pAirports.value(aptCode) = airport
		        
		        exit
		      loop until tis.EOF
		      
		    loop until tis.EOF
		    
		  loop until tis.EOF
		  
		  tis.Close
		  
		  exception err as RegExException
		    MsgBox err.message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function findNearestAirports(latitude as double, longitude as double, maxRange as integer) As Airport()
		  dim i as integer
		  dim result() as Airport
		  dim airports() as Variant = pAirports.values
		  
		  for i = 0 to ubound(airports)
		    dim airport as Airport = Airport(airports(i))
		    if (airport.getDistanceFrom(latitude, longitude) <= maxRange) then
		      result.append(airport)
		    end if
		  next
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function isAirportData(folderItem as FolderItem) As boolean
		  return folderItem.name = "apt.dat"
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		pAirports As Dictionary
	#tag EndProperty


	#tag Constant, Name = kFastMatchAptDatAirportLine, Type = String, Dynamic = False, Default = \"1 ", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kRegexAptDat715RunwayLine, Type = String, Dynamic = False, Default = \"^\\s*10\\s+(-\?[0-9]+\\.[0-9]+)\\s+(-\?[0-9]+\\.[0-9]+)", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kRegexAptDat850RunwayLine, Type = String, Dynamic = False, Default = \"^\\s*100\\s+[0-9]+(\?:\\.[0-9]+)\?\\s+[0-9]+\\s+[0-9]+\\s+[0-9]+(\?:\\.[0-9]+)\?\\s+[0-9]\\s+[0-9]\\s+[0-9]\\s+.*\?\\s+(-\?[0-9]+\\.[0-9]+)\\s+(-\?[0-9]+\\.[0-9]+)", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kRegexAptDatAirportLine, Type = String, Dynamic = False, Default = \"^\\s*1\\s+[0-9]*\\s+[01]\\s+[01]\\s+(.*\?)\\s(.*)", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kRegexAptDatVersionLine, Type = String, Dynamic = False, Default = \"^([0-9]+)\\s", Scope = Private
	#tag EndConstant


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
