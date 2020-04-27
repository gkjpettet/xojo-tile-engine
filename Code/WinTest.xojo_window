#tag Window
Begin Window WinTest
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   750
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "OpenGL XTE"
   Visible         =   True
   Width           =   1200
   Begin XTE.IsometricSurface Display
      autoApplyBuffer =   False
      autoApplyCamera =   False
      autoApplyViewport=   False
      autoBackgroundColor=   &c00000000
      autoBlockRepeatMouseDrags=   False
      autoCameraMousing=   True
      autoClearBuffers=   False
      AutoDeactivate  =   True
      autoDepthIsOn   =   False
      autoEmptyModelViewStack=   False
      ColorBits       =   24
      ContextHandle   =   0
      DepthBits       =   24
      DoubleBuffer    =   True
      Enabled         =   True
      Height          =   710
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   1
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   1200
   End
   Begin Timer Updater
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   15
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  ' #########################################################
		  ' ### Scroll the map with the arrow keys ##################
		  ' #########################################################
		  if Keyboard.AsyncKeyDown(&h7B) then
		    ' Left arrow key
		    Display.map.ScrollLeft()
		  end if
		  if Keyboard.AsyncKeyDown(&h7C) then
		    ' Right arrow key
		    Display.map.ScrollRight()
		  end if
		  if Keyboard.AsyncKeyDown(&h7D) then
		    ' Down arrow key
		    Display.map.ScrollDown()
		  end if
		  if Keyboard.AsyncKeyDown(&h7E) then
		    ' Up arrow key
		    Display.map.ScrollUp()
		  end if
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  InitMap()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub InitMap()
		  using XTE
		  
		  dim col, row as Integer
		  
		  Display.map.Initialise(100, 100, 64, 32)
		  
		  for col = 0 to Display.map.columns - 1
		    
		    for row = 0 to Display.map.rows - 1
		      
		      Display.map.tiles(col, row) = new IsoTile(Display.map, col, row, tile_white_64x32)
		      
		    next row
		    
		  next col
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Display
	#tag Event
		Sub Open(g as ezgl)
		  Updater.Enabled = True
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As integer, y As integer) As boolean
		  return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As integer, y As integer)
		  using XTE
		  
		  dim maxCol as Integer = Ubound(me.map.tiles, 1) - 1
		  dim maxRow as Integer = Ubound(me.map.tiles, 2) - 1
		  dim tileUnderMouse as TileIndex
		  
		  ' Which tile was clicked?
		  tileUnderMouse = me.map.TileUnderMouse()
		  
		  me.window.title = tileUnderMouse.ToText
		  
		  ' Check a valid tile is under the cursor, otherwise bail
		  if tileUnderMouse = Nil or tileUnderMouse.column < 0 or tileUnderMouse.row < 0 or _
		  tileUnderMouse.column > maxCol or tileUnderMouse.row > maxRow then return
		  
		  ' Cmd-click. Place a cube
		  if Keyboard.AsyncCommandKey then
		    me.map.tiles(tileUnderMouse.column, tileUnderMouse.row).image = _
		    new EZTexture2D(cube_64_64, cube_64_64.CopyMask, True)
		  end if
		  
		  ' Ctrl-click. Place a tall cube
		  if Keyboard.AsyncControlKey then
		    me.map.tiles(tileUnderMouse.column, tileUnderMouse.row).image = _
		    new EZTexture2D(tall_cube_64_96, tall_cube_64_96.CopyMask, True)
		  end if
		  
		  ' Alt-click. Red tile
		  if Keyboard.AsyncAltKey then
		    me.map.tiles(tileUnderMouse.column, tileUnderMouse.row).image = _
		    new EZTexture2D(tile_red_64x32, tile_red_64x32.CopyMask, True)
		  end if
		  
		  ' Shift-click. White tile
		  if Keyboard.ShiftKey then
		    me.map.tiles(tileUnderMouse.column, tileUnderMouse.row).image = _
		    new EZTexture2D(tile_white_64x32, tile_white_64x32.CopyMask, True)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Updater
	#tag Event
		Sub Action()
		  Display.Render()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
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
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
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
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
