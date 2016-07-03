#tag Class
Protected Class FactoryEZGL
Inherits ezgl
	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub delBoundsSetter(w As integer, h As integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		 Shared Function getBoundsSetter(g As ezgl) As delBoundsSetter
		  if g = nil then return nil
		  
		  return AddressOf g.setWidthHeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function newEZGL() As ezgl
		  
		  return new ezgl
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
