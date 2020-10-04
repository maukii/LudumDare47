//Draw boi
if (flash > 0) color = c_white;

if (iframes == 0) {
	draw_circle_color(x, y, radius, color, color, false);
} else if (scrWave(0, 1, 0.2, 0) > 0.5){
	draw_circle_color(x, y, radius, color, color, false);
}

if (iframes > 0) {
	for (var i = 0; i < hp; ++i) {
		var space = 12;
	    draw_circle_color(x, y - 16 - i * space, 4, c_red, c_red, false);
	}
}