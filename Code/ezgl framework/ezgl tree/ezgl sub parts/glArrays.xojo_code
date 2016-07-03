#tag Class
Protected Class glArrays
	#tag Method, Flags = &h0
		Sub disableAll()
		  
		  if areEnabled(0) then disableColor
		  if areEnabled(1) then disableEdgeFlag
		  if areEnabled(2) then disableFogCoord
		  if areEnabled(3) then disableNormal
		  if areEnabled(4) then disableSecondaryColor
		  if areEnabled(5) then disableTextureCoord
		  if areEnabled(6) then disableVertex
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub disableColor()
		  
		  OpenGL.glDisableClientState(OpenGL.GL_COLOR_ARRAY)
		  
		  areEnabled(0) = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub disableEdgeFlag()
		  
		  OpenGL.glDisableClientState(OpenGL.GL_EDGE_FLAG_ARRAY)
		  
		  areEnabled(1) = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub disableFogCoord()
		  
		  OpenGL.glDisableClientState(OpenGL.GL_FOG_COORDINATE_ARRAY)
		  
		  areEnabled(2) = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub disableNormal()
		  
		  OpenGL.glDisableClientState(OpenGL.GL_NORMAL_ARRAY)
		  
		  areEnabled(3) = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub disableSecondaryColor()
		  
		  OpenGL.glDisableClientState(OpenGL.GL_SECONDARY_COLOR_ARRAY)
		  
		  areEnabled(4) = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub disableTextureCoord()
		  
		  OpenGL.glDisableClientState(OpenGL.GL_TEXTURE_COORD_ARRAY)
		  
		  areEnabled(5) = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub disableVertex()
		  
		  OpenGL.glDisableClientState(OpenGL.GL_VERTEX_ARRAY)
		  
		  areEnabled(6) = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawArrays(startingIndex As integer, endingIndex As integer)
		  
		  OpenGL.glDrawArrays(drawArraysAsType, startingIndex, endingIndex - startingIndex + 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawElements(lastIndice As integer, indices As MemoryBlock)
		  
		  OpenGL.glDrawElements(drawArraysAsType, lastIndice + 1, OpenGL.GL_UNSIGNED_INT, indices)
		  
		  'indices are tightly packed UInt32s
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawElementsMulti(lastIndex As integer, counts As MemoryBlock, indices As MemoryBlock)
		  
		  OpenGL.glMultiDrawElements(drawArraysAsType, counts, OpenGL.GL_UNSIGNED_INT, indices, lastIndex + 1)    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawRangeElements(minIndex As integer, maxIndex As integer, lastIndice As integer, indices As MemoryBlock)
		  
		  OpenGL.glDrawRangeElements(drawArraysAsType, minIndex, maxIndex, lastIndice + 1, OpenGL.GL_UNSIGNED_INT, indices)
		  
		  'indices are tightly packed UInt32s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enableColor()
		  
		  OpenGL.glEnableClientState(OpenGL.GL_COLOR_ARRAY)
		  
		  areEnabled(0) = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enableEdgeFlag()
		  
		  OpenGL.glEnableClientState(OpenGL.GL_EDGE_FLAG_ARRAY)
		  
		  areEnabled(1) = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enableFogCoord()
		  
		  OpenGL.glEnableClientState(OpenGL.GL_FOG_COORDINATE_ARRAY)
		  
		  areEnabled(2) = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enableNormal()
		  
		  OpenGL.glEnableClientState(OpenGL.GL_NORMAL_ARRAY)
		  
		  areEnabled(3) = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enableSecondaryColor()
		  
		  OpenGL.glEnableClientState(OpenGL.GL_SECONDARY_COLOR_ARRAY)
		  
		  areEnabled(4) = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enableTextureCoord()
		  
		  OpenGL.glEnableClientState(OpenGL.GL_TEXTURE_COORD_ARRAY)
		  
		  areEnabled(5) = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enableVertex()
		  
		  OpenGL.glEnableClientState(OpenGL.GL_VERTEX_ARRAY)
		  
		  areEnabled(6) = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub primAsLineLoop()
		  drawArraysAsType = OpenGL.GL_LINE_LOOP
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub primAsLines()
		  drawArraysAsType = OpenGL.GL_LINES
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub primAsLineStrip()
		  drawArraysAsType = OpenGL.GL_LINE_STRIP
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub primAsPoints()
		  drawArraysAsType = OpenGL.GL_POINTS
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub primAsPolygon()
		  drawArraysAsType = OpenGL.GL_POLYGON
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub primAsQuads()
		  drawArraysAsType = OpenGL.GL_QUADS
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub primAsQuadStrip()
		  drawArraysAsType = OpenGL.GL_QUAD_STRIP
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub primAsTriangleFan()
		  drawArraysAsType = OpenGL.GL_TRIANGLE_FAN
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub primAsTriangles()
		  drawArraysAsType = OpenGL.GL_TRIANGLES
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub primAsTriangleStrip()
		  drawArraysAsType = OpenGL.GL_TRIANGLE_STRIP
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setColorRGBAData(rgba As MemoryBlock)
		  
		  OpenGL.glColorPointer(4, OpenGL.GL_FLOAT, 0, rgba)
		  
		  '4 singles per color
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setColorRGBData(rgb As MemoryBlock)
		  
		  OpenGL.glColorPointer(3, OpenGL.GL_FLOAT, 0, rgb)
		  
		  '3 singles per color
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setEdgeFlagData(edgeFlags As MemoryBlock)
		  
		  OpenGL.glEdgeFlagPointer(0, edgeFlags)
		  
		  'glEdgeFlagPointer(int stride, void* pointer)
		  'glEdgeFlagPointer specifies the location and data format of an array of 
		  'boolean edge flags to use when rendering. stride specifies the byte stride 
		  'from one edge flag to the next, allowing vertices and attributes to be packed 
		  'into a single array or stored in separate arrays.
		  
		  'so is the memory 1 bit per flag or 1 byte?
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setFogCoordData(fogCoords As MemoryBlock)
		  
		  OpenGL.glFogCoordPointer(OpenGL.GL_FLOAT, 0, fogCoords)
		  
		  '1 single per coord
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setNormalData(normals As MemoryBlock)
		  
		  OpenGL.glNormalPointer(OpenGL.GL_FLOAT, 0, normals)
		  
		  '3 singles per normal
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setSecondaryColorData(colors As MemoryBlock)
		  
		  OpenGL.glSecondaryColorPointer(3, OpenGL.GL_FLOAT, 0, colors)
		  
		  '3 floats per color
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setTextureCoord1DData(texCoords As MemoryBlock)
		  
		  OpenGL.glTexCoordPointer(1, OpenGL.GL_FLOAT, 0, texCoords)
		  
		  '1 float per coord
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setTextureCoord2DData(texCoords As MemoryBlock)
		  
		  OpenGL.glTexCoordPointer(2, OpenGL.GL_FLOAT, 0, texCoords)
		  
		  '2 floats per coord
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setTextureCoord3DData(texCoords As MemoryBlock)
		  
		  OpenGL.glTexCoordPointer(3, OpenGL.GL_FLOAT, 0, texCoords)
		  
		  '3 floats per coord
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setTextureCoord4DData(texCoords As MemoryBlock)
		  
		  OpenGL.glTexCoordPointer(4, OpenGL.GL_FLOAT, 0, texCoords)
		  
		  '4 floats per coord
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setVertex2DData(vertices As MemoryBlock)
		  
		  OpenGL.glVertexPointer(2, OpenGL.GL_FLOAT, 0, vertices)
		  
		  '2 floats per vertex
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setVertex3DData(vertices As MemoryBlock)
		  
		  OpenGL.glVertexPointer(3, OpenGL.GL_FLOAT, 0, vertices)
		  
		  '3 floats per vertex
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setVertex4DData(vertices As MemoryBlock)
		  
		  OpenGL.glVertexPointer(4, OpenGL.GL_FLOAT, 0, vertices)
		  
		  '4 floats per vertex
		End Sub
	#tag EndMethod


	#tag Note, Name = about
		OpenGL 'arrays' are a more efficient way to draw geometric primitives
		
		Instead of a series of vertex, normal, color, texture calls you can set
		arrays with that info then call drawArrays to send it all in one go. 
		
		In this ezgl implementation all arrays are treated as tighly packed singles.
		Check each "set" method for the MemoryBlock values format
		
		
		//to add
		glInterleavedArrays
		works with color, normal, texture and vertex
		
		
		
		calls to enable/disable array use in drawing gl arrays
		glEnableClientState
		glDisableClientState
		GL_VERTEX_ARRAY
		GL_COLOR_ARRAY
		GL_NORMAL_ARRAY
		GL_TEXTURE_COORD_ARRAY
		GL_EDGE_FLAG_ARRAY
		GL_SECONDARY_COLOR_ARRAY
		GL_FOG_COORD_ARRAY
		
		
		
		calls to set gl array pointers
		glVertexPointer():  specify pointer to vertex coords array
		glNormalPointer():  specify pointer to normal array
		glColorPointer():  specify pointer to RGB color array
		glTexCoordPointer():  specify pointer to texture cords array
		glEdgeFlagPointer():  specify pointer to edge flag array
		glSecondaryColorPointer
		glFogCoordPointer
		
		
		calls to draw gl arrays
		glDrawArrays(draw type, start index, indices to draw)
		glDrawElements(draw type, arr count, arr value type, arr pointer)
		glDrawRangeElements(draw type, arr start, arr end, arr count, arr type, arr pointer)
		also
		glDrawBuffer - specifies color buffer to draw into
		glDrawBuffers - specific multiple color buffers to draw into
		glDrawPixels - write pixels into frame buffer
		
		
		
		
		draw types
		GL_POINTS
		GL_LINE_STRIP
		GL_LINE_LOOP
		GL_LINES
		GL_TRIANGLE_STRIP
		GL_TRIANGLE_FAN
		GL_TRIANGLES
		GL_QUAD_STRIP
		GL_QUADS
		GL_POLYGON
		
		
		
		
		
		vcnt   combos
		v
		c
		n
		t
		vc
		vn
		vt
		cn
		ct
		nt
		vcn
		vct
		vnt
		cnt
		vcnt
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private areEnabled(6) As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private drawArraysAsType As Integer
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
