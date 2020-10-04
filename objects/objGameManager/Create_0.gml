enum game_states {
	start,
	playing,
	over
}

state = game_states.playing;
overAlpha = 0;
global.curScore = 0;

display_set_gui_size(viewWidth, viewHeight);