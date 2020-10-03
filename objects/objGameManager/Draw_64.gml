switch (state) {
	case game_states.start:
	
	break;
	
	case game_states.playing:
	
	break;
	
	case game_states.over:
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fntUIBig);
		draw_text(room_width/2, 32, "GAME OVER");
		
		draw_set_font(fntUISmall);
		var height = font_get_size(fntUISmall);
		draw_text(room_width/2, 32 + height * 2, "R TO RESTART");
	break;
}