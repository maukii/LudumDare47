if (erect) {
	draw_self();
} else {
	draw_sprite_ext(sprPixel, 0, drawX, drawY, image_xscale, image_yscale, image_angle, c_white, 1);
	
	draw_sprite_ext(sprPixel, 0, drawX, drawY, maxImageScale, maxImageScale, image_angle, c_red, scrWave(0.1, 0.5, 1, 0));
}