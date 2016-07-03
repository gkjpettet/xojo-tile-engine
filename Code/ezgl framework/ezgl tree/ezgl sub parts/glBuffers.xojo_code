#tag Class
Protected Class glBuffers
Inherits glBase
	#tag Method, Flags = &h0
		Sub clear(c As Color = &c000000, withDepth As boolean = false)
		  //===================== clear buffers and enable depth
		  OpenGL.glClearColor c.Red * one255th, c.Green * one255th, c.Blue * one255th, 0
		  
		  if withDepth then
		    OpenGL.glClear      OpenGL.GL_COLOR_BUFFER_BIT + OpenGL.GL_DEPTH_BUFFER_BIT
		  else
		    OpenGL.glClear      OpenGL.GL_COLOR_BUFFER_BIT
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub clear(r As single, g As single, b As single, a As single, withDepth As boolean = false)
		  //===================== clear buffers and enable depth
		  OpenGL.glClearColor r, g, b, a
		  
		  if withDepth then
		    OpenGL.glClear      OpenGL.GL_COLOR_BUFFER_BIT + OpenGL.GL_DEPTH_BUFFER_BIT
		  else
		    OpenGL.glClear      OpenGL.GL_COLOR_BUFFER_BIT
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub clearDepth()
		  
		  OpenGL.glClear OpenGL.GL_DEPTH_BUFFER_BIT
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub copyPixelsColor(x As integer, y As integer, w As integer, h As integer)
		  OpenGL.glCopyPixels(x, y, w, h, OpenGL.GL_COLOR)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub copyPixelsDepth(x As integer, y As integer, w As integer, h As integer)
		  OpenGL.glCopyPixels(x, y, w, h, OpenGL.GL_DEPTH) 
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub copyPixelsStencil(x As integer, y As integer, w As integer, h As integer)
		  OpenGL.glCopyPixels(x, y, w, h, OpenGL.GL_STENCIL) 
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub depthDisable()
		  OpenGL.glDisable     OpenGL.GL_DEPTH_TEST
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub depthEnable()
		  OpenGL.glEnable     OpenGL.GL_DEPTH_TEST
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub depthWritingDisable()
		  
		  OpenGL.glDepthMask(OpenGL.GL_FALSE)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub depthWritingEnable()
		  
		  
		  
		  OpenGL.glDepthMask(OpenGL.GL_TRUE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawBack()
		  OpenGL.glDrawBuffer(OpenGL.GL_BACK)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawFront()
		  OpenGL.glDrawBuffer(OpenGL.GL_FRONT)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawPixels()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub pixelXfer(bias As single, scale As single, withAlpha As boolean = false)
		  OpenGL.glPixelTransferf(OpenGL.GL_RED_SCALE,   scale)
		  OpenGL.glPixelTransferf(OpenGL.GL_GREEN_SCALE, scale)
		  OpenGL.glPixelTransferf(OpenGL.GL_BLUE_SCALE,  scale)
		  if withAlpha then
		    OpenGL.glPixelTransferf(OpenGL.GL_ALPHA_SCALE, scale)
		  end
		  
		  OpenGL.glPixelTransferf(OpenGL.GL_RED_BIAS,    bias)
		  OpenGL.glPixelTransferf(OpenGL.GL_GREEN_BIAS,  bias)
		  OpenGL.glPixelTransferf(OpenGL.GL_BLUE_BIAS,   bias)
		  if withAlpha then
		    OpenGL.glPixelTransferf(OpenGL.GL_ALPHA_BIAS,  bias)
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub pixelXfer(redBias As single, redScale As single, greenBias As single, greenScale As single, blueBias As single, blueScale As single)
		  OpenGL.glPixelTransferf(OpenGL.GL_RED_SCALE,   redScale)
		  OpenGL.glPixelTransferf(OpenGL.GL_GREEN_SCALE, greenScale)
		  OpenGL.glPixelTransferf(OpenGL.GL_BLUE_SCALE,  blueScale)
		  
		  OpenGL.glPixelTransferf(OpenGL.GL_RED_BIAS,    redBias)
		  OpenGL.glPixelTransferf(OpenGL.GL_GREEN_BIAS,  greenBias)
		  OpenGL.glPixelTransferf(OpenGL.GL_BLUE_BIAS,   blueBias)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub pixelXfer(redBias As single, redScale As single, greenBias As single, greenScale As single, blueBias As single, blueScale As single, alphaBias As single, alphaScale As single)
		  OpenGL.glPixelTransferf(OpenGL.GL_RED_SCALE,   redScale)
		  OpenGL.glPixelTransferf(OpenGL.GL_GREEN_SCALE, greenScale)
		  OpenGL.glPixelTransferf(OpenGL.GL_BLUE_SCALE,  blueScale)
		  OpenGL.glPixelTransferf(OpenGL.GL_ALPHA_SCALE, alphaScale)
		  
		  OpenGL.glPixelTransferf(OpenGL.GL_RED_BIAS,    redBias)
		  OpenGL.glPixelTransferf(OpenGL.GL_GREEN_BIAS,  greenBias)
		  OpenGL.glPixelTransferf(OpenGL.GL_BLUE_BIAS,   blueBias)
		  OpenGL.glPixelTransferf(OpenGL.GL_ALPHA_BIAS,  alphaBias)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub pixelXferBias(bias As single, withAlpha As boolean = false)
		  OpenGL.glPixelTransferf(OpenGL.GL_RED_BIAS,    bias)
		  OpenGL.glPixelTransferf(OpenGL.GL_GREEN_BIAS,  bias)
		  OpenGL.glPixelTransferf(OpenGL.GL_BLUE_BIAS,   bias)
		  if withAlpha then
		    OpenGL.glPixelTransferf(OpenGL.GL_ALPHA_BIAS,  bias)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub pixelXferBias(redBias As single, greenBias As single, blueBias As single)
		  OpenGL.glPixelTransferf(OpenGL.GL_RED_BIAS,    redBias)
		  OpenGL.glPixelTransferf(OpenGL.GL_GREEN_BIAS,  greenBias)
		  OpenGL.glPixelTransferf(OpenGL.GL_BLUE_BIAS,   blueBias)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub pixelXferBias(redBias As single, greenBias As single, blueBias As single, alphaBias As single)
		  OpenGL.glPixelTransferf(OpenGL.GL_RED_BIAS,    redBias)
		  OpenGL.glPixelTransferf(OpenGL.GL_GREEN_BIAS,  greenBias)
		  OpenGL.glPixelTransferf(OpenGL.GL_BLUE_BIAS,   blueBias)
		  OpenGL.glPixelTransferf(OpenGL.GL_ALPHA_BIAS,  alphaBias)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub pixelXferReset()
		  OpenGL.glPixelTransferf(OpenGL.GL_RED_SCALE,   1)
		  OpenGL.glPixelTransferf(OpenGL.GL_GREEN_SCALE, 1)
		  OpenGL.glPixelTransferf(OpenGL.GL_BLUE_SCALE,  1)
		  OpenGL.glPixelTransferf(OpenGL.GL_ALPHA_SCALE, 1)
		  
		  OpenGL.glPixelTransferf(OpenGL.GL_RED_BIAS,    0)
		  OpenGL.glPixelTransferf(OpenGL.GL_GREEN_BIAS,  0)
		  OpenGL.glPixelTransferf(OpenGL.GL_BLUE_BIAS,   0)
		  OpenGL.glPixelTransferf(OpenGL.GL_ALPHA_BIAS,  0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub pixelXferScale(scale As single, withAlpha As boolean = false)
		  OpenGL.glPixelTransferf(OpenGL.GL_RED_SCALE,   scale)
		  OpenGL.glPixelTransferf(OpenGL.GL_GREEN_SCALE, scale)
		  OpenGL.glPixelTransferf(OpenGL.GL_BLUE_SCALE,  scale)
		  if withAlpha then
		    OpenGL.glPixelTransferf(OpenGL.GL_ALPHA_SCALE, scale)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub pixelXferScale(redScale As single, greenScale As single, blueScale As single)
		  OpenGL.glPixelTransferf(OpenGL.GL_RED_SCALE,   redScale)
		  OpenGL.glPixelTransferf(OpenGL.GL_GREEN_SCALE, greenScale)
		  OpenGL.glPixelTransferf(OpenGL.GL_BLUE_SCALE,  blueScale)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub pixelXferScale(redScale As single, greenScale As single, blueScale As single, alphaScale As single)
		  OpenGL.glPixelTransferf(OpenGL.GL_RED_SCALE,   redScale)
		  OpenGL.glPixelTransferf(OpenGL.GL_GREEN_SCALE, greenScale)
		  OpenGL.glPixelTransferf(OpenGL.GL_BLUE_SCALE,  blueScale)
		  OpenGL.glPixelTransferf(OpenGL.GL_ALPHA_SCALE, alphaScale)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub readBack()
		  OpenGL.glReadBuffer(OpenGL.GL_BACK)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub readFront()
		  OpenGL.glReadBuffer(OpenGL.GL_FRONT)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub readPixels()
		  
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
