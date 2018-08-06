#tag Class
Protected Class ZipSnapshots
	#tag Method, Flags = &h0
		Function AddSnapshot(snapshotName as String, dir as FolderItem, useMacBinary as Integer, followFileAliasesAndSymlinks as Boolean) As Boolean
		  dim ok as Boolean
		  dim n, startPos, endPos as Integer
		  
		  me.errmsg = ""
		  
		  n = Ubound(me.snapshotBegin)
		  if n >= 0 then
		    me.lastSnapshotBegin = snapshotBegin(n)
		    me.lastSnapshotEnd = snapshotEnd(n)
		    me.lastSnapshotName = snapshotName_(n)
		  end
		  
		  zar.Mark // mark the original archive state so that we can roll back in case the adding fails
		  
		  // add the snapshot prefix identifier
		  startPos = zar.AddItemByStreams(nil, 0, nil, 0, nil, me.markStart+zar.CleanName(snapshotName), nil, new Date)
		  if startPos >= 1 then
		    // add the folder items to the archive
		    ok = me.z_addFolder(zar.CleanName(snapshotName)+"/", "", dir, useMacBinary, followFileAliasesAndSymlinks)
		    if ok then
		      // add the snapshot suffix identifier
		      endPos = zar.AddItemByStreams(nil, 0, nil, 0, nil, me.markEnd+zar.CleanName(snapshotName), nil, new Date)
		      if endPos >= 1 then
		        // write the archive completely to disk
		        ok= zar.Flush
		        if ok then
		          me.snapshotBegin.Append startPos
		          me.snapshotEnd.Append endPos
		          me.snapshotName_.Append snapshotName
		          return true
		        end
		      end
		    end
		  end
		  
		  if me.errmsg = "" then
		    me.errmsg = zar.ErrorMessage
		  end
		  
		  ok = zar.Rollback
		  ok = zar.Flush
		  return false
		  
		  Exception exc as RuntimeException
		    me.errmsg = "Exception in AddSnapshot()"
		    ok = zar.Rollback
		    return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(archive as ZipArchive)
		  //
		  // Preconditions:
		  //   - archive must be open.
		  
		  if not archive.IsOpen then
		    raise new RuntimeException
		  end
		  
		  me.zar = archive
		  
		  me.markStart = "snapshot-begin-"
		  me.markEnd = "snapshot-end-"
		  
		  z_getSnapshots
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ErrorMessage() As String
		  return me.errmsg
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractFromSnapshot(snapshotIndex_1 as Integer, destDir as FolderItem, aliasHandling as Integer, Byref hadOverflow as Boolean) As Boolean
		  // 'aliasHandling': Pass one of the following functions: OverwriteAliases, SkipAliases, FollowAliases
		  dim nameOverflow as Boolean
		  dim i, thisSnapshotBegin, thisSnapshotEnd , n as Integer
		  dim thisSnapshotName as String
		  dim e as ZipEntry
		  dim f as FolderItem
		  
		  hadOverflow = false
		  me.errmsg = ""
		  
		  if aliasHandling < 1 or aliasHandling > 3 then
		    me.errmsg = "Illegal value passed to 'aliasHandling'"
		    return false
		  end
		  
		  if snapshotIndex_1 < 1 then
		    raise new OutOfBoundsException
		  end
		  n = snapshotIndex_1 - 1
		  thisSnapshotBegin = snapshotBegin(n)+1
		  thisSnapshotEnd = snapshotEnd(n)-1
		  thisSnapshotName = snapshotName_(n)
		  
		  for i = thisSnapshotBegin to thisSnapshotEnd
		    e = zar.Entry(i)
		    e.EnableFileLocking true
		    f = z_makeDestination(e, destDir, aliasHandling = 1)
		    if aliasHandling = 2 and f.Alias then
		      // skip this item
		    elseif not e.Extract(f) then
		      me.errmsg = zar.ErrorMessage+" ("+e.RawPath+")"
		      return false
		    else
		      // extraction succeeded
		      if TargetMacOS and Len(f.Name) <> Len(f.DisplayName) then
		        // Note: I (TT) am not 100% sure that the above test is always detecting
		        // an overflow when having non-ASCII chars in file names.
		        nameOverflow = true
		      end
		    end
		  next
		  
		  hadOverflow = nameOverflow
		  return true
		  
		  Exception exc as RuntimeException
		    me.errmsg = "Exception in ExtractFromSnapshot()"
		    return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FollowAliases() As Integer
		  // Pass this function result to the 'aliasHandling' parameter of ExtractFromSnapshot() if
		  // Alias files that exist at the destination shall be followed so that the file they point to will
		  // be replaced with the item from the archive
		  
		  return 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSnapshotEmpty(index_1 as Integer) As Boolean
		  return me.snapshotBegin(index_1-1)+1 = me.snapshotEnd(index_1-1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OverwriteAliases() As Integer
		  // Pass this function result to the 'aliasHandling' parameter of ExtractFromSnapshot() if
		  // Alias files that exist at the destination shall be replaced with the item from the archive
		  
		  return 3
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveSnapshot(index_1 as Integer) As Boolean
		  dim ok as Boolean
		  dim i, thisSnapshotBegin, thisSnapshotEnd , n as Integer
		  dim thisSnapshotName as String
		  
		  me.errmsg = ""
		  
		  n = index_1 - 1
		  thisSnapshotBegin = me.snapshotBegin(n)
		  thisSnapshotEnd = me.snapshotEnd(n)
		  thisSnapshotName = me.snapshotName_(n)
		  
		  for i = thisSnapshotEnd downto thisSnapshotBegin
		    if not zar.RemoveEntry(i) then
		      me.errmsg = "Removing a snapshot failed (1): "+zar.ErrorMessage
		      return false
		    end
		  next
		  
		  if not zar.Compact() then
		    me.errmsg = "Removing a snapshot failed (2): "+zar.ErrorMessage
		    return false
		  end
		  
		  ok = zar.Flush
		  
		  me.snapshotBegin.Remove n
		  me.snapshotEnd.Remove n
		  me.snapshotName_.Remove n
		  
		  return true
		  
		  Exception exc as RuntimeException
		    me.errmsg = "Exception in RemoveSnapshot()"
		    return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SkipAliases() As Integer
		  // Pass this function result to the 'aliasHandling' parameter of ExtractFromSnapshot() if
		  // items shall not be extracted if an Alias file exists at their destination.
		  
		  return 2
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SnapshotCount() As Integer
		  return Ubound(me.snapshotBegin)+1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SnapshotName(index_1 as Integer) As String
		  if index_1 < 1 then
		    raise new OutOfBoundsException
		  end
		  return me.snapshotName_(index_1-1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function z_abort(f as FolderItem, code as Integer, msg as String, canCont as Boolean) As Boolean
		  dim abort as Boolean
		  me.errmsg = msg
		  if me.monitor <> nil then
		    if not canCont then abort = true
		    me.monitor.ZipFileError(f, code,msg, abort)
		  else
		    abort = true
		  end
		  return not canCont or abort
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function z_addFolder(snapshot as String, prefixDOSPath as String, folder as FolderItem, useMacBinary as Integer, followFileAliasesAndSymlinks as Boolean) As Boolean
		  dim entry as ZipEntry
		  dim result, idx as Integer
		  dim name as String
		  dim f, files(-1), folders(-1) as TTsFolderItem
		  dim abort as Boolean
		  
		  if folder = nil then
		    me.errmsg = "no folder reference given"
		    return false
		  end
		  
		  me.monitor = zar.ProgressMonitor()
		  
		  // first, we collect all file and folder items into an array
		  
		  idx = 1
		  do
		    dim f0 as FolderItem
		    f0 = folder.TrueItem(idx)
		    if f0 = nil then
		      exit // end of files in this folder
		    end
		    f = new TTsFolderItem(f0)
		    if f.Visible or me.IncludeHiddenItems then // !TT 23Apr03: hidden items won't be added to the snapshot any more by default
		      if f.IsMacAlias or f.IsSymlink then
		        if followFileAliasesAndSymlinks then
		          f0 = folder.Child(f0.Name) // resolve alias
		          if f0.Directory then
		            f = nil // ignore aliases pointing to dirs to avoid endless recursion problems
		          else
		            f = new TTsFolderItem(f0)
		          end
		        else
		          f = nil // ignore all aliases
		        end
		      end
		      if f <> nil then
		        if f.Directory then
		          folders.append f
		        else
		          files.append f
		        end
		      end
		    end
		    idx = idx + 1
		  loop
		  
		  // now we add all the files from this folder to the archive
		  
		  for idx = 0 to Ubound(files)
		    f = files(idx)
		    abort = false
		    if me.monitor <> nil then
		      me.monitor.ZipFileStarting f, abort
		    end
		    if abort then
		      return false
		    end
		    name = prefixDOSPath+zar.CleanName(f.Name)
		    entry = z_findInLastSnapshot(name)
		    dim l1, l2 as Int64
		    l1 = f.modificationDate.TotalSeconds
		    l2 = entry.Time.TotalSeconds
		    if entry = nil or l1 <> l2 then
		      // add new item
		      result = zar.AddItemWithRawPath(f, snapshot+name, useMacBinary)
		      if result > 0 then
		        me.AddedNewItem = true
		      end
		    else
		      // just add new ref to existing item in archive
		      result = zar.AddFakeDuplicate(entry, snapshot+name, f.modificationDate, nil)
		    end
		    if result <= 0 then
		      if z_abort(f, result, me.errmsg, not abort) then
		        abort = true
		      end
		    end
		    if abort then
		      return false
		    end
		  next
		  redim files(-1) // free the used space before the recursion happens to save some memory
		  
		  // finally we add all the folders inside this folder to the archive
		  
		  while Ubound(folders) >= 0
		    f = folders(0)
		    folders.Remove 0
		    if not me.z_addFolder(snapshot, prefixDOSPath+zar.CleanName(f.Name)+"/", f, useMacBinary, followFileAliasesAndSymlinks) then
		      return false
		    end
		  wend
		  
		  return true // success
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function z_findInLastSnapshot(path as String) As ZipEntry
		  dim pos, i as Integer
		  dim e as ZipEntry
		  
		  pos = Len(me.lastSnapshotName)+2
		  
		  for i = me.lastSnapshotBegin+1 to me.lastSnapshotEnd-1
		    e = zar.Entry(i)
		    if e.SameRawPath(me.lastSnapshotName+"/"+path) then
		      return e
		    end
		  next
		  
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub z_getSnapshots()
		  dim i, pos as Integer, s, found as String, e as ZipEntry
		  
		  redim me.snapshotBegin(-1)
		  redim me.snapshotEnd(-1)
		  redim me.snapshotName_(-1)
		  
		  for i = 1 to me.zar.EntryCount
		    e = zar.Entry(i)
		    s = e.RawPath
		    if Left(s, Len(me.markStart)) = me.markStart then
		      found = Mid(s, Len(me.markStart)+1)
		      pos = i
		    elseif Left(s, Len(me.markEnd)) = me.markEnd then
		      if found = Mid(s, Len(me.markEnd)+1) then
		        me.snapshotBegin.Append pos
		        me.snapshotEnd.Append i
		        me.snapshotName_.Append found
		      end
		      found = ""
		    elseif Left(s, Len(found)+1) <> found+"/" then
		      // all entries in the snapshot-range must be subdirs of that snapshot name
		      found = ""
		    end
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function z_makeDestination(e as ZipEntry, dir as FolderItem, followAliases as Boolean) As FolderItem
		  dim names(-1) as String, i as Integer
		  dim f as FolderItem
		  
		  e.GetPath(names)
		  f = dir
		  for i = 1 to Ubound(names)
		    f = e.MakeDestinationChild(f, names(i), followAliases)
		  next
		  
		  return f
		End Function
	#tag EndMethod


	#tag Note, Name = Snapshots format
		
		A snapshot is made of the entire contents of a single folder.
		
		One can add several snapshots of the same folder to the archive.
		Each snapshot will add the entire folder's tree as a new subfolder
		to the archive. Each snapshot has a name, which is the folder name.
		
		The items of the tree will either be fake duplicates in case
		they're the same as the ones in the previous snapshot,
		or will be added items in case the were added to the tree or their
		data (modification date) different from the last snapshot. Files
		not present in the tree will also be missing from the new
		snapshot.
		
		Each snapshot starts with a 0-length file entry with a name
		that has the text "snapshot-begin-" plus the name of the subfolder
		of the snapshot, and ends with one where "begin" is replaced by
		"end".
	#tag EndNote


	#tag Property, Flags = &h0
		AddedNewItem As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected errmsg As String
	#tag EndProperty

	#tag Property, Flags = &h0
		IncludeHiddenItems As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected lastSnapshotBegin As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected lastSnapshotEnd As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected lastSnapshotName As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected markEnd As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected markStart As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected monitor As ZipProgressNotifier
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected snapshotBegin(-1) As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected snapshotEnd(-1) As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected snapshotName_(-1) As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected zar As ZipArchive
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AddedNewItem"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IncludeHiddenItems"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
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
