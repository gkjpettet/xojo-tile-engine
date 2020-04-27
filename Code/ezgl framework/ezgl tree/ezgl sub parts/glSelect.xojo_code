#tag Class
Protected Class glSelect
	#tag Method, Flags = &h0
		Sub beginWithBuffer(buf As MemoryBlock)
		  
		  //assume buf not nil
		  
		  OpenGL.glSelectBuffer(buf.Size \ 4, buf) //first link output buffer
		  
		  call OpenGL.glRenderMode(OpenGL.GL_SELECT)  //enter select mode
		  
		  OpenGL.glInitNames() //empty stack
		  
		  OpenGL.glPushName(-1) //for convenience add a first item
		  
		  
		  
		  refBuf = buf //keep hold of this mem for when reading back
		  
		  
		  
		  
		  
		  
		  
		  //glPushName (Xojo typed as integer, gl docs types as uint?) can use -1?
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub beginWithSize(bufferElementCount As integer)
		  //setup internal buffer
		  'if bufferElementCount < 4 then return //16 bytes is smallest size
		  
		  dim byteCount As integer = bufferElementCount * 4
		  
		  if internalBuf = nil then
		    internalBuf = new MemoryBlock(byteCount)
		  elseif internalBuf.Size <> byteCount then
		    internalBuf.Size = byteCount
		  end
		  
		  //do begin using internalBuf
		  beginWithBuffer(internalBuf)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub endWithFlatNames(flatNames() As integer)
		  
		  dim hitsm1 As integer = OpenGL.glRenderMode(OpenGL.GL_RENDER) - 1
		  
		  redim flatNames(hitsm1)
		  
		  dim i, idx, nameCount As integer //0
		  
		  for i = 0 to hitsm1
		    
		    nameCount = refBuf.UInt32Value(idx)
		    
		    flatNames(i) = refBuf.UInt32Value(idx + 12)
		    
		    idx = idx + 12 + nameCount * 4
		    
		  next
		  
		  refBuf = nil
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub endWithFlatNamesAndMinDist(flatNames() As integer, minDist() As single, camNear As single, camFar As single)
		  
		  dim hitsm1 As integer = OpenGL.glRenderMode(OpenGL.GL_RENDER) - 1
		  
		  redim flatNames(hitsm1)
		  redim minDist(hitsm1)
		  
		  dim t, p, m, ppm, m2, s As single //build linearizing vars
		  t = 2 * camFar * camNear
		  p = camFar + camNear
		  m = camFar - camNear
		  ppm = p + m
		  m2 = -2 * m
		  s = 4294967295
		  
		  
		  dim i, idx, nameCount As integer //0
		  
		  for i = 0 to hitsm1
		    
		    nameCount = refBuf.UInt32Value(idx)
		    
		    minDist(i) = t / (ppm + m2 * (refBuf.UInt32Value(idx + 4) / s))
		    
		    flatNames(i) = refBuf.UInt32Value(idx + 12)
		    
		    idx = idx + 12 + nameCount * 4
		    
		  next
		  
		  refBuf = nil
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub endWithFullNames(fullNames() As Variant)
		  #pragma unused fullNames
		  #pragma warning "unfinished"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub nameEmpty()
		  OpenGL.glInitNames() //empty stack
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub nameLoad(name As integer)
		  OpenGL.glLoadName(name) //again Xojo int, gl docs UInt
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub namePop()
		  OpenGL.glPopName
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub namePush(name As integer)
		  OpenGL.glPushName(name) 
		End Sub
	#tag EndMethod


	#tag Note, Name = old dev
		Struct rec
		  name As UInt32
		  distMin As single
		  distMax As single
		
		
		
		
		Private Sub beginSelectMode(buf As EZMemUInt32_1D)
		
		  OpenGL.glSelectBuffer(buf.ubound + 1, buf) //first link output buffer
		
		  call OpenGL.glRenderMode(OpenGL.GL_SELECT)  //enter select mode
		
		  OpenGL.glInitNames() //empty stack
		
		  OpenGL.glPushName(1) //start (Xojo typed as integer, gl docs types as uint?) can use -1?
		
		End Sub
		
		
		
		
		
		
		
		//2nd
		Function returnFlat(buf As EZMemUInt32_1D) As rec()
		  dim hits As integer = OpenGL.glRenderMode(OpenGL.GL_RENDER)
		
		  dim i, j, idx, nameCount As integer, vMin, vMax As single, ra() As rec
		  idx = 0
		
		  dim s As single = 4294967295
		
		  for i = 0 to hits - 1
		
		    dim r As rec
		
		    nameCount = buf.UInt32Value(idx)
		
		    r.distMin = buf.UInt32Value(idx + 4) / s '4294967295 //scale
		    r.distMax = buf.UInt32Value(idx + 8) / s '4294967295
		
		    idx = idx + 12
		    for j = 0 to nameCount - 1
		      if j = 0 then r.name = buf.UInt32Value(idx) //add only first name
		      idx = idx + 4 //skip/read all
		    next
		    ra.Append r
		  next
		
		  return ra
		
		End Function
		
		
		
		
		
		//1st
		Private Function returnToRenderMode(buf As EZMemUInt32_1D) As String()
		dim hits As integer = OpenGL.glRenderMode(OpenGL.GL_RENDER)
		
		//process hits
		
		dim i, j, idx, nameCount As integer, vMin, vMax As single, sa(), r() As String
		idx = 0
		for i = 0 to hits - 1
		
		nameCount = buf.UInt32Value(idx)
		'vMin = buf.SingleValue(idx + 4)
		'vMax = buf.SingleValue(idx + 8)
		'vMin = buf.UInt32Value(idx + 4) / &h7fffffff
		'vMax = buf.UInt32Value(idx + 8) / &h7fffffff
		vMin = buf.UInt32Value(idx + 4) / 4294967295
		vMax = buf.UInt32Value(idx + 8) / 4294967295
		'vMin = vMin * vMin
		'vMax = vMax * vMax
		idx = idx + 12
		redim sa(-1)
		for j = 0 to nameCount - 1
		sa.Append Str(buf.UInt32Value(idx))
		idx = idx + 4
		next
		'r.Append Str(i) + ") " + Str(nameCount) + " <" + Join(sa, ",") + ">   " + Str(vMin) + " " + Str(vMax)
		r.Append Str(i) + ") " + Str(nameCount) + " <" + Join(sa, ",") + ">   " + Format(vMin, "-0.000#####") + " " + Format(vMax, "-0.000#####")
		next
		
		return r
		
		End Function
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private internalBuf As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private refBuf As MemoryBlock
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
