#tag Class
Protected Class glDrawShapes
	#tag Method, Flags = &h0
		Sub axis(lineExtents As single = 2, unitMarks As boolean = true, x As single = 0, y As single = 0, z As single = 0)
		  
		  OpenGL.glBegin(OpenGL.GL_LINES)
		  
		  OpenGL.glColor3f(1, 0, 0)
		  OpenGL.glVertex3f(-lineExtents+x, y, z)
		  OpenGL.glVertex3f( lineExtents+x, y, z)
		  if unitMarks then
		    OpenGL.glVertex3f(1+x,  0.1+y, z)
		    OpenGL.glVertex3f(1+x, -0.1+y, z)
		    OpenGL.glVertex3f(1+x, y,  0.1+z)
		    OpenGL.glVertex3f(1+x, y, -0.1+z)
		  end
		  
		  OpenGL.glColor3f(0, 1, 0)
		  OpenGL.glVertex3f(x, -lineExtents+y, z)
		  OpenGL.glVertex3f(x,  lineExtents+y, z)
		  if unitMarks then
		    OpenGL.glVertex3f(-0.1+x, 1+y, z)
		    OpenGL.glVertex3f( 0.1+x, 1+y, z)
		    OpenGL.glVertex3f(     x, 1+y,  0.1+z)
		    OpenGL.glVertex3f(     x, 1+y, -0.1+z)
		  end
		  
		  OpenGL.glColor3f(0.3, 0.3, 1)
		  OpenGL.glVertex3f(x, y, -lineExtents)
		  OpenGL.glVertex3f(x, y,  lineExtents)
		  if unitMarks then
		    OpenGL.glVertex3f( 0.1+x, y, 1)
		    OpenGL.glVertex3f(-0.1+x, y, 1)
		    OpenGL.glVertex3f(x,  0.1+y, 1)
		    OpenGL.glVertex3f(x, -0.1+y, 1)
		  end
		  
		  OpenGL.glEnd
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub axisCorner(lineExtents As single = 2, unitMarks As boolean = true, x As single = 0, y As single = 0, z As single = 0)
		  
		  OpenGL.glBegin(OpenGL.GL_LINES)
		  
		  OpenGL.glColor3f(1, 0, 0)
		  OpenGL.glVertex3f(x, y, z)
		  OpenGL.glVertex3f(lineExtents+x, y, z)
		  if unitMarks then
		    OpenGL.glVertex3f(1+x,  0.1+y, z)
		    OpenGL.glVertex3f(1+x, -0.1+y, z)
		    OpenGL.glVertex3f(1+x, y,  0.1+z)
		    OpenGL.glVertex3f(1+x, y, -0.1+z)
		  end
		  
		  OpenGL.glColor3f(0, 1, 0)
		  OpenGL.glVertex3f(x, y, z)
		  OpenGL.glVertex3f(x, lineExtents+y, z)
		  if unitMarks then
		    OpenGL.glVertex3f(-0.1+x, 1+y, z)
		    OpenGL.glVertex3f( 0.1+x, 1+y, z)
		    OpenGL.glVertex3f(     x, 1+y,  0.1+z)
		    OpenGL.glVertex3f(     x, 1+y, -0.1+z)
		  end
		  
		  OpenGL.glColor3f(0.3, 0.3, 1)
		  OpenGL.glVertex3f(x, y, 0)
		  OpenGL.glVertex3f(x, y, lineExtents)
		  if unitMarks then
		    OpenGL.glVertex3f( 0.1+x, y, 1)
		    OpenGL.glVertex3f(-0.1+x, y, 1)
		    OpenGL.glVertex3f(x,  0.1+y, 1)
		    OpenGL.glVertex3f(x, -0.1+y, 1)
		  end
		  
		  OpenGL.glEnd
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub circleSolid(x As single, y As single, radius As single, res As integer = 2, phase As single = 0)
		  
		  if res <= 2 then res = 64 //default res
		  
		  
		  dim a, ascale As single, i As integer
		  
		  ascale = 6.28318 / res
		  
		  OpenGL.glBegin(OpenGL.GL_TRIANGLE_FAN) //triangle
		  OpenGL.glVertex2f(x, y) //center vertex
		  for i = 0 to res
		    
		    a = i * ascale + phase
		    
		    OpenGL.glVertex2f(x + radius * cos(a), y + radius * sin(a))
		    
		  next
		  OpenGL.glEnd
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub circleSolidLit(x As single, y As single, radius As single, res As integer = 2, phase As single = 0)
		  
		  if res <= 2 then res = 64 //default res
		  
		  
		  dim a, ascale As single, i As integer
		  
		  ascale = 6.28318 / res
		  
		  OpenGL.glBegin(OpenGL.GL_TRIANGLE_FAN) //triangle
		  OpenGL.glNormal3f(0, 0, 1)  //normal
		  OpenGL.glVertex2f(x, y) //center vertex
		  for i = 0 to res
		    
		    a = i * ascale + phase
		    
		    OpenGL.glVertex2f(x + radius * cos(a), y + radius * sin(a))
		    
		  next
		  OpenGL.glEnd
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub circleSolidLitTex(x As single, y As single, radius As single, res As integer = 2, phase As single = 0)
		  
		  if res <= 2 then res = 64 //default res
		  
		  
		  dim a, ascale, cosa, sina As single, i As integer
		  
		  ascale = 6.28318 / res
		  
		  OpenGL.glBegin(OpenGL.GL_TRIANGLE_FAN) //triangle
		  OpenGL.glNormal3f(0, 0, 1)  //normal
		  OpenGL.glTexCoord2f(0.5, 0.5) //texture
		  OpenGL.glVertex2f(x, y) //center vertex
		  for i = 0 to res
		    
		    a = i * ascale + phase
		    cosa = cos(a)
		    sina = sin(a)
		    OpenGL.glTexCoord2f(cosa*0.5+0.5, sina*0.5+0.5)
		    OpenGL.glVertex2f(x + radius * cosa, y + radius * sina)
		    
		  next
		  OpenGL.glEnd
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub circleSolidTex(x As single, y As single, radius As single, res As integer = 2, phase As single = 0)
		  
		  if res <= 2 then res = 64 //default res
		  
		  
		  dim a, ascale, cosa, sina As single, i As integer
		  
		  ascale = 6.28318 / res
		  
		  OpenGL.glBegin(OpenGL.GL_TRIANGLE_FAN) //triangle
		  //OpenGL.glNormal3f(0, 0, 1)  //normal
		  OpenGL.glTexCoord2f(0.5, 0.5) //texture
		  OpenGL.glVertex2f(x, y) //center vertex
		  for i = 0 to res
		    
		    a = i * ascale + phase
		    cosa = cos(a)
		    sina = sin(a)
		    OpenGL.glTexCoord2f(cosa*0.5+0.5, sina*0.5+0.5)
		    OpenGL.glVertex2f(x + radius * cosa, y + radius * sina)
		    
		  next
		  OpenGL.glEnd
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub circleWire(x As single, y As single, radius As single, res As integer = 1, phase As single = 0)
		  
		  if res <= 1 then res = 64 //default res
		  
		  
		  dim a, ascale As single, i, resm1 As integer
		  
		  ascale = 6.28318 / res
		  resm1 = res - 1
		  
		  OpenGL.glBegin(OpenGL.GL_LINE_LOOP)  //lineloop
		  for i = 0 to resm1
		    
		    a = i * ascale + phase
		    
		    OpenGL.glVertex2f(x + radius * cos(a), y + radius * sin(a))
		    
		  next
		  OpenGL.glEnd
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub cubeSolid()
		  OpenGL.glBegin(OpenGL.GL_QUADS)
		  
		  // Front Face
		  OpenGL.glVertex3f(-1.0, -1.0,  1.0)
		  OpenGL.glVertex3f( 1.0, -1.0,  1.0)
		  OpenGL.glVertex3f( 1.0,  1.0,  1.0)
		  OpenGL.glVertex3f(-1.0,  1.0,  1.0)
		  
		  // Back Face
		  OpenGL.glVertex3f(-1.0, -1.0, -1.0)
		  OpenGL.glVertex3f(-1.0,  1.0, -1.0)
		  OpenGL.glVertex3f( 1.0,  1.0, -1.0)
		  OpenGL.glVertex3f( 1.0, -1.0, -1.0)
		  
		  // Top Face
		  OpenGL.glVertex3f(-1.0,  1.0, -1.0)
		  OpenGL.glVertex3f(-1.0,  1.0,  1.0)
		  OpenGL.glVertex3f( 1.0,  1.0,  1.0)
		  OpenGL.glVertex3f( 1.0,  1.0, -1.0)
		  
		  // Bottom Face
		  OpenGL.glVertex3f(-1.0, -1.0, -1.0)
		  OpenGL.glVertex3f( 1.0, -1.0, -1.0)
		  OpenGL.glVertex3f( 1.0, -1.0,  1.0)
		  OpenGL.glVertex3f(-1.0, -1.0,  1.0)
		  
		  // Right face
		  OpenGL.glVertex3f( 1.0, -1.0, -1.0)
		  OpenGL.glVertex3f( 1.0,  1.0, -1.0)
		  OpenGL.glVertex3f( 1.0,  1.0,  1.0)
		  OpenGL.glVertex3f( 1.0, -1.0,  1.0)
		  
		  // Left Face
		  OpenGL.glVertex3f(-1.0, -1.0, -1.0)
		  OpenGL.glVertex3f(-1.0, -1.0,  1.0)
		  OpenGL.glVertex3f(-1.0,  1.0,  1.0)
		  OpenGL.glVertex3f(-1.0,  1.0, -1.0)
		  //==============================================
		  
		  
		  OpenGL.glEnd
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub cubeSolidLit()
		  OpenGL.glBegin(OpenGL.GL_QUADS)
		  
		  // Front Face
		  OpenGL.glNormal3f( 0.0,  0.0,  1.0)
		  OpenGL.glVertex3f(-1.0, -1.0,  1.0)
		  OpenGL.glVertex3f( 1.0, -1.0,  1.0)
		  OpenGL.glVertex3f( 1.0,  1.0,  1.0)
		  OpenGL.glVertex3f(-1.0,  1.0,  1.0)
		  
		  // Back Face
		  OpenGL.glNormal3f( 0.0,  0.0, -1.0)
		  OpenGL.glVertex3f(-1.0, -1.0, -1.0)
		  OpenGL.glVertex3f(-1.0,  1.0, -1.0)
		  OpenGL.glVertex3f( 1.0,  1.0, -1.0)
		  OpenGL.glVertex3f( 1.0, -1.0, -1.0)
		  
		  // Top Face
		  OpenGL.glNormal3f( 0.0,  1.0,  0.0)
		  OpenGL.glVertex3f(-1.0,  1.0, -1.0)
		  OpenGL.glVertex3f(-1.0,  1.0,  1.0)
		  OpenGL.glVertex3f( 1.0,  1.0,  1.0)
		  OpenGL.glVertex3f( 1.0,  1.0, -1.0)
		  
		  // Bottom Face
		  OpenGL.glNormal3f( 0.0, -1.0,  0.0)
		  OpenGL.glVertex3f(-1.0, -1.0, -1.0)
		  OpenGL.glVertex3f( 1.0, -1.0, -1.0)
		  OpenGL.glVertex3f( 1.0, -1.0,  1.0)
		  OpenGL.glVertex3f(-1.0, -1.0,  1.0)
		  
		  // Right face
		  OpenGL.glNormal3f( 1.0,  0.0,  0.0)
		  OpenGL.glVertex3f( 1.0, -1.0, -1.0)
		  OpenGL.glVertex3f( 1.0,  1.0, -1.0)
		  OpenGL.glVertex3f( 1.0,  1.0,  1.0)
		  OpenGL.glVertex3f( 1.0, -1.0,  1.0)
		  
		  // Left Face
		  OpenGL.glNormal3f(-1.0,  0.0,  0.0)
		  OpenGL.glVertex3f(-1.0, -1.0, -1.0)
		  OpenGL.glVertex3f(-1.0, -1.0,  1.0)
		  OpenGL.glVertex3f(-1.0,  1.0,  1.0)
		  OpenGL.glVertex3f(-1.0,  1.0, -1.0)
		  //==============================================
		  
		  
		  OpenGL.glEnd
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub cubeSolidLitTex()
		  OpenGL.glBegin(OpenGL.GL_QUADS)
		  
		  
		  
		  
		  OpenGL.glNormal3f(0, 0, 1)
		  // Front Face
		  OpenGL.glTexCoord2f(0, 0)
		  OpenGL.glVertex3f(-1, -1,1)
		  
		  // Bottom Left Of The Texture and Quad
		  OpenGL.glTexCoord2f(1, 0)
		  OpenGL.glVertex3f( 1, -1,1)
		  
		  // Bottom Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(1, 1)
		  OpenGL.glVertex3f( 1,1,1)
		  
		  // Top Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(0, 1)
		  OpenGL.glVertex3f(-1,1,1)
		  
		  
		  
		  
		  
		  OpenGL.glNormal3f(0, 0, -1)
		  // Top Left Of The Texture and Quad
		  // Back Face
		  OpenGL.glTexCoord2f(1, 0)
		  OpenGL.glVertex3f(-1, -1, -1)
		  
		  // Bottom Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(1, 1)
		  OpenGL.glVertex3f(-1,1, -1)
		  
		  // Top Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(0, 1)
		  OpenGL.glVertex3f( 1,1, -1)
		  
		  // Top Left Of The Texture and Quad
		  OpenGL.glTexCoord2f(0, 0)
		  OpenGL.glVertex3f( 1, -1, -1)
		  
		  
		  
		  
		  
		  
		  OpenGL.glNormal3f(0, 1, 0)
		  // Bottom Left Of The Texture and Quad
		  // Top Face
		  OpenGL.glTexCoord2f(0, 1)
		  OpenGL.glVertex3f(-1,1, -1)
		  
		  // Top Left Of The Texture and Quad
		  OpenGL.glTexCoord2f(0, 0)
		  OpenGL.glVertex3f(-1,1,1)
		  
		  // Bottom Left Of The Texture and Quad
		  OpenGL.glTexCoord2f(1, 0)
		  OpenGL.glVertex3f( 1,1,1)
		  
		  // Bottom Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(1, 1)
		  OpenGL.glVertex3f( 1,1, -1)
		  
		  
		  
		  
		  
		  
		  
		  
		  OpenGL.glNormal3f(0, -1, 0)
		  // Top Right Of The Texture and Quad
		  // Bottom Face
		  OpenGL.glTexCoord2f(1, 1)
		  OpenGL.glVertex3f(-1, -1, -1)
		  
		  // Top Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(0, 1)
		  OpenGL.glVertex3f( 1, -1, -1)
		  
		  // Top Left Of The Texture and Quad
		  OpenGL.glTexCoord2f(0, 0)
		  OpenGL.glVertex3f( 1, -1,1)
		  
		  // Bottom Left Of The Texture and Quad
		  OpenGL.glTexCoord2f(1, 0)
		  OpenGL.glVertex3f(-1, -1,1)
		  
		  
		  
		  
		  
		  
		  
		  
		  OpenGL.glNormal3f(1, 0, 0)
		  // Bottom Right Of The Texture and Quad
		  // Right face
		  OpenGL.glTexCoord2f(1, 0)
		  OpenGL.glVertex3f( 1, -1, -1)
		  
		  // Bottom Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(1, 1)
		  OpenGL.glVertex3f( 1,1, -1)
		  
		  // Top Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(0, 1)
		  OpenGL.glVertex3f( 1,1,1)
		  
		  // Top Left Of The Texture and Quad
		  OpenGL.glTexCoord2f(0, 0)
		  OpenGL.glVertex3f( 1, -1,1)
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  OpenGL.glNormal3f(-1, 0, 0)
		  // Bottom Left Of The Texture and Quad
		  // Left Face
		  OpenGL.glTexCoord2f(0, 0)
		  OpenGL.glVertex3f(-1, -1, -1)
		  // Bottom Left Of The Texture and Quad
		  OpenGL.glTexCoord2f(1, 0)
		  OpenGL.glVertex3f(-1, -1,1)
		  // Bottom Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(1, 1)
		  OpenGL.glVertex3f(-1,1,1)
		  // Top Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(0, 1)
		  OpenGL.glVertex3f(-1,1, -1)
		  // Top Left Of The Texture and Quad
		  
		  OpenGL.glEnd
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub cubeSolidTex()
		  OpenGL.glBegin(OpenGL.GL_QUADS)
		  
		  
		  
		  
		  
		  // Front Face
		  OpenGL.glTexCoord2f(0, 0)
		  OpenGL.glVertex3f(-1, -1,1)
		  
		  // Bottom Left Of The Texture and Quad
		  OpenGL.glTexCoord2f(1, 0)
		  OpenGL.glVertex3f( 1, -1,1)
		  
		  // Bottom Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(1, 1)
		  OpenGL.glVertex3f( 1,1,1)
		  
		  // Top Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(0, 1)
		  OpenGL.glVertex3f(-1,1,1)
		  
		  
		  
		  
		  
		  
		  // Top Left Of The Texture and Quad
		  // Back Face
		  OpenGL.glTexCoord2f(1, 0)
		  OpenGL.glVertex3f(-1, -1, -1)
		  
		  // Bottom Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(1, 1)
		  OpenGL.glVertex3f(-1,1, -1)
		  
		  // Top Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(0, 1)
		  OpenGL.glVertex3f( 1,1, -1)
		  
		  // Top Left Of The Texture and Quad
		  OpenGL.glTexCoord2f(0, 0)
		  OpenGL.glVertex3f( 1, -1, -1)
		  
		  
		  
		  
		  
		  
		  
		  // Bottom Left Of The Texture and Quad
		  // Top Face
		  OpenGL.glTexCoord2f(0, 1)
		  OpenGL.glVertex3f(-1,1, -1)
		  
		  // Top Left Of The Texture and Quad
		  OpenGL.glTexCoord2f(0, 0)
		  OpenGL.glVertex3f(-1,1,1)
		  
		  // Bottom Left Of The Texture and Quad
		  OpenGL.glTexCoord2f(1, 0)
		  OpenGL.glVertex3f( 1,1,1)
		  
		  // Bottom Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(1, 1)
		  OpenGL.glVertex3f( 1,1, -1)
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  // Top Right Of The Texture and Quad
		  // Bottom Face
		  OpenGL.glTexCoord2f(1, 1)
		  OpenGL.glVertex3f(-1, -1, -1)
		  
		  // Top Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(0, 1)
		  OpenGL.glVertex3f( 1, -1, -1)
		  
		  // Top Left Of The Texture and Quad
		  OpenGL.glTexCoord2f(0, 0)
		  OpenGL.glVertex3f( 1, -1,1)
		  
		  // Bottom Left Of The Texture and Quad
		  OpenGL.glTexCoord2f(1, 0)
		  OpenGL.glVertex3f(-1, -1,1)
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  // Bottom Right Of The Texture and Quad
		  // Right face
		  OpenGL.glTexCoord2f(1, 0)
		  OpenGL.glVertex3f( 1, -1, -1)
		  
		  // Bottom Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(1, 1)
		  OpenGL.glVertex3f( 1,1, -1)
		  
		  // Top Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(0, 1)
		  OpenGL.glVertex3f( 1,1,1)
		  
		  // Top Left Of The Texture and Quad
		  OpenGL.glTexCoord2f(0, 0)
		  OpenGL.glVertex3f( 1, -1,1)
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  // Bottom Left Of The Texture and Quad
		  // Left Face
		  OpenGL.glTexCoord2f(0, 0)
		  OpenGL.glVertex3f(-1, -1, -1)
		  // Bottom Left Of The Texture and Quad
		  OpenGL.glTexCoord2f(1, 0)
		  OpenGL.glVertex3f(-1, -1,1)
		  // Bottom Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(1, 1)
		  OpenGL.glVertex3f(-1,1,1)
		  // Top Right Of The Texture and Quad
		  OpenGL.glTexCoord2f(0, 1)
		  OpenGL.glVertex3f(-1,1, -1)
		  // Top Left Of The Texture and Quad
		  
		  OpenGL.glEnd
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub cubeWire()
		  
		  
		  // Front Face
		  OpenGL.glBegin(OpenGL.GL_LINE_LOOP)
		  OpenGL.glVertex3f(-1.0, -1.0,  1.0)
		  OpenGL.glVertex3f( 1.0, -1.0,  1.0)
		  OpenGL.glVertex3f( 1.0,  1.0,  1.0)
		  OpenGL.glVertex3f(-1.0,  1.0,  1.0)
		  OpenGL.glVertex3f(-1.0, -1.0,  1.0)
		  OpenGL.glEnd
		  
		  // Back Face
		  OpenGL.glBegin(OpenGL.GL_LINE_LOOP)
		  OpenGL.glVertex3f(-1.0, -1.0, -1.0)
		  OpenGL.glVertex3f(-1.0,  1.0, -1.0)
		  OpenGL.glVertex3f( 1.0,  1.0, -1.0)
		  OpenGL.glVertex3f( 1.0, -1.0, -1.0)
		  OpenGL.glVertex3f(-1.0, -1.0, -1.0)
		  OpenGL.glEnd
		  
		  OpenGL.glBegin(OpenGL.GL_LINES)
		  OpenGL.glVertex3f(-1.0, -1.0,  1.0)
		  OpenGL.glVertex3f(-1.0, -1.0, -1.0)
		  OpenGL.glVertex3f(-1.0,  1.0,  1.0)
		  OpenGL.glVertex3f(-1.0,  1.0, -1.0)
		  OpenGL.glVertex3f( 1.0,  1.0,  1.0)
		  OpenGL.glVertex3f( 1.0,  1.0, -1.0)
		  OpenGL.glVertex3f( 1.0, -1.0,  1.0)
		  OpenGL.glVertex3f( 1.0, -1.0, -1.0)
		  OpenGL.glEnd
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub dodecahedron()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub initTheQuad()
		  
		  theQuad = new Quadric
		  
		  theQuad.faceNormalsOut //apply settings to preserve, any use should return
		  theQuad.normalsNone    //theQuad to these
		  theQuad.styleFill
		  theQuad.textureOff
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub line(x0 As single, y0 As single, x1 As single, y1 As single)
		  OpenGL.glBegin(OpenGL.GL_LINES)
		  OpenGL.glVertex2f(x0, y0)
		  OpenGL.glVertex2f(x1, y1)
		  OpenGL.glEnd
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub line(x0 As single, y0 As single, z0 As single, x1 As single, y1 As single, z1 As single)
		  OpenGL.glBegin(OpenGL.GL_LINES)
		  OpenGL.glVertex3f(x0, y0, z0)
		  OpenGL.glVertex3f(x1, y1, z1)
		  OpenGL.glEnd
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub lineStrip(vertsX() As single, vertsY() As single)
		  OpenGL.glBegin(OpenGL.GL_LINE_STRIP)
		  
		  dim last As integer = vertsX.Ubound
		  
		  for i As integer = 0 to last
		    OpenGL.glVertex2f(vertsX(i), vertsY(i))
		  next
		  
		  OpenGL.glEnd
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub lineStrip(vertsX() As single, vertsY() As single, vertsZ() As single)
		  OpenGL.glBegin(OpenGL.GL_LINE_STRIP)
		  
		  dim last As integer = vertsX.Ubound
		  
		  for i As integer = 0 to last
		    OpenGL.glVertex3f(vertsX(i), vertsY(i), vertsZ(i))
		  next
		  
		  OpenGL.glEnd
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub point(x As single, y As single)
		  OpenGL.glBegin(OpenGL.GL_POINTS)
		  OpenGL.glVertex2f(x, y)
		  OpenGL.glEnd
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub point(x As single, y As single, z As single)
		  OpenGL.glBegin(OpenGL.GL_POINTS)
		  OpenGL.glVertex3f(x, y, z)
		  OpenGL.glEnd
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub points(x() As single, y() As single)
		  
		  dim last As integer = x.Ubound 
		  dim yu As integer = y.Ubound
		  if yu < last then last = yu
		  
		  OpenGL.glBegin(OpenGL.GL_POINTS)
		  
		  for i As integer = 0 to last
		    
		    OpenGL.glVertex2f(x(i), y(i))
		    
		  next
		  
		  OpenGL.glEnd
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub points(x() As single, y() As single, z() As single)
		  
		  dim last As integer = x.Ubound 
		  dim yzu As integer = y.Ubound
		  if yzu < last then last = yzu
		  yzu = z.Ubound
		  if yzu < last then last = yzu
		  
		  OpenGL.glBegin(OpenGL.GL_POINTS)
		  
		  for i As integer = 0 to last
		    
		    OpenGL.glVertex3f(x(i), y(i), z(i))
		    
		  next
		  
		  OpenGL.glEnd
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub points2D(xy() As single)
		  
		  dim last As integer = xy.Ubound - 1
		  
		  OpenGL.glBegin(OpenGL.GL_POINTS)
		  
		  for i As integer = 0 to last
		    
		    OpenGL.glVertex2f(xy(i), xy(i+1))
		    
		  next
		  
		  OpenGL.glEnd
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub points3D(xyz() As single)
		  
		  dim last As integer = xyz.Ubound - 2
		  
		  OpenGL.glBegin(OpenGL.GL_POINTS)
		  
		  for i As integer = 0 to last
		    
		    OpenGL.glVertex3f(xyz(i), xyz(i+1), xyz(i+2))
		    
		  next
		  
		  OpenGL.glEnd
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub rectSolid(x As single, y As single, w As single, h As single)
		  
		  
		  
		  OpenGL.glBegin(OpenGL.GL_QUADS) 'POLYGON)
		  
		  OpenGL.glVertex2f(x,   y)
		  OpenGL.glVertex2f(x+w, y)
		  OpenGL.glVertex2f(x+w, y+h)
		  OpenGL.glVertex2f(x,   y+h)
		  
		  OpenGL.glEnd
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub rectSolidLit(x As single, y As single, w As single, h As single)
		  
		  
		  
		  OpenGL.glBegin(OpenGL.GL_QUADS) 'POLYGON)
		  
		  OpenGL.glNormal3f( 0.0,  0.0,  1.0)
		  
		  OpenGL.glVertex2f(x,   y)
		  OpenGL.glVertex2f(x+w, y)
		  OpenGL.glVertex2f(x+w, y+h)
		  OpenGL.glVertex2f(x,   y+h)
		  
		  OpenGL.glEnd
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub rectSolidLitTex(x As single, y As single, w As single, h As single)
		  
		  
		  
		  OpenGL.glBegin(OpenGL.GL_QUADS) 'POLYGON)
		  
		  OpenGL.glNormal3f( 0.0,  0.0,  1.0)
		  
		  OpenGL.glTexCoord2f(0, 0)
		  OpenGL.glVertex2f(x,   y)
		  
		  OpenGL.glTexCoord2f(1, 0)
		  OpenGL.glVertex2f(x+w, y)
		  
		  OpenGL.glTexCoord2f(1, 1)
		  OpenGL.glVertex2f(x+w, y+h)
		  
		  OpenGL.glTexCoord2f(0, 1)
		  OpenGL.glVertex2f(x,   y+h)
		  
		  OpenGL.glEnd
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub rectSolidTex(x As single, y As single, w As single, h As single)
		  
		  
		  
		  OpenGL.glBegin(OpenGL.GL_QUADS) 'POLYGON)
		  
		  OpenGL.glTexCoord2f(0, 0)
		  OpenGL.glVertex2f(x,   y)
		  
		  OpenGL.glTexCoord2f(1, 0)
		  OpenGL.glVertex2f(x+w, y)
		  
		  OpenGL.glTexCoord2f(1, 1)
		  OpenGL.glVertex2f(x+w, y+h)
		  
		  OpenGL.glTexCoord2f(0, 1)
		  OpenGL.glVertex2f(x,   y+h)
		  
		  OpenGL.glEnd
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub rectSolidTexSized(x As single, y As single, w As single, h As single, repeats As double)
		  
		  dim minC As double = -repeats
		  dim maxC As double = 1 + repeats
		  
		  
		  OpenGL.glBegin(OpenGL.GL_QUADS) 'POLYGON)
		  
		  OpenGL.glTexCoord2f(minC, minC)
		  OpenGL.glVertex2f(x,   y)
		  
		  OpenGL.glTexCoord2f(maxC, minC)
		  OpenGL.glVertex2f(x+w, y)
		  
		  OpenGL.glTexCoord2f(maxC, maxC)
		  OpenGL.glVertex2f(x+w, y+h)
		  
		  OpenGL.glTexCoord2f(minC, maxC)
		  OpenGL.glVertex2f(x,   y+h)
		  
		  OpenGL.glEnd
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub rectWire(x As single, y As single, w As single, h As single)
		  dim x2, y2 As single
		  x2 = x + w
		  y2 = y + h
		  
		  OpenGL.glBegin(OpenGL.GL_LINE_LOOP)
		  
		  OpenGL.glVertex2f(x,  y)
		  OpenGL.glVertex2f(x2, y)
		  OpenGL.glVertex2f(x2, y2)
		  OpenGL.glVertex2f(x,  y2)
		  
		  OpenGL.glEnd
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub roundRectSolid(x As single, y As single, w As single, h As single, radiusW As single, radiusH As single, res As integer = 12)
		  //1 = flat segment, 2 = 2 segments
		  if res < 1 then res = 1
		  
		  dim i As integer
		  
		  dim xp(), yp(), a, aScale As single //precompute arc
		  redim xp(res)
		  redim yp(res)
		  aScale = 1.5707 / res
		  for i = 0 to res
		    a = i * aScale
		    xp(i) = radiusW * cos(a)
		    yp(i) = radiusH * sin(a)
		  next
		  
		  
		  OpenGL.glBegin(OpenGL.GL_POLYGON) //============================ <<< only change
		  dim cx, cy As single //inner arcing point
		  
		  cx = x + w - radiusW //top right
		  cy = y + radiusH
		  for i = 0 to res //<
		    OpenGL.glVertex2f(cx + xp(i), cy - yp(i)) //+ -
		  next
		  
		  cx = x + radiusW //top left
		  cy = y + radiusH
		  for i = res downto 0 //>
		    OpenGL.glVertex2f(cx - xp(i), cy - yp(i)) //- -
		  next
		  
		  cx = x + radiusW //bottom left
		  cy = y + h - radiusH
		  for i = 0 to res //<
		    OpenGL.glVertex2f(cx - xp(i), cy + yp(i)) //- +
		  next
		  
		  cx = x + w - radiusW //bottom right
		  cy = y + h - radiusH
		  for i = res downto 0 //>
		    OpenGL.glVertex2f(cx + xp(i), cy + yp(i)) //+ +
		  next
		  
		  OpenGL.glEnd //===================================
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub roundRectWire(x As single, y As single, w As single, h As single, radiusW As single, radiusH As single, res As integer = 12)
		  //1 = flat segment, 2 = 2 segments
		  if res < 1 then res = 1
		  
		  dim i As integer
		  
		  dim xp(), yp(), a, aScale As single //precompute arc
		  redim xp(res)
		  redim yp(res)
		  aScale = 1.5707 / res
		  for i = 0 to res
		    a = i * aScale
		    xp(i) = radiusW * cos(a)
		    yp(i) = radiusH * sin(a)
		  next
		  
		  
		  OpenGL.glBegin(OpenGL.GL_LINE_LOOP) //============================
		  dim cx, cy As single //inner arcing point
		  
		  cx = x + w - radiusW //top right
		  cy = y + radiusH
		  for i = 0 to res //<
		    OpenGL.glVertex2f(cx + xp(i), cy - yp(i)) //+ -
		  next
		  
		  cx = x + radiusW //top left
		  cy = y + radiusH
		  for i = res downto 0 //>
		    OpenGL.glVertex2f(cx - xp(i), cy - yp(i)) //- -
		  next
		  
		  cx = x + radiusW //bottom left
		  cy = y + h - radiusH
		  for i = 0 to res //<
		    OpenGL.glVertex2f(cx - xp(i), cy + yp(i)) //- +
		  next
		  
		  cx = x + w - radiusW //bottom right
		  cy = y + h - radiusH
		  for i = res downto 0 //>
		    OpenGL.glVertex2f(cx + xp(i), cy + yp(i)) //+ +
		  next
		  
		  OpenGL.glEnd //===================================
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub sphereSolid(radius As single, resSlices As integer, resStacks As integer, posX As single = 0.0, posY As single = 0.0, posZ As single = 0.0)
		  
		  
		  
		  if theQuad = nil then initTheQuad
		  
		  dim doXform As boolean = not (posX = 0.0 and posY = 0.0 and posZ = 0.0)
		  if doXform then
		    OpenGL.glPushMatrix
		    OpenGL.glTranslatef(posX, posY, posZ)
		  end
		  
		  theQuad.drawSphere(radius, resSlices, resStacks)
		  
		  if doXform then OpenGL.glPopMatrix
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub sphereSolidLit(radius As single, resSlices As integer, resStacks As integer, shadeSmooth As boolean = false, posX As single = 0.0, posY As single = 0.0, posZ As single = 0.0)
		  
		  if theQuad = nil then initTheQuad
		  
		  if shadeSmooth then theQuad.normalsSmooth else theQuad.normalsSmooth
		  
		  dim doXform As boolean = not (posX = 0.0 and posY = 0.0 and posZ = 0.0)
		  if doXform then
		    OpenGL.glPushMatrix
		    OpenGL.glTranslatef(posX, posY, posZ)
		  end
		  
		  theQuad.drawSphere(radius, resSlices, resStacks)
		  
		  if doXform then OpenGL.glPopMatrix
		  
		  theQuad.normalsNone
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub sphereSolidLitTex(radius As single, resSlices As integer, resStacks As integer, shadeSmooth As boolean = false, posX As single = 0.0, posY As single = 0.0, posZ As single = 0.0)
		  
		  if theQuad = nil then initTheQuad
		  
		  if shadeSmooth then theQuad.normalsSmooth else theQuad.normalsSmooth
		  theQuad.textureOn
		  
		  dim doXform As boolean = not (posX = 0.0 and posY = 0.0 and posZ = 0.0)
		  if doXform then
		    OpenGL.glPushMatrix
		    OpenGL.glTranslatef(posX, posY, posZ)
		  end
		  
		  theQuad.drawSphere(radius, resSlices, resStacks)
		  
		  if doXform then OpenGL.glPopMatrix
		  
		  theQuad.normalsNone
		  theQuad.textureOff
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub sphereSolidTex(radius As single, resSlices As integer, resStacks As integer, posX As single = 0.0, posY As single = 0.0, posZ As single = 0.0)
		  
		  if theQuad = nil then initTheQuad
		  
		  theQuad.textureOn
		  
		  dim doXform As boolean = not (posX = 0.0 and posY = 0.0 and posZ = 0.0)
		  if doXform then
		    OpenGL.glPushMatrix
		    OpenGL.glTranslatef(posX, posY, posZ)
		  end
		  
		  theQuad.drawSphere(radius, resSlices, resStacks)
		  
		  if doXform then OpenGL.glPopMatrix
		  
		  theQuad.textureOff
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub sphereWire(radius As single, resSlices As integer, resStacks As integer, posX As single = 0.0, posY As single = 0.0, posZ As single = 0.0)
		  
		  
		  
		  if theQuad = nil then initTheQuad
		  
		  theQuad.styleLine
		  
		  dim doXform As boolean = not (posX = 0.0 and posY = 0.0 and posZ = 0.0)
		  if doXform then
		    OpenGL.glPushMatrix
		    OpenGL.glTranslatef(posX, posY, posZ)
		  end
		  
		  theQuad.drawSphere(radius, resSlices, resStacks)
		  
		  if doXform then OpenGL.glPopMatrix
		  
		  theQuad.styleFill
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub torus(outRadius As double, inRadius As double, sliceRes As integer, ringRes As integer)
		  #pragma unused outRadius
		  #pragma unused inRadius
		  #pragma unused sliceRes
		  #pragma unused ringRes
		  dim k2Pi As double = 6.28318
		  
		  Dim vNormal As new kmVector3D 'glVector3D = new glVector3D
		  
		  Dim ringStep As Double = k2Pi / ringRes
		  Dim sideStep As Double = k2Pi / sliceRes
		  Dim ring1 As Integer = ringRes -1
		  Dim i, j As Integer
		  Dim a0, a1, b As Double
		  Dim x0, y0, x1, y1 As Single
		  Dim c, r, z As Single
		  
		  For i = 0 to ring1
		    a0 = i * ringStep
		    a1 = a0 + ringStep
		    x0 = Cos(a0)
		    y0 = Sin(a0)
		    x1 = Cos(a1)
		    y1 = Sin(a1)
		    
		    'OpenGL.glBegin(OpenGL.GL_TRIANGLE_STRIP)
		    OpenGL.glBegin(OpenGL.GL_QUAD_STRIP)
		    
		    For j = 0 to sliceRes
		      b = j * sideStep
		      c = Cos(b)
		      r = inRadius * c + outRadius
		      z = inRadius * Sin(b)
		      
		      //First point
		      OpenGL.glTexCoord2f(i/sliceRes, j/ringRes)
		      vNormal.X = x0 * c
		      vNormal.Y = y0 * c
		      vNormal.Z = z / inRadius
		      vNormal.Normalize
		      OpenGL.glNormal3f(vNormal.X, vNormal.Y, vNormal.Z)
		      OpenGL.glVertex3f(x0*r, y0*r, z)
		      
		      OpenGL.glTexCoord2f( (i+1)/sliceRes, j/ringRes )
		      vNormal.X = x1 * c
		      vNormal.Y = y1 * c
		      vNormal.Z = z / inRadius
		      vNormal.Normalize
		      OpenGL.glNormal3f(vNormal.X, vNormal.Y, vNormal.Z)
		      OpenGL.glVertex3f(x1*r, y1*r, z)
		    Next
		    OpenGL.glEnd
		  Next
		End Sub
	#tag EndMethod


	#tag Note, Name = about
		
		Utility for drawing some easy shapes
		
		cube and rect have variations to draw as...
		Wire -- lines 
		Solid -- filled
		SolidLit -- filled with normal
		SolidTex -- filled with unit texturing coords
		SolidLitTex -- filled with normal and texuring coords
		
		line -- draw a single line, 2D and 3D versions
		lineLoop -- supply array of coordinates to draw, 2D and 3D versions
		
		torus and dodecahedron need some work, and more shapes needed.
	#tag EndNote


	#tag Property, Flags = &h21
		Private theQuad As Quadric
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
