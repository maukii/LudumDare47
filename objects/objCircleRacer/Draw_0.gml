//Draw boi
if (dash.cooldown > 0) image_index = 2;

if (flash > 0) shader_set(shdFlash);

if (iframes == 0) {
	draw_self();
	if (dash.cooldown == 0) image_index = 0;
} else if (scrWave(0, 1, 0.2, 0) > 0.5){
	draw_self();
}	

shader_reset();

if (iframes > dashIFramesMax) {
	for (var i = 0; i < hp; ++i) {
		var space = 12;
	    draw_circle_color(x + scrWave(-4, 4, 1, i/3), y - 16 - i * space, 4, c_red, c_red, false);
	}
}