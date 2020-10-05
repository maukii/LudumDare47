draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fntUIHuge);

var txt = "JANTOR";
var shakeAmount = 2;
var c = global.textHighlightColor;
draw_text_color(room_width/2 + irandom_range(-shakeAmount, shakeAmount), room_height/4 + irandom_range(-shakeAmount, shakeAmount), txt, c, c, c, c, 1);
draw_text(room_width/2 + irandom_range(-shakeAmount, shakeAmount), room_height/4 + irandom_range(-shakeAmount, shakeAmount), txt);

if (drawIndex >= 1) {
	draw_set_font(fntUIBig);
	var txt = "A GAME BY";
	draw_text_color(room_width/2+1, room_height/2+1 + scrWave(-5, 5, 2, 0), txt, c, c, c, c, 1);
	draw_text(room_width/2, room_height/2 + scrWave(-5, 5, 2, 0), txt);
}

if (drawIndex >= 2) {
	draw_set_font(fntUISmall);
	draw_set_valign(fa_top);
	var txt = devsText;
	draw_text_color(room_width/2+1, room_height/8*5+1 + scrWave(-5, 5, 6, 0), txt, c, c, c, c, 1);
	draw_text(room_width/2, room_height/8*5 + scrWave(-5, 5, 6, 0), txt);
}

if (alarm[0] < 10) {
	alpha = scrApproach(alpha, 1, 0.1);
	var c = c_black;
	
	draw_set_alpha(alpha);
	draw_rectangle_color(0, 0, room_width, room_height, c, c, c, c, false);
	draw_set_alpha(1);
}