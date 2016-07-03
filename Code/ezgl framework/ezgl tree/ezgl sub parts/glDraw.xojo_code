#tag Class
Protected Class glDraw
	#tag Method, Flags = &h0
		Sub colour(c As Color, useAlpha As boolean = false)
		  if useAlpha then
		    OpenGL.glColor4ub c.Red, c.Green, c.Blue, c.Alpha
		  else
		    OpenGL.glColor3ub c.Red, c.Green, c.Blue
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub colour(c As Color, a As single)
		  OpenGL.glColor4ub c.Red, c.Green, c.Blue, a * 255
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub colour(grey As single)
		  OpenGL.glColor3f grey, grey, grey
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub colour(grey As single, a As single)
		  OpenGL.glColor4f grey, grey, grey, a
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub colour(r As Single, g As Single, b As Single)
		  OpenGL.glColor3f r, g, b
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub colour(r As Single, g As Single, b As Single, a As Single)
		  OpenGL.glColor4f r, g, b, a
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		  begin = new glDrawBegin
		  
		  shapes = new glDrawShapes
		  
		  point = new glDrawPoint
		  
		  line = new glDrawLine
		  
		  poly = new glDrawPoly
		  
		  pointSprite = new glPointSprite
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub edgeFlag(newState As boolean)
		  
		  if newState then
		    OpenGL.glEdgeFlag(OpenGL.GL_TRUE)
		  else
		    OpenGL.glEdgeFlag(OpenGL.GL_FALSE)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub endBegin()
		  OpenGL.glEnd
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub fogCoord(coord As single)
		  
		  OpenGL.glFogCoordf(coord)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function newInstance() As glDraw
		  return new glDraw
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub normal(x As single, y As single, z As single)
		  
		  OpenGL.glNormal3f(x, y, z)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub secondaryColor(c As Color)
		  
		  OpenGL.glSecondaryColor3ub(c.Red, c.Green, c.Blue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub shadeModelFlat()
		  OpenGL.glShadeModel OpenGL.GL_FLAT
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub shadeModelSmooth()
		  OpenGL.glShadeModel OpenGL.GL_SMOOTH
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub textureCoord(u As single, v As single)
		  
		  OpenGL.glTexCoord2f(u, v)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub threeVertices(x0 As single, y0 As single, x1 As single, y1 As single, x2 As single, y2 As single)
		  OpenGL.glVertex2f(x0, y0)
		  OpenGL.glVertex2f(x1, y1)
		  OpenGL.glVertex2f(x2, y2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub threeVertices(x0 As single, y0 As single, z0 As single, x1 As single, y1 As single, z1 As single, x2 As single, y2 As single, z2 As single)
		  OpenGL.glVertex3f(x0, y0, z0)
		  OpenGL.glVertex3f(x1, y1, z1)
		  OpenGL.glVertex3f(x2, y2, z2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub twoVertices(x0 As single, y0 As single, x1 As single, y1 As single)
		  OpenGL.glVertex2f(x0, y0)
		  OpenGL.glVertex2f(x1, y1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub twoVertices(x0 As single, y0 As single, z0 As single, x1 As single, y1 As single, z1 As single)
		  OpenGL.glVertex3f(x0, y0, z0)
		  OpenGL.glVertex3f(x1, y1, z1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub vertex(x As single, y As single)
		  OpenGL.glVertex2f(x, y)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub vertex(x As single, y As single, z As single)
		  OpenGL.glVertex3f(x, y, z)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = about
		
		
		Methods to set the current values
		
		colour -- current color, several overloaded versions
		secondaryColor
		normal
		textureCoord
		fogCoord
		edgeFlag
		
		
		Methods to send vertices, for each theres 2D and 3D versions
		
		vertex
		twoVertices
		threeVertices
		
		
		Method to end drawing in a primitive mode
		
		endBegin
		
		
		
		Properties/sub-parts
		
		begin -- begin drawing in a primitive mode
		
		point -- these 3 group the options for each primitive type
		line --
		poly --
		
		shapes -- currently only cube, rect, line
		
		pointSprite -- options for point sprites
		
	#tag EndNote

	#tag Note, Name = normalizing
		
		
		GL_RESCALE_NORMAL
		If enabled and no vertex shader is active, normal vectors are scaled
		after transformation and before lighting by a factor computed from the
		modelview matrix. If the modelview matrix scales space uniformly, this
		has the effect of restoring the transformed normal to unit length. This
		method is generally more efficient than GL_NORMALIZE. See glNormal and
		glNormalPointer.
		
		
		
		GL_NORMALIZE
		If enabled and no vertex shader is active, normal vectors are normalized
		to unit length after transformation and before lighting. This method is
		generally less efficient than GL_RESCALE_NORMAL. See glNormal and
		glNormalPointer.
		
	#tag EndNote

	#tag Note, Name = old methods
		
		lineStrip(verts() As single)
		
		  OpenGL.glBegin(OpenGL.GL_LINE_STRIP)
		  dim last As integer = verts.Ubound - 1
		  for i As integer = 0 to last step 3
		    OpenGL.glVertex3f(verts(i), verts(i + 1), verts(i + 2))
		  next
		  OpenGL.glEnd
		
		
		
		lineStrip2D(verts() As single)
		  OpenGL.glBegin(OpenGL.GL_LINE_STRIP)
		  dim last As integer = verts.Ubound - 1
		  for i As integer = 0 to last step 2
		    OpenGL.glVertex2f(verts(i), verts(i + 1))
		  next
		  OpenGL.glEnd
		
		//uses rb drawpoly style interleaved array
		//swutched to split arrays
	#tag EndNote


	#tag Property, Flags = &h0
		begin As glDrawBegin
	#tag EndProperty

	#tag Property, Flags = &h0
		line As glDrawLine
	#tag EndProperty

	#tag Property, Flags = &h0
		point As glDrawPoint
	#tag EndProperty

	#tag Property, Flags = &h0
		pointSprite As glPointSprite
	#tag EndProperty

	#tag Property, Flags = &h0
		poly As glDrawPoly
	#tag EndProperty

	#tag Property, Flags = &h0
		shapes As glDrawShapes
	#tag EndProperty


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
