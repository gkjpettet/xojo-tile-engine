#tag Class
Protected Class Quadric
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  
		  
		  
		  soft declare function gluNewQuadric lib libOpenGL () as Ptr
		  
		  theQuad = gluNewQuadric()
		  
		  
		  
		  if gettingMem = nil then gettingMem = New MemoryBlock(4)
		  
		  autoNormals = false
		  autoTexture = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  
		  
		  soft declare sub gluDeleteQuadric lib libOpenGL (quad As Ptr)
		  
		  gluDeleteQuadric(theQuad)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawCylinder(base as double, top as double, height as double, slices as integer, stacks as integer)
		  
		  if autoNormals then
		    OpenGL.glGetIntegerv(OpenGL.GL_SHADE_MODEL, gettingMem)
		    if gettingMem.UInt16Value(0) = OpenGL.GL_FLAT then 'flat
		      normalsFlat
		    else 'smooth, UInt16Value(0) = 7425 = OpenGL.GL_SMOOTH
		      normalsSmooth
		    end
		  end
		  
		  
		  
		  'void gluCylinder    (
		  ' GLUquadric* quad, 
		  ' GLdouble base  , 
		  ' GLdouble top   , 
		  ' GLdouble height, 
		  ' GLint    slices, 
		  ' GLint    stacks);
		  
		  
		  soft declare sub gluCylinder lib libOpenGL (pquad as Ptr, pbase as double, ptop as double, pheight as double, pslices as integer, pstacks as integer)
		  
		  gluCylinder(theQuad, base, top, height, slices, stacks)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawDisk(inner as double, outer as double, slices as integer, loops as integer)
		  
		  if autoNormals then
		    OpenGL.glGetIntegerv(OpenGL.GL_SHADE_MODEL, gettingMem)
		    if gettingMem.UInt16Value(0) = OpenGL.GL_FLAT then 'flat
		      normalsFlat
		    else 'smooth, UInt16Value(0) = 7425 = OpenGL.GL_SMOOTH
		      normalsSmooth
		    end
		  end
		  
		  
		  
		  'void gluDisk        (
		  ' GLUquadric* quad, 
		  ' GLdouble inner , 
		  ' GLdouble outer , 
		  ' GLint    slices, 
		  ' GLint    loops);
		  
		  soft declare sub gluDisk lib libOpenGL(pquad as Ptr, pinner as double, pouter as double, pslices as integer, ploops as integer)
		  
		  gluDisk(theQuad, inner, outer, slices, loops)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawPartialDisk(inner as double, outer as double, slices as integer, loops as integer, start as double, sweep as double)
		  
		  if autoNormals then
		    OpenGL.glGetIntegerv(OpenGL.GL_SHADE_MODEL, gettingMem)
		    if gettingMem.UInt16Value(0) = OpenGL.GL_FLAT then 'flat
		      normalsFlat
		    else 'smooth, UInt16Value(0) = 7425 = OpenGL.GL_SMOOTH
		      normalsSmooth
		    end
		  end
		  
		  
		  
		  'void gluPartialDisk (
		  ' GLUquadric* quad, 
		  ' GLdouble inner , 
		  ' GLdouble outer , 
		  ' GLint    slices, 
		  ' GLint    loops , 
		  ' GLdouble start, 
		  ' GLdouble sweep);
		  
		  
		  soft declare sub gluPartialDisk lib libOpenGL(pquad as Ptr, pinner as double, pouter as double, pslices as integer, ploops as integer, pstart as double, psweep as double)
		  
		  gluPartialDisk(theQuad, inner, outer, slices, loops, start, sweep)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawSphere(radius as double, slices as integer, stacks as integer)
		  
		  if autoNormals then
		    OpenGL.glGetIntegerv(OpenGL.GL_SHADE_MODEL, gettingMem)
		    if gettingMem.UInt16Value(0) = OpenGL.GL_FLAT then 'flat
		      normalsFlat
		    else 'smooth, UInt16Value(0) = 7425 = OpenGL.GL_SMOOTH
		      normalsSmooth
		    end
		  end
		  
		  if autoTexture then
		    OpenGL.glGetIntegerv(OpenGL.GL_SHADE_MODEL, gettingMem)
		    if gettingMem.UInt16Value(0) = OpenGL.GL_FLAT then 'flat
		      normalsFlat
		    else 'smooth, UInt16Value(0) = 7425 = OpenGL.GL_SMOOTH
		      normalsSmooth
		    end
		  end
		  
		  
		  'void gluSphere      (
		  ' GLUquadric* quad, 
		  ' GLdouble radius, 
		  ' GLint    slices, 
		  ' GLint    stacks);
		  
		  
		  soft declare sub gluSphere lib libOpenGL(quad as Ptr, pradius as double, pslices as integer, pstacks as integer)
		  
		  gluSphere(theQuad, radius, slices, stacks)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub faceNormalsIn()
		  
		  soft declare sub gluQuadricOrientation lib libOpenGL (quad as Ptr, mode as integer)
		  
		  gluQuadricOrientation(theQuad, GLU_INSIDE)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub faceNormalsOut()
		  
		  soft declare sub gluQuadricOrientation lib libOpenGL (quad as Ptr, mode as integer)
		  
		  gluQuadricOrientation(theQuad, GLU_OUTSIDE)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub normalsFlat()
		  
		  soft declare sub gluQuadricNormals lib libOpenGL (quad as Ptr, mode as integer)
		  
		  gluQuadricNormals(theQuad, GLU_FLAT)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub normalsNone()
		  
		  soft declare sub gluQuadricNormals lib libOpenGL (quad as Ptr, mode as integer)
		  
		  gluQuadricNormals(theQuad, GLU_NONE)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub normalsSmooth()
		  
		  soft declare sub gluQuadricNormals lib libOpenGL (quad as Ptr, mode as integer)
		  
		  gluQuadricNormals(theQuad, GLU_SMOOTH)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub styleFill()
		  
		  soft declare sub gluQuadricDrawStyle lib libOpenGL (quad as Ptr, style as integer)
		  
		  gluQuadricDrawStyle(theQuad, GLU_FILL)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub styleLine()
		  
		  soft declare sub gluQuadricDrawStyle lib libOpenGL (quad as Ptr, style as integer)
		  
		  gluQuadricDrawStyle(theQuad, GLU_LINE)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stylePoint()
		  
		  soft declare sub gluQuadricDrawStyle lib libOpenGL (quad as Ptr, style as integer)
		  
		  gluQuadricDrawStyle(theQuad, GLU_POINT)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub textureOff()
		  
		  soft declare sub gluQuadricTexture lib libOpenGL (quad as Ptr, doTexing as boolean)
		  
		  gluQuadricTexture(theQuad, false)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub textureOn()
		  
		  soft declare sub gluQuadricTexture lib libOpenGL (quad as Ptr, doTexing as boolean)
		  
		  gluQuadricTexture(theQuad, true)
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		autoNormals As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		autoTexture As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared gettingMem As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected theQuad As Ptr
	#tag EndProperty


	#tag Constant, Name = GLU_FILL, Type = Double, Dynamic = False, Default = \"100012", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GLU_FLAT, Type = Double, Dynamic = False, Default = \"100001", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GLU_INSIDE, Type = Double, Dynamic = False, Default = \"100021", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GLU_LINE, Type = Double, Dynamic = False, Default = \"100011", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GLU_NONE, Type = Double, Dynamic = False, Default = \"100002", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GLU_OUTSIDE, Type = Double, Dynamic = False, Default = \"100020", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GLU_POINT, Type = Double, Dynamic = False, Default = \"100010", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GLU_SMOOTH, Type = Double, Dynamic = False, Default = \"100000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = libOpenGL, Type = String, Dynamic = False, Default = \"OpenGL.framework", Scope = Protected
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"OpenGL.framework"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Glu32"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="autoNormals"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoTexture"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
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
