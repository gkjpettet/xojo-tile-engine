#tag Class
Protected Class glCullFace
	#tag Method, Flags = &h0
		Sub back()
		  OpenGL.glCullFace(OpenGL.GL_BACK)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub disable()
		  OpenGL.glDisable(OpenGL.GL_CULL_FACE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enable()
		  OpenGL.glEnable(OpenGL.GL_CULL_FACE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub front()
		  OpenGL.glCullFace(OpenGL.GL_FRONT)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub frontAndBack()
		  OpenGL.glCullFace(OpenGL.GL_FRONT_AND_BACK)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isEnabled() As boolean
		  return OpenGL.glIsEnabled(OpenGL.GL_CULL_FACE) <> 0
		End Function
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
