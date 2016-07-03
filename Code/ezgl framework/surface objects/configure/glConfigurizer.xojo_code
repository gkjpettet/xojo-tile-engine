#tag Class
Protected Class glConfigurizer
	#tag Method, Flags = &h0
		Sub accelerated()
		  stuff(73)
		  
		  'NSOpenGLPFAAccelerated
		  'A Boolean attribute. If present, this attribute indicates that only 
		  'hardware-accelerated renderers are considered. If not present, accelerated 
		  'renderers are still preferred.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub acceleratedCompute()
		  stuff(97)
		  
		  'NSOpenGLPFAAcceleratedCompute
		  'If present, this attribute indicates that only renderers that can execute 
		  'OpenCL programs should be used.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub allowOfflineRenderers()
		  stuff(96)
		  
		  'NSOpenGLPFAAllowOfflineRenderers
		  'A Boolean attribute. If present, this attribute indicates that 
		  'offline renderers may be used.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub allRenderers()
		  stuff(1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub auxBuffers(count As UInt32)
		  stuff(7, count)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub auxDepthStencil()
		  
		  stuff(57)
		  
		  'Each auxiliary buffer has its own depth stencil.
		  
		  'Boolean, value ?
		  
		  
		  //http:/ /www.opengl.org/registry/specs/APPLE/aux_depth_stencil.txt
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub backingStore()
		  stuff(76)
		  
		  'NSOpenGLPFABackingStore
		  'A Boolean attribute. If present, this attribute indicates that OpenGL only 
		  'considers renderers that have a back color buffer the full size of the drawable 
		  '(regardless of window visibility) and that guarantee the back buffer contents 
		  'to be valid after a call to NSOpenGLContext object’s flushBuffer.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub closestPolicy()
		  stuff(74)
		  
		  'NSOpenGLPFAClosestPolicy
		  'A Boolean attribute. If present, this attribute indicates that the pixel 
		  'format choosing policy is altered for the color buffer such that the buffer 
		  'closest to the requested size is preferred, regardless of the actual color 
		  'buffer depth of the supported graphics device.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub colorFloat()
		  
		  stuff(58)
		  
		  'A Boolean attribute. If present, this attribute indicates that only renderers 
		  'that are capable using buffers storing floating point pixels are considered. 
		  'This should be accompanied by a NSOpenGLPFAColorSize of 64 (for half float pixel 
		  'components) or 128 (for full float pixel components). Note, not all hardware 
		  'supports floating point color buffers thus the returned pixel format could be NULL.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub compliant()
		  stuff(83)
		  
		  'NSOpenGLPFACompliant
		  'A Boolean attribute. If present, this attribute indicates that pixel format 
		  'selection is only open to OpenGL-compliant renderers. This attribute is implied 
		  'unless NSOpenGLPFAAllRenderers is specified. 
		  '**This attribute is not useful in the attribute array.**
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  
		  mem = new MemoryBlock(320) //40choices*4bytes*2for extra values
		  
		  bpos = 0
		  
		  
		  '17 bools
		  '8 vals
		  '25 total
		  '
		  '39 listed for NSOpenGLPixelFormatAttribute
		  
		  //bools
		  'NSOpenGLPFAAllRenderers 2
		  'NSOpenGLPFADoubleBuffer 2
		  'NSOpenGLPFAStereo 2
		  'NSOpenGLPFAMinimumPolicy 2
		  'NSOpenGLPFAMaximumPolicy 2
		  'NSOpenGLPFAOffScreen 2
		  'NSOpenGLPFAFullScreen 2
		  'NSOpenGLPFASingleRenderer 2
		  'NSOpenGLPFANoRecovery 2
		  'NSOpenGLPFAAccelerated 2
		  'NSOpenGLPFAClosestPolicy 2
		  'NSOpenGLPFARobust 2
		  'NSOpenGLPFABackingStore 2
		  'NSOpenGLPFAWindow 2
		  'NSOpenGLPFAMultiScreen 2
		  'NSOpenGLPFACompliant 2
		  'NSOpenGLPFAPixelBuffer 2
		  //vals
		  'NSOpenGLPFAAuxBuffers 2
		  'NSOpenGLPFAColorSize 2
		  'NSOpenGLPFAAlphaSize 2
		  'NSOpenGLPFADepthSize 2
		  'NSOpenGLPFAStencilSize 2
		  'NSOpenGLPFAAccumSize 2
		  'NSOpenGLPFARendererID 2
		  'NSOpenGLPFAScreenMask 2
		  //left over
		  'NSOpenGLPFATripleBuffer 1  bool
		  'NSOpenGLPFASampleBuffers 1
		  'NSOpenGLPFASamples 1
		  'NSOpenGLPFAAuxDepthStencil 1
		  'NSOpenGLPFAColorFloat 1   bool
		  'NSOpenGLPFAMultisample 1  bool
		  'NSOpenGLPFASupersample 1  bool
		  'NSOpenGLPFASampleAlpha 1  bool
		  'NSOpenGLPFAMPSafe 1        bool (multiprocessor safe)
		  'NSOpenGLPFARemotePixelBuffer 1   bool
		  'NSOpenGLPFAAllowOfflineRenderers 1   bool
		  'NSOpenGLPFAAcceleratedCompute 1   bool? (openCL)
		  'NSOpenGLPFAOpenGLProfile 1
		  'NSOpenGLPFAVirtualScreenCount 1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub doubleBuffer()
		  stuff(5)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getMem() As MemoryBlock
		  if bpos = 0 then
		    return nil
		  else
		    return mem
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub maximumPolicy()
		  stuff(52)
		  
		  'A Boolean attribute. If present, this attribute indicates that the pixel format choosing policy is altered for the color, depth, and accumulation buffers such that, if a nonzero buffer size is requested, the largest available buffer is preferred.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub minimumPolicy()
		  stuff(51)
		  
		  'A Boolean attribute. If present, this attribute indicates that the pixel format choosing policy is altered for the color, depth, and accumulation buffers such that only buffers of size greater than or equal to the desired size are considered.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MPSafe()
		  stuff(78)
		  
		  'NSOpenGLPFAMPSafe
		  'A Boolean attribute. If present, this attribute indicates that the renderer 
		  'is multi-processor safe.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub multiScreen()
		  stuff(81)
		  
		  'NSOpenGLPFAMultiScreen
		  'A Boolean attribute. If present, this attribute indicates that only renderers 
		  'capable of driving multiple screens are considered.
		  '**This attribute is not generally useful.**
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub noRecovery()
		  stuff(72)
		  
		  'NSOpenGLPFANoRecovery
		  'A Boolean attribute. If present, this attribute indicates that OpenGL’s failure 
		  'recovery mechanisms are disabled. Normally, if an accelerated renderer fails due 
		  'to lack of resources, OpenGL automatically switches to another renderer. This 
		  'attribute disables these features so that rendering is always performed by the 
		  'chosen renderer. This attribute is not generally useful.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub offScreen()
		  stuff(53)
		  
		  'A Boolean attribute. If present, this attribute indicates that only renderers that are capable of rendering to an offscreen memory area and have buffer depth exactly equal to the desired buffer depth are considered. The NSOpenGLPFAClosestPolicy attribute is implied.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub pixelBuffer()
		  stuff(90)
		  
		  'NSOpenGLPFAPixelBuffer
		  'A Boolean attribute. If present, this attribute indicates that rendering to a 
		  'pixel buffer is enabled.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub profileCore()
		  
		  stuff(99, &h3200)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub profileLegacy()
		  
		  stuff(99, &h1000)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub remotePixelBuffer()
		  stuff(91)
		  
		  'NSOpenGLPFARemotePixelBuffer
		  'A Boolean attribute. If present, this attribute indicates that rendering to a 
		  'pixel buffer on an offline renderer is enabled.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub rendererID(id As UInt32)
		  
		  stuff(70, id)
		  
		  'NSOpenGLPFARendererID = 70
		  'Value is a nonnegative renderer ID number. OpenGL renderers that match the specified 
		  'ID are preferred. Constants to select specific renderers are provided in the 
		  'CGLRenderers.h header of the OpenGL framework. Of note is kCGLRendererGenericID 
		  'which selects the Apple software renderer. The other constants select renderers 
		  'for specific hardware vendors.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub robust()
		  stuff(75)
		  
		  'NSOpenGLPFARobust
		  'A Boolean attribute. If present, this attribute indicates that only renderers 
		  'that do not have any failure modes associated with a lack of video card resources 
		  'are considered. This attribute is not generally useful.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub sampleAlpha()
		  
		  stuff(61)
		  
		  'A Boolean attribute. If present and used with NSOpenGLPFASampleBuffers and NSOpenGLPFASampleBuffers, this attribute hints to OpenGL to update multi-sample alpha values to ensure the most accurate rendering. If pixel format is not requesting anti-aliasing then this hint does nothing.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub sampleBuffers(count As UInt32)
		  
		  stuff(55, count)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub sampleMulti()
		  
		  stuff(59)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub samples(count As UInt32)
		  
		  stuff(56, count)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub sampleSuper()
		  
		  
		  stuff(60)
		  
		  
		  'A Boolean attribute. If present and used with NSOpenGLPFASampleBuffers and NSOpenGLPFASamples, this attribute hints to OpenGL to prefer super-sampling. Super-sampling will process fragments with a texture sample per fragment and would likely be slower than multi-sampling. If the pixel format is not requesting anti-aliasing, this hint does nothing.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub screenMask(screenBitMask As UInt32)
		  stuff(84, screenBitMask)
		  
		  'NSOpenGLPFAScreenMask
		  'Value is a bit mask of supported physical screens. All screens specified in the 
		  'bit mask are guaranteed to be supported by the pixel format. Screens not specified 
		  'in the bit mask may still be supported. The bit mask is managed by the 
		  'CoreGraphics’s DirectDisplay, available in the CGDirectDisplay.h header of the 
		  'ApplicationServices umbrella framework. A CGDirectDisplayID must be converted to 
		  'an OpenGL display mask using the function CGDisplayIDToOpenGLDisplayMask. 
		  '**This attribute is not generally useful.**
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub singleRenderer()
		  stuff(71)
		  
		  'NSOpenGLPFASingleRenderer
		  'A Boolean attribute. If present, this attribute indicates that a single rendering 
		  'engine is chosen. On systems with multiple screens, this disables OpenGL’s ability 
		  'to drive different monitors through different graphics accelerator cards with a 
		  'single context. **This attribute is not generally useful.**
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub sizeAccum(bufferSize As UInt32)
		  stuff(14, bufferSize)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub sizeAlpha(bufferSize As UInt32)
		  
		  stuff(11, bufferSize)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub sizeColor(bufferSize As UInt32)
		  
		  stuff(8, bufferSize)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub sizeDepth(bufferSize As UInt32)
		  stuff(12, bufferSize)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub sizeStencil(bitPlaneCount As UInt32)
		  stuff(13, bitPlaneCount)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stereo()
		  stuff(6)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub stuff(paramArray values As UInt32)
		  
		  
		  for i As integer = 0 to values.Ubound
		    
		    mem.UInt32Value(bpos) = values(i)
		    
		    bpos = bpos + 4
		    
		  next
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub tripleBuffer()
		  stuff(3)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub virtualScreenCount(count As UInt32)
		  stuff(128, count)
		  
		  'NSOpenGLPFAVirtualScreenCount
		  'The number of virtual screens in this format.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub windowRenderer()
		  stuff(80)
		  
		  'NSOpenGLPFAWindow
		  'A Boolean attribute. If present, this attribute indicates that only renderers 
		  'that are capable of rendering to a window are considered. This attribute is 
		  'implied if neither NSOpenGLPFAFullScreen nor NSOpenGLPFAOffScreen is specified.
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private bpos As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mem As MemoryBlock
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
