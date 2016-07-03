#tag Class
Protected Class EZSurface
Inherits OpenGLSurface
	#tag Event
		Sub Close()
		  animStop
		  
		  RemoveHandler animTimer.Action, AddressOf animActionHandler
		  
		  MakeCurrent
		  
		  RaiseEvent Close()
		End Sub
	#tag EndEvent

	#tag Event
		Function Configure() As MemoryBlock
		  
		  #if TargetMacOS then
		    
		    dim pix As glConfigurizer, getter As glConfigFactory.delGetMem
		    
		    pix = glConfigFactory.newConfig(getter)
		    
		    RaiseEvent Configure(pix)
		    
		    return getter.Invoke
		    
		  #else
		    
		    return RaiseEvent ConfigureMemoryBlock()
		    
		  #endif
		  
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(x as Integer, y as Integer) As Boolean
		  
		  
		  dim doMousing As boolean = false
		  
		  if RaiseEvent MouseDown(x, y) then
		    useCustomMousing = true  //pipe drags to user
		    doMousing = true
		    
		  elseif autoCameraMousing and theCamera <> nil and theCamera IsA iAutoMouse then
		    useCustomMousing = false //apply auto euler mousing
		    doMousing = true
		    
		  end
		  
		  oldX = X
		  oldY = Y
		  
		  return doMousing
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(x as Integer, y as Integer)
		  
		  
		  if autoBlockRepeatMouseDrags and x = oldX and y = oldY then return
		  
		  dim dx As integer = x - oldX
		  dim dy As integer = y - oldY
		  
		  if useCustomMousing then  //user
		    
		    RaiseEvent MouseDrag(x, y, dx, dy)
		    
		  else                      //auto mousing
		    
		    if (theCamera <> nil) and (theCamera IsA iAutoMouse) then //get camera (maybe changed during drag so double check it's there)
		      iAutoMouse(theCamera).mouseDrag(x, y, dx, dy, self)
		    end
		    
		  end
		  
		  
		  oldX = X
		  oldY = Y
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(x as Integer, y as Integer)
		  
		  if useCustomMousing then
		    
		    RaiseEvent MouseUp(x, y)
		    
		  else
		    
		    if (theCamera <> nil) and (theCamera IsA iAutoMouse) then
		      iAutoMouse(theCamera).mouseUp(x, y, self)
		    end
		    
		  end
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  
		  //user handled
		  if RaiseEvent MouseWheel(X, Y, deltaX, deltaY) then return true
		  
		  
		  //if auto mousing is on and camera is euler then apply
		  if autoCameraMousing and theCamera <> nil and theCamera IsA iAutoMouse then
		    
		    iAutoMouse(theCamera).mouseWheel(X, Y, deltaX, deltaY, self)
		    
		    return true
		    
		  else
		    return false
		  end
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  //create objects
		  theGL = FactoryEZGL.newEZGL
		  theBoundsSetter = FactoryEZGL.getBoundsSetter(theGL)
		  theBoundsSetter.Invoke(Width, Height)
		  
		  theCamera = new EulerCamera
		  
		  
		  //init configurable vars
		  autoCameraMousing = true //interprets unhandled mousing when cam is euler
		  
		  autoClearBuffers = true //will clear color buffer and depth if it's on
		  
		  autoDepthIsOn = true //sets whether depth is on
		  
		  autoBackgroundColor = &c000000 //color that will be cleared with, set to fog color when fog is used
		  
		  autoBlockRepeatMouseDrags = true //only recieve mousedrags when there's a delta
		  
		  autoEmptyModelViewStack = false //check and empty the modelview matrix
		  
		  autoApplyViewport = true
		  autoApplyCamera = true
		  autoApplyBuffer = true
		  
		  //setup animation timer
		  animTimer = new Timer
		  AddHandler animTimer.Action, AddressOf animActionHandler
		  animSetFPS(30)
		  animResetTime
		  
		  
		  //bounce event
		  MakeCurrent
		  
		  RaiseEvent Open(theGL)
		  
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function Render() As Boolean
		  
		  if autoApplyViewport then
		    theGL.viewport(self)              //apply viewport
		  end
		  
		  
		  if autoEmptyModelViewStack then   //empty ModelView stack down to 1 if on and needed
		    static MVStack As MemoryBlock = new MemoryBlock(4)
		    OpenGL.glGetIntegerv(OpenGL.GL_MODELVIEW_STACK_DEPTH, MVStack)
		    dim MVCount As integer = MVStack.UInt32Value(0)
		    if MVCount > 1 then
		      OpenGL.glMatrixMode(OpenGL.GL_MODELVIEW)
		      for i As integer = 2 to MVCount
		        OpenGL.glPopMatrix
		      next
		    end
		  end
		  
		  
		  if autoApplyCamera then
		    if theCamera <> nil then          //apply camera
		      theCamera.applyGL(theGL)
		    else
		      theGL.projectAsCanvas(self)
		    end
		  end
		  
		  
		  if autoApplyBuffer then
		    if autoDepthIsOn then             //set depth
		      theGL.buffers.depthEnable
		    else
		      theGL.buffers.depthDisable
		    end
		    if autoClearBuffers then          //clear buffers
		      theGL.buffers.clear(autoBackgroundColor, autoDepthIsOn)
		    end
		  end
		  
		  
		  if oldWidth <> Width or oldHeight <> Height then //update bounds
		    theBoundsSetter.Invoke(Width, Height)
		    oldWidth = Width
		    oldHeight = Height
		  end
		  
		  
		  RaiseEvent Paint(theGL)           //bounce event
		End Function
	#tag EndEvent

	#tag Event
		Sub Resized()
		  #if TargetCocoa then
		    return
		  #endif
		  
		  
		  if theGL = nil then return  //get a Resized event before Open
		  
		  Render
		  
		  
		  'must always render here or can get broken stuff in
		  'the control, the scene/image won't stay crisply
		  'snapped to the edges of the window....
		  '--- this changed or got fixed at some point, not needed in Cocoa at least (do in Carbon)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub animActionHandler(sender As Timer)
		  #pragma unused sender
		  
		  
		  dim curTime As double = Microseconds / 1000000
		  dim delta As double = curTime - timeLast
		  timeElapsed = timeElapsed + delta
		  timeLast = curTime
		  timeFrame = timeFrame + 1
		  
		  
		  RaiseEvent StepAnimation(timeElapsed, delta, timeFrame)
		  
		  Render
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function animGetElapsedTime() As double
		  return timeElapsed
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function animGetFPS() As double
		  return idealFPS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function animGetFrame() As integer
		  return timeFrame
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function animGetIsRunning() As Boolean
		  return (animTimer.Mode = Timer.ModeMultiple) or (RaiseEvent ExternalTimerIsRunning)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub animResetTime()
		  
		  timeElapsed = 0.0 //real seconds since start
		  
		  timeFrame = 0 //frame index currently at
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub animSetFPS(newFPS As double)
		  
		  idealFPS = newFPS
		  
		  animTimer.Period = 1000 / newFPS
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub animSetPeriod(newPeriod As integer)
		  
		  idealFPS = 1000 / newPeriod
		  
		  animTimer.Period = newPeriod
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub animStart()
		  
		  if animTimer.Mode = Timer.ModeMultiple then return  //aleady running
		  
		  
		  
		  
		  //send initial event and render for frame '0'.
		  //If stopped then restarted will repeat the time when ended but with 0 delta
		  RaiseEvent StepAnimation(timeElapsed, 0, timeFrame)
		  
		  Render
		  
		  
		  //now mark this time to measure delta and start running
		  timeLast = Microseconds / 1000000
		  
		  animTimer.Mode = Timer.ModeMultiple
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub animStop()
		  
		  animTimer.Mode = Timer.ModeOff
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getCamera() As iApplyGL
		  
		  return theCamera
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getEulerCamera() As EulerCamera
		  
		  if theCamera IsA EulerCamera then
		    
		    return EulerCamera(theCamera)
		    
		  else
		    
		    return nil
		    
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getEZGL() As ezgl
		  return theGL
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub init2D()
		  //init surface
		  setCamera(nil)
		  autoDepthIsOn = false
		  autoCameraMousing = false //will be unused but anyways
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub init3D()
		  'func make2D() {
		  'autoApplyCamera = true
		  'theCamera = nil
		  'autoDepth = false
		  '}
		  'func make3D() {
		  'autoApplyCamera = true
		  'if theCamera == nil { theCamera = EZEulerCamera() }
		  'autoDepth = true
		  '}
		  
		  autoApplyCamera = true
		  if theCamera = nil then theCamera = new EulerCamera
		  autoDepthIsOn = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setCamera(newCam As iApplyGL)
		  
		  theCamera = newCam  //if nil uses Canvas projection
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Close()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Configure(pix As glConfigurizer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ConfigureMemoryBlock() As MemoryBlock
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ExternalTimerIsRunning() As boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(x As integer, y As integer) As boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDrag(x As integer, y As integer, dx As integer, dy As integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseUp(x As integer, y As integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseWheel(x As integer, y As integer, deltaX As integer, deltaY As integer) As boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open(g As ezgl)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Paint(g As ezgl)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event StepAnimation(elapsedTime As double, deltaTime As double, frameIndex As integer)
	#tag EndHook


	#tag Note, Name = about
		
		main features
		
		- Paint(g As ezgl)
		
		- animation timer
		
		- automatic color and depth buffer clearing
		
		- default camera mousing
		
		
		Check Open event for initial setup
		
		
		
		autoCameraMousing = true //interprets unhandling mousing when cam is euler
		
		autoClearBuffers = true //will clear color buffer and depth if it's on
		
		autoDepthIsOn = true //sets whether depth is on
		
		backgroundColor = &c000000 //color that will be cleared with, set to fog color when fog is used
		
		blockRepeatMouseDrags = true //only recieve mousedrags when there's a delta
		
		
		
		=====================================
		
		
		The first step to using ezgl is, well, copying the framework into your project. Then the next first step is dropping an EZSurface on your window. Everything works through the EZSurface and it’s main role is to reframe the Render event…
		
		Class OpenGLSurface
		
		Event Sub Render()
		
		End Class
		
		into this
		
		Class EZSurface
		
		Event Sub Paint(g As ezgl)
		
		End Class
		
		Code written in Render is the same thing you’d write in Paint with the difference that the g parameter provides a simpler syntax for many OpenGL calls.
		
		For example, to draw a red triangle on a green background looks like this using OpenGLSurface and OpenGL module
		
		Function Render() As Boolean
		
		OpenGL.glViewport(0, 0, me.Width, me.Height) //set viewport
		
		OpenGL.glMatrixMode(OpenGL.GL_PROJECTION) //set transform
		OpenGL.glLoadIdentity
		OpenGL.gluOrtho2D(0, me.Width, me.Height, 0)
		OpenGL.glMatrixMode(OpenGL.GL_MODELVIEW)
		OpenGL.glLoadIdentity
		
		OpenGL.glClearColor(0, 1, 0, 0) //fill green
		OpenGL.glClear(OpenGL.GL_COLOR_BUFFER_BIT)
		
		OpenGL.glColor3f(1, 0, 0) //draw red triangle
		OpenGL.glBegin(OpenGL.GL_TRIANGLES)
		OpenGL.glVertex2f(50, 50)
		OpenGL.glVertex2f(150, 50)
		OpenGL.glVertex2f(150, 150)
		OpenGL.glEnd
		
		End Function
		
		Using EZSurface the equivalent code can be called using the g parameter
		
		Sub Paint(g As ezgl)
		
		g.viewport(me) //set viewport
		
		g.projectAsCanvas(me) //set transform
		
		g.buffers.clear(&c00FF00) //fill green
		
		g.draw.colour(1, 0, 0) //draw red triangle
		g.draw.begin.triangles
		g.draw.vertex(50, 50)
		g.draw.vertex(150, 50)
		g.draw.vertex(150, 150)
		g.draw.endBegin
		
		End Sub
		
		Results of above code…
		
		image
		
		In addition to the g parameter there’s two more features EZSurface provides: automatic setup and animation.
		
		
		Automatic setup will apply some basic OpenGL boilerplate before calling Paint. What gets applied is controlled by the properties prefixed “auto” plus the camera reference.
		
		The default state of EZSurface applies viewport, a perspective camera, enables and clears depth, and clears color black. Typically you’d customize this in Open if necessary, including turning it all off.
		
		autoApplyViewport - if true set a standard viewport. initially true
		
		autoApplyCamera - if true call the camera’s apply method. If the camera is nil apply a standard 2D projection. initially true (and with a camera instance)
		
		autoApplyBuffer - if true apply the next few actions. initially true
		autoDepthIsOn - if true depth is enabled, if false depth is disabled. initially true
		autoClearBuffers - if true clear the color buffer, and the depth buffer if ‘DepthIsOn’. initially true
		autoBackgroundColor - the color used to clear the color buffer. initially &c000000
		
		autoEmptyModelViewStack - this is esoteric but technically part of the pre-paint process. If true the modelview matrix stack will be checked and popped down to 1 element. Intended for situations where the push and popping aren’t worked out yet. initially false
		
		A camera is anything that implements interface iApplyGLWithSurf which consists of the single method applyGLWithSurf(glSurf As EZSurface). The intention is a ‘camera’ object will setup the projection and model view matrices, but it could be used to run anything. Currently only a single camera class (EulerCamera) is provided and instantiated by default.
		
		The camera can be set and retrieved with these methods.
		
		setCamera(newCam As iApplyGLWithSurf)
		getCamera() As iApplyGLWithSurf
		getEulerCamera() As EulerCamera - for type convenience. returns nil if not a EulerCamera
		
		These convenience methods make simple changes to effect 2D or 3D modes.
		
		init2D()
		init3D()
		
		These properties are prefixed “auto” but shouldn’t be (they don’t affect the pre-paint process)
		autoBlockRepeatMouseDrags - if true MouseDrag events with no delta are not sent
		autoEulerCameraMousing - if true and the camera is a EulerCamera and the user doesn’t handle MouseDown then apply standard Mouse->EulerCamera handling
		
		
		Animation is controlled through a set of methods prefixed “anim” and the StepAnimation(…) event which is called just before Paint. StepAnimation gives you a place to update your scene variables separate from your drawing code. Internally a Timer is run and a few timing metrics tracked.
		
		These are the main methods.
		
		animSetFPS(newFPS As double) - set Timers period using a Frames Per Second value. initially 30
		animSetPeriod(newPeriod As integer) - set period directly
		
		animStart() - start Timer
		animStop() - stop it
		
		animResetTime() - just zeros elapsed and frame count (doesn’t stop the timer running)
		
		These are less necessary.
		
		animGetElapsedTime() As double - elapsed seconds at last StepAnimation event
		animGetFrame() As integer - frame count at last StepAnimation event
		
		animGetFPS() As double - get FPS value back (or equivalent if set by period)
		animGetIsRunning() As Boolean - true if currently running. initially not running
		
		When StepAnimation is called those timing values are passed in for convenience.
		
		StepAnimation(elapsedTime As double, deltaTime As double, frameIndex As integer)
		
		elapsedTime - seconds since timer started
		deltaTime - seconds since last StepAnimation event
		frameIndex - frame count for this event
		
		
		That covers the basics of EZSurface operation but there’s one more thing I want to point out. In the Paint and Open events you get that ‘g As ezgl’ parameter and in both it’s safe to call OpenGL functions because the backing context is currently bound. Outside those events the context may not be bound and your calls fall into the aether. In such cases call EZSurface1.MakeCurrent before working OpenGL.
		
		Creating and using the other ezgl framework objects (EZTexture2D, EZDisplayList, EZFont, EZProgram, EZShader, Quadric and Hershey) involve OpenGL calls, so take care if using those outside Paint or Open.
		
		The default EulerCamera doesn’t rely on OpenGL calls, you can manipulate it any time. It’s OpenGL is only applied during the pre-paint process.
		
		OK, that’s it for EZSurface. Next time I’ll cover the basics of what to code with g
	#tag EndNote


	#tag Property, Flags = &h21
		Private animTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h0
		autoApplyBuffer As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		autoApplyCamera As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		autoApplyViewport As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		autoBackgroundColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		autoBlockRepeatMouseDrags As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		autoCameraMousing As boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		autoClearBuffers As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		autoDepthIsOn As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		autoEmptyModelViewStack As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private idealFPS As double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private oldHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private oldWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private oldX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private oldY As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theBoundsSetter As FactoryEZGL.delBoundsSetter
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theCamera As iApplyGL
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theGL As ezgl
	#tag EndProperty

	#tag Property, Flags = &h21
		Private timeElapsed As double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private timeFrame As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private timeLast As double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private useCustomMousing As boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="autoApplyBuffer"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoApplyCamera"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoApplyViewport"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoBackgroundColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoBlockRepeatMouseDrags"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoCameraMousing"
			Group="Behavior"
			InitialValue="true"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoClearBuffers"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoDepthIsOn"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoEmptyModelViewStack"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColorBits"
			Visible=true
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DepthBits"
			Visible=true
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="128"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Group="Position"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="128"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
