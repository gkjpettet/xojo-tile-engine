#tag Class
Protected Class IsoTile
	#tag Method, Flags = &h0
		Sub Constructor(map as XTE.Isometric, column as Integer, row as Integer, pic as Picture)
		  me.myMap = map
		  me.column = column
		  me.row = row
		  me.image = new EZTexture2D(pic, pic.CopyMask, True)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		column As Integer = -1
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mimage
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Set the new base image
			  mImage = value
			  
			  ' Compute the new zOffset for this tile's base image drawing
			  mzOffset = mImage.height - myMap.tileHeight
			End Set
		#tag EndSetter
		image As EZTexture2D
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mImage As EZTexture2D
	#tag EndProperty

	#tag Property, Flags = &h0
		myMap As XTE.Isometric
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mzOffset As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		row As Integer = -1
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mzOffset
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Read only. Set internally when image property changed
			End Set
		#tag EndSetter
		zOffset As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="column"
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
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
			Name="row"
			Group="Behavior"
			InitialValue="-1"
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
		#tag ViewProperty
			Name="zOffset"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
