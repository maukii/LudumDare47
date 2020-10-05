scoreTextScale = lerp(scoreTextScale, 1, 0.1);
scoreTextRot = lerp(scoreTextRot, 0, 0.1);

if (jankScore != global.curScore) {
	scoreTextRot = irandom_range(-20, 20);
	scoreTextScale = 4;
	
	jankScore = global.curScore;
}