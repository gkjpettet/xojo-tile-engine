#tag Class
Protected Class OrthoCamera
Implements iApplyGL, iAutoMouse
	#tag Method, Flags = &h0
		Sub applyGL(g As ezgl)
		  // Part of the iApplyGLWithSurf interface.
		  
		  OpenGL.glMatrixMode(OpenGL.GL_PROJECTION)
		  OpenGL.glLoadIdentity
		  OpenGL.glOrtho(0, g.width, g.height, 0, near, far)
		  
		  OpenGL.glMatrixMode(OpenGL.GL_MODELVIEW)
		  OpenGL.glLoadIdentity
		  
		  
		  
		  dim scaleW As single = g.width / boundWidth
		  dim scaleH As single = g.height / boundHeight
		  
		  if centered then
		    
		    dim up As single = 1 //yup only applies to centered for now
		    if yUp then up = -1
		    
		    if scaleH < scaleW then
		      g.xform.scaleXY(scaleH, scaleH*up)
		      g.xform.translate((g.width / scaleH) * 0.5, boundHeight*0.5*up)
		    else
		      g.xform.scaleXY(scaleW, scaleW*up)
		      g.xform.translate(boundWidth*0.5, (g.height / scaleW) * 0.5 * up)
		    end
		    
		  else //topleft
		    
		    if scaleH < scaleW then
		      g.xform.scale(scaleH)
		      g.xform.translate((g.width / scaleH - boundWidth) * 0.5, 0)
		    else
		      g.xform.scale(scaleW)
		      g.xform.translate(0, (g.height / scaleW - boundHeight) * 0.5)
		    end
		    
		  end
		  
		  
		  
		  
		  
		  'dim scaler As single = me.Height / (board.lastCellY + 1)
		  'g.xform.pushMatrix
		  'g.xform.scale(scaler)
		  'g.xform.translate( (me.Width / scaler - (board.lastCellX + 1)) * 0.5, 0, 0 )
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(bWidth As single = 100, bHeight As single = 100, asCentered As boolean = false, asYUp As boolean = false)
		  
		  boundWidth = bWidth
		  boundHeight = bHeight
		  
		  centered = asCentered
		  
		  near = -1
		  far = 1
		  
		  
		  offsetX = 0
		  offsetY = 0
		  scale = 1.0
		  yUp = asYUp
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawBounds(g As ezgl)
		  'g.draw.shapes.rectWire(0, 0, boundWidth-1, boundHeight-1)
		  
		  g.draw.shapes.rectWire(0, 0, boundWidth, boundHeight)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub mouseDrag(x As integer, y As integer, dx As integer, dy As integer, surface As EZSurface)
		  // Part of the iAutoMouse interface.
		  
		  #pragma unused x
		  #pragma unused y
		  #pragma unused dx
		  #pragma unused dy
		  #pragma unused surface
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub mouseUp(x As integer, y As integer, surface As EZSurface)
		  // Part of the iAutoMouse interface.
		  
		  
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
		  #pragma unused deltaY
		  #pragma unused surface
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub project(gwidth As integer, gheight As integer, ix As single, iy As single, byref ox As single, byref oy As single)
		  dim scaleW As single = gwidth / boundWidth
		  dim scaleH As single = gheight / boundHeight
		  
		  if centered then
		    
		    dim up As single = 1 //yup only applies to centered for now
		    if yUp then up = -1
		    
		    if scaleH < scaleW then
		      ix = ix + (gwidth / scaleH) * 0.5
		      iy = iy + boundHeight*0.5*up
		      ox = ix * scaleH
		      oy = iy * scaleH * up
		    else
		      ix = ix + boundWidth*0.5
		      iy = iy + (gheight / scaleW) * 0.5 * up
		      ox = ix * scaleW
		      oy = iy * scaleW*up
		    end
		    
		  else //topleft
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function projectScale(gwidth As integer, gheight As integer, size As single) As single
		  dim scaleW As single = gwidth / boundWidth
		  dim scaleH As single = gheight / boundHeight
		  
		  if centered then
		    
		    'dim up As single = 1 //yup only applies to centered for now
		    'if yUp then up = -1
		    
		    if scaleH < scaleW then
		      return size * scaleH
		    else
		      return size * scaleW
		    end
		    
		  else //topleft
		    
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub unproject(gwidth As integer, gheight As integer, ix As single, iy As single, byref ox As single, byref oy As single)
		  dim scaleW As single = gwidth / boundWidth
		  dim scaleH As single = gheight / boundHeight
		  
		  if centered then
		    
		    dim up As single = 1 //yup only applies to centered for now
		    if yUp then up = -1
		    
		    if scaleH < scaleW then
		      ix = ix / scaleH
		      iy = iy / scaleH * up
		      ox = ix - (gwidth / scaleH) * 0.5
		      oy = iy - boundHeight*0.5*up
		    else
		      ix = ix / scaleW
		      iy = iy / scaleW*up
		      ox = ix - boundWidth*0.5
		      oy = iy - (gheight / scaleW) * 0.5 * up
		    end
		    
		  else //topleft
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function unprojectScale(gwidth As integer, gheight As integer, size As single) As single
		  dim scaleW As single = gwidth / boundWidth
		  dim scaleH As single = gheight / boundHeight
		  
		  if centered then
		    
		    'dim up As single = 1 //yup only applies to centered for now
		    'if yUp then up = -1
		    
		    if scaleH < scaleW then
		      return size / scaleH
		    else
		      return size / scaleW
		    end
		    
		  else //topleft
		    
		  end
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		boundHeight As single
	#tag EndProperty

	#tag Property, Flags = &h0
		boundWidth As single
	#tag EndProperty

	#tag Property, Flags = &h0
		centered As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		far As double
	#tag EndProperty

	#tag Property, Flags = &h0
		near As double
	#tag EndProperty

	#tag Property, Flags = &h0
		offsetX As single
	#tag EndProperty

	#tag Property, Flags = &h0
		offsetY As single
	#tag EndProperty

	#tag Property, Flags = &h0
		scale As single
	#tag EndProperty

	#tag Property, Flags = &h0
		yUp As boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="boundHeight"
			Group="Behavior"
			Type="single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="boundWidth"
			Group="Behavior"
			Type="single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="centered"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="far"
			Group="Behavior"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="near"
			Group="Behavior"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="offsetX"
			Group="Behavior"
			Type="single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="offsetY"
			Group="Behavior"
			Type="single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="scale"
			Group="Behavior"
			Type="single"
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
			Name="yUp"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
