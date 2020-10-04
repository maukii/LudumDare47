switch (state) {
	case game_states.start:
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fntUISmall);
		
		draw_text(room_width/2, room_height/2, "MOVE PLAYER BY\nMOVING THE CURSOR\nOR BY\nPRESSING A AND D");
	break;
	
	case game_states.playing:
	
	break;
	
	case game_states.over:
		//Dim play area
		overAlpha = scrApproach(overAlpha, 0.8, 0.01);
		draw_set_alpha(overAlpha);
		var c = c_black;
		draw_rectangle_color(0, 0, room_width, room_height, c, c, c, c, false);
		draw_set_alpha(1);
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fntUIBig);
		
		draw_text(room_width/2, 32, "GAME OVER");
		
		draw_set_font(fntUISmall);
		draw_set_valign(fa_top);
		var height = font_get_size(fntUISmall);
		
		draw_text(room_width/2, 32 + height * 2, "SCORE: " + string(global.curScore) + "\nR TO RESTART");
	break;
}