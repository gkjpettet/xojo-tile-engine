#tag Class
Protected Class glScissor
	#tag Method, Flags = &h0
		Sub defineBox(x As integer, y As integer, width As integer, height As integer)
		  
		  OpenGL.glScissor(x, y, width, height)
		  
		  ///setting scissor box and enabling/disabling doesn't work between begin/end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub disable()
		  
		  OpenGL.glDisable(OpenGL.GL_SCISSOR_TEST)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enable()
		  
		  OpenGL.glEnable(OpenGL.GL_SCISSOR_TEST)
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
