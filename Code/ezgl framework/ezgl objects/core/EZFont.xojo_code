#tag Class
Protected Class EZFont
	#tag Method, Flags = &h21
		Private Sub buildFontData(theFontName As String, theFontSize As single, withBold As boolean, withItalic As boolean, saveMem As boolean)
		  //collect char datas
		  dim chars() As String = listChars
		  
		  
		  //<1,1> temppic for initial infos
		  dim temppic As Picture = newFormattedPic(1, 1, theFontName, theFontSize, withBold, withItalic)
		  dim tempg As Graphics = temppic.Graphics
		  
		  
		  //collect real char advances (using temppic)
		  dim charRealAdvances() As single
		  for i As integer = 0 to chars.Ubound     //collect widths (starts not collected)
		    charRealAdvances.Append tempg.StringWidth(chars(i))
		  next
		  
		  
		  //calculate glyph drawing scratch space XYpos and pic size (using temppic)
		  dim drawPosX As integer = theFontSize                         //inset XY position of glyph drawing at baseline
		  dim drawPosY As integer = 10 + Max(tempg.TextAscent, theFontSize)
		  dim scratchWidth As integer = theFontSize * 3                 //picture size to draw glyphs in
		  dim scratchHeight As integer = 20 + drawPosY + (tempg.TextHeight - theFontSize) + 20
		  
		  
		  //collect X offset and span values for each char and the overall Y min/max and then baseLine and height
		  dim scratchPic As Picture = newFormattedPic(scratchWidth, scratchHeight, theFontName, theFontSize, withBold, withItalic)
		  dim pixXMin, pixXMax, pixYMin, pixYMax, rawXSpans(), rawXOffsets() As integer
		  pixYMin = scratchHeight     //init with values that will get updated
		  pixYMax = 0
		  for i As integer = 0 to chars.Ubound
		    scanForGlyphXBounds(scratchPic, chars(i), drawPosX, drawPosY, pixXMin, pixXMax, pixYMin, pixYMax)
		    rawXOffsets.Append drawPosX - pixXMin
		    rawXSpans.Append pixXMax - pixXMin
		  next
		  dim finalBaseLine As integer = drawPosY - pixYMin
		  dim finalYSpan As integer = pixYMax - pixYMin
		  
		  
		  //sum up glyph starts and set final width
		  dim glyphPixStarts(), curPixStart As integer
		  curPixStart = 1         //padding 1 pixel each side of span
		  for i As integer = 0 to rawXSpans.Ubound
		    glyphPixStarts.Append curPixStart
		    curPixStart = curPixStart + rawXSpans(i) + 3    //+span to get end pixel, +2 to get end of 2 pixel padding, +1 to get at next start pixel pos
		  next
		  dim finalXSpan As integer = curPixStart - 2      //-2 to undo the added pixel padding, leaves coord of last rightmost single pixel padding column
		  dim finalWidth As integer = finalXSpan + 1
		  
		  
		  //create final pic
		  dim finalPic As Picture = newFormattedPic(finalWidth, finalYSpan + 1, theFontName, theFontSize, withBold, withItalic)
		  dim finalg As Graphics = finalPic.Graphics
		  finalg.ForeColor = &cFFFFFF
		  finalg.FillRect(0, 0, finalg.Width, finalg.Height)
		  finalg.ForeColor = &c000000
		  
		  //draw each glyph and collect u coords)
		  dim U0(), U1() As single
		  for i As integer = 0 to chars.Ubound
		    finalg.DrawString(chars(i), glyphPixStarts(i) + rawXOffsets(i), finalBaseLine)
		    U0.Append glyphPixStarts(i) / finalWidth
		    U1.Append (glyphPixStarts(i) + rawXSpans(i) + 1) / finalWidth
		  next
		  
		  
		  //================================ store computed variables in properties
		  charYHeight   = finalPic.Height
		  charYBaseLine = finalBaseLine
		  charXAdvance  = charRealAdvances
		  for i As integer = 0 to rawXOffsets.Ubound //int() to single()
		    glyphXOffset.Append rawXOffsets(i)  
		  next
		  for i As integer = 0 to rawXSpans.Ubound   //int() span to single() width
		    glyphXWidth.Append rawXSpans(i) + 1
		  next
		  glyphU0Coords = U0
		  glyphU1Coords = U1
		  
		  //store generated finalPic
		  if saveMem then
		    savedTexMem = EZTexture2D.generateFormattedMem(nil, finalPic, true)
		  else
		    glyphTexture = new EZTexture2D(nil, finalPic, true)
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(fontData As MemoryBlock)
		  
		  dim p As Ptr =fontData
		  
		  charYHeight = p.Single(0) 
		  charYBaseLine = p.Single(4)
		  
		  dim arrLast As integer = p.UInt32(8)
		  redim charXAdvance(arrLast)
		  redim glyphU0Coords(arrLast)
		  redim glyphU1Coords(arrLast)
		  redim glyphXOffset(arrLast)
		  redim glyphXWidth(arrLast)
		  
		  dim base As integer = 12
		  for i As integer = 0 to arrLast
		    charXAdvance(i) = p.Single(base) 
		    glyphU0Coords(i) = p.Single(base+4)
		    glyphU1Coords(i) = p.Single(base+8)
		    glyphXOffset(i) = p.Single(base+12)
		    glyphXWidth(i) = p.Single(base+16)
		    base = base + 20
		  next
		  
		  dim length As UInt32 = p.UInt32(base)
		  glyphTexture = new EZTexture2D(fontData.StringValue(base+4, length))
		  
		  //create vertex array memory
		  vertData = new EZMemSingles2D(3)
		  uvData = new EZMemSingles2D(3)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theFontName As String = "Arial", theFontSize As single = 14, withBold As boolean = true, withItalic As boolean = false)
		  
		  
		  
		  buildFontData(theFontName, theFontSize, withBold, withItalic, false)
		  
		  //create vertex array memory
		  vertData = new EZMemSingles2D(3)
		  uvData = new EZMemSingles2D(3)
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub draw2ColorString(text As String, posXLeft As single, posYTop As integer, col1 As Color, charCount as integer, col2 As Color, scale As single = 1.0)
		  //REPEAT OF DRAWSTRING WITH 2 ADDED LINES
		  
		  //save state before modifying
		  OpenGL.glPushAttrib(OpenGL.GL_COLOR_BUFFER_BIT + OpenGL.GL_ENABLE_BIT + OpenGL.GL_TEXTURE_BIT) 'g.attrib.push(attribBit.colour, attribBit.enable, attribBit.texture)
		  
		  //===================== setup drawing params
		  OpenGL.glEnable(OpenGL.GL_BLEND) 'g.blend.enable
		  OpenGL.glBlendFunc(OpenGL.GL_SRC_ALPHA, OpenGL.GL_ONE_MINUS_SRC_ALPHA) 'g.blend.setFuncStandardAlpha
		  
		  OpenGL.glEnable(OpenGL.GL_TEXTURE_2D) 'g.texture.enable
		  glyphTexture.bind
		  
		  OpenGL.glEnableClientState(OpenGL.GL_VERTEX_ARRAY) 'g.arrays.enableVertex
		  OpenGL.glEnableClientState(OpenGL.GL_TEXTURE_COORD_ARRAY) 'g.arrays.enableTextureCoord
		  OpenGL.glVertexPointer(2, OpenGL.GL_FLOAT, 0, vertData) 'g.arrays.setVertex2DData(vertData)
		  OpenGL.glTexCoordPointer(2, OpenGL.GL_FLOAT, 0, uvData) 'g.arrays.setTextureCoord2DData(uvData)
		  
		  'drawArraysAsType = OpenGL.GL_QUADS //g.arrays.primAsQuads
		  
		  //++++++++++++++++++++++++++
		  OpenGL.glColor3ub(col1.Red, col1.Green, col1.Blue) 'g.draw.colour(col1) //++++++ <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ADDED
		  //++++++++++++++++++++++++++
		  
		  //========================== create char array
		  dim sa() As String = text.SplitB("")
		  
		  //========================= setup vertex array coords
		  dim baseCharX, x0, x1, y0, y1, u0, u1 As single
		  if scale = 1.0 then     //directly apply coords
		    baseCharX = posXLeft
		    y0 = posYTop
		    y1 = posYTop + charYHeight
		  else                    //draw at <0, 0> under a scale+translate transform
		    baseCharX = 0
		    y0 = 0
		    y1 = charYHeight
		    OpenGL.glPushMatrix 'g.xform.pushMatrix
		    OpenGL.glTranslatef(posXLeft, posYTop, 0) 'g.xform.translate(posXLeft, posYTop, 0)
		    OpenGL.glScalef(scale, scale, scale) 'g.xform.scale(scale)
		  end
		  
		  //========================== draw each char/glyph/quad
		  dim charIdx As integer
		  for i As integer = 0 to sa.Ubound
		    charIdx = sa(i).AscB - 32
		    
		    //+++++++++++++++++++++++++++++++++++++++++++++++
		    if i = charCount then OpenGL.glColor3ub(col2.Red, col2.Green, col2.Blue) 'g.draw.colour(col2) //+++++ <<<<<<<<<<<<<<<<<<<<< ADDED
		    //+++++++++++++++++++++++++++++++++++++++++++++++
		    
		    if charIdx < 0 or charIdx > glyphXOffset.Ubound then continue for i //skip bad ascii that creep in
		    
		    x0 = baseCharX - glyphXOffset(charIdx)
		    x1 = x0 + glyphXWidth(charIdx)
		    vertData.set(0, x0, y0)
		    vertData.set(1, x1, y0)
		    vertData.set(2, x1, y1)
		    vertData.set(3, x0, y1)
		    
		    u0 = glyphU0Coords(charIdx)
		    u1 = glyphU1Coords(charIdx)
		    uvData.set(0, u0, 0.0)
		    uvData.set(1, u1, 0.0)
		    uvData.set(2, u1, 1.0)
		    uvData.set(3, u0, 1.0)
		    
		    OpenGL.glDrawArrays(OpenGL.GL_QUADS, 0, 4) 'g.arrays.drawArrays(0, 3)
		    
		    baseCharX = baseCharX + charXAdvance(charIdx)
		    
		  next
		  
		  //====================== clean up
		  if scale <> 1.0 then OpenGL.glPopMatrix 'g.xform.popMatrix
		  
		  OpenGL.glDisableClientState(OpenGL.GL_VERTEX_ARRAY) 'g.arrays.disableAll
		  OpenGL.glDisableClientState(OpenGL.GL_TEXTURE_COORD_ARRAY)
		  'OpenGL.glDisable(OpenGL.GL_BLEND) 'g.blend.disable
		  'OpenGL.glDisable(OpenGL.GL_TEXTURE_2D) 'g.texture.disable
		  
		  //======================= restore state
		  OpenGL.glPopAttrib //g.attrib.pop
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawString(text As String, posXLeft As single, posYTop As single, scale As single = 1.0)
		  
		  //save state before modifying
		  OpenGL.glPushAttrib(OpenGL.GL_COLOR_BUFFER_BIT + OpenGL.GL_ENABLE_BIT + OpenGL.GL_TEXTURE_BIT) 'g.attrib.push(attribBit.colour, attribBit.enable, attribBit.texture)
		  
		  //===================== setup drawing params
		  OpenGL.glEnable(OpenGL.GL_BLEND) 'g.blend.enable
		  OpenGL.glBlendFunc(OpenGL.GL_SRC_ALPHA, OpenGL.GL_ONE_MINUS_SRC_ALPHA) 'g.blend.setFuncStandardAlpha
		  
		  OpenGL.glEnable(OpenGL.GL_TEXTURE_2D) 'g.texture.enable
		  glyphTexture.bind
		  
		  OpenGL.glEnableClientState(OpenGL.GL_VERTEX_ARRAY) 'g.arrays.enableVertex
		  OpenGL.glEnableClientState(OpenGL.GL_TEXTURE_COORD_ARRAY) 'g.arrays.enableTextureCoord
		  OpenGL.glVertexPointer(2, OpenGL.GL_FLOAT, 0, vertData) 'g.arrays.setVertex2DData(vertData)
		  OpenGL.glTexCoordPointer(2, OpenGL.GL_FLOAT, 0, uvData) 'g.arrays.setTextureCoord2DData(uvData)
		  
		  'drawArraysAsType = OpenGL.GL_QUADS //g.arrays.primAsQuads
		  
		  //========================== create char array
		  dim sa() As String = text.SplitB("")
		  
		  //========================= setup vertex array coords
		  dim baseCharX, x0, x1, y0, y1, u0, u1 As single
		  if scale = 1.0 then     //directly apply coords
		    baseCharX = posXLeft
		    y0 = posYTop
		    y1 = posYTop + charYHeight
		  else                    //draw at <0, 0> under a scale+translate transform
		    baseCharX = 0
		    y0 = 0
		    y1 = charYHeight
		    OpenGL.glPushMatrix 'g.xform.pushMatrix
		    OpenGL.glTranslatef(posXLeft, posYTop, 0) 'g.xform.translate(posXLeft, posYTop, 0)
		    OpenGL.glScalef(scale, scale, scale) 'g.xform.scale(scale)
		  end
		  
		  //========================== draw each char/glyph/quad
		  dim charIdx As integer
		  for i As integer = 0 to sa.Ubound
		    charIdx = sa(i).AscB - 32
		    
		    if charIdx < 0 or charIdx > glyphXOffset.Ubound then continue for i //skip bad ascii that creep in
		    
		    x0 = baseCharX - glyphXOffset(charIdx)
		    x1 = x0 + glyphXWidth(charIdx)
		    vertData.set(0, x0, y0)
		    vertData.set(1, x1, y0)
		    vertData.set(2, x1, y1)
		    vertData.set(3, x0, y1)
		    
		    u0 = glyphU0Coords(charIdx)
		    u1 = glyphU1Coords(charIdx)
		    uvData.set(0, u0, 0.0)
		    uvData.set(1, u1, 0.0)
		    uvData.set(2, u1, 1.0)
		    uvData.set(3, u0, 1.0)
		    
		    OpenGL.glDrawArrays(OpenGL.GL_QUADS, 0, 4) 'g.arrays.drawArrays(0, 3)
		    
		    baseCharX = baseCharX + charXAdvance(charIdx)
		    
		  next
		  
		  //====================== clean up
		  if scale <> 1.0 then OpenGL.glPopMatrix 'g.xform.popMatrix
		  
		  OpenGL.glDisableClientState(OpenGL.GL_VERTEX_ARRAY) 'g.arrays.disableAll
		  OpenGL.glDisableClientState(OpenGL.GL_TEXTURE_COORD_ARRAY)
		  'OpenGL.glDisable(OpenGL.GL_BLEND) 'g.blend.disable
		  'OpenGL.glDisable(OpenGL.GL_TEXTURE_2D) 'g.texture.disable
		  
		  //======================= restore state
		  OpenGL.glPopAttrib //g.attrib.pop 
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawStringCentered(text As String, posXCenter As single, posYCenter As single, scale As single = 1.0)
		  drawString(text, posXCenter - stringWidth(text, scale) * 0.5, posYCenter - stringHeight(scale) * 0.5, scale)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawStringRight(text As String, posXRight As single, posYTop As single, scale As single = 1.0)
		  drawString(text, posXRight - stringWidth(text, scale), posYTop, scale)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function generateFontDataMemory(theFontName As String, theFontSize As single, withBold As boolean, withItalic As boolean) As MemoryBlock
		  
		  dim t As new EZFont
		  t.buildFontData(theFontName, theFontSize, withBold, withItalic, true)
		  
		  dim arrLast As integer = t.charXAdvance.Ubound //all arrays same size
		  dim texMemSize As UInt32 = t.savedTexMem.Size
		  
		  dim mem As new MemoryBlock(12 + (arrLast+1)*20 + 4 + texMemSize)
		  dim p As Ptr = mem
		  
		  p.Single(0) = t.charYHeight
		  p.Single(4) = t.charYBaseLine
		  p.UInt32(8) = arrLast //all arrays are the same size, should always be 95 elements
		  dim base As integer = 12
		  for i As integer = 0 to arrLast
		    p.Single(base) = t.charXAdvance(i)
		    p.Single(base+4) = t.glyphU0Coords(i)
		    p.Single(base+8) = t.glyphU1Coords(i)
		    p.Single(base+12) = t.glyphXOffset(i)
		    p.Single(base+16) = t.glyphXWidth(i)
		    base = base + 20
		  next
		  
		  p.UInt32(base) = texMemSize
		  mem.StringValue(base+4, texMemSize) = t.savedTexMem
		  
		  return mem
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function listChars() As String()
		  dim chars() As String
		  
		  for i As integer = 32 to 126 //space to ~   (95 chars total)
		    chars.Append Chr(i)
		  next
		  
		  return chars
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function newFormattedPic(width As integer, height As integer, theFontName As String, theFontSize As integer, withBold As Boolean, withItalic As Boolean) As Picture
		  dim p As Picture
		  if TargetCarbon then
		    p = new Picture(width, height, 32)
		  else
		    p = new Picture(width, height)
		  end
		  dim g As Graphics = p.Graphics
		  g.TextFont = theFontName
		  g.TextSize = theFontSize
		  g.Bold = withBold
		  g.Italic = withItalic
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub scanForGlyphXBounds(tempPic As Picture, char As String, drawPosX As integer, drawPosY As integer, byref XMin As integer, byref XMax As integer, byref YMin As integer, byref YMax As integer)
		  //assume tempPic is setup with textfont, textSize and with enough overflow
		  //clear and draw glyph
		  tempPic.Graphics.ForeColor = &cFFFFFF
		  tempPic.Graphics.FillRect(0, 0, tempPic.Width, tempPic.Height)
		  tempPic.Graphics.ForeColor = &c000000
		  tempPic.Graphics.DrawString(char, drawPosX, drawPosY)
		  
		  //scan
		  dim surf As RGBSurface = tempPic.RGBSurface
		  dim w As integer = tempPic.Width - 1
		  dim h As integer = tempPic.Height - 1
		  dim x, y As integer
		  
		  dim thisXmin As integer = w //X Left/Start/Min
		  for x = 0 to w 
		    for y = 0 to h
		      if surf.Pixel(x, y) <> &cFFFFFF then
		        thisXmin = x
		        exit for x
		      end
		    next
		  next
		  dim thisXmax As integer = 0 //X Right/End/Max
		  for x = w downto 0
		    for y = 0 to h
		      if surf.Pixel(x, y) <> &cFFFFFF then
		        thisXmax = x
		        exit for x
		      end
		    next
		  next
		  dim thisYmin As integer = h  //Y Top/Min
		  for y = 0 to h
		    for x = 0 to w
		      if surf.Pixel(x, y) <> &cFFFFFF then
		        thisYmin = y
		        exit for y
		      end
		    next
		  next
		  dim thisYmax As integer = 0  //Y Bottom/Max
		  for y = h downto 0
		    for x = 0 to w
		      if surf.Pixel(x, y) <> &cFFFFFF then
		        thisYmax = y
		        exit for y
		      end
		    next
		  next
		  
		  //clamp XStart and XEnd values
		  if thisXmin > drawPosX then thisXmin = drawPosX
		  if thisXmax < drawPosX then thisXmax = drawPosX
		  
		  //set return values
		  XMin = thisXmin
		  XMax = thisXmax
		  if thisYmin < YMin then YMin = thisYmin
		  if thisYmax > YMax then YMax = thisYmax
		  
		  
		  
		  
		  //================================== hack warning about scratch space outflow
		  if thisXmin = 0 or thisXmax = w or thisYmin = 0 or thisYmax = h then
		    MsgBox "EZFont: too big " + tempPic.Graphics.TextFont + " (" + char + ":" + Str(Asc(char)) + ") " + Str(thisXmin) + ", " + Str(thisXmax) + ", " + Str(thisYmin) + ", " + Str(thisYmax)
		    'break
		  end
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function stringBaseLineY(scale As single = 1.0) As single
		  return charYBaseLine * scale
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function stringHeight(scale As single = 1.0) As single
		  return charYHeight * scale
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function stringWidth(text As String, scale As single = 1.0) As single
		  
		  dim sa() As String = text.SplitB("")
		  
		  dim wSum As single = 0.0
		  
		  for i As integer = 0 to sa.Ubound
		    wSum = wSum + charXAdvance(Asc(sa(i)) - 32)
		  next
		  
		  return wSum * scale
		End Function
	#tag EndMethod


	#tag Note, Name = about
		
		EZFont manages font creation and string drawing using OpenGL textured quads.
		
		
		
		Usage:
		EZFont needs to store a single texture of all the font glyphs. So when you generate 
		the texture bank leave a space for each font you want to have
		
		    g.texture.texBankGen(100) //reserve index 0 for the font
		
		Then create a EZFont instance and keep it around for drawing
		
		    //arialFont is a property
		    //parameters (g as ezgl, texBankIdx to use, font name, font size, font bold, font italic)
		
		    arialFont = new EZFont(g, 0, "Arial", 30, true, false)
		
		In the constructor an image is generated and put in that texture bank, and 
		several metrics for drawing are stored in the EZFont instance. To draw a string...
		
		    g.draw.colour(&c00FF00)    //set font color
		
		    arialFont.drawString(g, "the text", positionX, positionY)
		
		Here positionY marks the top of the string rect, not the textual base line.
		Also these...
		
		    dim w As single  = arialFont.stringWidth("the text")
		    dim h As single  = arialFont.stringHeight
		    dim bl As single = arialFont.stringBaseLineY
		
		    //draw a 2 color string
		    arialFont.draw2ColorString(g, "the text", posX, posY, Color1, charCountForColor1, Color2ForRestOfString)
		
		
		
		
		Restrictions:
		The passed in string is treated as bytes (SplitB) and will only work with 
		characters in the lower ascii range: 32 " " (space) to 126 "~" (tilda). 
		Any char/byte/ascii outside range will cause an out-of-bounds exception.
		
		
		
		
		Known issues:
		To find a letters actual glyph bounds the letter is drawn into a temporary
		picture that's 3 times the font size in width and 40 pixels taller than the
		text height. Still, some font letters go outside those bounds, like Zapfino.
		A MsgBox is shown if this happens while generating a font. Fix is to pad more.
		
		It appears alpha values 'weaken' between the Graphics.DrawString rendering
		of a letter glyph and what's drawn by OpenGL, so the antialiased edges get softer
		and the font looks like a lower weight. They still look ok, just not bold enough
		compared to what's rendered in a canvas. Not sure how to fatten the fonts.
		
		
		
		
		To do:
		It takes time scanning and building up the glyph texture which can be 
		bypassed by precomputing the font data into a single memory block, then 
		use the alternate constructor to quickly unpack it.
		
		    dim buildCourier As new EZFont(g, -1, "Courier", 24, true, false)   //generate font infos and hold onto glyph image
		
		A negative texture bank index tells the constructor to hold onto the 
		image data instead of sending it to the texture bank and forgetting it.
		
		    dim courierData As MemoryBlock = buildCourier.buildFontDataMemory   //pack into a single memory block
		
		That creates the data which you need to store in a file or Base64 encoded 
		string constant. Next time, loading into property 'courier As EZFont' looks like...
		
		    dim courierData As MemoryBlock = loadTheCourierFontData()  //reload the memory
		
		    courier = new EZFont(g, texBankIdx, courierData)        //unpack data, no generating/calculating
		
		
		
		
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private charXAdvance() As single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private charYBaseLine As single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private charYHeight As single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private glyphTexture As EZTexture2D
	#tag EndProperty

	#tag Property, Flags = &h21
		Private glyphU0Coords() As single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private glyphU1Coords() As single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private glyphXOffset() As single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private glyphXWidth() As single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private savedTexMem As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private uvData As EZMemSingles2D
	#tag EndProperty

	#tag Property, Flags = &h21
		Private vertData As EZMemSingles2D
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
