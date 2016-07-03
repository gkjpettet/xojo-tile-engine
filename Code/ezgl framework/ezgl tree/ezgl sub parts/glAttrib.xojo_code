#tag Class
Protected Class glAttrib
	#tag Method, Flags = &h0
		Sub markAllOff()
		  
		  theMask = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub pop()
		  
		  OpenGL.glPopAttrib
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub push(Paramarray bits As attribBit)
		  
		  if bits.Ubound = -1 then //use stored bits
		    
		    OpenGL.glPushAttrib(theMask)
		    
		    theMask = 0
		    
		  else //use the passed paramarray of bits
		    
		    dim mask As UInt32
		    
		    for i As integer = 0 to bits.Ubound
		      mask = mask or CType(bits(i), UInt32)
		    next
		    
		    OpenGL.glPushAttrib(mask)
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setAccum()
		  
		  theMask = theMask or OpenGL.GL_ACCUM_BUFFER_BIT
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setColour()
		  
		  theMask = theMask or OpenGL.GL_COLOR_BUFFER_BIT
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setCurrent()
		  
		  theMask = theMask or OpenGL.GL_CURRENT_BIT
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setDepth()
		  
		  theMask = theMask or OpenGL.GL_DEPTH_BUFFER_BIT
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setEnable()
		  
		  theMask = theMask or OpenGL.GL_ENABLE_BIT
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setEval()
		  
		  theMask = theMask or OpenGL.GL_EVAL_BIT
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setFog()
		  
		  theMask = theMask or OpenGL.GL_FOG_BIT
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setHint()
		  
		  theMask = theMask or OpenGL.GL_HINT_BIT
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setLighting()
		  
		  theMask = theMask or OpenGL.GL_LIGHTING_BIT
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setLine()
		  
		  theMask = theMask or OpenGL.GL_LINE_BIT
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setList()
		  
		  theMask = theMask or OpenGL.GL_LIST_BIT
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setPixelMode()
		  
		  theMask = theMask or OpenGL.GL_PIXEL_MODE_BIT
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setPoint()
		  
		  theMask = theMask or OpenGL.GL_POINT_BIT
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setPolygon()
		  
		  theMask = theMask or OpenGL.GL_POLYGON_BIT
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setPolygonStipple()
		  
		  theMask = theMask or OpenGL.GL_POLYGON_STIPPLE_BIT
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setScissor()
		  
		  theMask = theMask or OpenGL.GL_SCISSOR_BIT
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setStencil()
		  
		  theMask = theMask or OpenGL.GL_STENCIL_BUFFER_BIT
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setTexture()
		  
		  theMask = theMask or OpenGL.GL_TEXTURE_BIT
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setTransform()
		  
		  theMask = theMask or OpenGL.GL_TRANSFORM_BIT
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setViewport()
		  
		  theMask = theMask or OpenGL.GL_VIEWPORT_BIT
		End Sub
	#tag EndMethod


	#tag Note, Name = about
		
		the attribute stack saves and restores state variables in the gl engine
		
		two ways to push onto the stack...
		
		1)
		g.attrib.push(glAttrib.bit.colour, glAttrib.bit.depth)
		
		2)
		g.attrib.setColour
		g.attrib.setDepth
		g.attrib.push
		
		in style 2 there's an internal mask of the bits that are collected
		for each set called. When push, without parameters, is called that
		internal mask is used then cleared back to 0
		
		in style 1 the parameters are a ParamArray
		
		both styles push onto the attribute stack, calling pop() will
		pop from the stack, works for both styles, doesn't matter how they were pushed
		
	#tag EndNote

	#tag Note, Name = attrib state value sets
		all state values tagged with attribute group
		http://www.glprogramming.com/red/appendixb.html
		
		================================================================
		
		attrib groups and the state vars they affect
		http://www.opengl.org/sdk/docs/man2/
		
		
		  GL_ACCUM_BUFFER_BIT                        Accum
		Accumulation buffer clear value
		
		  GL_COLOR_BUFFER_BIT                        Colour
		GL_ALPHA_TEST enable bit
		Alpha test function and reference value
		GL_BLEND enable bit
		Blending source and destination functions
		Constant blend color
		Blending equation
		GL_DITHER enable bit
		GL_DRAW_BUFFER setting
		GL_COLOR_LOGIC_OP enable bit
		GL_INDEX_LOGIC_OP enable bit
		Logic op function
		Color mode and index mode clear values
		Color mode and index mode writemasks
		
		  GL_CURRENT_BIT                            Current
		Current RGBA color
		Current color index
		Current normal vector
		Current texture coordinates
		Current raster position
		GL_CURRENT_RASTER_POSITION_VALID flag
		RGBA color associated with current raster position
		Color index associated with current raster position
		Texture coordinates associated with current raster position
		GL_EDGE_FLAG flag
		
		  GL_DEPTH_BUFFER_BIT                       Depth
		GL_DEPTH_TEST enable bit
		Depth buffer test function
		Depth buffer clear value
		GL_DEPTH_WRITEMASK enable bit
		
		  GL_ENABLE_BIT                             Enable
		GL_ALPHA_TEST flag
		GL_AUTO_NORMAL flag
		GL_BLEND flag
		Enable bits for the user-definable clipping planes
		GL_COLOR_MATERIAL
		GL_CULL_FACE flag
		GL_DEPTH_TEST flag
		GL_DITHER flag
		GL_FOG flag
		GL_LIGHTi where 0 <= i < GL_MAX_LIGHTS
		GL_LIGHTING flag
		GL_LINE_SMOOTH flag
		GL_LINE_STIPPLE flag
		GL_COLOR_LOGIC_OP flag
		GL_INDEX_LOGIC_OP flag
		GL_MAP1_x where x is a map type
		GL_MAP2_x where x is a map type
		GL_MULTISAMPLE flag
		GL_NORMALIZE flag
		GL_POINT_SMOOTH flag
		GL_POLYGON_OFFSET_LINE flag
		GL_POLYGON_OFFSET_FILL flag
		GL_POLYGON_OFFSET_POINT flag
		GL_POLYGON_SMOOTH flag
		GL_POLYGON_STIPPLE flag
		GL_SAMPLE_ALPHA_TO_COVERAGE flag
		GL_SAMPLE_ALPHA_TO_ONE flag
		GL_SAMPLE_COVERAGE flag
		GL_SCISSOR_TEST flag
		GL_STENCIL_TEST flag
		GL_TEXTURE_1D flag
		GL_TEXTURE_2D flag
		GL_TEXTURE_3D flag
		Flags GL_TEXTURE_GEN_x where x is S, T, R, or Q
		
		    GL_EVAL_BIT                                      Eval
		GL_MAP1_x enable bits, where x is a map type
		GL_MAP2_x enable bits, where x is a map type
		1D grid endpoints and divisions
		2D grid endpoints and divisions
		GL_AUTO_NORMAL enable bit
		
		    GL_FOG_BIT                                       Fog
		GL_FOG enable bit
		Fog color
		Fog density
		Linear fog start
		Linear fog end
		Fog index
		GL_FOG_MODE value
		
		    GL_HINT_BIT                                      Hint
		GL_PERSPECTIVE_CORRECTION_HINT setting
		GL_POINT_SMOOTH_HINT setting
		GL_LINE_SMOOTH_HINT setting
		GL_POLYGON_SMOOTH_HINT setting
		GL_FOG_HINT setting
		GL_GENERATE_MIPMAP_HINT setting
		GL_TEXTURE_COMPRESSION_HINT setting
		
		    GL_LIGHTING_BIT                                  Lighting
		GL_COLOR_MATERIAL enable bit
		GL_COLOR_MATERIAL_FACE value
		Color material parameters that are tracking the current color
		Ambient scene color
		GL_LIGHT_MODEL_LOCAL_VIEWER value
		GL_LIGHT_MODEL_TWO_SIDE setting
		GL_LIGHTING enable bit
		Enable bit for each light
		Ambient, diffuse, and specular intensity for each light
		Direction, position, exponent, and cutoff angle for each light
		Constant, linear, and quadratic attenuation factors for each light
		Ambient, diffuse, specular, and emissive color for each material
		Ambient, diffuse, and specular color indices for each material
		Specular exponent for each material
		GL_SHADE_MODEL setting
		
		    GL_LINE_BIT                                  Line
		GL_LINE_SMOOTH flag
		GL_LINE_STIPPLE enable bit
		Line stipple pattern and repeat counter
		Line width
		
		    GL_LIST_BIT                                  List
		GL_LIST_BASE setting
		
		    GL_PIXEL_MODE_BIT    
		GL_RED_BIAS and GL_RED_SCALE settings
		GL_GREEN_BIAS and GL_GREEN_SCALE values
		GL_BLUE_BIAS and GL_BLUE_SCALE
		GL_ALPHA_BIAS and GL_ALPHA_SCALE
		GL_DEPTH_BIAS and GL_DEPTH_SCALE
		GL_INDEX_OFFSET and GL_INDEX_SHIFT values
		GL_MAP_COLOR and GL_MAP_STENCIL flags
		GL_ZOOM_X and GL_ZOOM_Y factors
		GL_READ_BUFFER setting
		
		    GL_POINT_BIT                                 Point
		GL_POINT_SMOOTH flag
		Point size
		
		    GL_POLYGON_BIT                               Polygon
		GL_CULL_FACE enable bit
		GL_CULL_FACE_MODE value
		GL_FRONT_FACE indicator
		GL_POLYGON_MODE setting
		GL_POLYGON_SMOOTH flag
		GL_POLYGON_STIPPLE enable bit
		GL_POLYGON_OFFSET_FILL flag
		GL_POLYGON_OFFSET_LINE flag
		GL_POLYGON_OFFSET_POINT flag
		GL_POLYGON_OFFSET_FACTOR
		GL_POLYGON_OFFSET_UNITS
		
		    GL_POLYGON_STIPPLE_BIT                       PolygonStipple
		Polygon stipple image
		
		    GL_SCISSOR_BIT    
		GL_SCISSOR_TEST flag
		Scissor box
		
		    GL_STENCIL_BUFFER_BIT                        Stencil
		GL_STENCIL_TEST enable bit
		Stencil function and reference value
		Stencil value mask
		Stencil fail, pass, and depth buffer pass actions
		Stencil buffer clear value
		Stencil buffer writemask
		
		    GL_TEXTURE_BIT                                              Texture
		Enable bits for the four texture coordinates
		Border color for each texture image
		Minification function for each texture image
		Magnification function for each texture image
		Texture coordinates and wrap mode for each texture image
		Color and mode for each texture environment
		Enable bits GL_TEXTURE_GEN_x, x is S, T, R, and Q
		GL_TEXTURE_GEN_MODE setting for S, T, R, and Q
		glTexGen plane equations for S, T, R, and Q
		Current texture bindings (for example, GL_TEXTURE_BINDING_2D)
		
		    GL_TRANSFORM_BIT                                           Transform
		Coefficients of the six clipping planes
		Enable bits for the user-definable clipping planes
		GL_MATRIX_MODE value
		GL_NORMALIZE flag
		GL_RESCALE_NORMAL flag
		
		    GL_VIEWPORT_BIT                                           Viewport
		Depth range (near and far)
		Viewport origin and extent
		
		
		
		    ****GL_MULTISAMPLE_BIT**** (not included in ezgl but listed in reference)
		GL_MULTISAMPLE flag
		GL_SAMPLE_ALPHA_TO_COVERAGE flag
		GL_SAMPLE_ALPHA_TO_ONE flag
		GL_SAMPLE_COVERAGE flag
		GL_SAMPLE_COVERAGE_VALUE value
		GL_SAMPLE_COVERAGE_INVERT value
		
		
		
		
		
		
	#tag EndNote

	#tag Note, Name = collecting enum values
		 
		void glPushAttrib(GLbitfield mask);
		
		A GLbitfield is simply defined to be an unsigned int,
		
		
		
		'dim va() As integer
		'va.Append OpenGL.GL_ACCUM_BUFFER_BIT
		'va.Append OpenGL.GL_COLOR_BUFFER_BIT
		'va.Append OpenGL.GL_CURRENT_BIT
		'va.Append OpenGL.GL_DEPTH_BUFFER_BIT
		'va.Append OpenGL.GL_ENABLE_BIT
		'va.Append OpenGL.GL_EVAL_BIT
		'va.Append OpenGL.GL_FOG_BIT
		'va.Append OpenGL.GL_HINT_BIT
		'va.Append OpenGL.GL_LIGHTING_BIT
		'va.Append OpenGL.GL_LINE_BIT
		'va.Append OpenGL.GL_LIST_BIT
		'    'va.Append OpenGL.GL_MULTISAMPLE_BIT   536870912  ~10 shifts away
		'va.Append OpenGL.GL_PIXEL_MODE_BIT
		'va.Append OpenGL.GL_POINT_BIT
		'va.Append OpenGL.GL_POLYGON_BIT
		'va.Append OpenGL.GL_POLYGON_STIPPLE_BIT
		'va.Append OpenGL.GL_SCISSOR_BIT
		'va.Append OpenGL.GL_STENCIL_BUFFER_BIT
		'va.Append OpenGL.GL_TEXTURE_BIT
		'va.Append OpenGL.GL_TRANSFORM_BIT
		'va.Append OpenGL.GL_VIEWPORT_BIT
		'
		'dim sa() As String
		'for i As integer = 0 to va.Ubound
		'sa.Append Str(va(i))
		'next
		'
		'dim c As new Clipboard
		'c.SetText Join(sa, EndOfLine)
		'c.Close
		
		
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private theMask As UInt32
	#tag EndProperty


	#tag Enum, Name = bit, Type = Integer, Flags = &h0
		current = 1
		  point = 2
		  line = 4
		  polygon = 8
		  polygonStipple = 16
		  pixelMode = 32
		  lighting = 64
		  fog = 128
		  depth = 256
		  accum = 512
		  stencil = 1024
		  viewport = 2048
		  transform = 4096
		  enable = 8192
		  colour = 16384
		  hint = 32768
		  eval = 65536
		  list = 131072
		  texture = 262144
		scissor = 524288
	#tag EndEnum


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
