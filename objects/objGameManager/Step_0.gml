scoreTextScale = lerp(scoreTextScale, 1, 0.1);
scoreTextRot = lerp(scoreTextRot, 0, 0.1);

if (jankScore != global.curScore) {
	scoreTextRot = irandom_range(-10, 10);
	scoreTextScale = 2;
	
	jankScore = global.curScore;
}