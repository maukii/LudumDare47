drawIndex = scrApproach(drawIndex, 5, 1);

 if (drawIndex < 2) {
	 alarm[1] = incrementTimer;
 } else {
	 alarm[1] = 30;
 }

if (drawIndex == 1) {
	audio_play_sound(sndDamage, 10, false);
} else if (drawIndex == 2) {
	devsText += "Kirstu";
	audio_play_sound(sndDamage3, 10, false);
} else if (drawIndex == 3) {
	devsText += "\nmaukii";
	audio_play_sound(sndSpit, 10, false);
} else if (drawIndex == 4) {
	devsText += "\ntams";
	audio_play_sound(sndDamage4, 10, false);
}