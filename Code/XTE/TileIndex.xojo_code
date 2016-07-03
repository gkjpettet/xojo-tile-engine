#tag Class
Protected Class TileIndex
	#tag Method, Flags = &h0
		Sub Constructor()
		  column = -1
		  row = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(column as Integer, row as Integer)
		  me.column = column
		  me.row = row
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToText() As Text
		  ' Format the column and row into pretty text.
		  
		  if column < 0 or row < 0 then return "Nil"
		  
		  return "(" + column.ToText + ", " + row.ToText + ")"
		End Function
	#tag EndMethod


	#tag Note, Name = About
		A simple class that represents the index of a tile in the map (column, row)
		
	#tag EndNote


	#tag Property, Flags = &h0
		column As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		row As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="column"
			Group="Behavior"
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
