#tag Class
Protected Class Isometric
	#tag Method, Flags = &h0
		Sub Draw(g As ezgl)
		  using XTE
		  
		  dim viewportColumns, viewportRows, startColumn, endColumn, startRow, endRow as Integer
		  dim c, r, x, y as Integer
		  dim viewportCentreTileIndex as TileIndex
		  dim tile as IsoTile
		  
		  ' How many columns and rows can fit in the viewport? (add three for good measure)
		  viewportColumns = ((g.width / tileWidth) * 2) + 3
		  viewportRows = ((g.height/tileHeight) * 2) + 3
		  
		  ' Get the tile in the centre of the viewport
		  viewportCentreTileIndex = TileIndexAtXY(xOffset + (g.width/2), yOffset + (g.height/2))
		  
		  ' Figure out which column and rows to draw
		  startColumn = viewportCentreTileIndex.column - (viewportColumns/2)
		  endColumn = startColumn + viewportColumns
		  startRow = viewportCentreTileIndex.row - (viewportRows/2)
		  endRow = startRow + viewportRows
		  
		  ' Loop through potential tiles to draw
		  for c = startColumn to endColumn
		    
		    for r = startRow to endRow
		      
		      ' Bounds checking
		      if c < 0 or r < 0 or c > COLUMNS_MAX or r > ROWS_MAX then continue
		      
		      ' Get the tile to draw
		      tile = tiles(c, r)
		      
		      ' Get the top left screen coords for this tile
		      x = ((c - r) * TILE_WIDTH_HALF) - xOffset
		      y = ((c + r) * TILE_HEIGHT_HALF) - yOffset - tile.zOffset
		      
		      ' Skip tiles not actually visible on the screen
		      if x < -TILE_WIDTH_HALF or x > g.width + TILE_WIDTH_HALF or _
		      y < -TILE_HEIGHT_HALF or y > g.height + TILE_HEIGHT_HALF then continue
		      
		      ' Draw the tile base image
		      tile.image.DrawTopLeft(x, y)
		      
		    next r
		    
		  next c
		  
		  ' I don't know what this does but it seems necessary
		  g.texture.enable
		  g.blend.enable
		  g.blend.equation(blendEqn.add)
		  g.blend.setFuncStandardAlpha
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Initialise(surface as EZSurface, columns as Integer, rows as Integer, tileWidth as Integer, tileHeight as Integer)
		  ' Initialise the map.
		  
		  me.mySurface = surface
		  me.columns = columns
		  me.rows = rows
		  me.tileWidth = tileWidth
		  me.tileHeight = tileHeight
		  
		  redim tiles(columns, rows)
		  
		  TILE_HEIGHT_HALF = tileHeight/2
		  TILE_WIDTH_HALF = tileWidth/2
		  COLUMNS_MAX = Ubound(tiles, 1) - 1
		  ROWS_MAX = Ubound(tiles, 2) - 1
		  COLUMNS_UBOUND = Ubound(tiles, 1)
		  ROWS_UBOUND = Ubound(tiles, 1)
		  MAP_WIDTH = tileWidth * (COLUMNS_MAX + 1)
		  MAP_HEIGHT = tileHeight * (ROWS_MAX + 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Initialise(columns as Integer, rows as Integer, tileWidth as Integer, tileHeight as Integer)
		  ' Initialise the map.
		  
		  me.columns = columns
		  me.rows = rows
		  me.tileWidth = tileWidth
		  me.tileHeight = tileHeight
		  
		  redim tiles(columns, rows)
		  
		  TILE_HEIGHT_HALF = tileHeight/2
		  TILE_WIDTH_HALF = tileWidth/2
		  COLUMNS_MAX = Ubound(tiles, 1) - 1
		  ROWS_MAX = Ubound(tiles, 2) - 1
		  COLUMNS_UBOUND = Ubound(tiles, 1)
		  ROWS_UBOUND = Ubound(tiles, 1)
		  MAP_WIDTH = tileWidth * (COLUMNS_MAX + 1)
		  MAP_HEIGHT = tileHeight * (ROWS_MAX + 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollDown()
		  yOffset = yOffset + scrollDownDistance
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollLeft()
		  xOffset = xOffset - scrollLeftDistance
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollRight()
		  xOffset = xOffset + scrollRightDistance
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollUp()
		  yOffset = yOffset - scrollUpDistance
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function TileIndexAtXY(x as Integer, y as Integer) As XTE.TileIndex
		  ' Takes (x, y) screen coordinates (which must be pre-adjusted before this method for 
		  ' scrolling offset) and returns the (column, row) index of the tile at this position.
		  ' If no tile is at this position we return index (-1, -1)
		  
		  dim column, row as Integer
		  
		  ' Get the column and row (not accounting for map rotation)
		  column = ((x / TILE_WIDTH_HALF + y / TILE_HEIGHT_HALF) / 2) - 0.5
		  row = ((y / TILE_HEIGHT_HALF - x / TILE_WIDTH_HALF) / 2) + 0.5
		  
		  return new TileIndex(column, row)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TileUnderMouse() As XTE.TileIndex
		  ' Returns the index of the tile currently under the mouse cursor (if there is one).
		  
		  dim x, y as Integer
		  
		  ' Determine the mouse x, y coordinates relative to the map canvas
		  x = mySurface.Window.MouseX() - mySurface.left
		  y = mySurface.Window.MouseY() - mySurface.top
		  
		  ' Adjust for scrolling offset
		  x = x + xOffset
		  y = y + yOffset
		  
		  return TileIndexAtXY(x, y)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		columns As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private COLUMNS_MAX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private COLUMNS_UBOUND As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MAP_HEIGHT As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MAP_WIDTH As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mySurface As EZSurface
	#tag EndProperty

	#tag Property, Flags = &h0
		rows As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ROWS_MAX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ROWS_UBOUND As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			When scrolling the map with the mouse at the edge is enabled (allowMouseScrolling = True), this is how
			many pixels to move the map downwards
		#tag EndNote
		scrollDownDistance As Integer = 32
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			When scrolling the map with the mouse at the edge is enabled (allowMouseScrolling = True), this is how
			many pixels to move the map leftwards
		#tag EndNote
		scrollLeftDistance As Integer = 64
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			When scrolling the map with the mouse at the edge is enabled (allowMouseScrolling = True), this is how
			many pixels to move the map rightwards
		#tag EndNote
		scrollRightDistance As Integer = 64
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			When scrolling the map with the mouse at the edge is enabled (allowMouseScrolling = True), this is how
			many pixels to move the map upwards
		#tag EndNote
		scrollUpDistance As Integer = 32
	#tag EndProperty

	#tag Property, Flags = &h0
		tileHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		tiles(-1,-1) As XTE.IsoTile
	#tag EndProperty

	#tag Property, Flags = &h0
		tileWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TILE_HEIGHT_HALF As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TILE_WIDTH_HALF As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		xOffset As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		yOffset As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="columns"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
			Name="rows"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="scrollDownDistance"
			Group="Behavior"
			InitialValue="32"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="scrollLeftDistance"
			Group="Behavior"
			InitialValue="64"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="scrollRightDistance"
			Group="Behavior"
			InitialValue="64"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="scrollUpDistance"
			Group="Behavior"
			InitialValue="32"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="tileHeight"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="tileWidth"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="xOffset"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="yOffset"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
