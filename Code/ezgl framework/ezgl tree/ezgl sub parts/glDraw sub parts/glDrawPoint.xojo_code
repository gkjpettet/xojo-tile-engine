#tag Class
Protected Class glDrawPoint
	#tag Method, Flags = &h0
		Sub size(sizeValue As single)
		  
		  OpenGL.glPointSize(sizeValue)
		  
		  ///not valid inside begin/end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub smoothDisable()
		  
		  OpenGL.glDisable(OpenGL.GL_POINT_SMOOTH)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub smoothEnable()
		  
		  OpenGL.glEnable(OpenGL.GL_POINT_SMOOTH)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = about
		
		Options when drawing points, only 2.
		
		size -- point size, probably limited to range [0-64]
		
		smoothDisable -- points draw as rects
		smoothEnable -- points draw as circles.
		
		
		'smooth' point circles are aliased unless blending is on, like
		g.blend.enable
		g.blend.setFuncStandardAlpha
		
		
		
		
		When using Point Sprites, the size value here controls the
		'starting' size of sprites. Not entirely clear on the
		interaction but the size set here is the biggest point sprites
		will be.
		
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
