#tag Class
Protected Class glColorMaterial
	#tag Method, Flags = &h0
		Sub ambient()
		  OpenGL.glColorMaterial(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_AMBIENT)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuse()
		  OpenGL.glColorMaterial(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuseBack()
		  OpenGL.glColorMaterial(OpenGL.GL_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuseFront()
		  OpenGL.glColorMaterial(OpenGL.GL_FRONT, OpenGL.GL_AMBIENT_AND_DIFFUSE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientBack()
		  OpenGL.glColorMaterial(OpenGL.GL_BACK, OpenGL.GL_AMBIENT)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientFront()
		  OpenGL.glColorMaterial(OpenGL.GL_FRONT, OpenGL.GL_AMBIENT)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuse()
		  OpenGL.glColorMaterial(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_DIFFUSE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuseBack()
		  OpenGL.glColorMaterial(OpenGL.GL_BACK, OpenGL.GL_DIFFUSE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuseFront()
		  OpenGL.glColorMaterial(OpenGL.GL_FRONT, OpenGL.GL_DIFFUSE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub disable()
		  OpenGL.glDisable(OpenGL.GL_COLOR_MATERIAL)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub emission()
		  OpenGL.glColorMaterial(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_EMISSION)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub emissionBack()
		  OpenGL.glColorMaterial(OpenGL.GL_BACK, OpenGL.GL_EMISSION)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub emissionFront()
		  OpenGL.glColorMaterial(OpenGL.GL_FRONT, OpenGL.GL_EMISSION)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enable()
		  OpenGL.glEnable(OpenGL.GL_COLOR_MATERIAL)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub specular()
		  OpenGL.glColorMaterial(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SPECULAR)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub specularBack()
		  OpenGL.glColorMaterial(OpenGL.GL_BACK, OpenGL.GL_SPECULAR)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub specularFront()
		  OpenGL.glColorMaterial(OpenGL.GL_FRONT, OpenGL.GL_SPECULAR)
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
