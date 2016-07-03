#tag Class
Protected Class glXform
	#tag Method, Flags = &h0
		Sub loadIdentity()
		  OpenGL.glLoadIdentity
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub matrixModeModelView()
		  OpenGL.glMatrixMode(OpenGL.GL_MODELVIEW)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub matrixModeProjection()
		  OpenGL.glMatrixMode(OpenGL.GL_PROJECTION)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub popMatrix()
		  OpenGL.glPopMatrix
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub pushMatrix()
		  OpenGL.glPushMatrix
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub rotate(angle As single, x As single, y As single, z As single)
		  OpenGL.glRotatef(angle, x, y, z)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub rotateX(angle As single)
		  OpenGL.glRotatef(angle, 1, 0, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub rotateY(angle As single)
		  OpenGL.glRotatef(angle, 0, 1, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub rotateZ(angle As single)
		  OpenGL.glRotatef(angle, 0, 0, 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub scale(vscale As single)
		  OpenGL.glScalef(vscale, vscale, vscale)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub scaleX(vscaleX As single)
		  OpenGL.glScalef(vscaleX, 1, 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub scaleXY(vscaleX As single, vscaleY As single)
		  OpenGL.glScalef(vscaleX, vscaleY, 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub scaleXYZ(vscaleX As single, vscaleY As single, vscaleZ As single)
		  OpenGL.glScalef(vscaleX, vscaleY, vscaleZ)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub scaleY(vscaleY As single)
		  OpenGL.glScalef(1, vscaleY, 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub scaleZ(vscaleZ As single)
		  OpenGL.glScalef(1, 1, vscaleZ)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub translate(x As single, y As single)
		  OpenGL.glTranslatef(x, y, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub translate(x As single, y As single, z As single)
		  OpenGL.glTranslatef(x, y, z)
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
