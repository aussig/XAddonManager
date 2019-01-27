#tag Class
Protected Class CustomSceneryPackage
Inherits AddOn
Implements FolderTraversalCallbackInterface
	#tag Method, Flags = &h0
		Shared Function checkXPlaneFolder(folderItem as FolderItem) As Boolean
		  return folderItem <> nil and folderItem.child("Custom Scenery").exists
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(name as String, folderItem as FolderItem, enabled as Boolean, xPlaneFolder as XPlaneFolderItem)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(name, folderItem, enabled, xPlaneFolder)
		  
		  // Build list of DSFs in this package
		  dim earthNavFolder as FolderItem = folderItem.child("Earth nav data")
		  if not earthNavFolder.exists() then earthNavFolder = folderItem.child("Earth Nav data")
		  if not earthNavFolder.exists() then earthNavFolder = folderItem.child("Earth nav Data")
		  if not earthNavFolder.exists() then earthNavFolder = folderItem.child("Earth Nav Data")
		  if not earthNavFolder.exists() then earthNavFolder = folderItem.child("earth nav data")
		  if not earthNavFolder.exists() then earthNavFolder = folderItem.child("earth Nav data")
		  if not earthNavFolder.exists() then earthNavFolder = folderItem.child("earth nav Data")
		  if not earthNavFolder.exists() then earthNavFolder = folderItem.child("earth Nav Data")
		  if earthNavFolder.exists() then
		    Utilities.traverseFolderStructure(me, earthNavFolder, true, false, kPlanetEarth)
		  end if
		  
		  dim marsNavFolder as FolderItem = folderItem.child("Mars nav data")
		  if not earthNavFolder.exists() then earthNavFolder = folderItem.child("Mars Nav data")
		  if not earthNavFolder.exists() then earthNavFolder = folderItem.child("Mars nav Data")
		  if not earthNavFolder.exists() then earthNavFolder = folderItem.child("Mars Nav Data")
		  if not earthNavFolder.exists() then earthNavFolder = folderItem.child("mars nav data")
		  if not earthNavFolder.exists() then earthNavFolder = folderItem.child("mars Nav data")
		  if not earthNavFolder.exists() then earthNavFolder = folderItem.child("mars nav Data")
		  if not earthNavFolder.exists() then earthNavFolder = folderItem.child("mars Nav Data")
		  if marsNavFolder.exists() then
		    Utilities.traverseFolderStructure(me, marsNavFolder, true, false, kPlanetMars)
		  end if
		  
		  dim libraryFolderItem as FolderItem = folderItem.child("library.txt")
		  if libraryFolderItem.exists() then
		    pLibrary = new LibrarySceneryObject(libraryFolderItem)
		  end if
		  
		  readXAMInfoFile(folderItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub cycleDrawColour()
		  // Cycle the colour
		  pCurrentColour = pCurrentColour + 30
		  if pCurrentColour > 255 then pCurrentColour = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enable(enable as boolean)
		  if enable <> pEnabled then
		    super.enable(enable)
		    
		    dim destinationParent as FolderItem = CustomSceneryPackage.getRootFolder(enable)
		    dim swapDestinationParent as FolderItem = CustomSceneryPackage.getRootFolder(not enable)
		    
		    moveItem(enable, destinationParent, swapDestinationParent)
		    
		    pCurrentColour = 0
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub expandListBoxEntry(listBox as ListBox, clickedRow as integer)
		  // Part of the AddonInterface interface.
		  super.expandListBoxEntry(listBox, clickedRow)
		  
		  // What we do depends on what is being expanded
		  dim expandingRowTitle as string = listBox.cell(clickedRow, 0)
		  dim i as Integer
		  
		  select case expandingRowTitle
		  case me.pName
		    // The top-level package itself has been clicked, show the special subfolders
		    
		    listBox.AddFolder(kSubfolderEarthAirportsProvided)
		    listBox.cellTag(listBox.lastIndex, 0) = me
		    listBox.RowPicture(listBox.LastIndex) = imgAirports
		    // Remove the check boxes
		    listBox.cellType(listBox.lastIndex, 6) = ListBox.TypeNormal
		    listBox.cellType(listBox.lastIndex, 7) = ListBox.TypeNormal
		    
		  case kSubfolderEarthAirportsProvided
		    // The 'Earth Airports Provided' special subfolder has been opened, show the airports
		    dim airportCount as integer = pEarthAirportData.pAirports.count - 1
		    for i = 0 to airportCount
		      dim airport as Airport = pEarthAirportData.pAirports.value(pEarthAirportData.pAirports.key(i))
		      listBox.AddRow(airport.pCode + " " + airport.pName)
		      listBox.cellTag(listBox.lastIndex, 0) = me
		      // Remove the check boxes
		      listBox.cellType(listBox.lastIndex, 6) = ListBox.TypeNormal
		      listBox.cellType(listBox.lastIndex, 7) = ListBox.TypeNormal
		    next
		    
		  else
		    // All other items do nothing.  Should never get here.
		  end select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub folderTraversalCallback(folderItem as FolderItem, data as variant)
		  // Part of the FolderTraversalCallbackInterface interface.
		  
		  if DSF.isDSF(folderItem) then
		    dim dsf as DSF
		    dsf = new DSF(folderItem)
		    
		    select case data
		    case kPlanetEarth
		      pEarthDSFs.append(dsf)
		    case kPlanetMars
		      pMarsDSFs.append(dsf)
		    end select
		    
		  elseif ENV.isENV(folderItem) then
		    dim env as ENV
		    env = new ENV(folderItem)
		    
		    select case data
		    case kPlanetEarth
		      pEarthENVs.append(env)
		    case kPlanetMars
		      pMarsENVs.append(env)
		    end select
		    
		  elseif AirportDataSceneryObject.isAirportData(folderItem) then
		    dim airportData as AirportDataSceneryObject
		    airportData = new AirportDataSceneryObject(folderItem)
		    
		    select case data
		    case kPlanetEarth
		      pEarthAirportData = airportData
		    case kPlanetMars
		      pMarsAirportData = airportData
		    end select
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getCurrentDrawColour(selected as Boolean) As Color
		  if selected then
		    if pEnabled then
		      // Selected, enabled - iterate from green to black
		      return RGB(0, 255 - pCurrentColour, 0)
		    else
		      // Selected, disabled - iterate from red to black
		      return RGB(255 - pCurrentColour, 0, 0)
		    end if
		  else
		    if pEnabled then
		      // Not selected, enabled - green
		      return &c00ff00
		    else
		      return &cff0000
		      // Not selected, disabled - red
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getCurrentDrawSizeIncrease(selected as Boolean) As double
		  if selected then
		    // Selected, iterate from 0 to 2 (pCurrentColour ranges from 0 to 255)
		    return (pCurrentColour / (255 / kMaxDrawSizeIncrease))
		  else
		    // Not selected, no increase
		    return 0
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getMinDistanceFrom(x as integer, y as integer) As double
		  dim minDistance as double = 10000
		  dim latitude as double = (90 * kMapScaleFactor - y) / kMapScaleFactor
		  dim longitude as double = (x - 180 * kMapScaleFactor) / kMapScaleFactor
		  dim i as integer
		  
		  if not pShownOnMap then return minDistance
		  
		  for i = 0 to uBound(pEarthDSFs)
		    dim dsf as DSF = pEarthDSFs(i)
		    dim distance as double = dsf.getDistanceFrom(latitude, longitude)
		    if distance < minDistance then minDistance = distance
		    if minDistance = 0 then return 0
		  next
		  
		  for i = 0 to uBound(pEarthENVs)
		    dim env as ENV = pEarthENVs(i)
		    dim distance as double = env.getDistanceFrom(latitude, longitude)
		    if distance < minDistance then minDistance = distance
		    if minDistance = 0 then return 0
		  next
		  
		  return minDistance
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function getRootFolder(enabledVersion as boolean = true) As FolderItem
		  if (enabledVersion) then
		    return App.pXPlaneFolder.child("Custom Scenery")
		  else
		    return App.pXPlaneFolder.child("Custom Scenery (disabled)")
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getXPlaneFolderPreferencesKey() As String
		  return kPreferencesKey
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function hasAirportData(planet as integer) As boolean
		  select case planet
		  case kPlanetEarth
		    return pEarthAirportData <> nil
		  case kPlanetMars
		    return pMarsAirportData <> nil
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function hasDSFs(planet as integer) As boolean
		  select case planet
		  case kPlanetEarth
		    return uBound(pEarthDSFs) > -1
		  case kPlanetMars
		    return uBound(pMarsDSFs) > -1
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function hasENVs(planet as integer) As boolean
		  select case planet
		  case kPlanetEarth
		    return uBound(pEarthENVs) > 0
		  case kPlanetMars
		    return uBound(pMarsENVs) > 0
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function hasLibrary() As boolean
		  return pLibrary <> nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function hasScenery(planet as integer) As boolean
		  return me.hasDSFs(planet) or me.hasENVs(planet)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub initialiseXPlaneFolder()
		  dim disabledFolder as FolderItem
		  
		  disabledFolder = CustomSceneryPackage.getRootFolder(false)
		  if (not disabledFolder.exists) then
		    disabledFolder.createAsFolder()
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub install(folderItem as FolderItem)
		  // Check whether an item with the same name exists first
		  if CustomSceneryPackage.getRootFolder().child(folderItem.name).exists or CustomSceneryPackage.getRootFolder(false).child(folderItem.name).exists then
		    dim parameters() as string = array(folderItem.name)
		    dim result as Integer = App.displayMessage(App.processParameterizedString(wndMain.kErrorItemWithSameNameExists, parameters), "", MessageDialog.GraphicCaution, App.kOk, "", "", wndInstallSceneryPackage)
		    return
		  end if
		  
		  // Move the folder
		  folderItem.moveFileTo(CustomSceneryPackage.getRootFolder())
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function isValid(folderItem as FolderItem) As boolean
		  if Addon.isValid(folderItem) = false then return false
		  
		  // It's a valid scenery package if it's a directory and certain files or folders exist inside it
		  return folderItem.Directory and _
		  (folderItem.child("library.txt").exists or _
		  folderItem.child("Earth nav data").exists or _
		  folderItem.child("Earth Nav data").exists or _
		  folderItem.child("Earth nav Data").exists or _
		  folderItem.child("Earth Nav Data").exists or _
		  folderItem.child("earth nav data").exists or _
		  folderItem.child("earth Nav data").exists or _
		  folderItem.child("earth nav Data").exists or _
		  folderItem.child("earth Nav Data").exists or _
		  folderItem.child("Mars nav data").exists or _
		  folderItem.child("Mars Nav data").exists or _
		  folderItem.child("Mars nav Data").exists or _
		  folderItem.child("Mars Nav Data").exists or _
		  folderItem.child("mars nav data").exists or _
		  folderItem.child("mars Nav data").exists or _
		  folderItem.child("mars nav Data").exists or _
		  folderItem.child("mars Nav Data").exists)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub plotOnMap(g as Graphics, rc as rectControl, planet as integer, selected as Boolean, viewportZoomFactor as integer)
		  // Plot all the scenery tiles that this package uses.  Tile naming scheme specifies
		  // the South Western corner of each tile.
		  
		  // kMapScaleFactor is the number of pixels per unit of lat / long
		  
		  dim i as integer
		  dim x, y as integer
		  
		  if not pShownOnMap then return
		  
		  g.foreColor = getCurrentDrawColour(selected)
		  dim blobIncrease as double = getCurrentDrawSizeIncrease(selected)
		  
		  dim combinedScaleFactor as integer = kMapScaleFactor * viewportZoomFactor
		  dim size as integer = combinedScaleFactor + blobIncrease * 2
		  dim maxSize as integer = combinedScaleFactor + kMaxDrawSizeIncrease * 2
		  
		  select case planet
		    
		  case kPlanetEarth
		    for i = 0 to uBound(pEarthDSFs)
		      dim dsf as DSF = pEarthDSFs(i)
		      x = (180 + dsf.getLongitude()) * combinedScaleFactor
		      y = (90 - dsf.getLatitude()) * combinedScaleFactor - combinedScaleFactor
		      
		      // Plot the package on the offscreen buffer
		      g.fillRect(x - blobIncrease, y - blobIncrease, size, size)
		      // Refresh the appropriate area of the canvas
		      rc.invalidate(x - kMaxDrawSizeIncrease, y - kMaxDrawSizeIncrease, maxSize, maxSize, false)
		    next
		    
		    for i = 0 to uBound(pEarthENVs)
		      dim env as ENV = pEarthENVs(i)
		      x = (180 + env.getLongitude()) * combinedScaleFactor
		      y = (90 - env.getLatitude()) * combinedScaleFactor - combinedScaleFactor
		      
		      // Plot the package on the offscreen buffer
		      g.fillRect(x - blobIncrease, y - blobIncrease, size, size)
		      // Refresh the appropriate area of the canvas
		      rc.invalidate(x - kMaxDrawSizeIncrease, y - kMaxDrawSizeIncrease, maxSize, maxSize, false)
		    next
		    
		  case kPlanetMars
		    for i = 0 to uBound(pMarsDSFs)
		      dim dsf as DSF = pMarsDSFs(i)
		      x = (180 + dsf.getLongitude()) * combinedScaleFactor
		      y = (90 - dsf.getLatitude()) * combinedScaleFactor - combinedScaleFactor
		      
		      // Plot the package on the offscreen buffer
		      g.fillRect(x - blobIncrease, y - blobIncrease, size, size)
		      // Refresh the appropriate area of the canvas
		      rc.invalidate(x - kMaxDrawSizeIncrease, y - kMaxDrawSizeIncrease, maxSize, maxSize, false)
		    next
		    
		    for i = 0 to uBound(pMarsENVs)
		      dim env as ENV = pMarsENVs(i)
		      x = (180 + env.getLongitude()) * combinedScaleFactor
		      y = (90 - env.getLatitude()) * combinedScaleFactor - combinedScaleFactor
		      
		      // Plot the package on the offscreen buffer
		      g.fillRect(x - blobIncrease, y - blobIncrease, size, size)
		      // Refresh the appropriate area of the canvas
		      rc.invalidate(x - kMaxDrawSizeIncrease, y - kMaxDrawSizeIncrease, maxSize, maxSize, false)
		    next
		  end select
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub populateListBoxEntry(listBox as ListBox)
		  // Part of the AddonInterface interface.
		  dim useFolder as boolean = hasAirportData(kPlanetEarth)
		  super.populateListBoxEntry(listBox, useFolder)
		  
		  if hasLibrary() then
		    listBox.cell(listBox.lastIndex, 1) = "✓"
		  end if
		  if hasDSFs(kPlanetEarth) or hasENVs(kPlanetEarth) then
		    listBox.cell(listBox.lastIndex, 2) = "✓"
		  end if
		  if hasDSFs(kPlanetMars) or hasENVs(kPlanetMars) then
		    listBox.cell(listBox.lastIndex, 3) = "✓"
		  end if
		  if hasAirportData(kPlanetEarth) then
		    listBox.cell(listBox.lastIndex, 4) = "✓"
		  end if
		  if hasAirportData(kPlanetMars) then
		    listBox.cell(listBox.lastIndex, 5) = "✓"
		  end if
		  
		  listBox.cellCheck(listBox.lastIndex, 6) = pShownOnMap
		  listBox.RowPicture(listBox.LastIndex) = imgGlobe
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub readXAMInfoFile(folderItem as FolderItem)
		  dim xamInfoFolderItem as FolderItem = folderItem.child("xamInfo.txt")
		  if xamInfoFolderItem.exists() then
		    dim tis as TextInputStream = TextInputStream.open(xamInfoFolderItem)
		    dim rowFromFile as String
		    pVersionDate = new Date
		    
		    pOrgID = val(tis.ReadLine)
		    pVersionDate.SQLDateTime = tis.ReadLine
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub retrieveStateFromDictionary(state as Dictionary)
		  super.retrieveStateFromDictionary(state)
		  
		  if state.hasKey(kPreferencesKeyShowOnMap) then pShownOnMap = state.value(kPreferencesKeyShowOnMap)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub shownOnMap(shown as Boolean)
		  pShownOnMap = shown
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub storeStateToDictionary(state as Dictionary)
		  super.storeStateToDictionary(state)
		  
		  state.value(kPreferencesKeyShowOnMap) = pShownOnMap
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub writeXAMInfoFile(folderItem as FolderItem)
		  dim xamInfoFolderItem as FolderItem = folderItem.child("xamInfo.txt")
		  
		  try
		    dim tos as TextOutputStream = TextOutputStream.create(xamInfoFolderItem)
		    tos.writeLine(str(pOrgID))
		    tos.writeLine(pVersionDate.SQLDateTime)
		  catch err as IOException
		  end try
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		pCurrentColour As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		pEarthAirportData As AirportDataSceneryObject
	#tag EndProperty

	#tag Property, Flags = &h0
		pEarthDSFs() As DSF
	#tag EndProperty

	#tag Property, Flags = &h0
		pEarthENVs() As ENV
	#tag EndProperty

	#tag Property, Flags = &h0
		pLibrary As LibrarySceneryObject
	#tag EndProperty

	#tag Property, Flags = &h0
		pMarsAirportData As AirportDataSceneryObject
	#tag EndProperty

	#tag Property, Flags = &h0
		pMarsDSFs() As DSF
	#tag EndProperty

	#tag Property, Flags = &h0
		pMarsENVs() As ENV
	#tag EndProperty

	#tag Property, Flags = &h0
		pOrgID As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		pShownOnMap As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		pVersionDate As Date
	#tag EndProperty


	#tag Constant, Name = kMapScaleFactor, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMaxDrawSizeIncrease, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPlanetEarth, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPlanetMars, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferencesKey, Type = String, Dynamic = False, Default = \"custom_scenery_packages", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferencesKeyShowOnMap, Type = String, Dynamic = False, Default = \"show_on_map", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSubfolderEarthAirportsProvided, Type = String, Dynamic = True, Default = \"Airports Provided by this Scenery Package (Earth)", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Aeroporti distribuiti con questo pacchetto (Terra)"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"A\xC3\xA9roports fournis dans cette sc\xC3\xA8ne (Terre)"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Aeroports prove\xC3\xAFts per aquest paquet d\'escenari (Terra)"
	#tag EndConstant

	#tag Constant, Name = kTypeLibraryAndLocational, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTypeLibraryOnly, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTypeLocational, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTypeUnknown, Type = Double, Dynamic = False, Default = \"-1", Scope = Public
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
			Name="pCurrentColour"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="pEnabled"
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="pName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="pOrgID"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="pShownOnMap"
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
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
