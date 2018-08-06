#tag Module
Protected Module Utilities
	#tag Method, Flags = &h0
		Function binToHex(binaryString as string, separator as string = " ") As string
		  dim result as string
		  dim i as integer
		  
		  result = ""
		  For i = 1 to LenB(binaryString)
		    result = result + Right("0" + Hex(Asc(MidB(binaryString, i, 1))), 2) + separator
		  next
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function convertBBtoHTML(text as String) As String
		  dim rg as new RegEx()
		  dim match as new RegExMatch()
		  dim rgo as new RegExOptions()
		  dim subExpression, bbCode, replacement as String
		  
		  rg.searchPattern = "[[]([^]]*)[]]"
		  rgo.greedy = false
		  rg.options = rgo
		  
		  match = rg.search(text)
		  while (match <> nil)
		    subExpression = match.SubExpressionString(0)
		    bbCode = unencodeHTML(match.SubExpressionString(1))
		    
		    if (bbCode.LeftB(1) = "/") then
		      // End tag
		      select case bbCode
		      case "/img"
		        replacement = "' />"
		      case "/quote"
		        replacement = "</blockquote>"
		      case "/code"
		        replacement = "</pre>"
		      case "/font"
		        replacement = "</span>"
		      case "/color"
		        replacement = "</span>"
		      case "/email"
		        replacement = "</a>"
		      case "/list"
		        replacement = ""
		      case "/size"
		        replacement = "</span>"
		      case "/sup"
		        replacement = "</sup>"
		      case "/sub"
		        replacement = "</sub>"
		      case "/right"
		        replacement = "</div>"
		      case "/center"
		        replacement = "</div>"
		      case "/b"
		        replacement = "</strong>"
		      case "/i"
		        replacement = "</em>"
		      case "/url"
		        replacement = "</a>"
		      case "/u"
		        replacement = "</span>"
		      case "/s"
		        replacement = "</span>"
		      else
		        replacement = subExpression
		      end select
		    else
		      // Start tag
		      select case true
		      case bbCode.leftB(3) = "img"
		        replacement = "<img src='"
		      case bbCode.leftB(5) = "quote"
		        replacement = "<blockquote>"
		      case bbCode.leftB(4) = "code"
		        replacement = "<pre>"
		      case bbCode.leftB(4) = "font"
		        replacement = "<span style='font-family:" + bbCode.MidB(7, bbCode.lenB() - 7) + ";'>"
		      case bbCode.leftB(5) = "color"
		        replacement = "<span style='color:" + bbCode.MidB(8, bbCode.lenB() - 8) + ";'>"
		      case bbCode.leftB(5) = "email"
		        replacement = "<a href='mailto:" + bbCode.MidB(8, bbCode.lenB() - 8) + "'>"
		      case bbCode.leftB(4) = "list"
		        replacement = ""
		      case bbCode.leftB(4) = "size"
		        replacement = "<span style='font-size: " + str(val(bbCode.MidB(7)) + kBBCodeSize1 - 1) + "pt;'>"
		      case bbCode.leftB(3) = "sup"
		        replacement = "<sup>"
		      case bbCode.leftB(3) = "sub"
		        replacement = "<sub>"
		      case bbCode.leftB(5) = "right"
		        replacement = "<div style='float: right;'>"
		      case bbCode.leftB(6) = "center"
		        replacement = "<div style='text-align:center;'>"
		      case bbCode.leftB(1) = "b"
		        replacement = "<strong>"
		      case bbCode.leftB(1) = "i"
		        replacement = "<em>"
		      case bbCode.leftB(3) = "url"
		        replacement = "<a href='" + bbCode.MidB(6, bbCode.lenB() - 6) + "'>"
		      case bbCode.leftB(1) = "u"
		        replacement = "<span style='text-decoration: underline;'>"
		      case bbCode.leftB(1) = "s"
		        replacement = "<span style='text-decoration: line-through;'>"
		      case bbCode.leftB(4) = "*"
		        replacement = "* "
		      else
		        replacement = subExpression
		      end select
		    end if
		    
		    text = text.LeftB(match.SubExpressionStartB(0)) + replacement + text.MidB(match.SubExpressionStartB(0) + subExpression.LenB + 1)
		    
		    // Can't just use rg.search() here because the length of html will have changed due to previous replacement
		    match = rg.Search(text, match.SubExpressionStartB(0) + replacement.LenB)
		  wend
		  
		  return text
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deleteContentsOfFolder(folder as FolderItem)
		  // Code from http://ramblings.aaronballman.com/2005/04/How_to_Delete_a_Folder.html
		  
		  dim i, count as Integer
		  count = folder.Count
		  
		  for i = 1 to count // Check to see if the item is a directory
		    if folder.TrueItem( 1 ).Directory then
		      deleteContentsOfFolder( folder.TrueItem(1) )
		    end if
		    folder.TrueItem( 1 ).Delete
		  next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function escapeSQLData(data as string) As string
		  // Prepare a string for use in a SQL statement.  A string which is being
		  // placed into a SQL statement cannot have a single quote in it since that will
		  // make the database engine believe the string is finished.
		  // For example the word "can't" will not work in SQL because it will see the word
		  // as just "can".
		  // In order to get around this you must escape all single quotes by adding a second
		  // one.  So "can't" will become "can''t" and then SQL command will work.
		  
		  // Replace all single quotes with two single quote characters
		  data = replaceAll( data, "'", "''" )
		  
		  // Return the new data which is ready to be used in SQL
		  return data
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function hexToBin(hexString as String, separator as string = " ") As string
		  dim result as string
		  dim i as integer
		  dim characterLength as integer
		  
		  characterLength = len(separator) + 2
		  
		  result = ""
		  for i = 1 to Len(hexString) step characterLength
		    result = result + Chr(Val("&h" + MidB(hexString, i, 2)))
		  next
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function highlightSearchTerm(text as String, searchTerm as String) As String
		  return ReplaceAll(text, searchTerm, "<span style='background-color: yellow';>" + searchTerm + "</span>")
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isUserLocalAdministrator() As Boolean
		  // Copyright © Aaron Ballman
		  // Code from: http://ramblings.aaronballman.com/2006/10/Is_the_user_an_administrator.html
		  
		  #if TargetMacOS or TargetLinux
		    return true
		  #endif
		  
		  dim fReturn as Boolean = false
		  dim dwStatus, dwAccessMask, dwAccessDesired, dwACLSize as Integer
		  dim dwStructureSize as Integer = 20 'sizeof(PRIVILEGE_SET)
		  dim pACL, psidAdmin as Integer
		  dim hToken as Integer
		  dim hImpersonationToken as Integer
		  dim ps as new MemoryBlock( dwStructureSize )
		  dim GenericMapping as new MemoryBlock( 16 )
		  dim psdAdmin as Integer
		  dim SystemSidAuthority as new MemoryBlock( 6 )
		  
		  SystemSidAuthority.Byte( 0 ) = 0
		  SystemSidAuthority.Byte( 1 ) = 0
		  SystemSidAuthority.Byte( 2 ) = 0
		  SystemSidAuthority.Byte( 3 ) = 0
		  SystemSidAuthority.Byte( 4 ) = 0
		  SystemSidAuthority.Byte( 5 ) = 5
		  
		  
		  // Determine if the current thread is running as a user that is a member
		  // of the local admins group. To do this, create a security descriptor
		  // that has a DACL which has an ACE that allows only local aministrators
		  // access. Then, call AccessCheck with the current thread's token and the
		  // security descriptor. It will say whether the user could access an object if
		  // it had that security descriptor. Note: you do not need to actually
		  // create the object. Just checking access against the security descriptor
		  // alone will be sufficient.
		  
		  // AccessCheck() requires an impersonation token. We first get a
		  // primary token and then create a duplicate impersonation token. The
		  // impersonation token is not actually assigned to the thread, but is
		  // used in the call to AccessCheck. Thus, this function itself never
		  // impersonates, but does use the identity of the thread. If the
		  // thread was impersonating already, this function uses that impersonation
		  // context.
		  
		  Soft Declare Function GetCurrentThread Lib "Kernel32" () as Integer
		  Soft Declare Function OpenThreadToken Lib "Advapi32" ( handle as Integer, access as Integer, _
		  openAsSelf as Boolean, ByRef tokenHandle as Integer ) as Boolean
		  Soft Declare Function GetLastError Lib "Kernel32" () as Integer
		  Soft Declare Function OpenProcessToken Lib "Advapi32" ( handle as Integer, access as Integer, _
		  ByRef tokenHandle as Integer ) as Boolean
		  Soft Declare Function GetCurrentProcess Lib "Kernel32" () as Integer
		  Soft Declare Function DuplicateToken Lib "Advapi32" ( existing as Integer, impersination as Integer, _
		  ByRef dupe as Integer ) as Boolean
		  Soft Declare Function AllocateAndInitializeSid Lib "Advapi32" ( authority as Ptr, count as Byte, _
		  auth0 as Integer, auth1 as Integer, auth2 as Integer, auth3 as Integer, auth4 as Integer, _
		  auth5 as Integer, auth6 as Integer, auth7 as Integer, ByRef sid as Integer ) as Boolean
		  Soft Declare Function LocalAlloc Lib "Kernel32" ( flags as Integer, bytes as Integer ) as Integer
		  Soft Declare Function InitializeSecurityDescriptor Lib "AdvApi32" ( desc as Integer, revision as Integer ) as Boolean
		  Soft Declare Function GetLengthSid Lib "AdvApi32" ( sid as Integer ) as Integer
		  Soft Declare Function InitializeAcl Lib "AdvApi32" ( acl as Integer, length as Integer, revision as Integer ) as Boolean
		  Soft Declare Function AddAccessAllowedAce Lib "AdvApi32" ( acl as Integer, revision as Integer, access as Integer, sid as Integer ) as Boolean
		  Soft Declare Function SetSecurityDescriptorDacl Lib "AdvApi32" ( desc as Integer, daclPresent as Boolean, _
		  dacl as Integer, defaulted as Boolean ) as Boolean
		  Soft Declare Sub SetSecurityDescriptorGroup Lib "AdvApi32" ( desc as Integer, group as Integer, defaulted as Boolean )
		  Soft Declare Sub SetSecurityDescriptorOwner Lib "AdvApi32" ( desc as Integer, owner as Integer, defaulted as Boolean )
		  Soft Declare Function IsValidSecurityDescriptor Lib "AdvApi32" ( desc as Integer ) as Boolean
		  Soft Declare Function AccessCheck Lib "AdvApi32" ( desc as Integer, client as Integer, access as Integer, mapping as Ptr, _
		  privSet as Ptr, ByRef privSetLength as Integer, ByRef grantedAccess as Integer, ByRef accessStatus as Integer ) as Boolean
		  Soft Declare Sub LocalFree Lib "Kernel32" ( p as Integer )
		  Soft Declare Sub CloseHandle Lib "Kernel32" ( handle as Integer )
		  Soft Declare Sub FreeSid Lib "AdvApi32" ( sid as Integer )
		  
		  Const TOKEN_DUPLICATE = &h2
		  Const TOKEN_QUERY = &h8
		  Const ERROR_NO_TOKEN = 1008
		  
		  if not OpenThreadToken( GetCurrentThread(), TOKEN_DUPLICATE + TOKEN_QUERY, true, hToken ) then
		    if not OpenProcessToken( GetCurrentProcess(), TOKEN_DUPLICATE + TOKEN_QUERY, hToken ) then
		      goto cleanup
		    end if
		  end if
		  
		  Const SecurityImpersonation = 2
		  if not DuplicateToken ( hToken, SecurityImpersonation, hImpersonationToken ) then
		    goto cleanup
		  end if
		  
		  // Create the binary representation of the well-known SID that
		  // represents the local administrators group. Then create the
		  // security descriptor and DACL with an ACE that allows only local admins
		  // access. After that, perform the access check. This will determine whether
		  // the current user is a local admin.
		  Const SECURITY_BUILTIN_DOMAIN_RID = &h20
		  Const DOMAIN_ALIAS_RID_ADMINS = &h220
		  if not AllocateAndInitializeSid( SystemSidAuthority, 2, SECURITY_BUILTIN_DOMAIN_RID, DOMAIN_ALIAS_RID_ADMINS, 0, 0, 0, 0, 0, 0, psidAdmin ) then
		    goto cleanup
		  end if
		  
		  Const LPTR = &h40
		  Const SECURITY_DESCRIPTOR_MIN_LENGTH = 20
		  psdAdmin = LocalAlloc( LPTR, SECURITY_DESCRIPTOR_MIN_LENGTH )
		  if psdAdmin = 0 then
		    goto cleanup
		  end if
		  
		  Const SECURITY_DESCRIPTOR_REVISION = 1
		  if not InitializeSecurityDescriptor( psdAdmin, SECURITY_DESCRIPTOR_REVISION ) then
		    goto cleanup
		  end if
		  
		  // Compute size needed for the ACL.
		  dwACLSize = 8 + 16 + GetLengthSid( psidAdmin ) - 4
		  
		  pACL = LocalAlloc( LPTR, dwACLSize )
		  if pACL = 0 then
		    goto cleanup
		  end if
		  
		  Const ACL_REVISION2 = 2
		  if not InitializeAcl( pACL, dwACLSize, ACL_REVISION2 ) then
		    goto cleanup
		  end if
		  
		  Const ACCESS_READ = &h1
		  Const ACCESS_WRITE = &h2
		  dwAccessMask= ACCESS_READ + ACCESS_WRITE
		  
		  if not AddAccessAllowedAce( pACL, ACL_REVISION2, dwAccessMask, psidAdmin ) then
		    goto cleanup
		  end if
		  
		  if not SetSecurityDescriptorDacl( psdAdmin, true, pACL, false ) then
		    goto cleanup
		  end if
		  
		  // AccessCheck validates a security descriptor somewhat; set the
		  // group and owner so that enough of the security descriptor is filled out
		  // to make AccessCheck happy.
		  
		  SetSecurityDescriptorGroup( psdAdmin, psidAdmin, false )
		  SetSecurityDescriptorOwner( psdAdmin, psidAdmin, false )
		  
		  if not IsValidSecurityDescriptor( psdAdmin ) then
		    goto cleanup
		  end if
		  
		  dwAccessDesired = ACCESS_READ
		  
		  // Initialize GenericMapping structure even though you
		  // do not use generic rights.
		  GenericMapping.Long( 0 ) = ACCESS_READ
		  GenericMapping.Long( 4 ) = ACCESS_WRITE
		  GenericMapping.Long( 8 ) = 0
		  GenericMapping.Long( 12 ) = ACCESS_READ + ACCESS_WRITE
		  
		  dim ret as Integer
		  if not AccessCheck( psdAdmin, hImpersonationToken, dwAccessDesired, GenericMapping, ps, dwStructureSize, dwStatus, ret ) then
		    dim err as Integer = GetLastError
		    
		    fReturn = false
		    goto cleanup
		  end if
		  
		  fReturn = ret <> 0
		  
		  cleanup:
		  // Clean up.
		  if pACL <> 0 then LocalFree( pACL )
		  if psdAdmin <> 0 then LocalFree( psdAdmin )
		  if psidAdmin <> 0 then FreeSid( psidAdmin )
		  if hImpersonationToken <> 0 then CloseHandle( hImpersonationToken )
		  if hToken <> 0 then CloseHandle( hToken )
		  
		  return fReturn
		  
		  exception e as FunctionNotFoundException
		    return true
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function normaliseFilePath(filePath as String) As String
		  #if TargetMacOS
		    return filePath.replaceAll(":", "/")
		  #elseif TargetWin32
		    return filePath.replaceAll("\", "/")
		  #else
		    return filePath
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub populateListBoxFromRecordSet(lb as ListBox, rs as RecordSet, optional firstFieldIsRowTag as boolean = false)
		  // Populate the specified listbox with the data in the recordset
		  // that is provided.  This will loop through the records in the
		  // recordset and add rows to the listbox that contain the data
		  // from the recordset.
		  
		  dim i as integer
		  
		  // Clear the order list
		  lb.deleteAllRows
		  
		  // Loop until we reach the end of the recordset
		  while not rs.eof
		    lb.addRow ""// add a new row to the listbox
		    
		    // Loop through all of the fields in the recordset and add the data to the correct
		    // column in the listbox
		    for i = 1 to rs.fieldCount
		      // The listbox Cell property is 0-based so we need to subtract 1 from the database field
		      // number to get the correct correct column number.  This means field 1 is in column 0 of
		      // the listbox.
		      if (firstFieldIsRowTag) then
		        if (i = 1) then
		          lb.rowTag(lb.lastIndex) = rs.idxField(i).stringValue
		        else
		          lb.cell(lb.lastIndex, i - 2) = rs.idxField(i).stringValue
		        end if
		      else
		        lb.cell(lb.lastIndex, i - 1) = rs.idxField(i).stringValue
		      end if
		    next
		    
		    rs.moveNext// move to the next record
		  wend
		  
		  
		  // If the listbox is set to be sorted by a particular column then we want to
		  // sort the listbox contents after we populate it, so that they appear in the
		  // correct order.
		  if lb.sortedColumn > -1 then// the listbox is sorted by a column
		    lb.sort// sort the listbox data using the current sort settings
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub reRunAsAdministrator()
		  // Copyright © Aaron Ballman
		  // Code from: http://ramblings.aaronballman.com/2007/03/uac_and_you.html
		  
		  #if TargetMacOS or TargetLinux
		    return
		  #endif
		  
		  Soft Declare Function ShellExecuteExW Lib "Shell32" ( info as Ptr ) as Boolean
		  Soft Declare Function ShellExecuteExA Lib "Shell32" ( info as Ptr ) as Boolean
		  
		  dim info as new MemoryBlock( 15 * 4 )
		  dim verb as new MemoryBlock( 32 )
		  dim file as new MemoryBlock( 260 * 2 )
		  
		  info.Long( 0 ) = info.Size
		  //info.Long( 8 ) = wndMain.Handle
		  
		  if System.IsFunctionAvailable( "ShellExecuteExW", "Shell32" ) then
		    verb.WString( 0 ) = "runas"
		    file.WString( 0 ) = App.ExecutableFile().AbsolutePath()
		  else
		    verb.CString( 0 ) = "runas"
		    file.CString( 0 ) = App.ExecutableFile().AbsolutePath()
		  end if
		  info.Ptr( 12 ) = verb
		  info.Ptr( 16 ) = file
		  
		  Const SW_SHOWNORMAL = 1
		  info.Long( 28 ) = SW_SHOWNORMAL
		  
		  dim ret as Boolean
		  if System.IsFunctionAvailable( "ShellExecuteExW", "Shell32" ) then
		    ret = ShellExecuteExW( info )
		  else
		    ret = ShellExecuteExA( info )
		  end if
		  
		  quit
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub traverseFolderStructure(callbackClass as FolderTraversalCallbackInterface, folderItem as FolderItem, callbackForFiles as boolean, callbackForFolders as boolean, data as variant)
		  dim i, count as Integer
		  count = folderItem.Count
		  
		  for i = 1 to count
		    // Check to see if the item is a directory
		    if folderItem.trueItem(i).Directory then
		      if callbackForFolders then
		        callbackClass.folderTraversalCallback(folderItem.trueItem(i), data)
		      end if
		      // Recurse
		      traverseFolderStructure(callbackClass, folderItem.trueItem(i), callbackForFiles, callbackForFolders, data)
		    else
		      if callbackForFiles then
		        callbackClass.folderTraversalCallback(folderItem.trueItem(i), data)
		      end if
		    end if
		  next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function unencodeHTML(html as String) As String
		  dim rg as new RegEx()
		  dim match as new RegExMatch()
		  dim rgo as new RegExOptions()
		  dim subExpression, htmlEntity, replacement as String
		  
		  // Build Dictionary for fast lookup of entities -> characters. Store it so we only have to build once per execution.
		  if (Utilities.pHTMLLookup = nil) then
		    Utilities.pHTMLLookup = new Dictionary()
		    
		    dim htmlEntities() as String = Utilities.kHTML.split(",")
		    
		    dim j as integer = ubound(htmlEntities) - 1
		    dim i as integer
		    
		    for i = 0 to j
		      Utilities.pHTMLLookup.value(htmlEntities(i)) = Utilities.kUTF8.Mid(i + 1, 1)
		    next
		  end if
		  
		  // Search for &xxxxxx; or &#xxx;
		  rgo.CaseSensitive = true
		  rgo.Greedy = false
		  rg.searchPattern = "&([^;]*);"
		  rg.options = rgo
		  
		  match = rg.search(html)
		  while (match <> nil)
		    subExpression = match.SubExpressionString(0)
		    htmlEntity = match.SubExpressionString(1)
		    
		    if (htmlEntity.LeftB(1) = "#") then
		      // Replace with character using value after #
		      replacement = chr(val(htmlEntity.MidB(2)))
		    else
		      // Replace with lookup into htmlEntities for string
		      replacement = pHTMLLookup.Value(htmlEntity)
		    end if
		    
		    html = html.LeftB(match.SubExpressionStartB(0)) + replacement + html.MidB(match.SubExpressionStartB(0) + subExpression.LenB + 1)
		    
		    // Can't just use rg.search() here because the length of html will have changed due to previous replacement
		    match = rg.Search(html, match.SubExpressionStartB(0) + replacement.LenB)
		  wend
		  
		  return html
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		pHTMLLookup As Dictionary
	#tag EndProperty


	#tag Constant, Name = kBBCodeSize1, Type = Double, Dynamic = False, Default = \"9", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHTML, Type = String, Dynamic = False, Default = \"Aacgr\x2Caacgr\x2CAacute\x2Caacute\x2CAbreve\x2Cabreve\x2CAcirc\x2Cacirc\x2Cacute\x2CAcy\x2Cacy\x2CAElig\x2Caelig\x2CAgr\x2Cagr\x2CAgrave\x2Cagrave\x2Calefsym\x2Caleph\x2CAlpha\x2Calpha\x2CAmacr\x2Camacr\x2Camalg\x2Camp\x2Cand\x2Cang\x2Cang90\x2Cangmsd\x2Cangsph\x2Cangst\x2CAogon\x2Caogon\x2Cap\x2Cape\x2Capos\x2CAring\x2Caring\x2Cast\x2Casymp\x2CAtilde\x2Catilde\x2CAuml\x2Cauml\x2Cb.alpha\x2Cb.beta\x2Cb.chi\x2Cb.Delta\x2Cb.delta\x2Cb.epsi\x2Cb.epsis\x2Cb.epsiv\x2Cb.eta\x2Cb.Gamma\x2Cb.gamma\x2Cb.gammad\x2Cb.iota\x2Cb.kappa\x2Cb.kappav\x2Cb.Lambda\x2Cb.lambda\x2Cb.mu\x2Cb.nu\x2Cb.Omega\x2Cb.omega\x2Cb.Phi\x2Cb.phis\x2Cb.phiv\x2Cb.Pi\x2Cb.pi\x2Cb.piv\x2Cb.Psi\x2Cb.psi\x2Cb.rho\x2Cb.rhov\x2Cb.Sigma\x2Cb.sigma\x2Cb.sigmav\x2Cb.tau\x2Cb.Theta\x2Cb.thetas\x2Cb.thetav\x2Cb.Upsi\x2Cb.upsi\x2Cb.Xi\x2Cb.xi\x2Cb.zeta\x2Cbarwed\x2CBarwed\x2Cbcong\x2CBcy\x2Cbcy\x2Cbdquo\x2Cbecaus\x2Cbepsi\x2Cbernou\x2CBeta\x2Cbeta\x2Cbeth\x2CBgr\x2Cbgr\x2Cblank\x2Cblk12\x2Cblk14\x2Cblk34\x2Cblock\x2Cbottom\x2Cbowtie\x2Cboxdl\x2CboxdL\x2CboxDl\x2CboxDL\x2Cboxdr\x2CboxdR\x2CboxDr\x2CboxDR\x2Cboxh\x2CboxH\x2Cboxhd\x2CboxHd\x2CboxhD\x2CboxHD\x2Cboxhu\x2CboxHu\x2CboxhU\x2CboxHU\x2Cboxul\x2CboxuL\x2CboxUl\x2CboxUL\x2Cboxur\x2CboxuR\x2CboxUr\x2CboxUR\x2Cboxv\x2CboxV\x2Cboxvh\x2CboxvH\x2CboxVh\x2CboxVH\x2Cboxvl\x2CboxvL\x2CboxVl\x2CboxVL\x2Cboxvr\x2CboxvR\x2CboxVr\x2CboxVR\x2Cbprime\x2Cbreve\x2Cbrvbar\x2Cbsim\x2Cbsime\x2Cbsol\x2Cbull\x2Cbump\x2Cbumpe\x2CCacute\x2Ccacute\x2Ccap\x2CCap\x2Ccaret\x2Ccaron\x2CCcaron\x2Cccaron\x2CCcedil\x2Cccedil\x2CCcirc\x2Cccirc\x2CCdot\x2Ccdot\x2Ccedil\x2Ccent\x2CCHcy\x2Cchcy\x2Ccheck\x2CChi\x2Cchi\x2Ccir\x2Ccirc\x2Ccire\x2Cclubs\x2Ccolon\x2Ccolone\x2Ccomma\x2Ccommat\x2Ccomp\x2Ccompfn\x2Ccong\x2Cconint\x2Ccoprod\x2Ccopy\x2Ccopysr\x2Ccrarr\x2Ccross\x2Ccuepr\x2Ccuesc\x2Ccularr\x2Ccup\x2CCup\x2Ccupre\x2Ccurarr\x2Ccurren\x2Ccuvee\x2Ccuwed\x2Cdagger\x2CDagger\x2Cdaleth\x2Cdarr\x2CdArr\x2Cdarr2\x2Cdash\x2Cdashv\x2Cdblac\x2CDcaron\x2Cdcaron\x2CDcy\x2Cdcy\x2Cdeg\x2CDelta\x2Cdelta\x2CDgr\x2Cdgr\x2Cdharl\x2Cdharr\x2Cdiam\x2Cdiams\x2Cdie\x2Cdivide\x2Cdivonx\x2CDJcy\x2Cdjcy\x2Cdlarr\x2Cdlcorn\x2Cdlcrop\x2Cdollar\x2CDot\x2Cdot\x2CDotDot\x2Cdrarr\x2Cdrcorn\x2Cdrcrop\x2CDScy\x2Cdscy\x2CDstrok\x2Cdstrok\x2Cdtri\x2Cdtrif\x2CDZcy\x2Cdzcy\x2CEacgr\x2Ceacgr\x2CEacute\x2Ceacute\x2CEcaron\x2Cecaron\x2Cecir\x2CEcirc\x2Cecirc\x2Cecolon\x2CEcy\x2Cecy\x2CEdot\x2Cedot\x2CeDot\x2CEEacgr\x2Ceeacgr\x2CEEgr\x2Ceegr\x2CefDot\x2CEgr\x2Cegr\x2CEgrave\x2Cegrave\x2Cegs\x2Cell\x2Cels\x2CEmacr\x2Cemacr\x2Cempty\x2Cemsp\x2Cemsp13\x2Cemsp14\x2CENG\x2Ceng\x2Censp\x2CEogon\x2Ceogon\x2Cepsi\x2CEpsilon\x2Cepsilon\x2Cepsis\x2Cequals\x2Cequiv\x2CerDot\x2Cesdot\x2CEta\x2Ceta\x2CETH\x2Ceth\x2CEuml\x2Ceuml\x2Cexcl\x2Cexist\x2CFcy\x2Cfcy\x2Cfemale\x2Cffilig\x2Cfflig\x2Cffllig\x2Cfilig\x2Cflat\x2Cfllig\x2Cfnof\x2Cforall\x2Cfork\x2Cfrac12\x2Cfrac13\x2Cfrac14\x2Cfrac15\x2Cfrac16\x2Cfrac18\x2Cfrac23\x2Cfrac25\x2Cfrac34\x2Cfrac35\x2Cfrac38\x2Cfrac45\x2Cfrac56\x2Cfrac58\x2Cfrac78\x2Cfrasl\x2Cfrown\x2Cgacute\x2CGamma\x2Cgamma\x2Cgammad\x2CGbreve\x2Cgbreve\x2CGcedil\x2Cgcedil\x2CGcirc\x2Cgcirc\x2CGcy\x2Cgcy\x2CGdot\x2Cgdot\x2Cge\x2CgE\x2Cgel\x2Cges\x2CGg\x2CGgr\x2Cggr\x2Cgimel\x2CGJcy\x2Cgjcy\x2Cgl\x2CgnE\x2Cgne\x2Cgnsim\x2Cgrave\x2Cgsdot\x2Cgsim\x2Cgt\x2CGt\x2CgvnE\x2Chairsp\x2Chalf\x2Chamilt\x2CHARDcy\x2Chardcy\x2Charr\x2ChArr\x2Charrw\x2CHcirc\x2Chcirc\x2Chearts\x2Chellip\x2Chorbar\x2CHstrok\x2Chstrok\x2Chybull\x2Chyphen\x2CIacgr\x2Ciacgr\x2CIacute\x2Ciacute\x2CIcirc\x2Cicirc\x2CIcy\x2Cicy\x2Cidiagr\x2CIdigr\x2Cidigr\x2CIdot\x2CIEcy\x2Ciecy\x2Ciexcl\x2Ciff\x2CIgr\x2Cigr\x2CIgrave\x2Cigrave\x2CIJlig\x2Cijlig\x2CImacr\x2Cimacr\x2Cimage\x2Cincare\x2Cinfin\x2Cinodot\x2Cinodot\x2Cint\x2Cintcal\x2CIOcy\x2Ciocy\x2CIogon\x2Ciogon\x2CIota\x2Ciota\x2Ciquest\x2Cisin\x2CItilde\x2Citilde\x2CIukcy\x2Ciukcy\x2CIuml\x2Ciuml\x2CJcirc\x2Cjcirc\x2CJcy\x2Cjcy\x2CJsercy\x2Cjsercy\x2CJukcy\x2Cjukcy\x2CKappa\x2Ckappa\x2Ckappav\x2CKcedil\x2Ckcedil\x2CKcy\x2Ckcy\x2CKgr\x2Ckgr\x2Ckgreen\x2CKHcy\x2Ckhcy\x2CKHgr\x2Ckhgr\x2CKJcy\x2Ckjcy\x2ClAarr\x2CLacute\x2Clacute\x2Clagran\x2CLambda\x2Clambda\x2Clang\x2Claquo\x2Clarr\x2CLarr\x2ClArr\x2Clarr2\x2Clarrhk\x2Clarrlp\x2Clarrtl\x2CLcaron\x2Clcaron\x2CLcedil\x2Clcedil\x2Clceil\x2Clcub\x2CLcy\x2Clcy\x2Cldot\x2Cldquo\x2Cldquor\x2Cle\x2ClE\x2Cleg\x2Cles\x2Clfloor\x2Clg\x2CLgr\x2Clgr\x2Clhard\x2Clharu\x2Clhblk\x2CLJcy\x2Cljcy\x2CLl\x2CLmidot\x2Clmidot\x2ClnE\x2Clne\x2Clnsim\x2Clowast\x2Clowbar\x2Cloz\x2Clozf\x2Clpar\x2Clrarr2\x2Clrhar2\x2Clrm\x2Clsaquo\x2Clsh\x2Clsim\x2Clsqb\x2Clsquo\x2Clsquor\x2CLstrok\x2Clstrok\x2Clt\x2CLt\x2Clthree\x2Cltimes\x2Cltri\x2Cltrie\x2Cltrif\x2ClvnE\x2Cmacr\x2Cmale\x2Cmalt\x2Cmap\x2Cmarker\x2CMcy\x2Cmcy\x2Cmdash\x2CMgr\x2Cmgr\x2Cmicro\x2Cmid\x2Cmiddot\x2Cminus\x2Cminusb\x2Cmldr\x2Cmnplus\x2Cmodels\x2CMu\x2Cmu\x2Cmumap\x2Cnabla\x2CNacute\x2Cnacute\x2Cnap\x2Cnapos\x2Cnatur\x2Cnbsp\x2CNcaron\x2Cncaron\x2CNcedil\x2Cncedil\x2Cncong\x2CNcy\x2Cncy\x2Cndash\x2Cne\x2Cnearr\x2Cnequiv\x2Cnexist\x2Cnge\x2Cnges\x2CNgr\x2Cngr\x2Cngt\x2Cnharr\x2CnhArr\x2Cni\x2CNJcy\x2Cnjcy\x2Cnlarr\x2CnlArr\x2Cnldr\x2Cnle\x2Cnles\x2Cnlt\x2Cnltri\x2Cnltrie\x2Cnmid\x2Cnot\x2Cnotin\x2Cnpar\x2Cnpr\x2Cnpre\x2Cnrarr\x2CnrArr\x2Cnrtri\x2Cnrtrie\x2Cnsc\x2Cnsce\x2Cnsim\x2Cnsime\x2Cnspar\x2Cnsub\x2CnsubE\x2Cnsube\x2Cnsup\x2CnsupE\x2Cnsupe\x2CNtilde\x2Cntilde\x2CNu\x2Cnu\x2Cnum\x2Cnumero\x2Cnumsp\x2Cnvdash\x2CnvDash\x2CnVdash\x2CnVDash\x2Cnwarr\x2COacgr\x2Coacgr\x2COacute\x2Coacute\x2Coast\x2Cocir\x2COcirc\x2Cocirc\x2COcy\x2Cocy\x2Codash\x2COdblac\x2Codblac\x2Codot\x2COElig\x2Coelig\x2Cogon\x2COgr\x2Cogr\x2COgrave\x2Cograve\x2COHacgr\x2Cohacgr\x2COHgr\x2Cohgr\x2Cohm\x2Colarr\x2Coline\x2COmacr\x2Comacr\x2COmega\x2Comega\x2COmicron\x2Comicron\x2Cominus\x2Coplus\x2Cor\x2Corarr\x2Corder\x2Cordf\x2Cordm\x2CoS\x2COslash\x2Coslash\x2Cosol\x2COtilde\x2Cotilde\x2Cotimes\x2COuml\x2Couml\x2Cpar\x2Cpara\x2Cpart\x2CPcy\x2Cpcy\x2Cpercnt\x2Cperiod\x2Cpermil\x2Cperp\x2CPgr\x2Cpgr\x2CPHgr\x2Cphgr\x2CPhi\x2Cphi\x2Cphis\x2Cphiv\x2Cphmmat\x2Cphone\x2CPi\x2Cpi\x2Cpiv\x2Cplanck\x2Cplus\x2Cplusb\x2Cplusdo\x2Cplusmn\x2Cpound\x2Cpr\x2Cpre\x2Cprime\x2CPrime\x2Cprnsim\x2Cprod\x2Cprop\x2Cprsim\x2CPSgr\x2Cpsgr\x2CPsi\x2Cpsi\x2Cpuncsp\x2Cquest\x2Cquot\x2CrAarr\x2CRacute\x2Cracute\x2Cradic\x2Crang\x2Craquo\x2Crarr\x2CRarr\x2CrArr\x2Crarr2\x2Crarrhk\x2Crarrlp\x2Crarrtl\x2Crarrw\x2CRcaron\x2Crcaron\x2CRcedil\x2Crcedil\x2Crceil\x2Crcub\x2CRcy\x2Crcy\x2Crdquo\x2Crdquor\x2Creal\x2Crect\x2Creg\x2Crfloor\x2CRgr\x2Crgr\x2Crhard\x2Crharu\x2CRho\x2Crho\x2Crhov\x2Cring\x2Crlarr2\x2Crlhar2\x2Crlm\x2Crpar\x2Crsaquo\x2Crsh\x2Crsqb\x2Crsquo\x2Crsquor\x2Crthree\x2Crtimes\x2Crtri\x2Crtrie\x2Crtrif\x2Crx\x2CSacute\x2Csacute\x2Csamalg\x2Csbquo\x2Csbsol\x2Csc\x2CScaron\x2Cscaron\x2Csccue\x2Csce\x2CScedil\x2Cscedil\x2CScirc\x2Cscirc\x2Cscnsim\x2Cscsim\x2CScy\x2Cscy\x2Csdot\x2Csdotb\x2Csect\x2Csemi\x2Csetmn\x2Csext\x2Csfgr\x2Csfrown\x2CSgr\x2Csgr\x2Csharp\x2CSHCHcy\x2Cshchcy\x2CSHcy\x2Cshcy\x2Cshy\x2CSigma\x2Csigma\x2Csigmaf\x2Csigmav\x2Csim\x2Csime\x2Csmile\x2CSOFTcy\x2Csoftcy\x2Csol\x2Cspades\x2Cspar\x2Csqcap\x2Csqcup\x2Csqsub\x2Csqsube\x2Csqsup\x2Csqsupe\x2Csqu\x2Csquare\x2Csquf\x2Cssetmn\x2Cssmile\x2Csstarf\x2Cstar\x2Cstarf\x2Csub\x2CSub\x2CsubE\x2Csube\x2CsubnE\x2Csubne\x2Csum\x2Csung\x2Csup\x2CSup\x2Csup1\x2Csup2\x2Csup3\x2CsupE\x2Csupe\x2CsupnE\x2Csupne\x2Cszlig\x2Ctarget\x2CTau\x2Ctau\x2CTcaron\x2Ctcaron\x2CTcedil\x2Ctcedil\x2CTcy\x2Ctcy\x2Ctdot\x2Ctelrec\x2CTgr\x2Ctgr\x2Cthere4\x2CTheta\x2Ctheta\x2Cthetas\x2Cthetasym\x2Cthetav\x2CTHgr\x2Cthgr\x2Cthinsp\x2Cthkap\x2Cthksim\x2CTHORN\x2Cthorn\x2Ctilde\x2Ctimes\x2Ctimesb\x2Ctop\x2Ctprime\x2Ctrade\x2Ctrie\x2CTScy\x2Ctscy\x2CTSHcy\x2Ctshcy\x2CTstrok\x2Ctstrok\x2Ctwixt\x2CUacgr\x2Cuacgr\x2CUacute\x2Cuacute\x2Cuarr\x2CuArr\x2Cuarr2\x2CUbrcy\x2Cubrcy\x2CUbreve\x2Cubreve\x2CUcirc\x2Cucirc\x2CUcy\x2Cucy\x2CUdblac\x2Cudblac\x2Cudiagr\x2CUdigr\x2Cudigr\x2CUgr\x2Cugr\x2CUgrave\x2Cugrave\x2Cuharl\x2Cuharr\x2Cuhblk\x2Culcorn\x2Culcrop\x2CUmacr\x2Cumacr\x2Cuml\x2CUogon\x2Cuogon\x2Cuplus\x2CUpsi\x2Cupsi\x2Cupsih\x2CUpsilon\x2Cupsilon\x2Curcorn\x2Curcrop\x2CUring\x2Curing\x2CUtilde\x2Cutilde\x2Cutri\x2Cutrif\x2CUuml\x2Cuuml\x2Cvarr\x2CvArr\x2CVcy\x2Cvcy\x2Cvdash\x2CvDash\x2CVdash\x2Cveebar\x2Cvellip\x2Cverbar\x2CVerbar\x2Cvltri\x2Cvprime\x2Cvprop\x2Cvrtri\x2CvsubnE\x2Cvsubne\x2CvsupnE\x2Cvsupne\x2CVvdash\x2CWcirc\x2Cwcirc\x2Cwedgeq\x2Cweierp\x2Cwreath\x2Cxcirc\x2Cxdtri\x2CXgr\x2Cxgr\x2CxhArr\x2Cxharr\x2CXi\x2Cxi\x2CxlArr\x2CxrArr\x2Cxutri\x2CYacute\x2Cyacute\x2CYAcy\x2Cyacy\x2CYcirc\x2Cycirc\x2CYcy\x2Cycy\x2Cyen\x2CYIcy\x2Cyicy\x2CYUcy\x2Cyucy\x2Cyuml\x2CYuml\x2CZacute\x2Czacute\x2CZcaron\x2Czcaron\x2CZcy\x2Czcy\x2CZdot\x2Czdot\x2CZeta\x2Czeta\x2CZgr\x2Czgr\x2CZHcy\x2Czhcy\x2Czwj\x2Czwnj\x2Ceuro", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUTF8, Type = String, Dynamic = False, Default = \"\xCE\x86\xCE\xAC\xC3\x81\xC3\xA1\xC4\x82\xC4\x83\xC3\x82\xC3\xA2\xC2\xB4\xD0\x90\xD0\xB0\xC3\x86\xC3\xA6\xCE\x91\xCE\xB1\xC3\x80\xC3\xA0\xE2\x84\xB5\xE2\x84\xB5\xCE\x91\xCE\xB1\xC4\x80\xC4\x81\xE2\x88\x90&\xE2\x88\xA7\xE2\x88\xA0\xE2\x88\x9F\xE2\x88\xA1\xE2\x88\xA2\xC3\x85\xC4\x84\xC4\x85\xE2\x89\x88\xE2\x89\x8A\'\xC3\x85\xC3\xA5*\xE2\x89\x88\xC3\x83\xC3\xA3\xC3\x84\xC3\xA4\xCE\xB1\xCE\xB2\xCF\x87\xCE\x94\xCE\xB4\xCE\xB5\xCE\xB5\xCE\xB5\xCE\xB7\xCE\x93\xCE\xB3\xCF\x9C\xCE\xB9\xCE\xBA\xCF\xB0\xCE\x9B\xCE\xBB\xCE\xBC\xCE\xBD\xCE\xA9\xCF\x8E\xCE\xA6\xCF\x86\xCF\x95\xCE\xA0\xCF\x80\xCF\x96\xCE\xA8\xCF\x88\xCF\x81\xCF\xB1\xCE\xA3\xCF\x83\xCF\x82\xCF\x84\xCE\x98\xCE\xB8\xCF\x91\xCE\xA5\xCF\x85\xCE\x9E\xCE\xBE\xCE\xB6\xE2\x8A\xBC\xE2\x8C\x86\xE2\x89\x8C\xD0\x91\xD0\xB1\xE2\x80\x9E\xE2\x88\xB5\xE2\x88\x8D\xE2\x84\xAC\xCE\x92\xCE\xB2\xE2\x84\xB6\xCE\x92\xCE\xB2\xE2\x90\xA3\xE2\x96\x92\xE2\x96\x91\xE2\x96\x93\xE2\x96\x88\xE2\x8A\xA5\xE2\x8B\x88\xE2\x94\x90\xE2\x95\x95\xE2\x95\x96\xE2\x95\x97\xE2\x94\x8C\xE2\x95\x92\xE2\x95\x93\xE2\x95\x94\xE2\x94\x80\xE2\x95\x90\xE2\x94\xAC\xE2\x95\xA4\xE2\x95\xA5\xE2\x95\xA6\xE2\x94\xB4\xE2\x95\xA7\xE2\x95\xA8\xE2\x95\xA9\xE2\x94\x98\xE2\x95\x9B\xE2\x95\x9C\xE2\x95\x9D\xE2\x94\x94\xE2\x95\x98\xE2\x95\x99\xE2\x95\x9A\xE2\x94\x82\xE2\x95\x91\xE2\x94\xBC\xE2\x95\xAA\xE2\x95\xAB\xE2\x95\xAC\xE2\x94\xA4\xE2\x95\xA1\xE2\x95\xA2\xE2\x95\xA3\xE2\x94\x9C\xE2\x95\x9E\xE2\x95\x9F\xE2\x95\xA0\xE2\x80\xB5\xCB\x98\xC2\xA6\xE2\x88\xBD\xE2\x8B\x8D\\\xE2\x80\xA2\xE2\x89\x8E\xE2\x89\x8F\xC4\x86\xC4\x87\xE2\x88\xA9\xE2\x8B\x92\xE2\x81\x81\xCB\x87\xC4\x8C\xC4\x8D\xC3\x87\xC3\xA7\xC4\x88\xC4\x89\xC4\x8A\xC4\x8B\xC2\xB8\xC2\xA2\xD0\xA7\xD1\x87\xE2\x9C\x93\xCE\xA7\xCF\x87\xE2\x97\x8B\xCB\x86\xE2\x89\x97\xE2\x99\xA3:\xE2\x89\x94\x2C@\xE2\x88\x81\xE2\x88\x98\xE2\x89\x85\xE2\x88\xAE\xE2\x88\x90\xC2\xA9\xE2\x84\x97\xE2\x86\xB5\xE2\x9C\x97\xE2\x8B\x9E\xE2\x8B\x9F\xE2\x86\xB6\xE2\x88\xAA\xE2\x8B\x93\xE2\x89\xBC\xE2\x86\xB7\xC2\xA4\xE2\x8B\x8E\xE2\x8B\x8F\xE2\x80\xA0\xE2\x80\xA1\xE2\x84\xB8\xE2\x86\x93\xE2\x87\x93\xE2\x87\x8A\xE2\x80\x90\xE2\x8A\xA3\xCB\x9D\xC4\x8E\xC4\x8F\xD0\x94\xD0\xB4\xC2\xB0\xCE\x94\xCE\xB4\xCE\x94\xCE\xB4\xE2\x87\x83\xE2\x87\x82\xE2\x8B\x84\xE2\x99\xA6\xC2\xA8\xC3\xB7\xE2\x8B\x87\xD0\x82\xD1\x92\xE2\x86\x99\xE2\x8C\x9E\xE2\x8C\x8D$\xC2\xA8\xCB\x99\xE2\x83\x9C\xE2\x86\x98\xE2\x8C\x9F\xE2\x8C\x8C\xD0\x85\xD1\x95\xC4\x90\xC4\x91\xE2\x96\xBF\xE2\x96\xBE\xD0\x8F\xD1\x9F\xCE\x88\xCE\xAD\xC3\x89\xC3\xA9\xC4\x9A\xC4\x9B\xE2\x89\x96\xC3\x8A\xC3\xAA\xE2\x89\x95\xD0\xAD\xD1\x8D\xC4\x96\xC4\x97\xE2\x89\x91\xCE\x89\xCE\xAE\xCE\x97\xCE\xB7\xE2\x89\x92\xCE\x95\xCE\xB5\xC3\x88\xC3\xA8\xE2\x8B\x9D\xE2\x84\x93\xE2\x8B\x9C\xC4\x92\xC4\x93\xE2\x88\x85\xE2\x80\x83\xE2\x80\x84\xE2\x80\x85\xC5\x8A\xC5\x8B\xE2\x80\x82\xC4\x98\xC4\x99\xCE\xB5\xCE\x95\xCE\xB5\xE2\x88\x8A\x3D\xE2\x89\xA1\xE2\x89\x93\xE2\x89\x90\xCE\x97\xCE\xB7\xC3\x90\xC3\xB0\xC3\x8B\xC3\xAB!\xE2\x88\x83\xD0\xA4\xD1\x84\xE2\x99\x80\xEF\xAC\x83\xEF\xAC\x80\xEF\xAC\x84\xEF\xAC\x81\xE2\x99\xAD\xEF\xAC\x82\xC6\x92\xE2\x88\x80\xE2\x8B\x94\xC2\xBD\xE2\x85\x93\xC2\xBC\xE2\x85\x95\xE2\x85\x99\xE2\x85\x9B\xE2\x85\x94\xE2\x85\x96\xC2\xBE\xE2\x85\x97\xE2\x85\x9C\xE2\x85\x98\xE2\x85\x9A\xE2\x85\x9D\xE2\x85\x9E\xE2\x81\x84\xE2\x8C\xA2\xC7\xB5\xCE\x93\xCE\xB3\xCF\x9C\xC4\x9E\xC4\x9F\xC4\xA2\xC4\xA3\xC4\x9C\xC4\x9D\xD0\x93\xD0\xB3\xC4\xA0\xC4\xA1\xE2\x89\xA5\xE2\x89\xA7\xE2\x8B\x9B\xE2\x89\xA5\xE2\x8B\x99\xCE\x93\xCE\xB3\xE2\x84\xB7\xD0\x83\xD1\x93\xE2\x89\xB7\xE2\x89\xA9\xE2\x89\xA9\xE2\x8B\xA7`\xE2\x8B\x97\xE2\x89\xB3>\xE2\x89\xAB\xE2\x89\xA9\xE2\x80\x8A\xC2\xBD\xE2\x84\x8B\xD0\xAA\xD1\x8A\xE2\x86\x94\xE2\x87\x94\xE2\x86\xAD\xC4\xA4\xC4\xA5\xE2\x99\xA5\xE2\x80\xA6\xE2\x80\x95\xC4\xA6\xC4\xA7\xE2\x81\x83-\xCE\x8A\xCE\xAF\xC3\x8D\xC3\xAD\xC3\x8E\xC3\xAE\xD0\x98\xD0\xB8\xCE\x90\xCE\xAA\xCF\x8A\xC4\xB0\xD0\x95\xD0\xB5\xC2\xA1\xE2\x87\x94\xCE\x99\xCE\xB9\xC3\x8C\xC3\xAC\xC4\xB2\xC4\xB3\xC4\xAA\xC4\xAB\xE2\x84\x91\xE2\x84\x85\xE2\x88\x9E\xC4\xB1\xC4\xB1\xE2\x88\xAB\xE2\x8A\xBA\xD0\x81\xD1\x91\xC4\xAE\xC4\xAF\xCE\x99\xCE\xB9\xC2\xBF\xE2\x88\x88\xC4\xA8\xC4\xA9\xD0\x86\xD1\x96\xC3\x8F\xC3\xAF\xC4\xB4\xC4\xB5\xD0\x99\xD0\xB9\xD0\x88\xD1\x98\xD0\x84\xD1\x94\xCE\x9A\xCE\xBA\xCF\xB0\xC4\xB6\xC4\xB7\xD0\x9A\xD0\xBA\xCE\x9A\xCE\xBA\xC4\xB8\xD0\xA5\xD1\x85\xCE\xA7\xCF\x87\xD0\x8C\xD1\x9C\xE2\x87\x9A\xC4\xB9\xC4\xBA\xE2\x84\x92\xCE\x9B\xCE\xBB\xE3\x80\x88\xC2\xAB\xE2\x86\x90\xE2\x86\x9E\xE2\x87\x90\xE2\x87\x87\xE2\x86\xA9\xE2\x86\xAB\xE2\x86\xA2\xC4\xBD\xC4\xBE\xC4\xBB\xC4\xBC\xE2\x8C\x88{\xD0\x9B\xD0\xBB\xE2\x8B\x96\xE2\x80\x9C\xE2\x80\x9E\xE2\x89\xA4\xE2\x89\xA6\xE2\x8B\x9A\xE2\x89\xA4\xE2\x8C\x8A\xE2\x89\xB6\xCE\x9B\xCE\xBB\xE2\x86\xBD\xE2\x86\xBC\xE2\x96\x84\xD0\x89\xD1\x99\xE2\x8B\x98\xC4\xBF\xC5\x80\xE2\x89\xA8\xE2\x89\xA8\xE2\x8B\xA6\xE2\x88\x97_\xE2\x97\x8A\xE2\x9C\xA6(\xE2\x87\x86\xE2\x87\x8B\xE2\x80\x8E\xE2\x80\xB9\xE2\x86\xB0\xE2\x89\xB2[\xE2\x80\x98\xE2\x80\x9A\xC5\x81\xC5\x82<\xE2\x89\xAA\xE2\x8B\x8B\xE2\x8B\x89\xE2\x97\x83\xE2\x8A\xB4\xE2\x97\x82\xE2\x89\xA8\xC2\xAF\xE2\x99\x82\xE2\x9C\xA0\xE2\x86\xA6\xE2\x96\xAE\xD0\x9C\xD0\xBC\xE2\x80\x94\xCE\x9C\xCE\xBC\xC2\xB5\xE2\x88\xA3\xC2\xB7\xE2\x88\x92\xE2\x8A\x9F\xE2\x80\xA6\xE2\x88\x93\xE2\x8A\xA7\xCE\x9C\xCE\xBC\xE2\x8A\xB8\xE2\x88\x87\xC5\x83\xC5\x84\xE2\x89\x89\xC5\x89\xE2\x99\xAE\xC2\xA0\xC5\x87\xC5\x88\xC5\x85\xC5\x86\xE2\x89\x87\xD0\x9D\xD0\xBD\xE2\x80\x93\xE2\x89\xA0\xE2\x86\x97\xE2\x89\xA2\xE2\x88\x84\xE2\x89\xB1\xE2\x89\xB1\xCE\x9D\xCE\xBD\xE2\x89\xAF\xE2\x86\xAE\xE2\x87\x8E\xE2\x88\x8B\xD0\x8A\xD1\x9A\xE2\x86\x9A\xE2\x87\x8D\xE2\x80\xA5\xE2\x89\xB0\xE2\x89\xB0\xE2\x89\xAE\xE2\x8B\xAA\xE2\x8B\xAC\xE2\x88\xA4\xC2\xAC\xE2\x88\x89\xE2\x88\xA6\xE2\x8A\x80\xE2\x8B\xA0\xE2\x86\x9B\xE2\x87\x8F\xE2\x8B\xAB\xE2\x8B\xAD\xE2\x8A\x81\xE2\x8B\xA1\xE2\x89\x81\xE2\x89\x84\xE2\x88\xA6\xE2\x8A\x84\xE2\x8A\x88\xE2\x8A\x88\xE2\x8A\x85\xE2\x8A\x89\xE2\x8A\x89\xC3\x91\xC3\xB1\xCE\x9D\xCE\xBD#\xE2\x84\x96\xE2\x80\x87\xE2\x8A\xAC\xE2\x8A\xAD\xE2\x8A\xAE\xE2\x8A\xAF\xE2\x86\x96\xCE\x8C\xCF\x8C\xC3\x93\xC3\xB3\xE2\x8A\x9B\xE2\x8A\x9A\xC3\x94\xC3\xB4\xD0\x9E\xD0\xBE\xE2\x8A\x9D\xC5\x90\xC5\x91\xE2\x8A\x99\xC5\x92\xC5\x93\xCB\x9B\xCE\x9F\xCE\xBF\xC3\x92\xC3\xB2\xCE\x8F\xCF\x8E\xCE\xA9\xCF\x89\xCE\xA9\xE2\x86\xBA\xE2\x80\xBE\xC5\x8C\xC5\x8D\xCE\xA9\xCF\x89\xCE\x9F\xCE\xBF\xE2\x8A\x96\xE2\x8A\x95\xE2\x88\xA8\xE2\x86\xBB\xE2\x84\xB4\xC2\xAA\xC2\xBA\xE2\x93\x88\xC3\x98\xC3\xB8\xE2\x8A\x98\xC3\x95\xC3\xB5\xE2\x8A\x97\xC3\x96\xC3\xB6\xE2\x88\xA5\xC2\xB6\xE2\x88\x82\xD0\x9F\xD0\xBF%.\xE2\x80\xB0\xE2\x8A\xA5\xCE\xA0\xCF\x80\xCE\xA6\xCF\x86\xCE\xA6\xCF\x86\xCF\x86\xCF\x95\xE2\x84\xB3\xE2\x98\x8E\xCE\xA0\xCF\x80\xCF\x96\xE2\x84\x8F+\xE2\x8A\x9E\xE2\x88\x94\xC2\xB1\xC2\xA3\xE2\x89\xBA\xE2\x89\xBC\xE2\x80\xB2\xE2\x80\xB3\xE2\x8B\xA8\xE2\x88\x8F\xE2\x88\x9D\xE2\x89\xBE\xCE\xA8\xCF\x88\xCE\xA8\xCF\x88\xE2\x80\x88\?\"\xE2\x87\x9B\xC5\x94\xC5\x95\xE2\x88\x9A\xE3\x80\x89\xC2\xBB\xE2\x86\x92\xE2\x86\xA0\xE2\x87\x92\xE2\x87\x89\xE2\x86\xAA\xE2\x86\xAC\xE2\x86\xA3\xE2\x86\x9D\xC5\x98\xC5\x99\xC5\x96\xC5\x97\xE2\x8C\x89}\xD0\xA0\xD1\x80\xE2\x80\x9D\xE2\x80\x9C\xE2\x84\x9C\xE2\x96\xAD\xC2\xAE\xE2\x8C\x8B\xCE\xA1\xCF\x81\xE2\x87\x81\xE2\x87\x80\xCE\xA1\xCF\x81\xCF\xB1\xCB\x9A\xE2\x87\x84\xE2\x87\x8C\xE2\x80\x8F)\xE2\x80\xBA\xE2\x86\xB1]\xE2\x80\x99\xE2\x80\x98\xE2\x8B\x8C\xE2\x8B\x8A\xE2\x96\xB9\xE2\x8A\xB5\xE2\x96\xB8\xE2\x84\x9E\xC5\x9A\xC5\x9B\xE2\x88\x90\xE2\x80\x9A\\\xE2\x89\xBB\xC5\xA0\xC5\xA1\xE2\x89\xBD\xE2\x89\xBD\xC5\x9E\xC5\x9F\xC5\x9C\xC5\x9D\xE2\x8B\xA9\xE2\x89\xBF\xD0\xA1\xD1\x81\xE2\x8B\x85\xE2\x8A\xA1\xC2\xA7;\xE2\x88\x96\xE2\x9C\xB6\xCF\x82\xE2\x8C\xA2\xCE\xA3\xCF\x83\xE2\x99\xAF\xD0\xA9\xD1\x89\xD0\xA8\xD1\x88\xC2\xAD\xCE\xA3\xCF\x83\xCF\x82\xCF\x82\xE2\x88\xBC\xE2\x89\x83\xE2\x8C\xA3\xD0\xAC\xD1\x8C/\xE2\x99\xA0\xE2\x88\xA5\xE2\x8A\x93\xE2\x8A\x94\xE2\x8A\x8F\xE2\x8A\x91\xE2\x8A\x90\xE2\x8A\x92\xE2\x96\xA1\xE2\x96\xA1\xE2\x96\xAA\xE2\x88\x96\xE2\x8C\xA3\xE2\x8B\x86\xE2\x98\x86\xE2\x98\x85\xE2\x8A\x82\xE2\x8B\x90\xE2\x8A\x86\xE2\x8A\x86\xE2\x8A\x8A\xE2\x8A\x8A\xE2\x88\x91\xE2\x99\xAA\xE2\x8A\x83\xE2\x8B\x91\xC2\xB9\xC2\xB2\xC2\xB3\xE2\x8A\x87\xE2\x8A\x87\xE2\x8A\x8B\xE2\x8A\x8B\xC3\x9F\xE2\x8C\x96\xCE\xA4\xCF\x84\xC5\xA4\xC5\xA5\xC5\xA2\xC5\xA3\xD0\xA2\xD1\x82\xE2\x83\x9B\xE2\x8C\x95\xCE\xA4\xCF\x84\xE2\x88\xB4\xCE\x98\xCE\xB8\xCE\xB8\xCF\x91\xCF\x91\xCE\x98\xCE\xB8\xE2\x80\x89\xE2\x89\x88\xE2\x88\xBC\xC3\x9E\xC3\xBE\xCB\x9C\xC3\x97\xE2\x8A\xA0\xE2\x8A\xA4\xE2\x80\xB4\xE2\x84\xA2\xE2\x89\x9C\xD0\xA6\xD1\x86\xD0\x8B\xD1\x9B\xC5\xA6\xC5\xA7\xE2\x89\xAC\xCE\x8E\xCF\x8D\xC3\x9A\xC3\xBA\xE2\x86\x91\xE2\x87\x91\xE2\x87\x88\xD0\x8E\xD1\x9E\xC5\xAC\xC5\xAD\xC3\x9B\xC3\xBB\xD0\xA3\xD1\x83\xC5\xB0\xC5\xB1\xCE\xB0\xCE\xAB\xCF\x8B\xCE\xA5\xCF\x85\xC3\x99\xC3\xB9\xE2\x86\xBF\xE2\x86\xBE\xE2\x96\x80\xE2\x8C\x9C\xE2\x8C\x8F\xC5\xAA\xC5\xAB\xC2\xA8\xC5\xB2\xC5\xB3\xE2\x8A\x8E\xCE\xA5\xCF\x85\xCF\x92\xCE\xA5\xCF\x85\xE2\x8C\x9D\xE2\x8C\x8E\xC5\xAE\xC5\xAF\xC5\xA8\xC5\xA9\xE2\x96\xB5\xE2\x96\xB4\xC3\x9C\xC3\xBC\xE2\x86\x95\xE2\x87\x95\xD0\x92\xD0\xB2\xE2\x8A\xA2\xE2\x8A\xA8\xE2\x8A\xA9\xE2\x8A\xBB\xE2\x8B\xAE|\xE2\x80\x96\xE2\x8A\xB2\xE2\x80\xB2\xE2\x88\x9D\xE2\x8A\xB3\xE2\x8A\x8A\xE2\x8A\x8A\xE2\x8A\x8B\xE2\x8A\x8B\xE2\x8A\xAA\xC5\xB4\xC5\xB5\xE2\x89\x99\xE2\x84\x98\xE2\x89\x80\xE2\x97\x8B\xE2\x96\xBD\xCE\x9E\xCE\xBE\xE2\x86\x94\xE2\x86\x94\xCE\x9E\xCE\xBE\xE2\x87\x90\xE2\x87\x92\xE2\x96\xB3\xC3\x9D\xC3\xBD\xD0\xAF\xD1\x8F\xC5\xB6\xC5\xB7\xD0\xAB\xD1\x8B\xC2\xA5\xD0\x87\xD1\x97\xD0\xAE\xD1\x8E\xC3\xBF\xC5\xB8\xC5\xB9\xC5\xBA\xC5\xBD\xC5\xBE\xD0\x97\xD0\xB7\xC5\xBB\xC5\xBC\xCE\x96\xCE\xB6\xCE\x96\xCE\xB6\xD0\x96\xD0\xB6\xE2\x80\x8D\xE2\x80\x8C\xE2\x82\xAC", Scope = Public
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
End Module
#tag EndModule
