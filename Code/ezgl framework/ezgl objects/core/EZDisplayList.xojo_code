#tag Class
Protected Class EZDisplayList
	#tag Method, Flags = &h0
		Sub beginList(listIndex As integer = 0)
		  
		  OpenGL.glNewList(theListBase + listIndex, OpenGL.GL_COMPILE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub callList(listIndex As integer = 0)
		  
		  
		  OpenGL.glCallList(theListBase + listIndex)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub callLists(listIndices() As integer)
		  
		  //array ends
		  dim last As integer = listIndices.Ubound
		  dim lastp1 As integer = last + 1
		  
		  //manage memory
		  static mem As MemoryBlock = new MemoryBlock(100)
		  
		  if lastp1 * 2 > mem.Size then mem.Size = lastp1 * 2 //scale up mem. doesn't go away
		  
		  //scan indices to memoryblock as uint16s
		  dim memPtr As Ptr = mem
		  for i As integer = 0 to last
		    memPtr.UInt16(i * 2) = listIndices(i)
		  next
		  
		  //send
		  OpenGL.glListBase(theListBase)
		  OpenGL.glCallLists(lastp1, OpenGL.GL_UNSIGNED_SHORT, mem)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub callLists(ParamArray listIndices As integer)
		  
		  callLists(listIndices)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(lastListIndex As integer = 0)
		  
		  
		  theListBase = OpenGL.glGenLists(lastListIndex + 1) //gen and store
		  
		  theListUbound = lastListIndex
		  
		  
		  //err if theListBase = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  
		  OpenGL.glDeleteLists(theListBase, theListUbound + 1)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub endList()
		  OpenGL.glEndList
		End Sub
	#tag EndMethod


	#tag Note, Name = about
		
		In OpenGL display lists are created and destroyed using...
		
		
		glGenLists(range As integer) As integer
		
		glGenLists has one argument, range. It returns an integer n such that range 
		contiguous empty display lists, named n, n1, ..., nrange1, are created.
		
		
		glDeleteLists(list As integer, range As integer)
		
		list: Specifies the integer name of the first display list to delete.
		range: Specifies the number of display lists to delete.
		
		glDeleteLists causes a contiguous group of display lists to be deleted.
		list is the name of the first display list to be deleted, and range is the
		number of display lists to delete. All display lists d with listdlistrange1
		are deleted.
		
		All storage locations allocated to the specified display lists are freed,
		and the names are available for reuse at a later time. Names within the
		range that do not have an associated display list are ignored.
		
		==========================================================================
		
		This class wraps creating a single contiguous set of display lists in the 
		constructor and deletes that set in the destructor. It can be used to represent
		a single display list or an array of lists.
		
		
		dim dl As new EZDisplayList(3)  //create array of 4 display lists [0, 1, 2, 3]
		
		dim dl2 As new EZDisplayList   //create single display list, equivalent to "new EZDisplayList(0)"
		
		Note that OpenGL uses Counts in the function calls but in EZDisplayList all
		sizes and indices are 0 based.
		
		Once created the size of this array can't be changed, immutable. You can of course
		fill the actual lists, call them, replace them and empty them. 
		
		
		dim dl As new EZDisplayList
		
		dl.beginList
		runMyCommandsToListify()
		dl.endList
		
		dl.callList
		
		dl.emptyList
		
		dl = nil
		
		
		
		===========================================================================
		
		All list building is done in GL_COMPILE mode, not GL_COMPILE_AND_EXECUTE
		
		
		
		
		
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private theListBase As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theListUbound As Integer
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
