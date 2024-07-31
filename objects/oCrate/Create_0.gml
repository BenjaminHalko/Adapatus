/// @desc Setup Goal

// Inherit the parent event
event_inherited();

objectToDetect = noone;
objectInBasket = 0;
progressAlpha = 0;
progressSucceeded = 0;
progressOutCurve = animcurve_get_channel(ProgressBarCurves, "barOut");