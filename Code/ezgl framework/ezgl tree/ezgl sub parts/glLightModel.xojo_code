#tag Class
Protected Class glLightModel
Inherits glBase
	#tag Method, Flags = &h0
		Sub ambient(c As Color)
		  
		  tempMem16.SingleValue(0) = c.Red * one255th
		  tempMem16.SingleValue(4) = c.Green * one255th
		  tempMem16.SingleValue(8) = c.Blue * one255th
		  tempMem16.SingleValue(12) = 1
		  
		  OpenGL.glLightModelfv(OpenGL.GL_LIGHT_MODEL_AMBIENT, tempMem16)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambient(grey As single)
		  
		  tempMem16.SingleValue(0) = grey
		  tempMem16.SingleValue(4) = grey
		  tempMem16.SingleValue(8) = grey
		  tempMem16.SingleValue(12) = 1
		  
		  OpenGL.glLightModelfv(OpenGL.GL_LIGHT_MODEL_AMBIENT, tempMem16)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ambient(r As single, g As single, b As single)
		  
		  tempMem16.SingleValue(0) = r
		  tempMem16.SingleValue(4) = g
		  tempMem16.SingleValue(8) = b
		  tempMem16.SingleValue(12) = 1
		  
		  OpenGL.glLightModelfv(OpenGL.GL_LIGHT_MODEL_AMBIENT, tempMem16)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub colorControlSeparateSpecular()
		  OpenGL.glLightModeli(OpenGL.GL_LIGHT_MODEL_COLOR_CONTROL, OpenGL.GL_SEPARATE_SPECULAR_COLOR)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub colorControlSingle()
		  OpenGL.glLightModeli(OpenGL.GL_LIGHT_MODEL_COLOR_CONTROL, OpenGL.GL_SINGLE_COLOR)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub disable()
		  OpenGL.glDisable(OpenGL.GL_LIGHTING)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enable()
		  OpenGL.glEnable(OpenGL.GL_LIGHTING)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub localViewerEyeCoord()
		  OpenGL.glLightModeli(OpenGL.GL_LIGHT_MODEL_LOCAL_VIEWER, OpenGL.GL_TRUE)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub localViewerParallel()
		  OpenGL.glLightModeli(OpenGL.GL_LIGHT_MODEL_LOCAL_VIEWER, OpenGL.GL_FALSE)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub normalizeFullDisable()
		  
		  OpenGL.glDisable(OpenGL.GL_NORMALIZE) //more expensize
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub normalizeFullEnable()
		  
		  OpenGL.glEnable(OpenGL.GL_NORMALIZE) //more expensize
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub normalizeScaleDisable()
		  
		  OpenGL.glDisable(OpenGL.GL_RESCALE_NORMAL) //uniform scale only
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub normalizeScaleEnable()
		  
		  OpenGL.glEnable(OpenGL.GL_RESCALE_NORMAL) //uniform scale only
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub sidedOne()
		  OpenGL.glLightModeli(OpenGL.GL_LIGHT_MODEL_TWO_SIDE, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub sidedTwo()
		  OpenGL.glLightModeli(OpenGL.GL_LIGHT_MODEL_TWO_SIDE, 1)
		  
		  
		  'use backface materials and reverses those normals
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
