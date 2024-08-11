/// @desc Transition

transitionPercent = Approach(transitionPercent, fadingOut, spd);
global.transitionFade = 1 - round(transitionPercent * 8) / 8;

if (fadingOut) {
	if (transitionPercent == 1 and --wait <= 0) {
		fadingOut = false;
		room_goto(roomTo);
		global.colorPalette += 1;
	}
} else {
	if (transitionPercent == 0) {
		global.transitionFade = 1;
		instance_destroy();
	}
}
