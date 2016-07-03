#tag Class
Protected Class EZShader
	#tag Method, Flags = &h0
		Sub compile()
		  soft declare sub glCompileShader lib kLibOpenGL (shdrid As UInt32)
		  
		  glCompileShader(instanceID)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(shaderType As integer, source As String = "", doCompile As boolean = false)
		  soft declare function glCreateShader lib kLibOpenGL (shdrType As UInt32) As UInt32
		  
		  //get an id
		  if shaderType = Vertex then
		    instanceID = glCreateShader(kTypeVertexShader)
		    
		  elseif shaderType = Fragment then
		    instanceID = glCreateShader(kTypeFragmentShader)
		    
		  else //err
		    MsgBox "EZShader.Constructor: you passed a bad shader type. received " + Str(shaderType)
		    return
		  end
		  
		  
		  //handle extras
		  if source = "" then return
		  
		  setSource(source)
		  
		  if doCompile then compile
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub delete()
		  
		  if instanceID = 0 then return
		  
		  soft declare sub glDeleteShader lib kLibOpenGL (id As UInt32)
		  
		  glDeleteShader(instanceID)
		  
		  instanceID = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  delete
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getID() As UInt32
		  return instanceID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getInfoLog() As String
		  soft declare sub glGetShaderInfoLog lib kLibOpenGL (pshdr As UInt32, pmaxlen As Int32, pretlen As Ptr, pinfo As Ptr)
		  
		  static retLenMem As new MemoryBlock(4)
		  
		  dim infoLen As UInt32 = getShaderData(kGetInfoLogLength)
		  
		  dim mem As new MemoryBlock(infoLen + 1)
		  
		  glGetShaderInfoLog(instanceID, infoLen, retLenMem, mem)
		  
		  return mem.CString(0).DefineEncoding(Encodings.UTF8)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getIsCompiled() As boolean
		  
		  return getShaderData(kGetCompileStatus) = OpenGL.GL_TRUE
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getShaderData(getWhat As UInt32) As UInt32
		  soft declare sub glGetShaderiv lib kLibOpenGL (pshdr As UInt32, penum As UInt32, pparams As Ptr)
		  
		  static mem As new MemoryBlock(4)
		  
		  glGetShaderiv(instanceID, getWhat, mem)
		  
		  return mem.UInt32Value(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setSource(source As String)
		  soft declare sub glShaderSource lib kLibOpenGL (shaderid As UInt32, pcount As UInt32, psource As Ptr, plength As ptr) //length ptr vs UInt32
		  
		  //build MemoryBlock for source String
		  dim srcMem As new MemoryBlock(5 + source.LenB) //4 bytes ptr, n chars, 1 byte null terminal
		  srcMem.Ptr(0) = Ptr(integer(CType(srcMem, Ptr)) + 4)
		  srcMem.CString(4) = source //place text leaving space for ptr
		  
		  //set it
		  glShaderSource(instanceID, 1, srcMem, nil)
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = convenience variations
		
		
		
		
		dim verts As new EZShader(EZShader.Vertex, source, true)
		
		
		dim verts As EZShader = EZShader.newVertex(source, true)
		
		
		
		dim verts As new EZShader(EZShader.Vertex)
		verts.setSource(source)
		verts.compile
		
		
		dim verts As EZShader = EZShader.newVertex
		verts.setSource(source)
		verts.compile
		
		
		
		if not verts.isCompiled then
		
		
		
		
		
		
		dim prog As new EZProgram()
		dim prog As new EZProgram(vertShdr, fragShdr)   //just attach
		dim prog As new EZProgram(true, vertShdr, fragShdr) //attach and link
		dim prog As new EZProgram(true, true, vertShdr, fragShdr) //attach, link and use
		
		//could also do these which are same as 'just attach'
		dim prog As new EZProgram(false, vertShdr, fragShdr)
		dim prog As new EZProgram(false, false, vertShdr, fragShdr)
		
		//this is nonsensical, can't use if not linked...
		dim prog As new EZProgram(false, true, vertShdr, fragShdr)
		
		
		
		
		
		may also want to keep shaders as properties for easier detaching
		or what not.
		
		
		
		
		
		
		super convenience. just supply sources and its all compiled, linked and option to use.
		
		dim prog As new EZProgram(vertSource, fragSource, true)
		
		
		
		
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private instanceID As UInt32
	#tag EndProperty


	#tag Constant, Name = Fragment, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kGetCompileStatus, Type = Double, Dynamic = False, Default = \"35713", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kGetInfoLogLength, Type = Double, Dynamic = False, Default = \"35716", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kLibOpenGL, Type = String, Dynamic = False, Default = \"OpenGL.framework", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kTypeFragmentShader, Type = Double, Dynamic = False, Default = \"35632", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kTypeVertexShader, Type = Double, Dynamic = False, Default = \"35633", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Vertex, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


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
