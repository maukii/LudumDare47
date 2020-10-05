enum game_states {
	start,
	playing,
	over
}

state = game_states.start;
overAlpha = 0;

scoreTextScale = 1;
scoreTextRot = 0;
jankScore = 0;

global.textHighlightColor = global.colPurple;
global.curScore = 0;

display_set_gui_size(viewWidth, viewHeight);