#tag Class
Protected Class glBlend
	#tag Method, Flags = &h0
		Sub colour(r As single, g As single, b As single, a As single)
		  
		  OpenGL.glBlendColor(r, g, b, a)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub disable()
		  OpenGL.glDisable(OpenGL.GL_BLEND)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enable()
		  OpenGL.glEnable(OpenGL.GL_BLEND)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub enumUtilBuildEqnListbox(lb As Listbox, initialMenuIndex As integer = 0)
		  if lb = nil then return
		  
		  dim enums() As blendEqn, names() As String //get ordered list of all enums
		  enumUtilListEqn(enums, names)
		  
		  lb.DeleteAllRows  //build lb
		  for i As integer = 0 to enums.Ubound
		    lb.AddRow names(i)
		    lb.RowTag(i) = enums(i)
		  next
		  
		  //select a row
		  if initialMenuIndex >= 0 and initialMenuIndex < lb.ListCount then
		    lb.ListIndex = initialMenuIndex
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub enumUtilBuildEqnPopupMenu(popMenu As PopupMenu, initialMenuIndex As integer = 0)
		  if popMenu = nil then return
		  
		  dim enums() As blendEqn, names() As String //get ordered list of all enums
		  enumUtilListEqn(enums, names)
		  
		  popMenu.DeleteAllRows  //build popupmenu
		  for i As integer = 0 to enums.Ubound
		    popMenu.AddRow names(i)
		    popMenu.RowTag(i) = enums(i)
		  next
		  
		  //select a row
		  if initialMenuIndex >= 0 and initialMenuIndex < popMenu.ListCount then
		    popMenu.ListIndex = initialMenuIndex
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub enumUtilBuildFunListbox(lb As Listbox, initialMenuIndex As integer = 0)
		  if lb = nil then return
		  
		  dim enums() As blendFunc, names() As String //get ordered list of all enums
		  enumUtilListFun(enums, names)
		  
		  lb.DeleteAllRows  //build lb
		  for i As integer = 0 to enums.Ubound
		    lb.AddRow names(i)
		    lb.RowTag(i) = enums(i)
		  next
		  
		  //select a row
		  if initialMenuIndex >= 0 and initialMenuIndex < lb.ListCount then
		    lb.ListIndex = initialMenuIndex
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub enumUtilBuildFunPopupMenu(popMenu As PopupMenu, initialMenuIndex As integer = 0)
		  if popMenu = nil then return
		  
		  dim enums() As blendFunc, names() As String //get ordered list of all enums
		  enumUtilListFun(enums, names)
		  
		  popMenu.DeleteAllRows  //build popupmenu
		  for i As integer = 0 to enums.Ubound
		    popMenu.AddRow names(i)
		    popMenu.RowTag(i) = enums(i)
		  next
		  
		  //select a row
		  if initialMenuIndex >= 0 and initialMenuIndex < popMenu.ListCount then
		    popMenu.ListIndex = initialMenuIndex
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub enumUtilListEqn(listEnums() As blendEqn, listNames() As String)
		  //assume arrays are empty
		  
		  listEnums.Append blendEqn.add
		  listEnums.Append blendEqn.subtract
		  listEnums.Append blendEqn.reverseSubtract
		  listEnums.Append blendEqn.min
		  listEnums.Append blendEqn.max
		  
		  listNames.Append "add"
		  listNames.Append "subtract"
		  listNames.Append "reverse subtract"
		  listNames.Append "min"
		  listNames.Append "max"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub enumUtilListFun(listEnums() As blendFunc, listNames() As String)
		  //assume arrays are empty
		  
		  'listEnums.Append fun.zero
		  'listEnums.Append fun.one
		  'listEnums.Append fun.srcColor
		  'listEnums.Append fun.oneMinusSrcColor
		  'listEnums.Append fun.dstColor
		  'listEnums.Append fun.oneMinusDstColor
		  'listEnums.Append fun.srcAlpha
		  'listEnums.Append fun.oneMinusSrcAlpha
		  'listEnums.Append fun.dstAlpha
		  'listEnums.Append fun.oneMinusDstAlpha
		  'listEnums.Append fun.constantColor
		  'listEnums.Append fun.oneMinusConstantColor
		  'listEnums.Append fun.constantAlpha
		  'listEnums.Append fun.oneMinusConstantAlpha
		  'listEnums.Append fun.srcAlphaSaturate
		  '
		  'listNames.Append "0"
		  'listNames.Append "1"
		  'listNames.Append "src color"
		  'listNames.Append "1 - src color"
		  'listNames.Append "dst color"
		  'listNames.Append "1 - dst color"
		  'listNames.Append "src alpha"
		  'listNames.Append "1 - src alpha"
		  'listNames.Append "dst alpha"
		  'listNames.Append "1 - dst alpha"
		  'listNames.Append "constant color"
		  'listNames.Append "1 - constant color"
		  'listNames.Append "constant alpha"
		  'listNames.Append "1 - constant alpha"
		  'listNames.Append "src alpha saturate"
		  
		  listEnums.Append blendFunc.zero
		  listEnums.Append blendFunc.one
		  listEnums.Append blendFunc.srcColor
		  listEnums.Append blendFunc.dstColor
		  listEnums.Append blendFunc.srcAlpha
		  listEnums.Append blendFunc.dstAlpha
		  listEnums.Append blendFunc.constantColor
		  listEnums.Append blendFunc.constantAlpha
		  listEnums.Append blendFunc.oneMinusSrcColor
		  listEnums.Append blendFunc.oneMinusDstColor
		  listEnums.Append blendFunc.oneMinusSrcAlpha
		  listEnums.Append blendFunc.oneMinusDstAlpha
		  listEnums.Append blendFunc.oneMinusConstantColor
		  listEnums.Append blendFunc.oneMinusConstantAlpha
		  listEnums.Append blendFunc.srcAlphaSaturate
		  
		  listNames.Append "0"
		  listNames.Append "1"
		  listNames.Append "src color"
		  listNames.Append "dst color"
		  listNames.Append "src alpha"
		  listNames.Append "dst alpha"
		  listNames.Append "constant color"
		  listNames.Append "constant alpha"
		  listNames.Append "1 - src color"
		  listNames.Append "1 - dst color"
		  listNames.Append "1 - src alpha"
		  listNames.Append "1 - dst alpha"
		  listNames.Append "1 - constant color"
		  listNames.Append "1 - constant alpha"
		  listNames.Append "src alpha saturate"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub equation(mode As blendEqn)
		  OpenGL.glBlendEquation(Integer(mode))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub equationSeparate(modeRGB As blendEqn, modeAlpha As blendEqn)
		  #pragma unused modeRGB
		  #pragma unused modeAlpha
		  
		  //glBlendEquationSeparate is available only if 
		  //the GL version is 2.0 or greater. Xojo only exposes 1.1
		  
		  //will need to declare this call
		  
		  soft declare sub glBlendEquationSeparate lib "OpenGL" (pmodeRGB As integer, pmodeAlpha As integer)
		  
		  glBlendEquationSeparate(Integer(modeRGB), Integer(modeAlpha))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub func(srcFactor As blendFunc, dstFactor As blendFunc)
		  OpenGL.glBlendFunc(Integer(srcFactor), Integer(dstFactor))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub funcSeparate(srcRGB As blendFunc, dstRGB As blendFunc, srcAlpha As blendFunc, dstAlpha As blendFunc)
		  
		  OpenGL.glBlendFuncSeparate(Integer(srcRGB), Integer(dstRGB), Integer(srcAlpha), Integer(dstAlpha))
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setFuncDefault()
		  OpenGL.glBlendFunc(OpenGL.GL_ONE, OpenGL.GL_ZERO)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setFuncStandardAlpha()
		  OpenGL.glBlendFunc(OpenGL.GL_SRC_ALPHA, OpenGL.GL_ONE_MINUS_SRC_ALPHA)
		  'func(fun.srcAlpha, fun.oneMinusSrcAlpha)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setFuncStandardAlphaOne()
		  OpenGL.glBlendFunc(OpenGL.GL_ONE, OpenGL.GL_ONE_MINUS_SRC_ALPHA)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setFuncStandardGlow()
		  OpenGL.glBlendFunc(OpenGL.GL_SRC_ALPHA, OpenGL.GL_ONE)
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
