#tag Class
Protected Class ZipArchive
Inherits ZipArchiveBase
	#tag Event
		Sub SetExternalAttributes(f as TTsFolderItem, dos_pathname as String, entry as ZipEntry)
		  // This function gets called by ZipArchiveBase.z_addItem() whenever a folder or file has been
		  // added to the archive.
		  // Its purpose is to set additional values in the zip dir entry, such as the DOS attributes and
		  // Unix file permissions.
		  // You usually do not have to change this code unless you have special needs.
		  
		  #pragma unused dos_pathname
		  
		  dim mode as Integer = f.UnixStatMode
		  if mode <> 0 then
		    // set the unix permissions in the upper 16 bit of the "external attributes"
		    entry.SetOSMadeBy 3 // unix
		    entry.SetExternalFileAttributes (ZipArchiveData.ShiftLeft16(mode) or (entry.ExternalFileAttributes and &hFFFF))
		  end
		  if not f.IsWriteable then
		    // set bit 0 ("read-only") in the DOS File Attribute
		    entry.SetExternalFileAttributes (entry.ExternalFileAttributes or 1)
		  end
		  if not f.Visible then
		    // set bit 1 ("hidden") in the DOS File Attribute
		    entry.SetExternalFileAttributes (entry.ExternalFileAttributes or 2)
		  end
		  // The directory bit (#4) should already be set
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function AddFakeDuplicate(entry as ZipEntry, newRawDOSPath as String, newDate as Date, newExtraField as ZipExtraField) As Integer
		  // Caution: This adds a new entry to the central directory, referring to an existing
		  // local entry. This added entry's file name, date and Extra Field may differ from
		  // the local header, which means it may not be seen as valid by other Zip tools.
		  // Because of this, use this function with caution, preferrably only if you plan
		  // to unpack the archive with this Zip package, which knows about this special case
		  // and does not consider it an error.
		  //
		  // Note that some Zip unarchiving tools cannot handle fake entries. This includes the Unzip
		  // tool the Mac OS X Finder uses to uncompress a Zip archive.
		  //
		  // A fake entry is marked this way: There is a bit in the header flags that indicates whether the
		  // length and CRC information is present right in the header or instead behind the compressed data.
		  // This bit (#3) will set in the central directory header's flags, while it will be clear in the local
		  // header. This combination is not occuring in normal archives, and using this bit for this purpose
		  // ensures that the fake entries can usually still be unpacked in some way using standard zip tools.
		  //
		  // Parameters:
		  //   newRawDOSPath: the new file name and path (stored only in the central dir, not the local header);
		  //     note that this name uses "/" as directory separator (see the CleanName function)
		  //   newDate: if not nil, this date will be recorded as the item's date in the central dir only,
		  //     otherwise the old date will be used.
		  //   newExtraField: if not nil, this new extra field will be stored in the central dir,
		  //     otherwise the old extra field will be used.
		  // Returns the index to the added entry (which is >= 1), or 0 or a negative value in case of an error.
		  
		  dim newEntry as ZipEntry, fh as MemoryBlock, dosEncName as String, ef as ZipExtraField
		  
		  // do we allow writing at all?
		  if not me.writeMode then
		    z_noWriteMsg
		    return 0
		  end
		  
		  if entry = nil then
		    me.errmsg = "no entry reference given"
		    return 0
		  end
		  
		  dosEncName = me.d.encodeForZip(newRawDOSPath)
		  
		  if newExtraField <> nil then
		    ef = newExtraField
		  else
		    ef = entry.ExtraField // we handle EF's as immutable, so we do not need to clone it here
		  end
		  
		  fh = z_cloneMB(entry.z_Header)
		  fh.UShort(28) = LenB(dosEncName)
		  if d <> nil then
		    // update item's date/time
		    fh.UShort(12) = newDate.Second \ 2 + 32 * newDate.Minute + 2048 * newDate.Hour
		    fh.UShort(14) = newDate.Day + 32 * newDate.Month + 512 *  Max(0, newDate.Year-1980)
		  end
		  
		  // let's mark this fake entry so that we can later identify it
		  fh.UInt16Value(8) =  Bitwise.BitOr(fh.UInt16Value(8), 8) // set bit 3 in the Flags field of the central dir header only
		  
		  newEntry = new ZipEntry(me.d, fh, dosEncName, ef, entry.Comment)
		  
		  // add the new entry to the directory and we're finished
		  me.d.entries_1.append newEntry
		  return Ubound(me.d.entries_1)
		  
		  Exception exc as RuntimeException
		    me.errmsg = "An unexpected error occured while adding a duplicate item"
		    return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddFolderContents(folder as FolderItem, prefixDOSPath as String, useMacBinary as Integer, aliasHandling as MacAliasHandling, includeInvisibles as Boolean) As Boolean
		  // Adds an entire folder's contents to the archive. The immediate contents of
		  //   the given folder will be put relatively to the "prefixDOSPath". Pass an
		  //   empty string or "/" to store them in the root of the archive directory
		  //   (a leading "/" in the string will always be ignored).
		  //   Be careful not to blindly pass names of FolderItems here, because they might
		  //   contain "/", which is a valid name char in Mac OS 9 but not in Windows.
		  //   Use ZipArchive.CleanName() on a name to change a FolderItem.Name into a
		  //   valid zip file name.
		  // To store or follow aliases, pass any of the ZipArchive.MacAliasHandling enum
		  //   values. Note that you can not have Aliases to folders followed because this
		  //   could lead to infinite loops (a safety check for this could be added but has
		  //   not yet). Note that even if useMacBinary is FALSE, it will be temporarily
		  //   enabled to store any aliases.
		  // useMacBinary: pass either of the MacBinary... functions from this class
		  // includeInvisibles: pass false if you do not want hidden files and folder stores
		  //   (this includes, on OSX and Linux, files starting with a period such as ".DS_Store")
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  // - Archive was opened for writing
		  
		  dim s as String
		  
		  if not me.writeMode then
		    z_noWriteMsg
		    return false
		  end
		  
		  s = ReplaceAll(prefixDOSPath+"/","//","/")
		  
		  return z_addFolderContents(folder, s, aliasHandling, useMacBinary, includeInvisibles, false, true) = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddItemByStreams(dataStream as SeqDataInputStream, dataLen as Integer, rsrcStream as SeqDataInputStream, rsrcLen as Integer, macBinaryHeader as MemoryBlock, rawDOSPath as String, extra as ZipExtraField, fileDate as Date) As Integer
		  // Like AddItemWithRawPath, but allows you to provide the data and resource fork
		  //   streams separately.
		  // If you want the item stored with a resource fork, then it will be stored in
		  //   MacBinary format, which also means you have to provide the MacBinary
		  //   header explicitly. Call MakeMacBinaryHeader() and pass its value as the
		  //   'macBinaryHeader' parameter to this function.
		  //
		  // Be careful not to pass a macBinaryHeader for folders (it's a folder if rawDOSPath
		  //   end with a "/"), because that would cause confusion when unpacking them
		  //   with software that is not MacBinary-aware (which is the case for most
		  //   non-Mac tools).
		  //
		  // Preconditions:
		  //   if 'macBinaryHeader' is nil, then the 'rsrcStream' parameter must be nil, too
		  //   if 'rsrcStream' is not nil, then the 'macBinaryHeader' parameter must not be
		  //     nil, either.
		  
		  dim idx as Integer
		  dim mbHdr as MemoryBlock
		  
		  if macBinaryHeader = nil and rsrcStream <> nil then
		    raise new RuntimeException // not allowed, see preconditions above
		  end
		  
		  if not me.writeMode then
		    z_noWriteMsg
		    return 0
		  end
		  
		  idx = z_zip(dataStream, dataLen, rsrcStream, rsrcLen, mbHdr, rawDOSPath, fileDate, extra, true)
		  
		  return idx
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddItemToRoot(f as FolderItem, useMacBinary as Integer, mayCompress as Boolean = true) As Integer
		  // Stores (and compresses) a file or folder in the archive. It does
		  //  this by appending the file data always to the end of the archive,
		  //  never replacing existing, even deleted, space in the middle of it.
		  // This also appends the entry to the list of entries (directory).
		  // A ZipEntry object is created that describes the stored item,
		  //   f.name as the item's name. This entry is appended to the list of
		  //   archive entries and its index is returned by this function.
		  // If this function returns 0 or a negative number, an error had
		  //   occured (ErrorMessage() will then provide a descriptive msg).
		  // The path, comment and other information may then be modified
		  //   by fetching the entry with Entry(), then calling the entry's
		  //   Set... methods.
		  // useMacBinary: pass either of the MacBinary... functions from this class
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  // - Archive was opened for writing
		  // - The file's size must be below 2GB (2^31) - a ZIP limitation
		  
		  dim name as String
		  
		  if f <> nil then
		    name = me.d.cleanName(f.name)
		    if f.Directory then
		      name = name + "/"
		    end
		  end
		  
		  return z_addItem(new TTsFolderItem(f), name, useMacBinary, false, mayCompress)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddItemWithRawPath(f as FolderItem, rawDOSPath as String, useMacBinary as Integer) As Integer
		  // Like AddItemToRoot(), but allows you to provide the name as it shall
		  //   appear in the archive directory. You can construct this name by
		  //   using one of the two RawPath() functions.
		  
		  return z_addItem(new TTsFolderItem(f), rawDOSPath, useMacBinary, false, true)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AllEntriesAsRawPaths() As String()
		  // Returns an array of all current entries in the directory. Useful for debugging.
		  //
		  // To quickly view the list, use either:
		  //   MsgBox Join(zar.AllEntriesAsRawPaths(), EndOfLine)
		  // or:
		  //   System.DebugLog Join(zar.AllEntriesAsRawPaths(), EndOfLine)
		  
		  dim list() as String
		  dim idx, lastIdx as Integer
		  lastIdx = Ubound(me.d.entries_1)
		  for idx = 1 to lastIdx
		    list.Append me.d.entries_1(idx).RawPath()
		  next
		  return list
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ArchiveSize() As Int64
		  // Caution: This gives only the correct result if the archive has not been modified
		  // or after a Flush or Compact call!
		  
		  return me.d.theFile.Length
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalcFolderSize(folder as FolderItem, useMacBinary as Integer, aliasHandling as MacAliasHandling, includeInvisibles as Boolean) As Int64
		  // Calculates the size of all items to store in the archive, without actually adding them.
		  // Useful to know in advance when showing a progress bar during the actual archiving process.
		  
		  return z_addFolderContents(folder, "", aliasHandling, useMacBinary, includeInvisibles, true, false)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalcItemSize(f as FolderItem, useMacBinary as Integer) As Int64
		  // returns the size that the file would report via the ZipProgressNotifier
		  // when it would be stored in the archive using AddItem...()
		  
		  return z_addItem(new TTsFolderItem(f), "", useMacBinary, true, false)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CleanName(s as String) As String
		  // If you want to pass an existing file name to the "DOSPath" parameter of
		  // one of the Add... functions, you should clean this name with this function first!
		  
		  // "/" and "\" are illegal chars in DOS file names and Zip archives, so we need to replace them with legal chars:
		  return me.d.cleanName(s)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Close() As Boolean
		  // Closes access to an opened archive, writing back all changes to the entries list (directory)
		  // Returns FALSE if an error occured
		  //
		  // Note: If this call fails (i.e. FALSE is returned), the archive is probably corrupted
		  // and should be deleted if it was just created. In other cases, other tools might be
		  // able to recover part or all of the archive (but this software is not designed for it)
		  //
		  // May be called even if no archive was open (returns TRUE then)
		  
		  dim error as Boolean
		  
		  if me.d = nil or me.d.zipStream = nil then
		    return true
		  end
		  
		  if not z_writeDirectory() then
		    error = true
		  end
		  
		  me.d.zipStream.Close
		  me.d.zipStream = nil
		  redim me.d.entries_1(0)
		  me.entriesRead = false
		  me.justCreated = false
		  me.marked = false
		  me.writeMode = false
		  me.writeSequentially = false
		  return not error
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Comment() As String
		  // Returns the optional comment about the archive. Returns empty string if no comment available
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  
		  return me.comment_
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Compact() As Boolean
		  // Rewrites the entire archive, removing any unused
		  //   (i.e. deleted) space in between.
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  // - Archive was opened for writing
		  
		  dim flags as UInt64
		  dim i, n, entryCnt as Integer, e as ZipEntry, fh, hdr as MemoryBlock
		  dim lastOffset, readpos, writepos as Int64, error as Boolean
		  dim zipStream as BinaryStream
		  
		  if not me.writeMode then
		    z_noWriteMsg
		    return false
		  end
		  
		  zipStream = me.d.zipStream
		  
		  // How this will work:
		  // A list of all the entries is created, then this list is sorted
		  //   by the offset of their compressed data in the archive.
		  // Then the archive will be rewritten, skipping parts that
		  //   are between these entries.
		  
		  entryCnt = Ubound(me.d.entries_1)
		  n = entryCnt - 1
		  redim me.compactEntries(n) // sorted index of entries
		  redim me.compactOffset(n) // sorted offset of entries' data
		  
		  for i = 1 to entryCnt
		    e = me.d.entries_1(i)
		    hdr = e.z_Header()
		    me.compactEntries(i-1) = hdr
		    me.compactOffset(i-1) = hdr.UInt32Value(42)
		  next
		  
		  z_ArrayQuickSort(0, Ubound(me.compactEntries))
		  
		  // now the list has been sorted and we can begin to rewrite the archive
		  
		  // Note: With the possible presence of fake entries, it gets complicated.
		  // A fake entry does not provide the real size of the local entry. This
		  // means that the local header has to be read to figure out its real size.
		  // For this reason we do read every local header, even if readpos
		  // equals writepos.
		  
		  me.marked = false
		  me.d.dirty = true
		  
		  fh = new MemoryBlock(30)
		  fh.LittleEndian = true
		  
		  n = 0
		  writepos = 0
		  lastOffset = -1
		  for i = 0 to Ubound(me.compactEntries)
		    readpos = me.compactOffset(i)
		    hdr = me.compactEntries(i)
		    if lastOffset = readpos then
		      // this comes from a repeat (fake) entry - repeat with the last written item
		    else
		      writepos = writepos + n
		      
		      // read the Local File Header
		      zipStream.Position = readpos
		      fh.StringValue(0,30) = zipStream.Read(30)
		      // make sure the data is consistent with our Directory record
		      if fh.Long(0) <> &h04034B50 then
		        me.errmsg = "Invalid Local File Header signature (archive appears to be severely corrupted)"
		        error = true
		        exit
		      end
		      
		      dim forceRewrite as Boolean
		      
		      flags = fh.UInt16Value(6)
		      if Bitwise.BitAnd(flags,8) <> 0 then
		        // we can now remove the Data Descriptor and update the File Header fields properly
		        fh.Long(14) = hdr.Long(16)
		        fh.Long(18) = hdr.Long(20)
		        fh.Long(22) = hdr.Long(24)
		        fh.UInt16Value(6) = Bitwise.BitAnd(flags,65535-8)
		        forceRewrite = true
		      end
		      // make sure the values match those from the directory
		      if fh.UShort(8) <> hdr.UShort(10) or fh.Long(14) <> hdr.Long(16) or fh.Long(18) <> hdr.Long(20) or fh.Long(22) <> hdr.Long(24) or (flags <> hdr.UInt16Value(8)) and not me.d.isFakeEntry(hdr,flags) then
		        // oops, something does not fit. Could be an error in the archive, or in our code here.
		        // let's better not mess any further with it.
		        me.errmsg = "File Headers mismatch (archive appears to be severely corrupted)"
		        error = true
		        exit
		      end
		      n = 30 + fh.Long(18) + fh.UShort(26) + fh.UShort(28)
		      if readpos <> writepos or forceRewrite then
		        zipStream.Position = writepos
		        zipStream.Write fh.StringValue(0,30)
		        z_copy readpos+30, writepos+30, n - 30
		      end
		      lastOffset = readpos
		    end
		    // finally, update the offset of this file in the directory entry
		    hdr.UInt32Value(42) = writepos
		  next
		  
		  if not error then
		    me.startOfDirInArchive = writepos + n
		  end
		  
		  // free up the space used by the class-wide arrays
		  redim me.compactEntries(-1)
		  redim me.compactOffset(-1)
		  return not error
		  
		  Exception exc as RuntimeException
		    me.errmsg = "Compact() encountered an unexpected error"
		    // free up the space used by the class-wide arrays
		    redim me.compactEntries(-1)
		    redim me.compactOffset(-1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // default constructor
		  
		  z_setup
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DefaultOSMadeBy() As Integer
		  return me.d.defaultOSMadeBy
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Destructor()
		  // destructor
		  
		  dim ok, deleteIfFails as Boolean
		  
		  if me.d <> nil and me.d.zipStream <> nil and me.justCreated then
		    deleteIfFails = true
		  end
		  
		  ok = me.Close()
		  if not ok and deleteIfFails and me.d.theFile <> nil then
		    me.d.theFile.Delete
		  end
		  
		  Exception exc as RuntimeException
		    // ignore
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function EncodedAsDOSLatinUS() As TextEncoding
		  // Use this to open archives created or meant for most Zip tools (on PCs, Unix, Linux, etc.)
		  // Pass the result of this function to the 3rd parameter of Open()
		  
		  return GetTextEncoding(&H400) // code page 437
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function EncodedAsMacDefault() As TextEncoding
		  // Use this to open archives created by or for ZipIt up to v2.2 (http://www.maczipit.com/)
		  // Note: This call does not work on Windows, only on Mac OS, so avoid this
		  //   encoding if you create archives for interchange with Windows.
		  // Pass the result of this function to the 3rd parameter of Open()
		  
		  static enc as TextEncoding
		  
		  if enc = nil then
		    enc = GetFontTextEncoding("System")
		    if enc = nil then
		      enc = Encodings.MacRoman
		    end if
		  end
		  
		  return enc
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function EncodedAsUnicode() As TextEncoding
		  // Use this to open archives created by or for ZipIt v2.2.2 or later (http://www.maczipit.com/)
		  // Use this also if you're planning to read/write the archive only with this software, because
		  // the use of Unicode is causing the least amout of problems with all the possible languages (scripts)
		  // Pass the result of this function to the 3rd parameter of Open()
		  
		  return Encodings.UTF8
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function EncodedAsWinLatin1() As TextEncoding
		  // Use this to open archives created by or for Aladdin's Stuffit (http://www.aladdinsys.com/)
		  // Pass the result of this function to the 3rd parameter of Open()
		  
		  return GetTextEncoding(&H500) // WinLatin1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Entry(index_1 as Integer) As ZipEntry
		  // Returns an entry from the directory of files in the archive.
		  // The index starts with 1, and must be between 1 and EntryCount()
		  // The entries have no particular order, and may contain directory entries
		  //   with no actual file data.
		  // Be aware that the Zip format allows it that several entries with the same
		  //   name exist in the archive. So, if you extract all entries, be aware that you
		  //   might get duplicate name conflicts.
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  
		  if not me.entriesRead then
		    // oops - archive is not open
		    raise new RuntimeException
		  end
		  
		  if index_1 < 1 then
		    raise new OutOfBoundsException // index must be at least 1
		  end
		  
		  return me.d.entries_1(index_1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EntryCount() As Integer
		  // Returns the number of entries from the directory of files in the archive.
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  
		  if not me.entriesRead then
		    // oops - archive is not open
		    raise new RuntimeException
		  end
		  
		  return Ubound(me.d.entries_1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EntryIdxByRawPath(path as String, startIdx as Integer = 1) As Integer
		  // Looks up an entry by name, starting either at the start of the list of entries or at the given index (which has to be between 1 and EntryCount+1)
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  
		  if not me.entriesRead then
		    // oops - archive is not open
		    raise new RuntimeException
		  end
		  
		  if startIdx < 1 or startIdx > EntryCount+1 then
		    raise new OutOfBoundsException // index must be at least 1
		  end
		  
		  return me.d.lookup (me.z_pathToEncName(path), startIdx)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ErrorMessage() As String
		  // Returns a description about the latest error as an english phrase
		  //
		  // Function calls that could cause such an error:
		  // - Open()
		  // - Close()
		  // - AddItemToRoot()
		  // - AddItemWithRawPath()
		  // - AddItemByStreams()
		  // - AddFolderContents()
		  // - AddFakeDuplicate()
		  // - Compact()
		  // - RemoveEntry()
		  // - ReplaceEntry()
		  // - SetComment()
		  
		  return me.errmsg
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Flush() As Boolean
		  // Write the directory information back to the archive
		  //   so that it's in a valid state. You might want to call
		  //   this after you made changes to an archive but plan
		  //   to keep the archive open for longer.
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  
		  if not me.writeMode then
		    z_noWriteMsg
		    return false
		  end
		  
		  if not me.entriesRead then
		    // oops - archive is not open
		    raise new RuntimeException
		  end
		  
		  if not z_writeDirectory() then
		    return true // we just ignore Flush calls on a read-only archive
		  end
		  
		  if not z_writeDirectory() then
		    return false
		  end
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOfEntry(entry as ZipEntry) As Integer
		  // Returns 0 if not found
		  
		  dim idx as Integer
		  idx = me.d.entries_1.IndexOf(entry)
		  if idx > 0 then
		    return idx
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsCorrupted() As Boolean
		  return me.centralDirCorrupted
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsOpen() As Boolean
		  // Returns TRUE if archive is opened
		  
		  return me.d.zipStream <> nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsValidName(itemName as String) As Boolean
		  // Tells whether the given file or folder name can be used in
		  //   the archive directory unmodified.
		  // Returns FALSE if the name contains illegal chars, such as "/",
		  //   returns TRUE otherwise.
		  
		  return itemName = me.d.cleanName(itemName)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsWritable() As Boolean
		  // Returns TRUE if archive is open and was opened in write mode
		  
		  return me.d.zipStream <> nil and me.writeMode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeMacBinaryHeader(f as FolderItem) As MemoryBlock
		  // Use this if you plan to call 'AddItemAsStreams' and plan to
		  //   add all forks of this folderItem.
		  
		  return z_makeMBHdr(f.Length, f.ResourceForkLength, f.Name, f.MacType, f.MacCreator, f.CreationDate, f.ModificationDate, f)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeMacBinaryHeader(f as FolderItem, dataLen as UInt64, rsrcLen as Integer, macName as String) As MemoryBlock
		  // Use this if you plan to call 'AddItemAsStreams' and plan not to
		  //   add all forks of this folderItem (if you do not want to add a fork,
		  //   pass 0 for its length).
		  //
		  // Notes:
		  //   'macName' must not be empty. Pass f.Name if in doubt.
		  //   Mind the encoding of 'macName': if it uses any non-ASCII chars, make sure you encode them as MacRoman or
		  //   any other adequate Macintosh encoding. If you pass "f.Name", this will be automatically handled for you.
		  
		  return z_makeMBHdr(dataLen, rsrcLen, macName, f.MacType, f.MacCreator, f.CreationDate, f.ModificationDate, f)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeMacBinaryHeader(dataLen as UInt64, rsrcLen as Integer, macName as String, macType as String, macCreator as String, creationDate as Date, modificationDate as Date) As MemoryBlock
		  // Use this if you plan to call 'AddItemAsStreams' and are running on
		  //   Windows or have other reasons to specify the data explicitly instead
		  //   implicitly by a FolderItem.
		  //
		  // Notes:
		  //   'macName' must not be empty. Pass 'f.Name' if in doubt.
		  //   'modificationDate' and 'creationDate' may be nil
		  //   Mind the encoding of 'macName': if it uses any non-ASCII chars, make sure you encode them as MacRoman or
		  //   any other adequate Macintosh encoding
		  
		  return z_makeMBHdr(dataLen, rsrcLen, macName, macType, macCreator, creationDate, modificationDate, nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeZipExtraField(f as FolderItem) As ZipExtraField
		  // Creates an entry to preserve Mac or Windows specific file or folder information
		  return MakeZipExtraField(f, f.Name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeZipExtraField(f as FolderItem, macName as String) As ZipExtraField
		  // Creates an entry to preserve Mac specific file or folder information
		  //
		  // "macName" is the name the file shall have on a Mac when it's unpacked from the archive again.
		  //   this is relevant if the name contains special chars that are not allowed in the archive directory
		  //   due to DOS naming conventions, and so this Mac name will be stored in a separate place.
		  // If you pass an empty string, the shorter ZipIt-specific field (code &H2605) will be used,
		  //   but you must not allow this if you're also writing a MacBinary header, because ZipIt expects
		  //   to find the longer field (code &H2705) in oder to detect a MacBinary header automatically!
		  
		  #if TargetMacOS
		    // if neither name nor type&creator are available, we don't need to do this
		    static NullType as String = new MemoryBlock(4)
		    if macName <> "" or (not f.Directory and (f.MacType<>NullType or f.MacCreator<>NullType)) then
		      return MakeZipExtraField(f.MacType, f.MacCreator, macName)
		    end
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeZipExtraField(fieldData as String) As ZipExtraField
		  // Constructor
		  // "fieldData" is the entire set of bytes that'll be stored in the extras field
		  
		  return new ZipExtraField(me.d, fieldData)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeZipExtraField(macType as String, macCreator as String, macName as String) As ZipExtraField
		  // Creates an entry to preserve Mac specific file information
		  //
		  // "macType" and "macCreator" are the codes that Mac files, but not folders, have.
		  // "macName" is the name the file shall have on a Mac when it's unpacked from the archive again.
		  //   this is relevant if the name contains special chars that are not allowed in the archive directory
		  //   due to DOS naming conventions, and so this Mac name will be stored in a separate place.
		  // Leave "macName" empty to not have it explicitly stored (saves a little space), but not when you're
		  //   also using MacBinary (or ZipIt won't detect the MB header when unpacking your archive)!
		  
		  dim n as Integer, newName as String, data as MemoryBlock, te as TextEncoding
		  
		  // We must encode the name into a classic Mac encoding here, but the macName is probably encoded in Unicode
		  if macName <> "" then
		    te = GuessJapaneseEncoding(macName) '### modernize this? (look for other places of this use, too!)
		    if te <> nil and te.base = &H100 then
		      newName = me.d.encodeForZip(macName)
		    else
		      // if it's not unicode, we take the given name without change. I (TT) think that's the best solution. Feel free to change it, though.
		      newName = macName
		    end
		  end
		  
		  // preserve Type & Creator the way ZipIt does it
		  if newName <> "" then
		    // the long form, including the explicit Mac file name
		    n = 1 + LenB(newName)
		  else
		    // the short form, without the explicit Mac file name
		    n = 0
		  end
		  data = new MemoryBlock(16 + n)
		  if data = nil then
		    raise new OutOfMemoryException
		  end
		  data.LittleEndian = true
		  if n <> 0 then
		    data.UShort(0) = &H2605
		  else
		    data.UShort(0) = &H2705
		  end
		  data.UShort(2) = data.Size-4
		  data.LittleEndian = false
		  data.Long(4) = &H5A504954 // "ZPIT"
		  if n <> 0 then
		    data.PString(8) = newName
		  end
		  data.StringValue(8+n,4) = macType
		  data.StringValue(12+n,4) = macCreator
		  
		  return MakeZipExtraField(data.StringValue(0,data.Size))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Mark()
		  // Saves the list of entries. Later, Rollback may be called
		  //   to undo any addition of entries since Mark was called last.
		  // It does not, however, preserve changes to existing entries.
		  // This means: If you call Mark, then modify a ZipEntry, then
		  //   call Rollback, the change is not undone. Only calls to AddItem
		  //   and AddFolderContents will be undone.
		  
		  me.markDirStart = me.startOfDirInArchive
		  me.markEntries = Ubound(me.d.entries_1)
		  me.marked = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open(stream as BinaryStream, write as Boolean, encoding as TextEncoding, recover as Boolean = false, mergeDittoEntries as Boolean = true) As Boolean
		  // Opens access to an archive with a given Text Encoding,
		  // coming from a BinaryStream. Note that you can even read from
		  // or write to a MemoryBlock this way, because you can create a
		  // BinaryStream that works on a MemoryBlock, like this:
		  //
		  // dim mb as new MemoryBlock // new empty memory block
		  // dim stream as BinaryStream = new BinaryStream(mb)
		  //
		  // - write: should specify TRUE if archive is to be created or modified, otherwise FALSE
		  // - encoding: the encoding the archive is using or shall use. Pass nil to ignore any encodings
		  //    (careful: passing nil can lead to weird results - test with foreign chars on all the
		  //    platforms you want to use this software!). Or pass one of the EncodedAs... functions
		  //
		  // Returns TRUE if open was successful
		  //
		  // Preconditions:
		  // - Open() not has been called, or Close() has been called latest
		  
		  dim ok as Boolean
		  
		  me.errmsg = ""
		  
		  if me.entriesRead then
		    // already opened
		    raise new RuntimeException
		  end
		  
		  if stream = nil then
		    me.errmsg = "No stream specified"
		    return false
		  end
		  
		  me.d.theFile = nil
		  me.d.setArchiveEncoding encoding
		  
		  me.d.zipStream = stream
		  me.d.zipStream.Position = 0
		  me.d.zipStream.LittleEndian = true
		  
		  if stream.Length = 0 then
		    me.entriesRead = true
		    me.justCreated = true
		    ok = true
		  else
		    dim abort as Boolean
		    me.z_readDirectory(recover, mergeDittoEntries, abort) // sets "errmsg"
		    if not abort then
		      ok = me.entriesRead
		    end
		    if not ok then
		      me.d.zipStream.Close
		      me.d.zipStream = nil
		    end
		  end
		  
		  me.writeMode = write and ok and not me.centralDirCorrupted
		  if me.writeMode then
		    me.d.Dirty = true
		  end
		  
		  return ok
		  
		  Exception exc as RuntimeException
		    me.errmsg = "Unexpected error (exception)"
		    return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open(f as FolderItem, write as Boolean) As Boolean
		  // Opens access to an archive with the default encoding (as used on PCs)
		  //
		  // - f: identifies the archive file
		  // - write: should specify TRUE if archive is to be created or modified, otherwise FALSE
		  //
		  // Returns TRUE if open was successful
		  //
		  // The archive is assumed to be encoded in DOSLatinUS, which is the default for Zip tools on PCs.
		  // To specify a different encoding, use one of the other Open... methods
		  //
		  // Preconditions:
		  // - Open() not has been called, or Close() has been called latest
		  
		  dim enc as TextEncoding
		  
		  #if DefaultToUnicode
		    enc = me.EncodedAsUnicode
		  #else
		    enc = me.EncodedAsDOSLatinUS
		  #endif
		  
		  return Open(f, write, enc)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open(f as FolderItem, write as Boolean, encoding as TextEncoding, recover as Boolean = false, mergeDittoEntries as Boolean = true) As Boolean
		  // Opens access to an archive with a given Text Encoding
		  //
		  // - f: identifies the archive file
		  // - write: should specify TRUE if archive is to be created or modified, otherwise FALSE
		  // - encoding: the encoding the archive is using or shall use. Pass nil to ignore any encodings
		  //    (careful: passing nil can lead to weird results - test with foreign chars on all the
		  //    platforms you want to use this software!). Or pass one of the EncodedAs... functions
		  //
		  // Returns TRUE if open was successful
		  //
		  // Preconditions:
		  // - Open() not has been called, or Close() has been called latest
		  
		  dim ok as Boolean
		  
		  me.errmsg = ""
		  
		  if me.entriesRead then
		    // already opened
		    raise new RuntimeException
		  end
		  
		  if f = nil then
		    me.errmsg = "No file specified"
		    return false
		  end
		  
		  me.d.theFile = f
		  me.d.setArchiveEncoding encoding
		  
		  if write and not f.exists then
		    #if RBVersion >= 2012
		      me.d.zipStream = BinaryStream.Create(f)
		    #else
		      me.d.zipStream = f.CreateBinaryFile("")
		    #endif
		    if me.d.zipStream = nil then
		      me.errmsg = "Creating the archive file failed"
		    else
		      me.d.zipStream.LittleEndian = true
		      me.entriesRead = true
		      me.justCreated = true
		      ok = true
		    end
		  else
		    #if RBVersion >= 2012
		      me.d.zipStream = BinaryStream.Open (f, write)
		    #else
		      me.d.zipStream = f.OpenAsBinaryFile(write)
		    #endif
		    if me.d.zipStream = nil then
		      me.errmsg = "Opening the archive file failed"
		    else
		      me.d.zipStream.LittleEndian = true
		      dim abort as Boolean
		      me.z_readDirectory(recover, mergeDittoEntries, abort) // sets "errmsg"
		      if not abort then
		        ok = me.entriesRead
		      end
		      if not ok then
		        me.d.zipStream.Close
		        me.d.zipStream = nil
		      end
		    end
		  end
		  
		  me.writeMode = write and ok and not me.centralDirCorrupted
		  if me.writeMode then
		    me.d.Dirty = true
		  end
		  
		  return ok
		  
		  Exception exc as RuntimeException
		    me.errmsg = "Unexpected error (exception)"
		    return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OpenForSequentialWriting(stream as ZipSeqOutputStream, encoding as TextEncoding) As Boolean
		  // Starts a new archive for writing with a given Text Encoding.
		  //
		  // You may only add new items to the archive, not read, delete or replace
		  // them. This makes it possible to receive the archived output immediately,
		  // e.g. to further encrypt it or pass it over a network, without having it written
		  // to a file first. Make sure to call Close before assuming that the archive is
		  // completely written.
		  //
		  // - stream: a subclass of ZipSeqOutputStream class, implementing only
		  //    its two events Write() and Close().
		  // - encoding: the encoding the archive is using or shall use. Pass nil to ignore any encodings
		  //    (careful: passing nil can lead to weird results - test with foreign chars on all the
		  //    platforms you want to use this software!). Or pass one of the EncodedAs... functions
		  //
		  // Returns TRUE if open was successful
		  //
		  // Preconditions:
		  // - Open() not has been called, or Close() has been called latest
		  
		  me.errmsg = ""
		  
		  if me.entriesRead then
		    // already opened
		    raise new RuntimeException
		  end
		  
		  if stream = nil then
		    me.errmsg = "No output stream specified"
		    return false
		  end
		  
		  me.d.theFile = nil
		  me.d.setArchiveEncoding encoding
		  
		  me.d.zipStream = stream
		  me.d.zipStream.LittleEndian = true
		  
		  me.entriesRead = true
		  me.justCreated = true
		  me.writeMode = true
		  me.writeSequentially = true
		  me.d.Dirty = true
		  
		  return true
		  
		  Exception exc as RuntimeException
		    me.errmsg = "Unexpected error (exception)"
		    return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProgressMonitor() As ZipProgressNotifier
		  return me.d.monitor
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RawPath(rootFolder as FolderItem, destItem as FolderItem) As String
		  // Creates a raw path name (for AddItemWithRawPath and AddItemByStreams)
		  //   from a file or folder (destItem) relative to a starting folder (rootFolder).
		  //
		  // Preconditions:
		  // - rootFolder is a directory
		  // - destItem is somewhere inside rootFolder
		  
		  dim i as Integer, names(-1) as String, f, fs(-1) as FolderItem
		  
		  if not rootFolder.Directory then
		    // Error: 'rootFolder' is not a directory
		    return ""
		  end
		  
		  f = destItem
		  do
		    if TTsFolderItem.SameFolderItem(f, rootFolder) then
		      // it's a valid path
		      for i = Ubound(fs) downTo 0
		        names.append fs(i).name
		      next
		      return RawPath(names)
		    elseif f = nil or TTsFolderItem.SameFolderItem(f.Parent, f) then
		      // we've reached the root - it's an invalid path
		      // Error: 'destItem' is not inside 'rootFolder'
		      return ""
		    end
		    if f <> nil then
		      fs.append f
		    end
		    f = f.Parent
		  loop
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RawPath(names() as String) As String
		  // Creates a raw path name (for AddItemWithRawPath and AddItemByStreams)
		  //   from an array of folders and a final folder or file name.
		  // This is the same format that you get by calling
		  //  ZipEntry.GetPath
		  
		  dim i as Integer, s as String
		  
		  for i = 0 to Ubound(names)
		    s = s + "/" + me.d.cleanName(names(i))
		  next
		  
		  return MidB(s,2) // remove the first "/" again
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub RegisterLicense(name as String, code as UInt32)
		  // Call this to enable the use of the ZipFolderItem class in built apps.
		  //
		  // To get a license, contact tt@tempel.org or visit http://www.tempel.org/RB/ZipPackage
		  
		  gRegName = name
		  gRegCode = code
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveEntry(index_1 as Integer) As Boolean
		  // Removes an entry from the archive list of entries
		  // Does not actually regain the used space of the stored data
		  //   in the archive until ZipArchive.Compact() is called.
		  //
		  // Note: After the item has been removed, EntryCount()
		  // will be one less, and any indexes starting behind the
		  // removed entry will shift down by one.
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  // - Archive was opened for writing
		  
		  if not me.writeMode then
		    z_noWriteMsg
		    return false
		  end
		  
		  if not me.entriesRead then
		    // oops - archive is not open
		    raise new RuntimeException
		  end
		  
		  if index_1 < 1 then
		    raise new OutOfBoundsException
		  end
		  
		  'dim e as ZipEntry = d.entries_1(index_1)
		  
		  me.marked = false
		  me.d.dirty = true
		  
		  me.d.entries_1.Remove index_1
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReplaceEntry(index_1 as Integer, entry as ZipEntry) As ZipEntry
		  // Replaces the entry at the index with the given one.
		  // Returns the entry that was previously at this index,
		  //   returns nil if an error occured
		  // This function allows you to change the order of entries for
		  //   sorting purposes
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  // - Archive was opened for writing
		  // - entry originates from this archive, not from a different one!
		  
		  dim e2 as ZipEntry
		  
		  if not me.writeMode then
		    z_noWriteMsg
		    return nil
		  end
		  
		  if not me.entriesRead then
		    // oops - archive is not open
		    raise new RuntimeException
		  end
		  
		  if index_1 < 1 then
		    raise new OutOfBoundsException
		  end
		  
		  me.marked = false
		  me.d.dirty = true
		  
		  e2 = me.d.entries_1(index_1)
		  me.d.entries_1(index_1) = entry
		  
		  return e2
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Rollback() As Boolean
		  // Undoes any added entries since the last call to Mark()
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  // - Mark has been called, but not any of these since then:
		  //    - Compact
		  //    - RemoveEntry
		  //    - ReplaceEntry
		  
		  if me.marked and me.markDirStart <= me.startOfDirInArchive and me.markEntries <= Ubound(me.d.entries_1) then
		    me.startOfDirInArchive = me.markDirStart
		    Redim me.d.entries_1(me.markEntries)
		    me.d.dirty = true
		    return true
		  end
		  me.marked = false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetComment(comment as String) As Boolean
		  // Sets the optional comment about the archive.
		  // Pass an empty string to delete an existing comment
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  // - Archive was opened for writing
		  
		  if not me.writeMode then
		    z_noWriteMsg
		    return false
		  end
		  
		  me.comment_ = comment
		  me.d.dirty = true
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDefaultOSMadeBy(code as Integer)
		  // See the "PKZIP format.txt" or any "appnote.txt" on the web for the codes
		  //
		  // This code well be used for all newly added ZipEntries
		  // Default is 0.
		  //
		  // Call DefaultOSMadeBy() to get the current default value
		  
		  me.d.defaultOSMadeBy = code
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetProgressMonitor(monitor as ZipProgressNotifier)
		  // Defines an object that implement the ZipProgressMonitor
		  //   interface. Its event ZipProgress() will be called
		  //   periodically while a compression or extraction is
		  //   in progress.
		  // The ZipProgress also has the ability to stop a
		  //   compression or extraction process.
		  
		  me.d.monitor = monitor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Tree(rebuild as Boolean = false) As ZipFolderItem
		  // Returns the root item of the directory tree of the items in the zip archive
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  
		  if not me.entriesRead then
		    // oops - archive is not open
		    raise new RuntimeException
		  end
		  
		  if d.tree = nil or rebuild then
		    d.tree = new ZipFolderItem (me.d, me)
		  end if
		  return d.tree
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UsesAppleDittoFormat() As Boolean
		  // Returns true if archive uses the Mac OS 10.4's (Tiger) format
		  // where resource forks and other HFS infos are stored in "._" entries
		  // (usually inside a "__MACOSX" folder)
		  return me.d.dittoFormat
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Version() As Double
		  return 3.030400 // v.mmffbb, with m=minor-version, f=bugfix-version, b=build(nonreleaseversion)
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is a collection of Classes to extract and create ZIP archives
		(PKZIP and Info-ZIP formats), written by Thomas Tempelmann.
		
		Homepage: http://www.tempel.org/RB/ZipPackage
		Contact: tt@tempel.org
		
		The current version of this code has been tested using RB 2010r4.1
		and 2010r5. Previous versions have been tested on Mac OS X 10.5
		on PPC and Intel Macs, on Windows XP SP2 and Ubuntu 7.10
		
		This code was written very throughly, and tries to deal with all
		eventualities, such as detection of corrupted archives, and
		observing all the little differences from various Zip tools on
		all platforms.
		
		It implements only a subset of the entire ZIP archive
		definition, though. Here are the known restrictions:
		
		* Can't do encryption (nor decryption).
		* No support for the PKZip 64bit format (yet), meaning the archive
		   can contain only files that are less than 4GB in original length,
		   and the total archive file size has the same limit.
		* Supports only "stored" and "deflate" compression methods
		   (which are the most common ones).
		* Can't read all possible ZIP archives since some of them use
		   different compression methods, but if you're using any
		   Zip creating tool, you usually have control over which
		   methods should be used. And "deflate" is usually the most
		   effective, anyways.
		* No support for multi-segment archives.
		* There is no provision for loss of file name information under
		   older Mac OS versions (before 9): If an archive items has a
		   name longer than 31 chars and if it is extracted using
		   ZipEntry.MakeDestination(), the name may get cut off at
		   the end without preserving an extension. Under Mac OS 9
		   and OS X, as well as MS Windows and Linux, this is not a
		   problem, though.
		
		Special Features:
		
		* It can create "fake" entries, i.e. extra entries that refer to any
		   file in the archive, allowing to have several entries even refer
		   to the same file. However, this feature is not supported by
		   some other Zip tools, including the one used by the Mac Finder.
		   So, it's best to use this feature only if you are using these
		   classes to read from the archive again.
		* Supports preserving of Resource Forks using the MacBinary
		   format. This format, however, is not supported by Apple's
		   Zip tools, sadly. (It should be supported, as it has been a
		   well documented format for many years, but what can we do).
		* Supports reading of Resource Forks written by Apple's Zip
		   tool (which uses the "__MACOSX" folders for such data), but
		   cannot create such folders itself (yet).
		
		One thing you can be sure of is that files created by this
		class can be read by any modern ZIP tool, such as ZipIt (for
		Mac OS), WinZIP (for Windows), Stuffit Expander (Mac
		and Windows) and, of course, by this class collection.
		
		A nice feature is that you can not only add items to an existing
		archive, but even remove them and then compact the archive
		to gain the space back.
		
		For more information about the ZIP archive format, search
		on www.google.com for "ZIP format appnote". The "appnote.txt"
		describes the format.
		
	#tag EndNote

	#tag Note, Name = Acknowledgements
		CRC-16 code by Eric D. Brown
		
		e-CryptIt Engine copyright Björn Eiríksson (www.einhugur.com)
		
		e-CryptIt Engine uses zlib code, copyright © 1995-2002
		Jean-Loup Gailly and Mark Adler.
		
		Original zip format REALbasic code was written by Carsten
		Friehe for the Mieze program (http://carsten-friehe.de/).
		
		RB code improved and reorganized by Thomas Tempelmann
		(http://www.tempel.org/rb/) for public release.
		
		Some of the design and error messages was influenced by Java 1.1's
		ZipFile and related classes.
		
		This RB code, written by Carsten Friehe and Thomas Tempelmann,
		is given to the Public Domain, which means you can do whatever
		you want with it. It is, however appreciated if you would "tip"
		me by sending me a few dollars for my work (it took me a several
		weeks to develop this software for people like you - I myself
		could have done with much less for my own needs, but I wanted
		to provide this as a clean and complete solution so that others
		won't have to deal with this not-trivial task).
		
		My thanks go to Leonard Rosenthol (author of Stuffit Zip support
		and maintainer of MacBinary format) and Tom Brown (author
		of ZipIt) for providing helpful information.
		
		Please visit the following web address to find out how to tip me:
		
		    http://tip.tempel.org/
		
		Enjoy!
		
		14 March 2003
		
		Thomas Tempelmann
	#tag EndNote

	#tag Note, Name = Change History
		(see the "About Zip Package.html" file)
	#tag EndNote

	#tag Note, Name = Important change notice
		Since version 1.4 (May 2008), ZipProgressNotifier.ZipProgress() has changed:
		
		When unzipping, the amount values are not specifying the unpacked sizes any more. Instead,
		now the packed size is passed. This is necessary so that it works reliably with damaged archives.
		When zipping, the values still represent the unpacked size, though.
	#tag EndNote

	#tag Note, Name = MacBinary constants
		MacBinaryAlways:
		  Means to save all files MacBinary encoded.
		  But only on Mac OS -- on Windows, MacBinary will not be used even with this option.
		  To save Resource Forks when running on Windows, you have to use AddItemByStreams()
		
		MacBinarySmart:
		  Means to save files MacBinary-encoded only if the item has a resource fork.
		  But only on Mac OS -- on Windows and Linux, MacBinary will not be used even with this option.
		  To archive Resource Forks when running on Windows or Linux, you have to use AddItemByStreams()
		
	#tag EndNote

	#tag Note, Name = Plugins you will need
		If you want to get the highest speed, you'll need the following plugins (which
		cost extra money):
		
		  * e-CryptIt Engine (from <http://www.einhugur.com/>)
		  * #TypeLib (comes with the e-CryptIt plugin)
		
		  To use them, set ZipConfig.HaveEinhugurPlugin to true and remove the two interfaces
		  IStreamReader and IStreamWriter.
		
		
		Alternatively, this code can use the zlib library which should always be installed on Linux
		and OS X systems inside /usr/lib/
		
		For Microsoft Windows, however, you will have to manually get the "zlib1.dll" and place
		it into C:\Windows\system\. Get it here:
		http://www.zlib.net/ (simply download the "zlib compiled DLL")
		
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mAddMacSpecifica
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mAddMacSpecifica = value
			End Set
		#tag EndSetter
		AddMacSpecifica As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = MacBinaryAlways, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MacBinaryNever, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MacBinarySmart, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


	#tag Enum, Name = MacAliasHandling, Type = Integer, Flags = &h0
		StoreAll
		  DropAll
		  FollowFilesDropFolders
		FollowFilesStoreFolders
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AddMacSpecifica"
			Group="Behavior"
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
