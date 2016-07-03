#tag Class
Protected Class glFog
Inherits glBase
	#tag Method, Flags = &h0
		Sub colour(r As Single, g As Single, b As Single, a As Single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = a
		  
		  
		  OpenGL.glFogfv(OpenGL.GL_FOG_COLOR, tempMem16)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub coordSrcFogCoord()
		  OpenGL.glFogi(OpenGL.GL_FOG_COORDINATE_SOURCE, OpenGL.GL_FOG_COORDINATE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub coordSrcFragmentDepth()
		  OpenGL.glFogi(OpenGL.GL_FOG_COORDINATE_SOURCE, OpenGL.GL_FRAGMENT_DEPTH)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub disable()
		  OpenGL.glDisable(OpenGL.GL_FOG)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enable()
		  OpenGL.glEnable(OpenGL.GL_FOG)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub expDensity(density As Single)
		  
		  OpenGL.glFogf(OpenGL.GL_FOG_DENSITY, density)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub linearEnd(fogEnd As Single)
		  OpenGL.glFogf(OpenGL.GL_FOG_END, fogEnd)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub linearStart(fogStart As Single)
		  OpenGL.glFogf(OpenGL.GL_FOG_START, fogStart)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub modeExp()
		  OpenGL.glFogi(OpenGL.GL_FOG_MODE, OpenGL.GL_EXP)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub modeExp2()
		  OpenGL.glFogi(OpenGL.GL_FOG_MODE, OpenGL.GL_EXP2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub modeLinear()
		  OpenGL.glFogi(OpenGL.GL_FOG_MODE, OpenGL.GL_LINEAR)
		End Sub
	#tag EndMethod


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
