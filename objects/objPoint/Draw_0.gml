if (shouldDraw && lineEnd != undefined) {
	draw_line_width(x, y, lineEnd.x, lineEnd.y, spinIncrement * 0.1);
}

draw_circle(x,y,spinIncrement * 0.05,false);