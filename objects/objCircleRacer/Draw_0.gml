//Draw boi
if (flash > 0) color = c_white;

if (iframes == 0) {
	draw_circle_color(x, y, radius, color, color, false);
} else if (scrWave(0, 1, 0.2, 0) > 0.5){
	draw_circle_color(x, y, radius, color, color, false);
}