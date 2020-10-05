audio_play_sound(sndBlop, 10, false);
audio_play_sound(sndCry, 10, false);

var heartPiece = instance_create_layer(x, y, "Enemies", objHeartPiece);
heartPiece.hsp = -1;
heartPiece.vsp = -2;

heartPiece = instance_create_layer(x, y, "Enemies", objHeartPiece);
heartPiece.hsp = 1;
heartPiece.vsp = -3;
heartPiece.image_index = 1;

instance_destroy();