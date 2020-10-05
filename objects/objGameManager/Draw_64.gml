var margin = 16;
var wave = scrWave(-4, 4, 4, 0);

switch (state) {
	case game_states.start:
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fntUISmall);
		var txt = "MOVE PLAYER BY\nMOVING THE CURSOR\nOR BY\nPRESSING A AND D\n\nDASH BY LEFT CLICKING\nOR PRESSING SPACE";
		var c = global.textHighlightColor;
		
		draw_text_color(room_width/2 + 1, room_height/2 + 1 + wave, txt, c, c, c, c, 1);
		
		draw_text(room_width/2, room_height/2 + wave, txt);
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(fntUISmall);
		var txt = "M TO MUTE MUSIC";
		var c = global.textHighlightColor;
		
		draw_text_color(margin+1, margin+1, txt, c, c, c, c, 1);
		
		c = c_white;
		draw_text_color(margin, margin, txt, c, c, c, c, 1);
	break;
	
	case game_states.playing:
		if (alarm[0] != -1) {
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_set_font(fntUISmall);
			var txt = "YOU HAVE DEFEATED\nTHE JANTOR\n\nYOU HAVE WON THE GAME\n\nBUT MAY KEEP PLAYING\nTO REACH A HIGHER SCORE\n\nA HIGHER\nUNDERSTANDING";
			var c = global.textHighlightColor;
		
			draw_text_color(room_width/2 + 1, room_height/2 + 1 + wave, txt, c, c, c, c, 1);
		
			draw_text(room_width/2, room_height/2 + wave, txt);
		}
		
		if (alarm[1] != -1) {
			var height = font_get_size(fntUIHuge) * 2;
			var shakeAmount = 2;
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_set_font(fntUIHuge);
			var txt = "DEFEAT";
			var c = global.textHighlightColor;
		
			draw_text_color(room_width/2 + irandom_range(-shakeAmount, shakeAmount), room_height/2 + irandom_range(-shakeAmount, shakeAmount) - height, txt, c, c, c, c, 1);
		
			draw_text(room_width/2 + irandom_range(-shakeAmount, shakeAmount), room_height/2 + irandom_range(-shakeAmount, shakeAmount) - height, txt);
			
			var txt = "THE";
			var c = global.textHighlightColor;
		
			draw_text_color(room_width/2 + irandom_range(-shakeAmount, shakeAmount), room_height/2 + irandom_range(-shakeAmount, shakeAmount), txt, c, c, c, c, 1);
		
			draw_text(room_width/2 + irandom_range(-shakeAmount, shakeAmount), room_height/2 + irandom_range(-shakeAmount, shakeAmount), txt);
			
			var txt = "JANTOR";
			var c = global.textHighlightColor;
		
			draw_text_color(room_width/2 + irandom_range(-shakeAmount, shakeAmount), room_height/2 + irandom_range(-shakeAmount, shakeAmount) + height, txt, c, c, c, c, 1);
		
			var c = global.colOrange;
			draw_text_color(room_width/2 + irandom_range(-shakeAmount, shakeAmount), room_height/2 + irandom_range(-shakeAmount, shakeAmount) + height, txt, c, c, c, c, 1);
		}
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_set_font(fntUISmall);
		var txt = "SCORE: " + string(global.curScore);
		var c = global.textHighlightColor;
		
		draw_text_transformed_color(margin+1, margin+1 + scrWave(0, 8, 4, 0), txt, scoreTextScale, scoreTextScale, scoreTextRot, c, c, c, c, 1);
		
		c = c_white;
		draw_text_transformed_color(margin, margin + scrWave(0, 8, 4, 0), txt, scoreTextScale, scoreTextScale, scoreTextRot, c, c, c, c, 1);
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
		draw_set_font(fntUIHuge);
		
		var txt = "GAME OVER";
		var c = global.textHighlightColor;
		
		draw_text_color(room_width/2+1, 64+1, txt, c, c, c, c, 1);
		draw_text(room_width/2, 64, txt);
		
		draw_set_font(fntUISmall);
		draw_set_valign(fa_center);
		
		txt = "SCORE: " + string(global.curScore) + "\n\nR TO RESTART\n\nESC TO ESCAPE THIS NIGHTMARE";
		c = global.textHighlightColor;
		
		draw_text_color(room_width/2+1, room_height/2+1 + wave, txt, c, c, c, c, 1);
		draw_text(room_width/2, room_height/2 + wave, txt);
	break;
}