#tag Class
Protected Class glConfigFactory
Inherits glConfigurizer
	#tag DelegateDeclaration, Flags = &h0
		Delegate Function delGetMem() As MemoryBlock
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		 Shared Function newConfig(byref callback As delGetMem) As glConfigurizer
		  
		  dim pix As new glConfigurizer
		  
		  callback = AddressOf pix.getMem
		  
		  return pix
		  
		End Function
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
