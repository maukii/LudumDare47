shader_set(shdSpiral);
shader_set_uniform_f(uniform_resolution, room_width, room_height);
shader_set_uniform_f(uniform_time, current_time);

if (surface_exists(backSurf)) {
	draw_surface(backSurf, -room_width/2, -room_height/2);
} else {
	backSurf = surface_create(room_width * 2, room_height * 2);
}
shader_reset();