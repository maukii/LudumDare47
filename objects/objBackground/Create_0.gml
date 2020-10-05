backSurf = surface_create(room_width * 2, room_height * 2);

uniform_resolution = shader_get_uniform(shdSpiral, "iResolution");
uniform_time = shader_get_uniform(shdSpiral, "time");
uniform_timeMultiplier = shader_get_uniform(shdSpiral, "timeMultiplier");
uniform_white = shader_get_uniform(shdSpiral, "white");
uniform_black = shader_get_uniform(shdSpiral, "black");

timeMultiplier = 1;
white = array_create(3, 0);

rTarget = 0.1;
gTarget = 0.1;
bTarget = 0.1;
