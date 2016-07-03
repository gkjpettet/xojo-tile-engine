#tag Class
Protected Class EZProgram
	#tag Method, Flags = &h0
		Sub attachShader(shader As EZShader)
		  'if shader = nil then return
		  
		  soft declare sub glAttachShader lib kLibOpenGL (progid As UInt32, shaderid As UInt32)
		  
		  glAttachShader(instanceID, shader.getID)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  soft declare function glCreateProgram lib kLibOpenGL () As UInt32
		  
		  instanceID = glCreateProgram
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(vertShdr As EZShader, fragShdr As EZShader, doUse As boolean = false)
		  
		  Constructor
		  
		  attachShader(vertShdr)
		  attachShader(fragShdr)
		  
		  link
		  
		  if doUse then use
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(vertSource As String, fragSource As String, doUse As boolean = false)
		  
		  Constructor
		  
		  attachShader(new EZShader(EZShader.Vertex, vertSource, true))
		  attachShader(new EZShader(EZShader.Fragment, fragSource, true))
		  
		  link
		  
		  if doUse then use
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub delete()
		  
		  if instanceID = 0 then return
		  
		  soft declare sub glDeleteProgram lib kLibOpenGL (progid As UInt32)
		  
		  glDeleteProgram(instanceID)
		  
		  instanceID = 0
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  delete
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub detachShader(shader As EZShader)
		  soft declare sub glDetachShader lib kLibOpenGL (progid As UInt32, shdrid As UInt32)
		  
		  glDetachShader(instanceID, shader.getID)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getAttribID(name As String) As Int32
		  soft declare function glGetAttribLocation lib kLibOpenGL (pprog As UInt32, pname As CString) As Int32
		  
		  return glGetAttribLocation(instanceID, name)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getID() As UInt32
		  return instanceID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getUniformID(name As String) As UInt32
		  soft declare function glGetUniformLocation lib kLibOpenGL (pprog As UInt32, pname As CString) As Int32
		  
		  return glGetUniformLocation(instanceID, name)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub link()
		  soft declare sub glLinkProgram lib kLibOpenGL (progid As UInt32)
		  
		  glLinkProgram(instanceID)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setUniform1f(name As String, newValue As single)
		  
		  dim loc As UInt32 = getUniformID(name)
		  
		  if loc = -1 then return
		  
		  
		  soft declare sub glUniform1f lib kLibOpenGL (locid As Int32, pvalue As single)
		  
		  glUniform1f(loc, newValue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setUniform2f(name As String, val0 As single, val1 As single)
		  
		  dim loc As UInt32 = getUniformID(name)
		  
		  if loc = -1 then return
		  
		  
		  soft declare sub glUniform2f lib kLibOpenGL (locid As Int32, pval0 As single, pval1 As single)
		  
		  glUniform2f(loc, val0, val1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setUniform3f(name As String, val0 As single, val1 As single, val2 As single)
		  
		  dim loc As UInt32 = getUniformID(name)
		  
		  if loc = -1 then return
		  
		  
		  soft declare sub glUniform3f lib kLibOpenGL (locid As Int32, pval0 As single, pval1 As single, pval2 As single)
		  
		  glUniform3f(loc, val0, val1, val2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setUniform4f(name As String, val0 As single, val1 As single, val2 As single, val3 As single)
		  
		  dim loc As UInt32 = getUniformID(name)
		  
		  if loc = -1 then return
		  
		  
		  soft declare sub glUniform4f lib kLibOpenGL (locid As Int32, pval0 As single, pval1 As single, pval2 As single, pval3 As single)
		  
		  glUniform4f(loc, val0, val1, val2, val3)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setVertexAttrib1f(name As String, val0 As single)
		  
		  dim loc As Int32 = getAttribID(name)
		  
		  if loc = -1 then return
		  
		  
		  soft declare sub glVertexAttrib1f lib kLibOpenGL (locid As Int32, pval0 As single)
		  
		  glVertexAttrib1f(loc, val0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setVertexAttrib2f(name As String, val0 As single, val1 As single)
		  
		  dim loc As Int32 = getAttribID(name)
		  
		  if loc = -1 then return
		  
		  
		  soft declare sub glVertexAttrib1f lib kLibOpenGL (locid As Int32, pval0 As single, pval1 As single)
		  
		  glVertexAttrib1f(loc, val0, val1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setVertexAttrib3f(name As String, val0 As single, val1 As single, val2 As single)
		  
		  dim loc As Int32 = getAttribID(name)
		  
		  if loc = -1 then return
		  
		  
		  soft declare sub glVertexAttrib1f lib kLibOpenGL (locid As Int32, pval0 As single, pval1 As single, pval2 As single)
		  
		  glVertexAttrib1f(loc, val0, val1, val2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setVertexAttrib4f(name As String, val0 As single, val1 As single, val2 As single, val3 As single)
		  
		  dim loc As Int32 = getAttribID(name)
		  
		  if loc = -1 then return
		  
		  
		  soft declare sub glVertexAttrib1f lib kLibOpenGL (locid As Int32, pval0 As single, pval1 As single, pval2 As single, pval3 As single)
		  
		  glVertexAttrib1f(loc, val0, val1, val2, val3)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub unuse()
		  soft declare sub glUseProgram lib kLibOpenGL (progid As UInt32)
		  
		  glUseProgram(0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub use()
		  soft declare sub glUseProgram lib kLibOpenGL (progid As UInt32)
		  
		  glUseProgram(instanceID)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub vertexPointSizeDisable()
		  OpenGL.glDisable(kVertexProgramPointSize)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub vertexPointSizeEnable()
		  OpenGL.glEnable(kVertexProgramPointSize)
		End Sub
	#tag EndMethod


	#tag Note, Name = associated calls
		
		glCreateProgram
		glAttachShader
		glLinkProgram
		glUseProgram
		glDeleteProgram
		glValidateProgram
		glDetachShader
		
		
		
		glUniform - Specify the value of a uniform variable for the current program object
		glVertexAttrib - Specifies the value of a generic vertex attribute
		glBindAttribLocation - Associates a generic vertex attribute index with a named attribute variable
		
		glVertexAttribPointer - define an array of generic vertex attribute data
		
		glEnableClientState < these are used for vertex arrays. Vertex 'attribs' are for shaders?
		glVertexPointer <
		
		
		glCreateProgram â€” Creates a program object
		
		C Specification
		
		GLuint glCreateProgram(    Â     void);
		
		glCreateProgram creates an empty program object and returns a non-zero value by which it can be
		referenced. A program object is an object to which shader objects can be attached. This provides a
		mechanism to specify the shader objects that will be linked to create a program. It also provides a
		means for checking the compatibility of the shaders that will be used to create a program (for
		instance, checking the compatibility between a vertex shader and a fragment shader). When no longer
		needed as part of a program object, shader objects can be detached.
		
		One or more executables are created in a program object by successfully attaching shader objects to it
		with glAttachShader, successfully compiling the shader objects with glCompileShader, and successfully
		linking the program object with glLinkProgram. These executables are made part of current state when
		glUseProgram is called. Program objects can be deleted by calling glDeleteProgram. The memory
		associated with the program object will be deleted when it is no longer part of current rendering state
		for any context.
		
		
		
		
		
		
		
		
		
		glAttachShader â€” Attaches a shader object to a program object
		
		C Specification
		
		void glAttachShader(    GLuint Â     program,
		Â     GLuint Â     shader);
		Parameters
		
		program
		Specifies the program object to which a shader object will be attached.
		
		shader
		Specifies the shader object that is to be attached.
		
		Description
		
		In order to create an executable, there must be a way to specify the list of things that will be linked
		together. Program objects provide this mechanism. Shaders that are to be linked together in a program
		object must first be attached to that program object. glAttachShader attaches the shader object
		specified by shader to the program object specified by program. This indicates that shader will be
		included in link operations that will be performed on program.
		
		All operations that can be performed on a shader object are valid whether or not the shader object is
		attached to a program object. It is permissible to attach a shader object to a program object before
		source code has been loaded into the shader object or before the shader object has been compiled. It is
		permissible to attach multiple shader objects of the same type because each may contain a portion of
		the complete shader. It is also permissible to attach a shader object to more than one program object.
		If a shader object is deleted while it is attached to a program object, it will be flagged for
		deletion, and deletion will not occur until glDetachShader is called to detach it from all program
		objects to which it is attached.
		
		
		
		
		
		
		
		
		
		glLinkProgram â€” Links a program object
		
		C Specification
		
		void glLinkProgram(    GLuint Â     program);
		Parameters
		
		program
		Specifies the handle of the program object to be linked.
		
		Description
		
		glLinkProgram links the program object specified by program. If any shader objects of type
		GL_VERTEX_SHADER are attached to program, they will be used to create an executable that will run on
		the programmable vertex processor. If any shader objects of type GL_FRAGMENT_SHADER are attached to
		program, they will be used to create an executable that will run on the programmable fragment
		processor.
		
		The status of the link operation will be stored as part of the program object's state. This value will
		be set to GL_TRUE if the program object was linked without errors and is ready for use, and GL_FALSE
		otherwise. It can be queried by calling glGetProgram with arguments program and GL_LINK_STATUS.
		
		As a result of a successful link operation, all active user-defined uniform variables belonging to
		program will be initialized to 0, and each of the program object's active uniform variables will be
		assigned a location that can be queried by calling glGetUniformLocation. Also, any active user-defined
		attribute variables that have not been bound to a generic vertex attribute index will be bound to one
		at this time.
		
		Linking of a program object can fail for a number of reasons as specified in the OpenGL Shading
		Language Specification. The following lists some of the conditions that will cause a link error.
		
		The number of active attribute variables supported by the implementation has been exceeded.
		
		The storage limit for uniform variables has been exceeded.
		
		The number of active uniform variables supported by the implementation has been exceeded.
		
		The main function is missing for the vertex shader or the fragment shader.
		
		A varying variable actually used in the fragment shader is not declared in the same way (or is not
		declared at all) in the vertex shader.
		
		A reference to a function or variable name is unresolved.
		
		A shared global is declared with two different types or two different initial values.
		
		One or more of the attached shader objects has not been successfully compiled.
		
		Binding a generic attribute matrix caused some rows of the matrix to fall outside the allowed maximum
		of GL_MAX_VERTEX_ATTRIBS.
		
		Not enough contiguous vertex attribute slots could be found to bind attribute matrices.
		
		When a program object has been successfully linked, the program object can be made part of current
		state by calling glUseProgram. Whether or not the link operation was successful, the program object's
		information log will be overwritten. The information log can be retrieved by calling
		glGetProgramInfoLog.
		
		glLinkProgram will also install the generated executables as part of the current rendering state if the
		link operation was successful and the specified program object is already currently in use as a result
		of a previous call to glUseProgram. If the program object currently in use is relinked unsuccessfully,
		its link status will be set to GL_FALSE , but the executables and associated state will remain part of
		the current state until a subsequent call to glUseProgram removes it from use. After it is removed from
		use, it cannot be made part of current state until it has been successfully relinked.
		
		If program contains shader objects of type GL_VERTEX_SHADER but does not contain shader objects of type
		GL_FRAGMENT_SHADER, the vertex shader will be linked against the implicit interface for fixed
		functionality fragment processing. Similarly, if program contains shader objects of type
		GL_FRAGMENT_SHADER but it does not contain shader objects of type GL_VERTEX_SHADER, the fragment shader
		will be linked against the implicit interface for fixed functionality vertex processing.
		
		The program object's information log is updated and the program is generated at the time of the link
		operation. After the link operation, applications are free to modify attached shader objects, compile
		attached shader objects, detach shader objects, delete shader objects, and attach additional shader
		objects. None of these operations affects the information log or the program that is part of the
		program object.
		
		Notes
		
		glLinkProgram is available only if the GL version is 2.0 or greater.
		
		If the link operation is unsuccessful, any information about a previous link operation on program is
		lost (i.e., a failed link does not restore the old state of program ). Certain information can still be
		retrieved from program even after an unsuccessful link operation. See for instance glGetActiveAttrib
		and glGetActiveUniform.
		
		
		
		
		
		
		
		
		
		
		
		
		glUseProgram â€” Installs a program object as part of current rendering state
		
		C Specification
		
		void glUseProgram(    GLuint Â     program);
		Parameters
		
		program
		Specifies the handle of the program object whose executables are to be used as part of current
		rendering state.
		
		Description
		
		glUseProgram installs the program object specified by program as part of current rendering state. One
		or more executables are created in a program object by successfully attaching shader objects to it with
		glAttachShader, successfully compiling the shader objects with glCompileShader, and successfully
		linking the program object with glLinkProgram.
		
		A program object will contain an executable that will run on the vertex processor if it contains one or
		more shader objects of type GL_VERTEX_SHADER that have been successfully compiled and linked.
		Similarly, a program object will contain an executable that will run on the fragment processor if it
		contains one or more shader objects of type GL_FRAGMENT_SHADER that have been successfully compiled and
		linked.
		
		Successfully installing an executable on a programmable processor will cause the corresponding fixed
		functionality of OpenGL to be disabled. Specifically, if an executable is installed on the vertex
		processor, the OpenGL fixed functionality will be disabled as follows.
		
		The modelview matrix is not applied to vertex coordinates.
		
		The projection matrix is not applied to vertex coordinates.
		
		The texture matrices are not applied to texture coordinates.
		
		Normals are not transformed to eye coordinates.
		
		Normals are not rescaled or normalized.
		
		Normalization of GL_AUTO_NORMAL evaluated normals is not performed.
		
		Texture coordinates are not generated automatically.
		
		Per-vertex lighting is not performed.
		
		Color material computations are not performed.
		
		Color index lighting is not performed.
		
		This list also applies when setting the current raster position.
		
		The executable that is installed on the vertex processor is expected to implement any or all of the
		desired functionality from the preceding list. Similarly, if an executable is installed on the fragment
		processor, the OpenGL fixed functionality will be disabled as follows.
		
		Texture environment and texture functions are not applied.
		
		Texture application is not applied.
		
		Color sum is not applied.
		
		Fog is not applied.
		
		Again, the fragment shader that is installed is expected to implement any or all of the desired
		functionality from the preceding list.
		
		While a program object is in use, applications are free to modify attached shader objects, compile
		attached shader objects, attach additional shader objects, and detach or delete shader objects. None of
		these operations will affect the executables that are part of the current state. However, relinking the
		program object that is currently in use will install the program object as part of the current
		rendering state if the link operation was successful (see glLinkProgram ). If the program object
		currently in use is relinked unsuccessfully, its link status will be set to GL_FALSE, but the
		executables and associated state will remain part of the current state until a subsequent call to
		glUseProgram removes it from use. After it is removed from use, it cannot be made part of current state
		until it has been successfully relinked.
		
		If program contains shader objects of type GL_VERTEX_SHADER but it does not contain shader objects of
		type GL_FRAGMENT_SHADER, an executable will be installed on the vertex processor, but fixed
		functionality will be used for fragment processing. Similarly, if program contains shader objects of
		type GL_FRAGMENT_SHADER but it does not contain shader objects of type GL_VERTEX_SHADER, an executable
		will be installed on the fragment processor, but fixed functionality will be used for vertex
		processing. If program is 0, the programmable processors will be disabled, and fixed functionality will
		be used for both vertex and fragment processing.
		
		Notes
		
		glUseProgram is available only if the GL version is 2.0 or greater.
		
		While a program object is in use, the state that controls the disabled fixed functionality may also be
		updated using the normal OpenGL calls.
		
		Like display lists and texture objects, the name space for program objects may be shared across a set
		of contexts, as long as the server sides of the contexts share the same address space. If the name
		space is shared across contexts, any attached objects and the data associated with those attached
		objects are shared as well.
		
		Applications are responsible for providing the synchronization across API calls when objects are
		accessed from different execution threads.
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		glDeleteProgram â€” Deletes a program object
		
		C Specification
		
		void glDeleteProgram(    GLuint Â     program);
		Parameters
		
		program
		Specifies the program object to be deleted.
		
		Description
		
		glDeleteProgram frees the memory and invalidates the name associated with the program object specified
		by program. This command effectively undoes the effects of a call to glCreateProgram.
		
		If a program object is in use as part of current rendering state, it will be flagged for deletion, but
		it will not be deleted until it is no longer part of current state for any rendering context. If a
		program object to be deleted has shader objects attached to it, those shader objects will be
		automatically detached but not deleted unless they have already been flagged for deletion by a previous
		call to glDeleteShader. A value of 0 for program will be silently ignored.
		
		To determine whether a program object has been flagged for deletion, call glGetProgram with arguments
		program and GL_DELETE_STATUS.
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		glValidateProgram â€” Validates a program object
		
		C Specification
		
		void glValidateProgram(    GLuint Â     program);
		Parameters
		
		program
		Specifies the handle of the program object to be validated.
		
		Description
		
		glValidateProgram checks to see whether the executables contained in program can execute given the
		current OpenGL state. The information generated by the validation process will be stored in program's
		information log. The validation information may consist of an empty string, or it may be a string
		containing information about how the current program object interacts with the rest of current OpenGL
		state. This provides a way for OpenGL implementers to convey more information about why the current
		program is inefficient, suboptimal, failing to execute, and so on.
		
		The status of the validation operation will be stored as part of the program object's state. This value
		will be set to GL_TRUE if the validation succeeded, and GL_FALSE otherwise. It can be queried by
		calling glGetProgram with arguments program and GL_VALIDATE_STATUS. If validation is successful,
		program is guaranteed to execute given the current state. Otherwise, program is guaranteed to not
		execute.
		
		This function is typically useful only during application development. The informational string stored
		in the information log is completely implementation dependent; therefore, an application should not
		expect different OpenGL implementations to produce identical information strings.
		
		Notes
		
		glValidateProgram is available only if the GL version is 2.0 or greater.
		
		This function mimics the validation operation that OpenGL implementations must perform when rendering
		commands are issued while programmable shaders are part of current state. The error
		GL_INVALID_OPERATION will be generated by glBegin, glRasterPos, or any command that performs an
		implicit call to glBegin if:
		
		any two active samplers in the current program object are of different types, but refer to the same
		texture image unit,
		
		any active sampler in the current program object refers to a texture image unit where fixed-function
		fragment processing accesses a texture target that does not match the sampler type, or
		
		the sum of the number of active samplers in the program and the number of texture image units enabled
		for fixed-function fragment processing exceeds the combined limit on the total number of texture image
		units allowed.
		
		It may be difficult or cause a performance degradation for applications to catch these errors when
		rendering commands are issued. Therefore, applications are advised to make calls to glValidateProgram
		to detect these issues during application development.
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		void glDetachShader(    GLuint Â     program,
		Â     GLuint Â     shader);
		
		glDetachShader detaches the shader object specified by shader from the program object specified by
		program. This command can be used to undo the effect of the command glAttachShader.
		
		If shader has already been flagged for deletion by a call to glDeleteShader and it is not attached to
		any other program object, it will be deleted after it has been detached.
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private instanceID As UInt32
	#tag EndProperty


	#tag Constant, Name = kLibOpenGL, Type = String, Dynamic = False, Default = \"OpenGL.framework", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kVertexProgramPointSize, Type = Double, Dynamic = False, Default = \"34370", Scope = Public
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
