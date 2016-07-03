#tag Class
Protected Class glPointSprite
Inherits glBase
	#tag Method, Flags = &h0
		Sub attenuation(a As single, b As single, c As single)
		  
		  tempMem16.SingleValue(0) = a
		  tempMem16.SingleValue(4) = b
		  tempMem16.SingleValue(8) = c
		  
		  OpenGL.glPointParameterfv(OpenGL.GL_POINT_DISTANCE_ATTENUATION, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub disable()
		  OpenGL.glDisable(kPointSprite)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enable()
		  OpenGL.glEnable(kPointSprite)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezSetup2D(minSize As single = 1, maxSize As single = 64)
		  
		  enable
		  sizeMinMax(minSize, maxSize)
		  attenuation(0, 0, 0)
		  texEnvCoordReplace(true)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezSetup3D(attenConstant As single, attenLinear As single, attenSquare As single, minSize As single = 1, maxSize As single = 64)
		  
		  enable
		  sizeMinMax(minSize, maxSize)
		  attenuation(attenConstant, attenLinear, attenSquare)
		  texEnvCoordReplace(true)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub fadeThresholdSize(size As single)
		  
		  OpenGL.glPointParameterf(OpenGL.GL_POINT_FADE_THRESHOLD_SIZE, size)
		  
		  'If multisampling is enabled, an implementation may optionally fade the
		  'point alpha (see section 3.14) instead of allowing the point width to
		  'go below a given threshold. In this case, the width of the rasterized
		  'point is 
		  'width = derived size ≥ threshold 
		  'width = threshold otherwise
		  'and the fade factor is computed as follows:
		  'fade = 1 derived size ≥ threshold 
		  'fade = (derived size/threshold)^2 otherwise
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub originLowerLeft()
		  
		  #if TargetMacOS then
		    
		    //void glPointParameteri(GLenum pname, GLint param);
		    soft declare sub glPointParameteri lib "OpenGL" (enumName As integer, choice As integer)
		    
		    glPointParameteri(kSpriteCoordOrigin, kLowerLeft)
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub originUpperLeft()
		  
		  #if TargetMacOS then
		    
		    soft declare sub glPointParameteri lib "OpenGL" (enumName As integer, choice As integer)
		    
		    glPointParameteri(kSpriteCoordOrigin, kUpperLeft)
		    
		  #endif
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub sizeMinMax(sizeMin As single, sizeMax As single)
		  OpenGL.glPointParameterf(OpenGL.GL_POINT_SIZE_MIN, sizeMin)
		  OpenGL.glPointParameterf(OpenGL.GL_POINT_SIZE_MAX, sizeMax)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub texEnvCoordReplace(state As boolean)
		  
		  //Tell OGL to Replace Coordinates upon drawing.
		  
		  if state then
		    OpenGL.glTexEnvi(kPointSprite, kCoordReplace, OpenGL.GL_TRUE) 
		  else
		    OpenGL.glTexEnvi(kPointSprite, kCoordReplace, OpenGL.GL_FALSE)
		  end
		End Sub
	#tag EndMethod


	#tag Note, Name = about
		
		Point Sprites are an easy way to draw 'billboarded' sprites. They are
		fairly limited though. 64x64 is the maximum size, or whatever max point
		size on your hardware is. They are square and all the same size and texture
		when drawn inside a g.draw.begin.points.
		
		===========================================================================
		
		enable, disable -- whether to use point sprite drawing
		
		sizeMinMax -- range of size sprites can be. limited by max point size and current point size as set in g.draw.point.size
		
		texEnvCoordReplace -- set to true so that texture coordinates are applied to 'sprites'
		
		fadeThresholdSize -- not sure what this does, has something to do with alpha when blending a certain way
		
		originLowerLeft -- vertex coordinates mark lower left coordinate of sprite
		originUpperLeft -- vertex marks upper left
		(there is no originCenter available in OpenGL)
		
		attenuation -- supply coeffients to a quadratic expression that scales sprites by distance
		
		ezSetup2D -- initialize in 1 call for 2D use (no attenuation)
		ezSetup3D -- same with attenuation for 3D use
	#tag EndNote


	#tag Constant, Name = kCoordReplace, Type = Double, Dynamic = False, Default = \"34914", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kLowerLeft, Type = Double, Dynamic = False, Default = \"36001", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPointSprite, Type = Double, Dynamic = False, Default = \"34913", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSpriteCoordOrigin, Type = Double, Dynamic = False, Default = \"36000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kUpperLeft, Type = Double, Dynamic = False, Default = \"36002", Scope = Private
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
End Class
#tag EndClass
