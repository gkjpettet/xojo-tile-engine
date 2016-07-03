#tag Class
Protected Class EZMemUInt32_1D
Inherits MemoryBlock
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  //block default
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(lastIndex As integer)
		  
		  if lastIndex < -1 then lastIndex = -1
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor((lastIndex + 1) * 4)
		  
		  refPtr = self
		  
		  lastElemIdx = lastIndex
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub set(idx As integer, x As UInt32)
		  //no bounds checking of idx
		  
		  refPtr.UInt32(idx * 4) = x
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ubound() As integer
		  return lastElemIdx
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private lastElemIdx As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private refPtr As Ptr
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
			Name="LittleEndian"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Size"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
