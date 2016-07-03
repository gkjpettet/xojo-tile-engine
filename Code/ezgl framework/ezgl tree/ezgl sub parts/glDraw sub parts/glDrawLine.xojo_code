#tag Class
Protected Class glDrawLine
	#tag Method, Flags = &h0
		Sub smoothDisable()
		  OpenGL.glDisable(OpenGL.GL_LINE_SMOOTH)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub smoothEnable()
		  OpenGL.glEnable(OpenGL.GL_LINE_SMOOTH)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stippleDisable()
		  OpenGL.glDisable(OpenGL.GL_LINE_STIPPLE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stippleEnable()
		  OpenGL.glEnable(OpenGL.GL_LINE_STIPPLE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stipplePattern(factor As integer, pattern As UInt16)
		  
		  OpenGL.glLineStipple(factor, pattern)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub width(w As single)
		  
		  OpenGL.glLineWidth(w)
		End Sub
	#tag EndMethod


	#tag Note, Name = about
		
		Options when drawing lines
		
		
		width -- pixel width of lines
		
		smoothDisable -- aliased
		smoothEnable -- anti-alias
		
		stipplePattern -- set line stippling As a UInt16
		stippleEnable -- apply stippling to lines
		stippleDisable -- don't stipple
	#tag EndNote


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
