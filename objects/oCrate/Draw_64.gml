/// @desc Draw Counter

event_inherited();

if (progressAlpha != 0) {
	DrawProgressBar(x, y - 30, 30 * (1 - animcurve_channel_evaluate(progressOutCurve, progressSucceeded)), objectInBasket, progressAlpha);	
}
