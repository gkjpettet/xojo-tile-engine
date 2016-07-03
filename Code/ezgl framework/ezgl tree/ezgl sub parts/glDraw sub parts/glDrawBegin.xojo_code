#tag Class
Protected Class glDrawBegin
	#tag Method, Flags = &h0
		Sub lineLoop()
		  OpenGL.glBegin(OpenGL.GL_LINE_LOOP)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub lines()
		  
		  
		  OpenGL.glBegin(OpenGL.GL_LINES)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub lineStrip()
		  OpenGL.glBegin(OpenGL.GL_LINE_STRIP)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub points()
		  OpenGL.glBegin(OpenGL.GL_POINTS)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub polygon()
		  OpenGL.glBegin(OpenGL.GL_POLYGON)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub quads()
		  
		  
		  OpenGL.glBegin(OpenGL.GL_QUADS)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub quadStrip()
		  OpenGL.glBegin(OpenGL.GL_QUAD_STRIP)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub triangleFan()
		  OpenGL.glBegin(OpenGL.GL_TRIANGLE_FAN)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub triangles()
		  OpenGL.glBegin(OpenGL.GL_TRIANGLES)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub triangleStrip()
		  OpenGL.glBegin(OpenGL.GL_TRIANGLE_STRIP)
		End Sub
	#tag EndMethod


	#tag Note, Name = about
		
		
		Simply begins one of the primitive modes
		
		ie, OpenGL.glBegin(OpenGL.GL_TRIANGLE_FAN)
		
		
		use g.draw.endBegin to finish the 'immediate mode'
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
