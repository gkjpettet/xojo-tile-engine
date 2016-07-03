#tag Class
Protected Class glTextureEZ
	#tag Method, Flags = &h0
		Sub disable()
		  
		  OpenGL.glDisable(OpenGL.GL_TEXTURE_2D)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enable()
		  
		  OpenGL.glEnable(OpenGL.GL_TEXTURE_2D)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub envBlend()
		  OpenGL.glTexEnvf(OpenGL.GL_TEXTURE_ENV, OpenGL.GL_TEXTURE_ENV_MODE, OpenGL.GL_BLEND)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub envDecal()
		  
		  OpenGL.glTexEnvf(OpenGL.GL_TEXTURE_ENV, OpenGL.GL_TEXTURE_ENV_MODE, OpenGL.GL_DECAL)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub envModulate()
		  OpenGL.glTexEnvf(OpenGL.GL_TEXTURE_ENV, OpenGL.GL_TEXTURE_ENV_MODE, OpenGL.GL_MODULATE)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub envReplace()
		  OpenGL.glTexEnvf(OpenGL.GL_TEXTURE_ENV, OpenGL.GL_TEXTURE_ENV_MODE, OpenGL.GL_REPLACE)
		  
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
