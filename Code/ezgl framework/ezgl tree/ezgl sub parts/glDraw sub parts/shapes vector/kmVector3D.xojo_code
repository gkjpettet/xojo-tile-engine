#tag Class
Class kmVector3D
	#tag Method, Flags = &h0
		Sub applyVertex()
		  OpenGL.glVertex3d(x, y, z)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  x = 0.0
		  y = 0.0
		  z = 0.0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(px As Double, py As Double, pz As Double)
		  x = px
		  y = py
		  z = pz
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(v As kmVector3D)
		  
		  if v <> nil then
		    x = v.x
		    y = v.y
		    z = v.z
		  else
		    Self.Constructor
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function copy() As kmVector3D
		  Return New kmVector3D(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function distance() As double
		  
		  return Sqrt(x * x + y * y + z * z)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawCube(g As ezgl, radius As Double = 0.1, doFill As Boolean = True)
		  
		  g.xform.pushMatrix
		  g.xform.translate(x, y, z)
		  g.xform.scale(radius)
		  
		  if doFill then
		    g.draw.shapes.cubeSolidLitTex
		  else
		    g.draw.shapes.cubeWire
		  end
		  
		  g.xform.popMatrix
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function hit(px As Double, py As Double, pr As Double) As Boolean
		  
		  dim xx As Double = px - x
		  dim yy As Double = py - y
		  
		  Return xx * xx + yy * yy <= pr * pr
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub limitDistance(maxDistance As double)
		  dim d As double = distance
		  
		  if d > maxDistance then
		    dim scale As double = maxDistance / d //d * scale = maxDistance
		    x = x * scale
		    y = y * scale
		    z = z * scale
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub move(px As Double, py As Double, pz As Double)
		  x = x + px
		  y = y + py
		  z = z + pz
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub move(vec As kmVector3D)
		  x = x + vec.x
		  y = y + vec.y
		  z = z + vec.z
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub normalize()
		  dim d As double = distance
		  if d > 0.00001 then
		    x = x / d
		    y = y / d
		    z = z / d
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub scale(s As double)
		  x = x * s
		  y = y * s
		  z = z * s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub set(px As Double, py As Double, pz As Double)
		  x = px
		  y = py
		  z = pz
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub set(v As kmVector3D)
		  
		  if v = nil then Return
		  
		  x = v.x
		  y = v.y
		  z = v.z
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function vectorFrom(px As double, py As double, pz As double) As kmVector3D
		  return new kmVector3D(x - px, y - py, z - pz)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function vectorTo(px As double, py As double, pz As double) As kmVector3D
		  return new kmVector3D(px - x, py - y, pz - z)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		x As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		y As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		z As Double
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
		#tag ViewProperty
			Name="x"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="y"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="z"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
