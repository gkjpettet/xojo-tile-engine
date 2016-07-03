#tag Class
Protected Class EulerCamera
Implements iApplyGL, iAutoMouse
	#tag Method, Flags = &h0
		Sub applyGL(g As ezgl)
		  // Part of the iApplyGLWithSurf interface.
		  
		  
		  dim imageRatio As single = g.Width / g.Height
		  
		  
		  //===================== setup the PROJECTION transform
		  OpenGL.glMatrixMode(OpenGL.GL_PROJECTION)    //perspective
		  OpenGL.glLoadIdentity
		  dim fovy As double = 114.59155902616465 * atan(tan(fovx * 0.00872664625997) / imageRatio)
		  OpenGL.gluPerspective(fovy, imageRatio, near, far) //input is fovY, converting from fovX
		  
		  
		  //=================== prep the MODEL transform
		  OpenGL.glMatrixMode(OpenGL.GL_MODELVIEW)
		  OpenGL.glLoadIdentity
		  
		  OpenGL.glRotatef(tilt, 0, 0, 1)  //tilt
		  
		  dim z1, y1, x2, z2 As double     //orientation
		  z1 = dolly * cos(angleX)
		  y1 = dolly * sin(angleX)
		  x2 = z1 * sin(angleY)
		  z2 = z1 * cos(angleY)
		  Soft Declare sub gluLookAt lib libOpenGL (eyeX as Double, eyeY as Double, eyeZ as Double, centerX as Double, centerY as Double, centerZ as Double, upX as Double, upY as Double, upZ as Double)
		  gluLookAt(x2+lookAtX, y1+lookAtY, z2+lookAtZ,   lookAtX, lookAtY, lookAtZ,   0.0, 1.0, 0.0)
		  
		  
		  
		  
		  
		  //expansion of fovy computation
		  //dim fovy As double = 2 * 360/6.28318 * ATan(Tan(fovx * 0.5 * 6.28318/360)*glSurf.Height/glSurf.Width)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub buildXZSteeringVec(forwardDelta As double, rightDelta As double, scale As double, byref vecX As double, byref vecZ As double)
		  dim nx, nz As double
		  
		  nx = -sin(angleY) * scale
		  nz = -cos(angleY) * scale
		  
		  vecX = nx * forwardDelta - nz * rightDelta * 0.7
		  vecZ = nz * forwardDelta + nx * rightDelta * 0.7
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  dolly = 5.0
		  fovx = 55.0 //degrees
		  near = 0.1
		  far = 100
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub flyForward(dist As double)
		  dim z1, y1, x2, z2, mag, scale As double
		  
		  z1 = dolly * cos(angleX)
		  y1 = dolly * sin(angleX)
		  x2 = z1 * sin(angleY)
		  z2 = z1 * cos(angleY)
		  
		  mag = Sqrt(x2 * x2 + y1 * y1 + z2 * z2)
		  
		  if mag < 0.00001 then return
		  
		  scale = dist / mag
		  
		  lookAtX = lookAtX - x2 * scale
		  lookAtY = lookAtY - y1 * scale
		  lookAtZ = lookAtZ - z2 * scale
		  
		  'x2 y1 z2 goes from lookat to cam
		  'so suvtract on that vector to go forward
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub followXZ(deltaX As double, deltaZ As double)
		  dim L2x, L2z, r, C1x, C1z, C1primex, C1primez As double
		  
		  L2x = lookAtX + deltaX
		  L2z = lookAtZ + deltaZ
		  
		  r = dolly * cos(angleX)
		  
		  C1x = lookAtX + r * sin(angleY)
		  C1z = lookAtZ + r * cos(angleY)
		  
		  C1primex = C1x - L2x
		  C1primez = C1z - L2z
		  
		  angleY = ATan2(C1primex, C1primez)
		  lookAtX = L2x
		  lookAtZ = L2z
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub mouseDrag(x As integer, y As integer, dx As integer, dy As integer, surface As EZSurface)
		  // Part of the iAutoMouse interface.
		  #pragma unused x
		  #pragma unused y
		  #pragma unused surface
		  
		  
		  if Keyboard.AsyncShiftKey then          //shift + xy = move lookat in XZ
		    moveLookAt(dolly / 400 * dx, 0, dolly / 400 * dy)
		    
		  elseif Keyboard.AsyncControlKey then    //control + xy = swing lookat point
		    swingLookAt(dy * 0.005, dx * -0.005)
		    
		  elseif Keyboard.AsyncOptionKey then     //option + y = fly forward
		    flyForward(dy * -0.001)
		    
		  else                                    //xy = swing camera
		    shiftAngles(dy * 0.005, dx * -0.005)
		    
		  end
		  
		  if (surface <> nil) and (not surface.animGetIsRunning) then surface.Render
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub mouseUp(x As integer, y As integer, surface As EZSurface)
		  // Part of the iAutoMouse interface.
		  
		  //no actions
		  
		  #pragma unused x
		  #pragma unused y
		  #pragma unused surface
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub mouseWheel(x As integer, y As integer, deltaX As integer, deltaY As integer, surface As EZSurface)
		  #pragma unused x
		  #pragma unused y
		  #pragma unused deltaX
		  #pragma unused surface
		  
		  dolly = Max(0.01, dolly + deltaY * 0.01 * dolly)
		  
		  if not surface.animGetIsRunning then surface.Render
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub moveLookAt(dx As double, dy AS double, dz As double)
		  lookAtX = lookAtX + dx
		  lookAtY = lookAtY + dy
		  lookAtZ = lookAtZ + dz
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setAngles(ax As double, ay As double)
		  angleX = ax
		  angleY = ay
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setLookAt(x As double, y As double, z As double)
		  lookAtX = x
		  lookAtY = y
		  lookAtZ = z
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setNearFar(n As double, f As double)
		  near = n
		  far = f
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub shiftAngles(dx As double, dy As double)
		  //clamp up/down to just under 90degrees
		  angleX = Min(Max(-1.5, angleX + dx), 1.5)
		  angleY = angleY + dy
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub steerXZ(forwardVec As double, sideVec As double)
		  dim nx, nz As double
		  
		  nx = -sin(angleY)
		  nz = -cos(angleY)
		  
		  'followXZ(nx*forwardVec+nz*sideVec, nz*forwardVec-nx*sideVec )
		  
		  'followXZ(-nz*sideVec, nx*sideVec )
		  
		  followXZ(nx*forwardVec-nz*sideVec, nz*forwardVec+nx*sideVec )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub swingLookAt(dx As double, dy As double)
		  dim cam1X, cam1Y, cam1Z, cam2X, cam2Y, cam2Z As double
		  dim z1, y1, x2, z2 As double
		  
		  z1 = dolly * cos(angleX)
		  y1 = dolly * sin(angleX)
		  x2 = z1 * sin(angleY)
		  z2 = z1 * cos(angleY)
		  cam1X = x2
		  cam1Y = y1
		  cam1Z = z2
		  
		  z1 = dolly * cos(angleX+dx)
		  y1 = dolly * sin(angleX+dx)
		  x2 = z1 * sin(angleY+dy)
		  z2 = z1 * cos(angleY+dy)
		  cam2X = x2
		  cam2Y = y1
		  cam2Z = z2
		  
		  lookAtX = lookAtX + cam2X - cam1X
		  lookAtY = lookAtY + cam2Y - cam1Y
		  lookAtZ = lookAtZ + cam2Z - cam1Z
		  
		  
		  angleX = angleX - dx
		  angleY = angleY - dy
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = about
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		angleX As double
	#tag EndProperty

	#tag Property, Flags = &h0
		angleY As double
	#tag EndProperty

	#tag Property, Flags = &h0
		dolly As double
	#tag EndProperty

	#tag Property, Flags = &h0
		far As double
	#tag EndProperty

	#tag Property, Flags = &h0
		fovx As double
	#tag EndProperty

	#tag Property, Flags = &h0
		lookAtX As double
	#tag EndProperty

	#tag Property, Flags = &h0
		lookAtY As double
	#tag EndProperty

	#tag Property, Flags = &h0
		lookAtZ As double
	#tag EndProperty

	#tag Property, Flags = &h0
		near As double
	#tag EndProperty

	#tag Property, Flags = &h0
		tilt As single
	#tag EndProperty


	#tag Constant, Name = libOpenGL, Type = String, Dynamic = False, Default = \"OpenGL.framework", Scope = Protected
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"OpenGL.framework"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Glu32"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="angleX"
			Group="Behavior"
			InitialValue="0"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="angleY"
			Group="Behavior"
			InitialValue="0"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="dolly"
			Group="Behavior"
			InitialValue="0"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="far"
			Group="Behavior"
			InitialValue="0"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="fovx"
			Group="Behavior"
			InitialValue="0"
			Type="double"
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
			Name="lookAtX"
			Group="Behavior"
			InitialValue="0"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lookAtY"
			Group="Behavior"
			InitialValue="0"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lookAtZ"
			Group="Behavior"
			InitialValue="0"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="near"
			Group="Behavior"
			InitialValue="0"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="tilt"
			Group="Behavior"
			Type="single"
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
