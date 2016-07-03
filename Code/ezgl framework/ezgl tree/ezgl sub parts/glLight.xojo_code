#tag Class
Protected Class glLight
Inherits glBase
	#tag Method, Flags = &h0
		Sub ambient(c As Color)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = 1
		  
		  OpenGL.glLightfv(refIdx, OpenGL.GL_AMBIENT, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambient(grey As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = 1
		  
		  OpenGL.glLightfv(refIdx, OpenGL.GL_AMBIENT, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambient(r As single, g As single, b As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = 1
		  
		  OpenGL.glLightfv(refIdx, OpenGL.GL_AMBIENT, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub attenuationConstant(factor As single)
		  
		  OpenGL.glLightf(refIdx, OpenGL.GL_CONSTANT_ATTENUATION, factor)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub attenuationLinear(factor As single)
		  
		  OpenGL.glLightf(refIdx, OpenGL.GL_LINEAR_ATTENUATION, factor)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub attenuationQuadratic(factor As single)
		  
		  OpenGL.glLightf(refIdx, OpenGL.GL_QUADRATIC_ATTENUATION, factor)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(idx As integer)
		  
		  refIdx = &h4000 + idx
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuse(c As Color)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glLightfv(refIdx, OpenGL.GL_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuse(grey As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glLightfv(refIdx, OpenGL.GL_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuse(r As single, g As single, b As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glLightfv(refIdx, OpenGL.GL_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub disable()
		  
		  OpenGL.glDisable(refIdx)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enable()
		  
		  OpenGL.glEnable(refIdx)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezAttenuations(constant As single, linear As single, quadratic As single)
		  OpenGL.glLightf(refIdx, OpenGL.GL_CONSTANT_ATTENUATION,  constant)
		  OpenGL.glLightf(refIdx, OpenGL.GL_LINEAR_ATTENUATION,    linear)
		  OpenGL.glLightf(refIdx, OpenGL.GL_QUADRATIC_ATTENUATION, quadratic)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColors(colAmbient As Color, colDiffuse As Color, colSpecular As Color)
		  
		  ambient(colAmbient)
		  diffuse(colDiffuse)
		  specular(colSpecular)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColors(ambR As single, ambG As single, ambB As single, difR As single, difG As single, difB As single, specR As single, specG As single, specB As single)
		  
		  ambient(ambR, ambG, ambB)
		  diffuse(difR, difG, difB)
		  specular(specR, specG, specB)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezSpot(dirX As single, dirY As single, dirZ As single, exponent As integer, cutoff As single = 89)
		  
		  
		  tempMem16.SingleValue(0) = dirX
		  tempMem16.SingleValue(4) = dirY
		  tempMem16.SingleValue(8) = dirZ
		  OpenGL.glLightfv(refIdx, OpenGL.GL_SPOT_DIRECTION, tempMem16)
		  
		  OpenGL.glLighti(refIdx, OpenGL.GL_SPOT_EXPONENT, exponent)
		  
		  OpenGL.glLightf(refIdx, OpenGL.GL_SPOT_CUTOFF, cutoff)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub position(x As single, y As single, z As single)
		  
		  tempMem16.SingleValue(0) = x
		  tempMem16.SingleValue(4) = y
		  tempMem16.SingleValue(8) = z
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glLightfv(refIdx, OpenGL.GL_POSITION, tempMem16)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub specular(c As Color)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glLightfv(refIdx, OpenGL.GL_SPECULAR, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub specular(grey As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glLightfv(refIdx, OpenGL.GL_SPECULAR, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub specular(r As single, g As single, b As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glLightfv(refIdx, OpenGL.GL_SPECULAR, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub spotCutoff(cutoff As single)
		  
		  OpenGL.glLightf(refIdx, OpenGL.GL_SPOT_CUTOFF, cutoff)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub spotDirection(x As single, y As single, z As single)
		  
		  tempMem16.SingleValue(0) = x
		  tempMem16.SingleValue(4) = y
		  tempMem16.SingleValue(8) = z
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glLightfv(refIdx, OpenGL.GL_SPOT_DIRECTION, tempMem16)
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  'change from
		  //http://www.gamedev.net/topic/620817-gl-spot-exponent-and-gl-spot-cutoff-not-working-on-mac-osx/
		  
		  'def and params, normalizing talk
		  //http://www.talisman.org/opengl-1.1/Reference/glGetLight.html
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub spotExponent(theExponent As single)
		  
		  OpenGL.glLighti(refIdx, OpenGL.GL_SPOT_EXPONENT, theExponent)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private refIdx As Integer
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
