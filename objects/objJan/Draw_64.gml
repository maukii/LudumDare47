if (alarm[5] == -1) exit;

var height = font_get_size(fntUIHuge) * 2;
var shakeAmount = 2;
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fntUIHuge);
var txt = "BREAK";
var c = global.textHighlightColor;
		
draw_text_color(room_width/2 + irandom_range(-shakeAmount, shakeAmount), room_height/2 + irandom_range(-shakeAmount, shakeAmount) - height, txt, c, c, c, c, 1);
		
draw_text(room_width/2 + irandom_range(-shakeAmount, shakeAmount), room_height/2 + irandom_range(-shakeAmount, shakeAmount) - height, txt);
			
var txt = "HIS";
var c = global.textHighlightColor;
		
draw_text_color(room_width/2 + irandom_range(-shakeAmount, shakeAmount), room_height/2 + irandom_range(-shakeAmount, shakeAmount), txt, c, c, c, c, 1);
		
draw_text(room_width/2 + irandom_range(-shakeAmount, shakeAmount), room_height/2 + irandom_range(-shakeAmount, shakeAmount), txt);
			
var txt = "HEART";
var c = global.textHighlightColor;
		
draw_text_color(room_width/2 + irandom_range(-shakeAmount, shakeAmount), room_height/2 + irandom_range(-shakeAmount, shakeAmount) + height, txt, c, c, c, c, 1);
		
var c = global.colOrange;
draw_text_color(room_width/2 + irandom_range(-shakeAmount, shakeAmount), room_height/2 + irandom_range(-shakeAmount, shakeAmount) + height, txt, c, c, c, c, 1);