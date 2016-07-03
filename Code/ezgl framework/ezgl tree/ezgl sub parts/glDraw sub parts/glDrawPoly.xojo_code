#tag Class
Protected Class glDrawPoly
	#tag Method, Flags = &h0
		Sub modeFill(doFront As boolean = false, doBack As boolean = false)
		  
		  if doFront = doBack then
		    OpenGL.glPolygonMode(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_FILL)
		  elseif doFront then
		    OpenGL.glPolygonMode(OpenGL.GL_FRONT, OpenGL.GL_FILL)
		  else
		    OpenGL.glPolygonMode(OpenGL.GL_BACK, OpenGL.GL_FILL)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub modeLine(doFront As boolean = false, doBack As boolean = false)
		  
		  if doFront = doBack then
		    OpenGL.glPolygonMode(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_LINE)
		  elseif doFront then
		    OpenGL.glPolygonMode(OpenGL.GL_FRONT, OpenGL.GL_LINE)
		  else
		    OpenGL.glPolygonMode(OpenGL.GL_BACK, OpenGL.GL_LINE)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub modePoint(doFront As boolean = false, doBack As boolean = false)
		  
		  if doFront = doBack then
		    OpenGL.glPolygonMode(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_POINT)
		  elseif doFront then
		    OpenGL.glPolygonMode(OpenGL.GL_FRONT, OpenGL.GL_POINT)
		  else
		    OpenGL.glPolygonMode(OpenGL.GL_BACK, OpenGL.GL_POINT)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub offsetFactor(factor As single, units As single)
		  
		  OpenGL.glPolygonOffset(factor, units)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub offsetFillDisable()
		  
		  OpenGL.glDisable(OpenGL.GL_POLYGON_OFFSET_FILL)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub offsetFillEnable()
		  
		  OpenGL.glEnable(OpenGL.GL_POLYGON_OFFSET_FILL)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub offsetLineDisable()
		  
		  OpenGL.glDisable(OpenGL.GL_POLYGON_OFFSET_LINE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub offsetLineEnable()
		  
		  OpenGL.glEnable(OpenGL.GL_POLYGON_OFFSET_LINE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub offsetPointDisable()
		  
		  OpenGL.glDisable(OpenGL.GL_POLYGON_OFFSET_POINT)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub offsetPointEnable()
		  
		  OpenGL.glEnable(OpenGL.GL_POLYGON_OFFSET_POINT)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub smoothDisable()
		  
		  OpenGL.glDisable(OpenGL.GL_POLYGON_SMOOTH)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub smoothEnable()
		  
		  OpenGL.glEnable(OpenGL.GL_POLYGON_SMOOTH)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stippleDisable()
		  
		  OpenGL.glDisable(OpenGL.GL_POLYGON_STIPPLE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stippleEnable()
		  
		  OpenGL.glEnable(OpenGL.GL_POLYGON_STIPPLE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stipplePattern(pattern As MemoryBlock)
		  
		  
		  OpenGL.glPolygonStipple(pattern)
		  
		  
		  'pattern is a pointer to a 32x32 stipple pattern that is stored in
		  'memory just like the pixel data supplied to a glDrawPixels call
		  'with height and width both equal to 32, a pixel format of
		  'GL_COLOR_INDEX, and data type of GL_BITMAP. That is, the stipple
		  'pattern is represented as a 3232 array of 1-bit color indices
		  'packed in unsigned bytes. glPixelStore parameters like
		  'GL_UNPACK_SWAP_BYTES and GL_UNPACK_LSB_FIRST affect the
		  'assembling of the bits into a stipple pattern. Pixel transfer
		  'operations (shift, offset, pixel map) are not applied to the
		  'stipple image, however.
		End Sub
	#tag EndMethod


	#tag Note, Name = about
		
		Options when drawing a polygon primitive type
		
		
		Polygons have a Front and a Back face and each side can be drawn
		as either filled (default), lines or points. Use the methods
		prefixed "mode" to set what as what.
		
		You can set a depth offset and when to use the offset
		
		fill style can also have a stipple pattern, supplied as a 128 byte MemoryBlock, 32x32 bits
		
		===================================================================================
		
		  setting faces to Fill
		modeFillFrontAndBack -- both front and back faces are filled
		modeFillFront -- set only front faces filled
		modeFillBack -- set only back faces filled
		
		  setting faces to draw as lines (uses settings from 'line' sub-part)
		modeLineFrontAndBack
		modeLineFront
		modeLineBack
		
		  setting faces to draw as points (uses settings from 'point' sub-part)
		modePointFrontAndBack
		modePointFront
		modePointBack
		
		
		
		offsetFactor -- if one of the three offsets are enabled this controls how to compute the offset
		
		offsetFillEnable, offsetFillDisable -- apply offset to filled faces
		offsetLineEnable, offsetLineDisable -- apply offset to lined faces
		offsetPointEnable, offsetPointDisable -- apply offset to pointed faces
		
		
		
		smoothEnable -- antialias filled faces
		smoothDisable -- draw aliased edges
		
		
		
		stipplePattern -- supply pattern
		stippleEnable, stippleDisable -- use stippling or not
		
		
		
		
		
		
		
		
	#tag EndNote


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
