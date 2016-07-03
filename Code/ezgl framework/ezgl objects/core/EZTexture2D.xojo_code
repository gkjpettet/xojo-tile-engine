#tag Class
Protected Class EZTexture2D
	#tag Method, Flags = &h0
		Sub bind()
		  
		  OpenGL.glBindTexture(OpenGL.GL_TEXTURE_2D, theTexName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  dim texMem As new MemoryBlock(4)
		  
		  OpenGL.glGenTextures(1, texMem)    //retrieve new id
		  
		  theTexName = texMem.Int32Value(0)  //store
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(formattedMem As MemoryBlock)
		  
		  Constructor()
		  
		  loadImage(formattedMem)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(mem As MemoryBlock, width As integer, height As integer, isRGBA As boolean, doClampVsRepeat As boolean)
		  
		  Constructor()
		  
		  loadImage(mem, width, height, isRGBA, doClampVsRepeat)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(pic As Picture, withAlpha As boolean, doClampVsRepeat As boolean = false)
		  
		  Constructor()
		  
		  loadImage(pic, withAlpha, doClampVsRepeat)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(pic As Picture, picAlpha As Picture, doClampVsRepeat As boolean = false)
		  
		  Constructor()
		  
		  loadImage(pic, picAlpha, doClampVsRepeat)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  
		  dim mem As new MemoryBlock(4)
		  
		  mem.Int32Value(0) = theTexName
		  
		  OpenGL.glDeleteTextures(1, mem)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawCentered(x As single, y As single, scale As single = 1.0)
		  
		  //calc offset bounds
		  dim halfX, halfY, x0, x1, y0, y1 As single
		  halfX = theWidth  * 0.5 * scale
		  halfY = theHeight * 0.5 * scale
		  x0 = x - halfX
		  x1 = x + halfX
		  y0 = y - halfY
		  y1 = y + halfY
		  
		  //link self
		  bind
		  
		  //draw (inlined from g.draw.shapes.rectSolidTex, then tweeked)
		  OpenGL.glBegin(OpenGL.GL_QUADS)
		  
		  OpenGL.glTexCoord2f(0, 0)
		  OpenGL.glVertex2f(x0, y0)
		  
		  OpenGL.glTexCoord2f(1, 0)
		  OpenGL.glVertex2f(x1, y0)
		  
		  OpenGL.glTexCoord2f(1, 1)
		  OpenGL.glVertex2f(x1, y1)
		  
		  OpenGL.glTexCoord2f(0, 1)
		  OpenGL.glVertex2f(x0, y1)
		  
		  OpenGL.glEnd
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawTopLeft(x As single, y As single, scale As single = 1.0)
		  
		  
		  
		  //calc offset bounds
		  dim x1, y1 As single
		  x1 = x + theWidth * scale
		  y1 = y + theHeight * scale
		  
		  //link self
		  bind
		  
		  //draw (inlined from g.draw.shapes.rectSolidTex, then tweeked)
		  OpenGL.glBegin(OpenGL.GL_QUADS)
		  
		  OpenGL.glTexCoord2f(0, 0)
		  OpenGL.glVertex2f(x, y)
		  
		  OpenGL.glTexCoord2f(1, 0)
		  OpenGL.glVertex2f(x1, y)
		  
		  OpenGL.glTexCoord2f(1, 1)
		  OpenGL.glVertex2f(x1, y1)
		  
		  OpenGL.glTexCoord2f(0, 1)
		  OpenGL.glVertex2f(x, y1)
		  
		  OpenGL.glEnd
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub filterMagLinear()
		  OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_MAG_FILTER, OpenGL.GL_LINEAR)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub filterMagNearest()
		  OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_MAG_FILTER, OpenGL.GL_NEAREST)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub filterMinLinear()
		  OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_MIN_FILTER, OpenGL.GL_LINEAR)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub filterMinNearest()
		  OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_MIN_FILTER, OpenGL.GL_NEAREST)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function generateFormattedMem(pic As Picture, picAlpha As Picture, doClampVsRepeat As Boolean) As MemoryBlock
		  //determine alpha usage
		  dim isRGBA As boolean = picAlpha <> nil
		  
		  //create pixel data
		  dim memImg As MemoryBlock
		  if isRGBA then
		    memImg = generateMem(pic, picAlpha) //pic may be nil
		  else
		    memImg = generateMem(pic, false)
		  end
		  
		  //grab byte size
		  dim imgBytes As integer = memImg.Size
		  
		  //figure w/h
		  dim picWidth, picHeight As integer
		  if pic <> nil then
		    picWidth = pic.Width
		    picHeight = pic.Height
		  else
		    picWidth = picAlpha.Width //if pic is nil then picAlpha must not be
		    picHeight = picAlpha.Height
		  end
		  
		  //create formatted memory
		  dim formMem As new MemoryBlock(9 + imgBytes)
		  formMem.Int32Value(0) = picWidth
		  formMem.Int32Value(4) = picHeight
		  formMem.UInt8Value(8) = (CType(isRGBA, UInt8) * CType(2, UInt8)) or CType(doClampVsRepeat, UInt8)  //is UInt8 typing lost in the multiply? or 'or'?
		  formMem.StringValue(9, imgBytes) = memImg.StringValue(0, imgBytes)
		  
		  //result
		  return formMem
		  
		  
		  //4) Int32 - Width
		  //4) Int32 - Height
		  //1) UInt8 - has alpha masked with doClampVsRepeat
		  //n) memImg
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function generateMem(pic As Picture, withAlpha As boolean) As MemoryBlock
		  #pragma DisableBackgroundTasks
		  #pragma NilObjectChecking
		  #pragma StackOverflowChecking
		  
		  dim imgW As integer = pic.Width
		  dim imgH As integer = pic.Height
		  
		  //=========================== setup destination memory
		  dim memImg As MemoryBlock
		  if withAlpha then
		    memImg = new MemoryBlock(imgW * imgH * 4)
		  else
		    memImg = new MemoryBlock(imgW * imgH * 3 + 1) //pad an extra byte for the Ptr.Color overwrite so there's no OOB. should be skipped when read as the texture
		  end
		  
		  dim memPtr As Ptr = memImg //grab Ptr for faster access
		  
		  //=========================== setup surface to scan
		  dim surf As RGBSurface = pic.RGBSurface
		  if surf = nil then    //need a new pic with a surface
		    dim p2 As Picture
		    if TargetCarbon then
		      p2 = new Picture(imgW, imgH, 32)
		    else
		      p2 = new Picture(imgW, imgH)
		    end
		    p2.Graphics.DrawPicture pic, 0, 0
		    pic = p2
		    surf = pic.RGBSurface
		  end
		  
		  //============================= scan pic into memoryblock
		  dim x, y, xlast, ylast, offset As integer
		  xlast = imgW - 1
		  ylast = imgH - 1
		  if withAlpha then        //write color as BGRA then invert A
		    for y = 0 to ylast
		      for x = 0 to xlast
		        memPtr.Color(offset) = surf.Pixel(x, y) //write BGRA
		        offset = offset + 3
		        memPtr.UInt8(offset) = 255 - memPtr.UInt8(offset) //invert A
		        offset = offset + 1
		      next
		    next
		  else          //write BGR, A is written/overwritten and the last A is padded for
		    for y = 0 to ylast
		      for x = 0 to xlast
		        memPtr.Color(offset) = surf.Pixel(x, y)  //writes BGRA
		        offset = offset + 3
		      next
		    next
		  end
		  
		  //================ result
		  return memImg
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function generateMem(pic As Picture, picAlpha As Picture) As MemoryBlock
		  #pragma DisableBackgroundTasks
		  #pragma NilObjectChecking
		  #pragma StackOverflowChecking
		  
		  dim imgW As integer = picAlpha.Width
		  dim imgH As integer = picAlpha.Height
		  
		  //=================== setup destination memory
		  dim memImg As new MemoryBlock(imgW * imgH * 4)
		  dim memPtr As Ptr = memImg
		  
		  //==================== setup surfaces to scan
		  dim picsurf As RGBSurface
		  if pic <> nil then
		    picsurf = pic.RGBSurface
		    if picsurf = nil then //need a new pic with a surface
		      dim p2 As Picture
		      if TargetCarbon then
		        p2 = new Picture(imgW, imgH, 32)
		      else
		        p2 = new Picture(imgW, imgH)
		      end
		      p2.Graphics.DrawPicture pic, 0, 0
		      pic = p2
		      picsurf = pic.RGBSurface
		    end
		  end
		  
		  dim alphasurf As RGBSurface = picAlpha.RGBSurface
		  if alphasurf = nil then
		    dim p2 As Picture
		    if TargetCarbon then
		      p2 = new Picture(imgW, imgH, 32)
		    else
		      p2 = new Picture(imgW, imgH)
		    end
		    p2.Graphics.DrawPicture picAlpha, 0, 0
		    picAlpha = p2
		    alphasurf = picAlpha.RGBSurface
		  end
		  
		  //====================== scan pic into memoryblock
		  dim x, y, xlast, ylast, offset As integer
		  xlast = imgW - 1
		  ylast = imgH - 1
		  if pic <> nil then //RRGGBBAA
		    for y = 0 to ylast
		      for x = 0 to xlast
		        memPtr.Color(offset) = picsurf.Pixel(x, y)
		        memPtr.UInt8(offset+3) = 255 - alphasurf.Pixel(x, y).Red
		        offset = offset + 4
		      next
		    next
		  else          //FFFFFFAA
		    dim c As Color, avg As single
		    for y = 0 to ylast
		      for x = 0 to xlast
		        memPtr.UInt32(offset) = &hFFFFFFFF //fill 255 for RGBA, then overwrite A with average of real RGB
		        c = alphasurf.Pixel(x, y)
		        avg = ((c.Red + c.Green + c.Blue) / 3)
		        if avg > 255 then avg = 255
		        memPtr.UInt8(offset+3) = 255 - avg
		        offset = offset + 4
		      next
		    next
		  end
		  
		  
		  //==================== result
		  return memImg
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function height() As integer
		  return theHeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub loadImage(formattedMem As MemoryBlock)
		  
		  dim width As integer = formattedMem.Int32Value(0)
		  dim height As integer = formattedMem.Int32Value(4)
		  dim flags As UInt8 = formattedMem.UInt8Value(8)
		  
		  dim isRGBA As boolean = (flags and &h02) > 0
		  dim doClampVsRepeat As boolean = (flags and &h01) > 0
		  
		  dim byteSize As integer
		  if isRGBA then byteSize = width * height * 4 else byteSize = width * height * 3
		  
		  dim memImg As MemoryBlock = formattedMem.StringValue(9, byteSize)
		  
		  loadImage(memImg, width, height, isRGBA, doClampVsRepeat)
		  
		  
		  
		  //4) Int32 - Width
		  //4) Int32 - Height
		  //1) UInt8 - has alpha masked with doClampVsRepeat
		  //n) memImg
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub loadImage(mem As MemoryBlock, picWidth As integer, picHeight As integer, isRGBA As boolean, doClampVsRepeat As boolean)
		  
		  
		  //bind
		  OpenGL.glBindTexture(OpenGL.GL_TEXTURE_2D, theTexName) 
		  
		  
		  //set wrap
		  if doClampVsRepeat then
		    OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_WRAP_S, OpenGL.GL_CLAMP_TO_EDGE)
		    OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_WRAP_T, OpenGL.GL_CLAMP_TO_EDGE)
		  else
		    OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_WRAP_S, OpenGL.GL_REPEAT)
		    OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_WRAP_T, OpenGL.GL_REPEAT)
		  end
		  
		  
		  //set mag/min filters
		  OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_MAG_FILTER, OpenGL.GL_LINEAR)'NEAREST)
		  OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_MIN_FILTER, OpenGL.GL_LINEAR)'GL_NEAREST)
		  
		  
		  //store pixel data
		  OpenGL.glPixelStorei(OpenGL.GL_UNPACK_ALIGNMENT, 1)
		  if isRGBA then
		    OpenGL.glTexImage2D(OpenGL.GL_TEXTURE_2D, 0, OpenGL.GL_RGBA, picWidth, picHeight, 0, OpenGL.GL_BGRA, OpenGL.GL_UNSIGNED_BYTE, mem)
		  else
		    OpenGL.glTexImage2D(OpenGL.GL_TEXTURE_2D, 0, OpenGL.GL_RGBA, picWidth, picHeight, 0, OpenGL.GL_BGR, OpenGL.GL_UNSIGNED_BYTE, mem)
		  end
		  
		  theWidth = picWidth
		  theHeight = picHeight
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub loadImage(pic As Picture, withAlpha As boolean, doClampVsRepeat As boolean = false)
		  
		  dim memImg As MemoryBlock = generateMem(pic, withAlpha)
		  
		  loadImage(memImg, pic.Width, pic.Height, withAlpha, doClampVsRepeat)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub loadImage(pic As Picture, picAlpha As Picture, doClampVsRepeat As boolean = false)
		  
		  dim memImg As MemoryBlock = generateMem(pic, picAlpha)
		  
		  loadImage(memImg, picAlpha.Width, picAlpha.Height, true, doClampVsRepeat)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub unload()
		  
		  dim mem As new MemoryBlock(0)
		  
		  loadImage(mem, 0, 0, false, false)
		  
		  
		  //untested???
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function width() As integer
		  return theWidth
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub wrapClamp(clampS As boolean = true, clampT As boolean = true)
		  
		  if clampS then
		    OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_WRAP_S, OpenGL.GL_CLAMP)
		  end
		  
		  if clampT then
		    OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_WRAP_T, OpenGL.GL_CLAMP)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub wrapClampToBorder(clampBorderS As boolean = true, clampBorderT As boolean = true)
		  
		  if clampBorderS then
		    OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_WRAP_S, OpenGL.GL_CLAMP_TO_BORDER)
		  end
		  
		  if clampBorderT then
		    OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_WRAP_T, OpenGL.GL_CLAMP_TO_BORDER)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub wrapClampToEdge(clampEdgeS As boolean = true, clampEdgeT As boolean = true)
		  
		  if clampEdgeS then
		    OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_WRAP_S, OpenGL.GL_CLAMP_TO_EDGE)
		  end
		  
		  if clampEdgeT then
		    OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_WRAP_T, OpenGL.GL_CLAMP_TO_EDGE)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub wrapMirroredRepeat(mirrorRepeatS As boolean = true, mirrorRepeatT As boolean = true)
		  
		  if mirrorRepeatS then
		    OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_WRAP_S, OpenGL.GL_MIRRORED_REPEAT)
		  end
		  
		  if mirrorRepeatT then
		    OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_WRAP_T, OpenGL.GL_MIRRORED_REPEAT)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub wrapRepeat(repeatS As boolean = true, repeatT As boolean = true)
		  
		  if repeatS then
		    OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_WRAP_S, OpenGL.GL_REPEAT)
		  end
		  
		  if repeatT then
		    OpenGL.glTexParameteri(OpenGL.GL_TEXTURE_2D, OpenGL.GL_TEXTURE_WRAP_T, OpenGL.GL_REPEAT)
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private theHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theTexName As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theWidth As Integer
	#tag EndProperty


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
