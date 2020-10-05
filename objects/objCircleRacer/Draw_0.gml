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


for (var i = 0; i < hp; ++i) {
	var space = 32;
	draw_sprite_ext(sprHeart, 0,  space/2 + i * space, room_height - space / 2, scrWave(0.03, 0.05, 1, 0), scrWave(0.03, 0.05, 1, 0), scrWave(-10, 10, 2, i/3), c_white, 1);
}