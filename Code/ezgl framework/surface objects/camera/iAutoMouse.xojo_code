#tag Interface
Protected Interface iAutoMouse
	#tag Method, Flags = &h0
		Sub mouseDrag(x As integer, y As integer, dx As integer, dy As integer, surface As EZSurface)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub mouseUp(x As integer, y As integer, surface As EZSurface)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub mouseWheel(x As integer, y As integer, deltaX As integer, deltaY As integer, surface As EZSurface)
		  
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
End Interface
#tag EndInterface
