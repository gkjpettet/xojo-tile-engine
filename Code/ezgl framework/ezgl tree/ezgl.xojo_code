#tag Class
Protected Class ezgl
Inherits glBase
	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  
		  dim newDraw As delNewDraw = AddressOf glDraw.newInstance
		  draw = newDraw.Invoke
		  
		  redim light(7)
		  for i As integer = 0 to 7
		    light(i) = new glLight(i)
		  next
		  
		  lightModel = new glLightModel
		  
		  dim newMat As delNewMaterial = AddressOf glMaterial.newInstance
		  material = newMat.Invoke
		  
		  texture = new glTextureEZ
		  
		  xform = new glXform
		  
		  blend = new glBlend
		  
		  cullFace = new glCullFace
		  
		  fog = new glFog
		  
		  arrays = new glArrays
		  
		  attrib = new glAttrib
		  
		  accum = new glAccum
		  
		  scissor = new glScissor
		  
		  buffers = new glBuffers
		  
		  selectMode = new glSelect
		  
		  initBaseData //from super, glBase
		  
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function delNewDraw() As glDraw
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function delNewMaterial() As glMaterial
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function getPicture(glSurf As OpenGLSurface) As Picture
		  //calculate sizes
		  dim w As integer = glSurf.Width
		  dim h As integer = glSurf.Height
		  dim pad As integer = w mod 4
		  dim totalBytes As integer = (w * h * 3) + (h * pad)
		  
		  //create and fill memoryblock with pixel data
		  dim m As MemoryBlock = New MemoryBlock(totalBytes)
		  OpenGL.glReadPixels(0, 0, w, h, OpenGL.GL_BGR, OpenGL.GL_UNSIGNED_BYTE, m)
		  
		  //create output picture
		  dim p As Picture
		  if TargetCarbon then
		    p = new Picture(w, h, 32)
		  else
		    p = new Picture(w, h)
		  end
		  
		  dim surf As RGBSurface = p.RGBSurface
		  
		  //scan memoryblock into picture
		  h = h-1
		  w = w-1
		  dim x, y, offset As integer //offset starts at 0
		  for y = h downto 0
		    for x = 0 to w
		      surf.Pixel(x, y) = m.ColorValue(offset, 24)
		      offset = offset + 3
		    next
		    offset = offset + pad //skip per line
		  next
		  
		  return p //store picture
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getVersionInfo() As String
		  
		  #if not TargetMacOS then
		    return "not available on non-macs. needs declare update in ezgl.getVersionInfo()"
		  #endif
		  
		  soft declare function glGetString lib "OpenGL" (enumName As integer) As CString
		  
		  dim sa() As String
		  sa.Append "Version: " + glGetString(OpenGL.GL_VERSION)
		  sa.Append "Vendor: " + glGetString(OpenGL.GL_VENDOR)
		  sa.Append "Renderer: " + glGetString(OpenGL.GL_RENDERER)
		  sa.Append "Shading Language Version: " + glGetString(kShadingLanguageVersion)
		  sa.Append "Extensions..."
		  //dim ext() As String = glGetString(OpenGL.GL_EXTENSIONS).Split(" ")
		  dim s As String = glGetString(OpenGL.GL_EXTENSIONS)
		  dim ext() As String = s.Split(" ")
		  for i As integer = 0 to ext.Ubound
		    sa.Append ext(i)
		  next
		  
		  return Join(sa, EndOfLine)
		  
		  //GL_SHADING_LANGUAGE_VERSION value from...
		  //http:/ /docs.factorcode.org/content/word-GL_SHADING_LANGUAGE_VERSION,opengl.gl.html
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function height() As integer
		  return surfHeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub projectAsCanvas()
		  
		  projectAsCanvas(surfWidth, surfHeight)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub projectAsCanvas(w As double, h As double)
		  //======================= setup canvas style drawing
		  OpenGL.glMatrixMode(OpenGL.GL_PROJECTION)
		  OpenGL.glLoadIdentity
		  OpenGL.gluOrtho2D(0, w, h, 0)
		  
		  OpenGL.glMatrixMode(OpenGL.GL_MODELVIEW)
		  OpenGL.glLoadIdentity //erase previous transform (or use push/pop)
		  
		  
		  //OpenGL.glDisable(OpenGL.GL_DEPTH_TEST)
		  
		  
		  
		  
		  //uh, don't do these (may break pre-existing projects)
		  'OpenGL.glDisable(OpenGL.GL_TEXTURE_2D) 'g.texture.disable
		  'OpenGL.glDisable(OpenGL.GL_LIGHTING) 'g.lightsOff
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub projectAsCanvas(glSurf As OpenGLSurface)
		  
		  projectAsCanvas(glSurf.Width, glSurf.Height)
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub setWidthHeight(w As integer, h As integer)
		  surfWidth = w
		  surfHeight = h
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub viewport(x As integer, y As integer, w As integer, h As integer)
		  OpenGL.glViewport x, y, w, h
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub viewport(glSurf As OpenGLSurface)
		  OpenGL.glViewport 0, 0, glSurf.Width, glSurf.Height
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function width() As integer
		  return surfWidth
		End Function
	#tag EndMethod


	#tag Note, Name = about
		
		Purpose:
		organize all the flat OpenGL functions into groups
		autocomplete works so I don't have to remember what somethings called
		type restrictions so I'm not concerned it that's GL_DEPTH or GL_DEPTH_TEST
		
		ezgl is the root of the tree. Mostly its just exposing more functionality through
		it's public prooperties but there are a few useful methods (several should
		probably be moved)
		
		Typically you don't create an ezgl instance yourself, the glSurface classes
		create it for you and pass it to Paint. There's no problem with creating one though.
		
		The extra parts it exposes are public properties, meaning...
		g.material = nil
		...will remove that part from the tree (glSurfaces only create one ezgl instance).
		Reasoning: Accessing OpenGL through ezgl imposes some overhead. Property access is faster 
		than a method call and it's easy enough to know.
		
		
		Constructor() -- instantiates all the properties, including any sub-properties so a full tree is built
		
		getVersionInfo() -- get a string describing OpenGL version, vendor and extensions
		
		getPicture() -- returns a Xojo Picture of the current frame buffer
		
		    methods that aren't really in the right place...
		
		projectAsCanvas(glSurf As OpenGLSurface) -- applies Canvas style Y-up projection
		
		clearBuffers(c As Color, withDepth As boolean) -- clears color frame buffer with optional depth clearing
		
		depthOn(), depthOff() -- set whether depth testing is done (discard fragments behind depth)
		
		lightsOn(), lightsOff() -- set whether lighting is applied (use light(i) and lightModel properties to set settings)
		
		shadeModelFlat(), shadeModelSmooth() -- set shading style, flat is single color over a primitive, smooth has gradient
		
		
		Properties
		
		accum -- accumulation buffer
		arrays -- vertex arrays
		attib -- attributes stack
		blend -- pixel blending
		cullface -- cull faces
		displayList -- utility array storage of EZDisplayLists
		draw -- set current values, begin immediate modes and send vertices. Also subparts for point, line and polygon options and a utility for shapes
		fog -- fog
		light(-1) -- this gets instatiated to light(7), matching the 8 lights OpenGL has
		lightModel -- some extra lighting options, not part of individual lights
		material -- material settings used to color when lighting is enabled
		scissor -- define a clipping box
		texture -- enable and set environment mode. Also has utilites of jagged array of textures and Dictionary for textures
		xform -- model-view matrix stack
		
		
		
		
	#tag EndNote

	#tag Note, Name = dev log
		http://ezgl.tumblr.com
		
		** to remember: turn on UseGDI+ **
		** to remember: windows needs copy resources build step **
		todo: enumerate which libraries and where declares are used
		todo: improve EZFont
		todo: implement Picture.GetData for texture memory
		todo: improve EZTexture2D alpha checking
		todo: document premultiplied alpha considerations
		-todo: update camera interface (pass in g, more flexible, more info/interactions in interface)
		todo: add colour overloads to light(i)
		todo: stereo
		todo: more gets of system info
		todo: collect opengl default/initial state values
		todo: add documentation notes to classes for easy reference
		
		ghosting demo
		specular tex demo
		ortho finish
		collision framework
		rebels game
		skybox (cam interface for position)
		*OpenGLSurface.Invalidate works*
		
		**> When building ogl object widgets (Font, Texture, DisplayList, Program) they
		**> should have a reference to their context so their destructor can always
		**> remove themselves from the correct context
		
		15-3-5 ======================= 1k3
		
		extracted, rebuilt and expanded audio queue classes
		
		
		
		14-12-02 =======================
		
		-made EZFont.constructor params optional
		
		added pragma for unused method params  
		
		14-11-08 =======================
		
		-add MakeCurrent to EZSurface.Close before bouncing event
		This gives a current context to tear down OpenGL stuff in Close
		
		14-11-07 =======================
		
		fixed TouchTestWindow demo. There was a lag in interaction because 'Renders' piled up.
		Invalidate works on OpenGLSurface. Should use that instead of Render??
		
		14-10-30 =======================
		
		-modified EZFont.drawString (and draw2ColorString) to use attribute bits so state is restored
		
		(been building km ui and other projects)
		
		14-10-24 =======================
		
		-added g.draw.shapes.point variants
		
		(been building projects)
		
		14-10-7 =======================
		
		-changed camelCase of g.cullface methods
		
		14-10-6 ========================
		
		-added g.draw.shapes.axisCorner
		-added g.buffers.depthWritingEnable/Disable
		
		14-9-29 =========================
		
		-moved normalizeFull/Scale from g.draw to g.lightModel
		
		14-9-28 ========================= 1k0
		
		-added g.xform.scaleX/Y/Z/XY
		-building more OrthoCamera
		
		14-9-25 =========================
		
		-fixed EZFont.drawString YTop parameter from integer to single
		
		14-9-24 ======================== 1j3
		
		-added g.buffers.clear (overload)
		-added a bunch to g.buffers
		-added g.draw.shapes.roundRect*
		-added more g.draw.shapes.circle*
		
		14-9-22 ========================
		
		-added g.draw.shapes.axis
		
		14-9-20 ======================== 1j2c
		
		-added g.draw.shapes.circleWire/circleSolid/circleSolidLit
		
		14-9-19 ========================
		
		**not disabling depth in ezgl.projectAsCanvas(w, h) will break some demos
		
		-fixed EZSurface.getFPS to return double type
		-reordered EulerCamera.applyGLWithSurf (so tilt and gluLookAt in in ModelView, fixes fog bug)
		-renamed iApplyGLWithSurf iApplyGL and its method to just applyGL(g As ezgl)
		-updated ESurface, EulerCamera and OrthoCamera for new iApplyGL name
		-updated EZSurface.animGetIsRunning to include externaltimer
		-added iAutoMouse, implemented in EulerCamera and OrthoCamera
		-renamed EZSurface.autoEulerCameraMousing to autoCameraMousing
		-updated EZSurface.MouseDown/Drag/Up/Wheel to use new mousing
		
		14-9-16 ========================
		
		-fixed EulerCamera.applyGLWithSurf to properly apply fovx
		
		14-9-15 ======================== 1j2b
		
		-added glMaterial overloads for color
		-refactored glMaterial to have sparate Front and Back names
		-added class glColorMaterial with it's methods
		-added glMaterial.colour As glColorMaterial
		-refactored glMaterial/ezgl to use addressof shared method factory
		-refactored glDraw/ezgl for same pattern
		
		14-9-14 ======================== 1j2
		
		-added overloads to glLight.ambient, diffuse, specular, ezColors
		-added overloads to glLightModel.ambient
		-made glLightModel a glBase subclass and refactored to use it's tempMem16
		
		-posted 1j1 version
		
		14-9-10 ======================== 1j1
		
		-removed System.DebugLogs from EZSurface.Render and Open -duh
		-fixed Xoppy Bird noe, added XBGap.deinitTex and called in Close
		-added EulerCamera.tilt property 
		-edited EulerCamera.applyGLWithSurf to apply tilt (fixes Comanche bug)
		
		14-9-7 ========================= 1j0
		
		-added g.blend.colour
		-added g.blend.equationSeparate (untested)
		
		
		14-9-6 ========================
		
		-added EZSurface.init3D
		-added event EZSurface.ConfigureMemoryBlock
		-edited EZSurface.Configure to bounce based on platform
		
		14-9-5 ========================
		
		-moved gluLookAt to perspective matrix section in EulerCamera.applyGLWithSurf
		-added g.xform.matrixModeProjection
		-added g.xform.matrixModeModelView
		-added g.xform.loadIdentity
		-added 2d version of g.xform.translate
		
		14-9-4 ========================
		
		added app icon
		-Added MakeCurrent before bouncing EZSurface.Open  (do for Close too? StepAnimation?)
		
		14-9-3 ========================
		
		reorganized projects folder
		imported Comanch
		
		14-9-2 ========================
		
		Windows fixes from Alwyn Bester and Alain Bailleul
		https://forum.xojo.com/conversation/post/125529
		
		-updated EZFont.drawString and draw2ColorString to filter out non-lower-ascii values.
		
		-added App.getResourcesFolder and repointed projects to use it (Win safe)
		
		-added OS X build step to copy resources to built app (need similar for windows)
		
		-removed texBank and texKeyed items from glTextureEZ
		
		-removed ezgl.displayList and glDisplayList
		
		-added ezgl.projectAsCanvas()
		-added ezgl.projectAsCanvas(w As double, h As double)
		(overloads previous projectAsCanvas(glSurf As OpenGLSurface))
		
		14-8-15 =======================
		
		more testing and refactoring of glSelect
		
		14-8-14 ======================= 1h5
		
		1) developing glSelect
		-added glSelect Class
		-added property ezgl.selectMode
		-updated ezgl.Constructor to make the property
		
		-Window4 is testing selectMode. lots to debug
		
		14-7-11 ======================= 1h4
		
		1) added EZSurface.init2D(). Effectively makes EZSurfaceCanvas unnecessary
		
		2) removed EZSurfaceCanvas. removed usage from projects (only HelloWorlds and Flasher)
		
		3) removed 'old and deprecated' folder of glSurfaceCanvas, glSurfaceTouch.
		
		4) segragated touch so framework can be copied
		
		Still need a way to paste/impport EZSurfaceTouch. If done after rest of
		framework then it works, just can't be done with the import/paste. super linking messed up
		
		14-7-8 ======================= 1h3
		
		1) added filter* and wrap* methods to EZTexture2D
		
		*solved alpha aliasing bug. Need to manage premultiplied colors in
		alpha-channel pictures and choose scaling of masked pictures. Will
		need to modify formattedMem, generateMem, loadImage and Constructor to
		handle the choice plus adding storage of the choice, a way to read choice,
		and add to formattedMem data.
		
		14-7-7 ======================= 1h2
		
		1) added glBlend.setFuncStandardAlphaOne
		
		*discovered alpha aliasing 'bug'
		
		14-7-5 ================================== 1h1
		
		1) Added width/height to ezgl
		
		ezgl: added width(), height(), surfWidth, surfHeight, 
		      added protected setWidthHeight() and made Constructor() protected
		added Class FactoryEZGL: subclass of ezgl. Now must use it to make an ezgl
		                         added newEZGL(), getBoundsSetter() and delSetBounds
		EZSurface: added oldWidth, oldHeight and theBoundsSetter.
		           modified Open (initing) and Render (update bounds) to work with these new parts.
		
		- reorganized framework and projects
		- posted 1g3 version
		
		14-5-24 ==================================
		
		- implemented TouchableView.eventClose which breaks the cyclic link
		- fixed EZSurfaceTouch.Close and CanvasTouch.Close to test toucher for nil
		
		14-4-10 =================================
		
		todo: fix Cstring in EZShader.setSource
		https://forum.xojo.com/10939-memoryblock-cstring-cstring-issue/0#p78742
		
		made TouchableView.NSPoint public for tro touching
		
		14-4-9 ======================================
		
		3) added vertex attributes to EZProgram
		2) added EZProgram.setUniform2f/3f
		1) added EZProgram.vertexPointSizeEnable/Disable shared methods
		
		14-4-8 ======================================
		
		6) added EZFont.drawStringCentered()
		5) deprecating glSurfaceTouch and glSurfacePlainCanvas
		4) created EZSurfaceCanvas
		3) created CanvasTouch
		2) refactored EZSurfaceTouch into composition with TouchableView
		1) added RemoveHandler for anim timer in EZSurface.Close
		
		14-4-7 ==================================
		todo: update more names of gl classes to EZ
		
		4) added new Close() event to EZSurface
		3) create TouchableView class for application to any NSView
		2) created EZSurfaceTouch to replace glSurfaceTouch
		1) added autoApply* properties to glSurface
		initialized in Open(), used in Render() to skip stuff
		
		14-4-4 ==================================
		
		* hacking splitter.MouseDrag for oglsurface resize bug
		
		3) rearranged the project resources and updated XoppyWindow's.Open hard coded path to sound files 
		2) added MsPacman project
		1) added EZFont.drawStringRight from eztro1
		
		been building EZProgram and EZShader
		devolped ShaderTest2 Window for testing
		
		14-3-28 =========================================
		
		4) added glConfigFactory
		3) added EZShader and EZProgram
		2) updated glSurface to use glConfigurizer
		1) added glConfigurizer
		
		
		14-3-23 ========================================
		
		5) added glSurface.animSetPeriod
		
		4) Quadrics use glu declares, glut32 install on windows and i think should work
		
		3) changed some glSurface public properties to start with "auto",
		making it consistent and autocomplete 
		
		2) Picture alpha vs mask
		Updated "new Picture"s to use Mask when Carbon.
		SHould this be done for Windows non-GDI too?
		
		
		1) updated gluLookAt use to use Constant "libOpenGL" with Mac and Windows definitions.
		Will need glut32.dll instanlled on windows for this call.
		Also, gluLookAt can be worked around, I mean can be done without.
		
		from https://forum.xojo.com/4923-gaming-with-xojo-seeking-advice
		
		Alwyn Bester Sep 2013 Beta Testers, Xojo Pro Johannesburg, South Africa
		stuart s Forgot a declare was in there. I think it's just the Lib name that doesn't work on windows, maybe it should be "OpenGL.dll", or simply "OpenGL".
		Ah, got it working... thanks Stuart.
		
		Simply had to download and install glut32.dll, and then changed the code from
		
		Soft Declare sub gluLookAt lib "OpenGL.framework" (eyeX as Double, eyeY as Double, eyeZ as Double, centerX as Double, centerY as Double, centerZ as Double, upX as Double, upY as Double, upZ as Double)
		to
		
		#if TargetWin32
		Soft Declare sub gluLookAt lib "Glu32" (eyeX as Double, eyeY as Double, eyeZ as Double, centerX as Double, centerY as Double, centerZ as Double, upX as Double, upY as Double, upZ as Double)
		#endif
		
		#if TargetMacOS
		Soft Declare sub gluLookAt lib "OpenGL.framework" (eyeX as Double, eyeY as Double, eyeZ as Double, centerX as Double, centerY as Double, centerZ as Double, upX as Double, upY as Double, upZ as Double)
		#endif
	#tag EndNote


	#tag Property, Flags = &h0
		accum As glAccum
	#tag EndProperty

	#tag Property, Flags = &h0
		arrays As glArrays
	#tag EndProperty

	#tag Property, Flags = &h0
		attrib As glAttrib
	#tag EndProperty

	#tag Property, Flags = &h0
		blend As glBlend
	#tag EndProperty

	#tag Property, Flags = &h0
		buffers As glBuffers
	#tag EndProperty

	#tag Property, Flags = &h0
		cullFace As glCullFace
	#tag EndProperty

	#tag Property, Flags = &h0
		draw As glDraw
	#tag EndProperty

	#tag Property, Flags = &h0
		fog As glFog
	#tag EndProperty

	#tag Property, Flags = &h0
		light(-1) As glLight
	#tag EndProperty

	#tag Property, Flags = &h0
		lightModel As glLightModel
	#tag EndProperty

	#tag Property, Flags = &h0
		material As glMaterial
	#tag EndProperty

	#tag Property, Flags = &h0
		scissor As glScissor
	#tag EndProperty

	#tag Property, Flags = &h0
		selectMode As glSelect
	#tag EndProperty

	#tag Property, Flags = &h21
		Private surfHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private surfWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		texture As glTextureEZ
	#tag EndProperty

	#tag Property, Flags = &h0
		xform As glXform
	#tag EndProperty


	#tag Constant, Name = kShadingLanguageVersion, Type = Double, Dynamic = False, Default = \"35724", Scope = Private
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
