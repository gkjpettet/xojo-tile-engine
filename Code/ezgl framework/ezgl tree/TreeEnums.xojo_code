#tag Module
Protected Module TreeEnums
	#tag Enum, Name = attribBit, Type = Integer, Flags = &h0
		current = 1
		  point = 2
		  line = 4
		  polygon = 8
		  polygonStipple = 16
		  pixelMode = 32
		  lighting = 64
		  fog = 128
		  depth = 256
		  accum = 512
		  stencil = 1024
		  viewport = 2048
		  transform = 4096
		  enable = 8192
		  colour = 16384
		  hint = 32768
		  eval = 65536
		  list = 131072
		  texture = 262144
		scissor = 524288
	#tag EndEnum

	#tag Enum, Name = blendEqn, Type = Integer, Flags = &h0
		add = 32774
		  subtract = 32778
		  reverseSubtract = 32779
		  min = 32775
		max = 32776
	#tag EndEnum

	#tag Enum, Name = blendFunc, Type = Integer, Flags = &h0
		zero = 0
		  one = 1
		  srcColor = 768
		  oneMinusSrcColor = 769
		  dstColor = 774
		  oneMinusDstColor = 775
		  srcAlpha = 770
		  oneMinusSrcAlpha = 771
		  dstAlpha = 772
		  oneMinusDstAlpha = 773
		  constantColor = 32769
		  oneMinusConstantColor = 32770
		  constantAlpha = 32771
		  oneMinusConstantAlpha = 32772
		srcAlphaSaturate = 776
	#tag EndEnum


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
End Module
#tag EndModule
