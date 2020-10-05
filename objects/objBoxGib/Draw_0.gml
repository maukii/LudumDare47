var thickness = 8;
for (var i = thickness; i > 0; --i) {
	var c = merge_color(global.colPurple, c_black, i / 10);
    draw_sprite_ext(sprPixel, 0, x, y+i, 4, 4, current_time / 10, c, 1);
}