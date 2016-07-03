#tag Class
Protected Class glMaterial
Inherits glBase
	#tag Method, Flags = &h0
		Sub ambient(c As Color)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_AMBIENT, tempMem16)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambient(grey As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = 1.0
		  
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_AMBIENT, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambient(r As single, g As single, b As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = 1.0
		  
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_AMBIENT, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuse(c As Color)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuse(c As Color, a As single)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = a
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuse(grey As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuse(grey As single, a As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = a
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuse(r As single, g As single, b As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuse(r As single, g As single, b As single, a As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = a
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuseBack(c As Color)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuseBack(c As Color, a As single)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = a
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuseBack(grey As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuseBack(grey As single, a As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = a
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuseBack(r As single, g As single, b As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuseBack(r As single, g As single, b As single, a As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = a
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuseFront(c As Color)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuseFront(c As Color, a As single)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = a
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuseFront(grey As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuseFront(grey As single, a As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = a
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuseFront(r As single, g As single, b As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientAndDiffuseFront(r As single, g As single, b As single, a As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = a
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientBack(c As Color)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_AMBIENT, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientBack(grey As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_AMBIENT, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientBack(r As single, g As single, b As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_AMBIENT, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientFront(c As Color)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_AMBIENT, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientFront(grey As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_AMBIENT, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambientFront(r As single, g As single, b As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_AMBIENT, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  colour = new glColorMaterial
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuse(c As Color)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuse(c As Color, a As single)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = a
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuse(grey As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuse(grey As single, a As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = a
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuse(r As single, g As single, b As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuse(r As single, g As single, b As single, a As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = a
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuseBack(c As Color)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuseBack(c As Color, a As single)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = a
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuseBack(grey As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuseBack(grey As single, a As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = a
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuseBack(r As single, g As single, b As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuseBack(r As single, g As single, b As single, a As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = a
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuseFront(c As Color)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_DIFFUSE, tempMem16)
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuseFront(c As Color, a As single)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = a
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_DIFFUSE, tempMem16)
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuseFront(grey As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuseFront(grey As single, a As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = a
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuseFront(r As single, g As single, b As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub diffuseFront(r As single, g As single, b As single, a As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = a
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_DIFFUSE, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub emission(c As Color)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_EMISSION, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub emission(grey As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_EMISSION, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub emission(r As single, g As single, b As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_EMISSION, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub emissionBack(c As Color)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_EMISSION, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub emissionBack(grey As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_EMISSION, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub emissionBack(r As single, g As single, b As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_EMISSION, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub emissionFront(c As Color)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_EMISSION, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub emissionFront(grey As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_EMISSION, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub emissionFront(r As single, g As single, b As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_EMISSION, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColors(colAmbient As Color, colDiffuse As Color, colSpecular As Color, shiny As single)
		  
		  tempMem16.SingleValue(0) = colAmbient.Red   * one255th
		  tempMem16.SingleValue(4) = colAmbient.Green * one255th
		  tempMem16.SingleValue(8) = colAmbient.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_AMBIENT, tempMem16)
		  
		  tempMem16.SingleValue(0) = colDiffuse.Red   * one255th
		  tempMem16.SingleValue(4) = colDiffuse.Green * one255th
		  tempMem16.SingleValue(8) = colDiffuse.Blue  * one255th
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		  tempMem16.SingleValue(0) = colSpecular.Red   * one255th
		  tempMem16.SingleValue(4) = colSpecular.Green * one255th
		  tempMem16.SingleValue(8) = colSpecular.Blue  * one255th
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColors(colAmbientAndDiffuse As Color, colSpecular As Color, shiny As single)
		  
		  tempMem16.SingleValue(0) = colAmbientAndDiffuse.Red   * one255th
		  tempMem16.SingleValue(4) = colAmbientAndDiffuse.Green * one255th
		  tempMem16.SingleValue(8) = colAmbientAndDiffuse.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		  tempMem16.SingleValue(0) = colSpecular.Red   * one255th
		  tempMem16.SingleValue(4) = colSpecular.Green * one255th
		  tempMem16.SingleValue(8) = colSpecular.Blue  * one255th
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColors(colAmbient As Color, colDiffuse As Color, diffuseAlpha As single, colSpecular As Color, shiny As single)
		  
		  tempMem16.SingleValue(0) = colAmbient.Red   * one255th
		  tempMem16.SingleValue(4) = colAmbient.Green * one255th
		  tempMem16.SingleValue(8) = colAmbient.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_AMBIENT, tempMem16)
		  
		  tempMem16.SingleValue(0) = colSpecular.Red   * one255th
		  tempMem16.SingleValue(4) = colSpecular.Green * one255th
		  tempMem16.SingleValue(8) = colSpecular.Blue  * one255th
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		  tempMem16.SingleValue(0) = colDiffuse.Red   * one255th
		  tempMem16.SingleValue(4) = colDiffuse.Green * one255th
		  tempMem16.SingleValue(8) = colDiffuse.Blue  * one255th
		  tempMem16.SingleValue(12) = diffuseAlpha
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColors(colAmbientAndDiffuse As Color, diffuseAlpha As single, colSpecular As Color, shiny As single)
		  
		  tempMem16.SingleValue(0) = colAmbientAndDiffuse.Red   * one255th
		  tempMem16.SingleValue(4) = colAmbientAndDiffuse.Green * one255th
		  tempMem16.SingleValue(8) = colAmbientAndDiffuse.Blue  * one255th
		  tempMem16.SingleValue(12) = diffuseAlpha
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		  tempMem16.SingleValue(0) = colSpecular.Red   * one255th
		  tempMem16.SingleValue(4) = colSpecular.Green * one255th
		  tempMem16.SingleValue(8) = colSpecular.Blue  * one255th
		  tempMem16.SingleValue(12) = 1
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColors(ambDifR As single, ambDifG As single, ambDifB As single, specR As single, specG As single, specB As single, shiny As single)
		  
		  tempMem16.SingleValue(0) = ambDifR
		  tempMem16.SingleValue(4) = ambDifG
		  tempMem16.SingleValue(8) = ambDifB
		  tempMem16.SingleValue(12) = 1.0
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		  tempMem16.SingleValue(0) = specR
		  tempMem16.SingleValue(4) = specG
		  tempMem16.SingleValue(8) = specB
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColors(ambDifR As single, ambDifG As single, ambDifB As single, ambDifA As single, specR As single, specG As single, specB As single, shiny As single)
		  
		  tempMem16.SingleValue(0) = ambDifR
		  tempMem16.SingleValue(4) = ambDifG
		  tempMem16.SingleValue(8) = ambDifB
		  tempMem16.SingleValue(12) = ambDifA
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		  tempMem16.SingleValue(0) = specR
		  tempMem16.SingleValue(4) = specG
		  tempMem16.SingleValue(8) = specB
		  tempMem16.SingleValue(12) = 1
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColors(ambR As single, ambG As single, ambB As single, difR As single, difG As single, difB As single, specR As single, specG As single, specB As single, shiny As single)
		  
		  tempMem16.SingleValue(0) = ambR
		  tempMem16.SingleValue(4) = ambG
		  tempMem16.SingleValue(8) = ambB
		  tempMem16.SingleValue(12) = 1.0
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_AMBIENT, tempMem16)
		  
		  tempMem16.SingleValue(0) = difR
		  tempMem16.SingleValue(4) = difG
		  tempMem16.SingleValue(8) = difB
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		  tempMem16.SingleValue(0) = specR
		  tempMem16.SingleValue(4) = specG
		  tempMem16.SingleValue(8) = specB
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColors(ambR As single, ambG As single, ambB As single, difR As single, difG As single, difB As single, difA As single, specR As single, specG As single, specB As single, shiny As single)
		  
		  tempMem16.SingleValue(0) = ambR
		  tempMem16.SingleValue(4) = ambG
		  tempMem16.SingleValue(8) = ambB
		  tempMem16.SingleValue(12) = 1.0
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_AMBIENT, tempMem16)
		  
		  tempMem16.SingleValue(0) = specR
		  tempMem16.SingleValue(4) = specG
		  tempMem16.SingleValue(8) = specB
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		  tempMem16.SingleValue(0) = difR
		  tempMem16.SingleValue(4) = difG
		  tempMem16.SingleValue(8) = difB
		  tempMem16.SingleValue(12) = difA
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColorsBack(colAmbient As Color, colDiffuse As Color, colSpecular As Color, shiny As single)
		  
		  tempMem16.SingleValue(0) = colAmbient.Red   * one255th
		  tempMem16.SingleValue(4) = colAmbient.Green * one255th
		  tempMem16.SingleValue(8) = colAmbient.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_AMBIENT, tempMem16)
		  
		  tempMem16.SingleValue(0) = colDiffuse.Red   * one255th
		  tempMem16.SingleValue(4) = colDiffuse.Green * one255th
		  tempMem16.SingleValue(8) = colDiffuse.Blue  * one255th
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		  tempMem16.SingleValue(0) = colSpecular.Red   * one255th
		  tempMem16.SingleValue(4) = colSpecular.Green * one255th
		  tempMem16.SingleValue(8) = colSpecular.Blue  * one255th
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_BACK, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColorsBack(colAmbientAndDiffuse As Color, colSpecular As Color, shiny As single)
		  
		  tempMem16.SingleValue(0) = colAmbientAndDiffuse.Red   * one255th
		  tempMem16.SingleValue(4) = colAmbientAndDiffuse.Green * one255th
		  tempMem16.SingleValue(8) = colAmbientAndDiffuse.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		  tempMem16.SingleValue(0) = colSpecular.Red   * one255th
		  tempMem16.SingleValue(4) = colSpecular.Green * one255th
		  tempMem16.SingleValue(8) = colSpecular.Blue  * one255th
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_BACK, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColorsBack(colAmbient As Color, colDiffuse As Color, diffuseAlpha As single, colSpecular As Color, shiny As single)
		  
		  tempMem16.SingleValue(0) = colAmbient.Red   * one255th
		  tempMem16.SingleValue(4) = colAmbient.Green * one255th
		  tempMem16.SingleValue(8) = colAmbient.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_AMBIENT, tempMem16)
		  
		  tempMem16.SingleValue(0) = colSpecular.Red   * one255th
		  tempMem16.SingleValue(4) = colSpecular.Green * one255th
		  tempMem16.SingleValue(8) = colSpecular.Blue  * one255th
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		  tempMem16.SingleValue(0) = colDiffuse.Red   * one255th
		  tempMem16.SingleValue(4) = colDiffuse.Green * one255th
		  tempMem16.SingleValue(8) = colDiffuse.Blue  * one255th
		  tempMem16.SingleValue(12) = diffuseAlpha
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_BACK, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColorsBack(colAmbientAndDiffuse As Color, diffuseAlpha As single, colSpecular As Color, shiny As single)
		  
		  tempMem16.SingleValue(0) = colAmbientAndDiffuse.Red   * one255th
		  tempMem16.SingleValue(4) = colAmbientAndDiffuse.Green * one255th
		  tempMem16.SingleValue(8) = colAmbientAndDiffuse.Blue  * one255th
		  tempMem16.SingleValue(12) = diffuseAlpha
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		  tempMem16.SingleValue(0) = colSpecular.Red   * one255th
		  tempMem16.SingleValue(4) = colSpecular.Green * one255th
		  tempMem16.SingleValue(8) = colSpecular.Blue  * one255th
		  tempMem16.SingleValue(12) = 1
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_BACK, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColorsBack(ambDifR As single, ambDifG As single, ambDifB As single, specR As single, specG As single, specB As single, shiny As single)
		  
		  tempMem16.SingleValue(0) = ambDifR
		  tempMem16.SingleValue(4) = ambDifG
		  tempMem16.SingleValue(8) = ambDifB
		  tempMem16.SingleValue(12) = 1.0
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		  tempMem16.SingleValue(0) = specR
		  tempMem16.SingleValue(4) = specG
		  tempMem16.SingleValue(8) = specB
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_BACK, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColorsBack(ambDifR As single, ambDifG As single, ambDifB As single, ambDifA As single, specR As single, specG As single, specB As single, shiny As single)
		  
		  tempMem16.SingleValue(0) = ambDifR
		  tempMem16.SingleValue(4) = ambDifG
		  tempMem16.SingleValue(8) = ambDifB
		  tempMem16.SingleValue(12) = ambDifA
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		  tempMem16.SingleValue(0) = specR
		  tempMem16.SingleValue(4) = specG
		  tempMem16.SingleValue(8) = specB
		  tempMem16.SingleValue(12) = 1
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_BACK, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColorsBack(ambR As single, ambG As single, ambB As single, difR As single, difG As single, difB As single, specR As single, specG As single, specB As single, shiny As single)
		  
		  tempMem16.SingleValue(0) = ambR
		  tempMem16.SingleValue(4) = ambG
		  tempMem16.SingleValue(8) = ambB
		  tempMem16.SingleValue(12) = 1.0
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_AMBIENT, tempMem16)
		  
		  tempMem16.SingleValue(0) = difR
		  tempMem16.SingleValue(4) = difG
		  tempMem16.SingleValue(8) = difB
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		  tempMem16.SingleValue(0) = specR
		  tempMem16.SingleValue(4) = specG
		  tempMem16.SingleValue(8) = specB
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_BACK, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColorsBack(ambR As single, ambG As single, ambB As single, difR As single, difG As single, difB As single, difA As single, specR As single, specG As single, specB As single, shiny As single)
		  
		  tempMem16.SingleValue(0) = ambR
		  tempMem16.SingleValue(4) = ambG
		  tempMem16.SingleValue(8) = ambB
		  tempMem16.SingleValue(12) = 1.0
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_AMBIENT, tempMem16)
		  
		  tempMem16.SingleValue(0) = specR
		  tempMem16.SingleValue(4) = specG
		  tempMem16.SingleValue(8) = specB
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		  tempMem16.SingleValue(0) = difR
		  tempMem16.SingleValue(4) = difG
		  tempMem16.SingleValue(8) = difB
		  tempMem16.SingleValue(12) = difA
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_DIFFUSE, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_BACK, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColorsFront(colAmbient As Color, colDiffuse As Color, colSpecular As Color, shiny As single)
		  
		  tempMem16.SingleValue(0) = colAmbient.Red   * one255th
		  tempMem16.SingleValue(4) = colAmbient.Green * one255th
		  tempMem16.SingleValue(8) = colAmbient.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_AMBIENT, tempMem16)
		  
		  tempMem16.SingleValue(0) = colDiffuse.Red   * one255th
		  tempMem16.SingleValue(4) = colDiffuse.Green * one255th
		  tempMem16.SingleValue(8) = colDiffuse.Blue  * one255th
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_DIFFUSE, tempMem16)
		  
		  tempMem16.SingleValue(0) = colSpecular.Red   * one255th
		  tempMem16.SingleValue(4) = colSpecular.Green * one255th
		  tempMem16.SingleValue(8) = colSpecular.Blue  * one255th
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_SPECULAR, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_FRONT, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColorsFront(colAmbientAndDiffuse As Color, colSpecular As Color, shiny As single)
		  
		  tempMem16.SingleValue(0) = colAmbientAndDiffuse.Red   * one255th
		  tempMem16.SingleValue(4) = colAmbientAndDiffuse.Green * one255th
		  tempMem16.SingleValue(8) = colAmbientAndDiffuse.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		  tempMem16.SingleValue(0) = colSpecular.Red   * one255th
		  tempMem16.SingleValue(4) = colSpecular.Green * one255th
		  tempMem16.SingleValue(8) = colSpecular.Blue  * one255th
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_SPECULAR, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_FRONT, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColorsFront(colAmbient As Color, colDiffuse As Color, diffuseAlpha As single, colSpecular As Color, shiny As single)
		  
		  tempMem16.SingleValue(0) = colAmbient.Red   * one255th
		  tempMem16.SingleValue(4) = colAmbient.Green * one255th
		  tempMem16.SingleValue(8) = colAmbient.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_AMBIENT, tempMem16)
		  
		  tempMem16.SingleValue(0) = colSpecular.Red   * one255th
		  tempMem16.SingleValue(4) = colSpecular.Green * one255th
		  tempMem16.SingleValue(8) = colSpecular.Blue  * one255th
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_SPECULAR, tempMem16)
		  
		  tempMem16.SingleValue(0) = colDiffuse.Red   * one255th
		  tempMem16.SingleValue(4) = colDiffuse.Green * one255th
		  tempMem16.SingleValue(8) = colDiffuse.Blue  * one255th
		  tempMem16.SingleValue(12) = diffuseAlpha
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_DIFFUSE, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_FRONT, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColorsFront(colAmbientAndDiffuse As Color, diffuseAlpha As single, colSpecular As Color, shiny As single)
		  
		  tempMem16.SingleValue(0) = colAmbientAndDiffuse.Red   * one255th
		  tempMem16.SingleValue(4) = colAmbientAndDiffuse.Green * one255th
		  tempMem16.SingleValue(8) = colAmbientAndDiffuse.Blue  * one255th
		  tempMem16.SingleValue(12) = diffuseAlpha
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		  tempMem16.SingleValue(0) = colSpecular.Red   * one255th
		  tempMem16.SingleValue(4) = colSpecular.Green * one255th
		  tempMem16.SingleValue(8) = colSpecular.Blue  * one255th
		  tempMem16.SingleValue(12) = 1
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_SPECULAR, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_FRONT, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColorsFront(ambDifR As single, ambDifG As single, ambDifB As single, specR As single, specG As single, specB As single, shiny As single)
		  
		  tempMem16.SingleValue(0) = ambDifR
		  tempMem16.SingleValue(4) = ambDifG
		  tempMem16.SingleValue(8) = ambDifB
		  tempMem16.SingleValue(12) = 1.0
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		  tempMem16.SingleValue(0) = specR
		  tempMem16.SingleValue(4) = specG
		  tempMem16.SingleValue(8) = specB
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_SPECULAR, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_FRONT, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColorsFront(ambDifR As single, ambDifG As single, ambDifB As single, ambDifA As single, specR As single, specG As single, specB As single, shiny As single)
		  
		  tempMem16.SingleValue(0) = ambDifR
		  tempMem16.SingleValue(4) = ambDifG
		  tempMem16.SingleValue(8) = ambDifB
		  tempMem16.SingleValue(12) = ambDifA
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_AMBIENT_AND_DIFFUSE, tempMem16)
		  
		  tempMem16.SingleValue(0) = specR
		  tempMem16.SingleValue(4) = specG
		  tempMem16.SingleValue(8) = specB
		  tempMem16.SingleValue(12) = 1
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_SPECULAR, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_FRONT, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColorsFront(ambR As single, ambG As single, ambB As single, difR As single, difG As single, difB As single, specR As single, specG As single, specB As single, shiny As single)
		  
		  tempMem16.SingleValue(0) = ambR
		  tempMem16.SingleValue(4) = ambG
		  tempMem16.SingleValue(8) = ambB
		  tempMem16.SingleValue(12) = 1.0
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_AMBIENT, tempMem16)
		  
		  tempMem16.SingleValue(0) = difR
		  tempMem16.SingleValue(4) = difG
		  tempMem16.SingleValue(8) = difB
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_DIFFUSE, tempMem16)
		  
		  tempMem16.SingleValue(0) = specR
		  tempMem16.SingleValue(4) = specG
		  tempMem16.SingleValue(8) = specB
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_SPECULAR, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_FRONT, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ezColorsFront(ambR As single, ambG As single, ambB As single, difR As single, difG As single, difB As single, difA As single, specR As single, specG As single, specB As single, shiny As single)
		  
		  tempMem16.SingleValue(0) = ambR
		  tempMem16.SingleValue(4) = ambG
		  tempMem16.SingleValue(8) = ambB
		  tempMem16.SingleValue(12) = 1.0
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_AMBIENT, tempMem16)
		  
		  tempMem16.SingleValue(0) = specR
		  tempMem16.SingleValue(4) = specG
		  tempMem16.SingleValue(8) = specB
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_SPECULAR, tempMem16)
		  
		  tempMem16.SingleValue(0) = difR
		  tempMem16.SingleValue(4) = difG
		  tempMem16.SingleValue(8) = difB
		  tempMem16.SingleValue(12) = difA
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_DIFFUSE, tempMem16)
		  
		  OpenGL.glMaterialf(OpenGL.GL_FRONT, OpenGL.GL_SHININESS, shiny)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function newInstance() As glMaterial
		  return new glMaterial
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub shininess(shiny As single)
		  
		  OpenGL.glMaterialf(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SHININESS, shiny)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub shininessBack(shiny As single)
		  
		  OpenGL.glMaterialf(OpenGL.GL_BACK, OpenGL.GL_SHININESS, shiny)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub shininessFront(shiny As single)
		  
		  OpenGL.glMaterialf(OpenGL.GL_FRONT, OpenGL.GL_SHININESS, shiny)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub specular(c As Color)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub specular(grey As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub specular(r As single, g As single, b As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT_AND_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub specularBack(c As Color)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub specularBack(grey As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub specularBack(r As single, g As single, b As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_BACK, OpenGL.GL_SPECULAR, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub specularFront(c As Color)
		  
		  tempMem16.SingleValue(0) = c.Red   * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue  * one255th
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_SPECULAR, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub specularFront(grey As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_SPECULAR, tempMem16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub specularFront(r As single, g As single, b As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = 1.0
		  
		  OpenGL.glMaterialfv(OpenGL.GL_FRONT, OpenGL.GL_SPECULAR, tempMem16)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		colour As glColorMaterial
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
