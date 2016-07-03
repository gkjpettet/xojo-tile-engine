#tag Class
Protected Class glBase
	#tag Method, Flags = &h1
		Protected Sub initBaseData()
		  
		  one255th = 0.0039215686274509803
		  
		  tempMem16 = new MemoryBlock(16)
		End Sub
	#tag EndMethod


	#tag Note, Name = about
		
		just provides 2 things to subclasses...
		
		one255th: constant value to scale 255.0 to 1.0
		tempMem16: a 16 byte MemoryBlock to stuff in values and pass to OpenGL
		
		
		initBaseData() must be called to initialize those values. This responsibility
		is handled by ezgl at the end of it's constructor. If for some reason you
		instantiate a subclass of glBase then make sure to have called initBaseData.
	#tag EndNote


	#tag Property, Flags = &h1
		Protected Shared one255th As single
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared tempMem16 As MemoryBlock
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
