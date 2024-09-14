function @draw_tank($sc:screen, $level:number, $x:number, $y:number, $width:number, $height:number, $thickness:number, $frame_gap:number, $fluid_colour:number, $frame_colour:number, $back_colour:number)
	
	; Truthy Value, 1 or 0
	if $frame_gap != 0
		$frame_gap = 1
	
	; Draw Tank
	if $frame_colour != 0
		$sc.draw_rect($x, $y, $x+$width, $y+$height, $frame_colour, $frame_colour)
	
	; Draw fluid outline
	; if $frame_colour != 0
	$sc.draw_rect($x+$thickness, $y+$thickness, $x+$width-$thickness, $y+$height-$thickness, $back_colour, $back_colour)
	
	; Calc fluid fill level
	; Adjust fill level for gap
	var $fluid_size = ($height - ($thickness * 2) - (($frame_gap*2)*$thickness) ) * $level
	
	; Adjust this so code works, forget why its needed
	$frame_gap += 1
	
	; Draw fluid
	$sc.draw_rect($x+($thickness*$frame_gap), $y+$height-$fluid_size-($thickness*$frame_gap), $x+$width-($thickness*$frame_gap), $y+$height-($thickness*$frame_gap), $fluid_colour, $fluid_colour)