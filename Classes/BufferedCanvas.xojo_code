#tag Class
Protected Class BufferedCanvas
Inherits Canvas
	#tag Event
		Sub Open()
		  
		  Dim osv As Integer
		  isBuffered = True
		  
		  #If TargetMacOS
		    If System.Gestalt("sysv", osv) And osv >= &h1000 Then    // OS X 10.0.0 or higher
		      isBuffered = False
		    End If
		  #Endif
		  
		  Open()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  If isBuffered Then
		    If (mBuffer Is Nil) Or (g.Width <> mBuffer.Width) Or (g.Height <> mBuffer.Height) Then
		      NewBuffer
		      Paint(mBuffer.Graphics)
		    End If
		    g.DrawPicture(mBuffer, 0, 0)
		  Else
		    Paint(g)
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Buffer() As Graphics
		  
		  //============================================================
		  '
		  '    Buffer() provides access to the *active* buffer graphics object (even in OS X) in
		  '    cases where you need to draw directly to the graphics context without erasing
		  '    the existing data.
		  '
		  //============================================================
		  
		  Dim g As Graphics
		  g = Me.Graphics
		  
		  If isBuffered Then
		    If mBuffer Is Nil Then
		      NewBuffer
		    End If
		    Return mBuffer.Graphics
		  Else
		    Return g
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Mask() As Graphics
		  
		  //============================================================
		  '
		  '    Mask() provides access to the buffer mask graphics object in cases where you
		  '    need to use transparency effects.
		  '
		  '    WARNING:  returns NIL if the mask is not available (always the case in OS X).
		  '
		  //============================================================
		  
		  If isBuffered Then
		    If Not (mBuffer Is Nil) Then
		      Return mBuffer.Mask.Graphics
		    End If
		  End If
		  
		  Return Nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub NewBuffer()
		  
		  Dim err As RuntimeException
		  
		  mBuffer = new Picture(Width, Height, 32)
		  
		  If mBuffer Is Nil Then
		    mBuffer = new Picture(Width, Height, 16)
		    If mBuffer Is Nil Then
		      err = New RuntimeException
		      err.Message = "There is not enough free memory to create the double buffer.  Falling back to non-buffered canvas."
		      Raise err
		    End If
		  End If
		  
		  Exception e As RuntimeException
		    isBuffered = False
		    Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Refresh(EraseBackground As Boolean = True)
		  
		  //============================================================
		  '
		  '    Refresh() deletes the existing buffer and calls Paint() to redraw the entire
		  '    buffer.  EraseBackground determines whether the background is erased before
		  '    the new buffer image is drawn to the screen (required for transparency effects).
		  '
		  '    This class overrides the Super.Refresh() method but retains almost the exact
		  '    behavior including EraseBackground default to True.  What is different is that
		  '    the order of method calls is designed to bring screen flickering to an absolute
		  '    minimum.  What this means is that the new buffer picture is always built before
		  '    the background is erased and so the only thing left to do is to draw the buffer
		  '    to the screen.  Again like the regular Refresh() version, if you call Refresh(False)
		  '    then the buffer will draw directly to the screen without first erasing the
		  '    background.
		  '
		  //============================================================
		  
		  Dim g As Graphics
		  g = Me.Graphics
		  
		  If isBuffered Then
		    NewBuffer
		    Paint(mBuffer.Graphics)
		    If EraseBackground Then
		      Super.Refresh(EraseBackground)
		    Else
		      Update
		    End If
		  Else
		    Super.Refresh(EraseBackground)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshRect(X As Integer, Y As Integer, Width As Integer, Height As Integer, EraseBackground As Boolean = True)
		  
		  //============================================================
		  '
		  '    RefreshRect() deletes the existing buffer and calls Paint() to redraw the only
		  '    the rectangle area defined by X, Y, Width and Height.  EraseBackground
		  '    determines whether the background is erased before the RefreshRect area is
		  '    drawn to the screen (required for transparency effects).
		  '
		  '    See notes on Refresh() for more information on why this method is overridden.
		  '
		  //============================================================
		  
		  Dim g As Graphics
		  g = Me.Graphics
		  
		  If isBuffered Then
		    NewBuffer
		    Paint(mBuffer.Graphics)
		    If EraseBackground Then
		      Super.RefreshRect(X, Y, Width, Height, EraseBackground)
		    Else
		      g.DrawPicture(mBuffer, X, Y, Width, Height, X, Y, width, height)
		    End If
		  Else
		    Super.RefreshRect(X, Y, Width, Height, EraseBackground)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RequiresBuffering() As Boolean
		  
		  //============================================================
		  '
		  '    Returns the value of isBuffered, which is evaluated at the initialization of the
		  '    BufferedCanvas object.  Currently only OS X native applications do not require
		  '    manual buffering, and if isBuffered is False the default buffering behavior will
		  '    take place.
		  '
		  //============================================================
		  
		  Return isBuffered
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update()
		  
		  //============================================================
		  '
		  '    Update() is only to refresh the current buffer object to the screen and will
		  '    *not* call the Paint() event unless the buffer object does not exist.
		  '
		  '    OS X:  This method always calls Refresh with EraseBackground as True.
		  '
		  //============================================================
		  
		  If Not (mBuffer Is Nil) Then
		    Me.Graphics.DrawPicture(mBuffer, 0, 0)
		  Else
		    Refresh
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateRect(X As Integer, Y As Integer, Width As Integer, Height As Integer)
		  
		  //============================================================
		  '
		  '    UpdateRect() is only to refresh the current buffer object to the screen and will
		  '    *not* call the Paint() event unless the buffer object does not exist.
		  '
		  '    OS X:  This method always calls RefreshRect with EraseBackground as True.
		  '
		  //============================================================
		  
		  If Not (mBuffer Is Nil) Then
		    Me.Graphics.DrawPicture(mBuffer, X, Y, width, height, X, Y, width, height)
		  Else
		    RefreshRect(X, Y, Width, Height)
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Paint(g As Graphics)
	#tag EndHook


	#tag Property, Flags = &h21
		#tag Note
			Returns the value of isBuffered, which is evaluated at the initialization of the
			BufferedCanvas object.  Currently only OS X native applications do not require
			manual buffering, and if isBuffered is False the default buffering behavior will
			take place.
		#tag EndNote
		Private isBuffered As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			This is the picture object which is used as the double-buffer.
		#tag EndNote
		Private mBuffer As Picture
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
