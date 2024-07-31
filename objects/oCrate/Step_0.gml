/// @desc Detect object in crate

// Inherit the parent event
event_inherited();

var _hasDetected = false;
if (instance_exists(objectToDetect)) {
	if (place_meeting(x, y, objectToDetect)) {
		_hasDetected = true;
	}
}

if (_hasDetected) {
	objectInBasket = Approach(objectInBasket, 1, 0.5/60);
	progressAlpha = 1;
	if (objectInBasket == 1)
		progressSucceeded = Approach(progressSucceeded, 1, 0.05);
} else {
	progressSucceeded = 0;
	objectInBasket = Approach(objectInBasket, 0, 4/60);
	if (objectInBasket == 0)
		progressAlpha = Approach(progressAlpha, 0, 0.1);
}