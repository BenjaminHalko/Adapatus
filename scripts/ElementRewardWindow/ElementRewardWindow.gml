/// @desc	A window for the GUI reward
/// @param	{enum.ELEMENT} element
/// @param	{real} quantity
function ElementRewardWindow(_element, _quantity) {
	return new __ElementRewardWindow(_element, _quantity, sRewardElement);
}

/// @desc	The backend for the window thing
/// @param	{enum.ELEMENT} element
/// @param	{real} quantity
/// @param	{Asset.GMSprite} sprite
function __ElementRewardWindow(_element, _quantity, _sprite) : __ElementToolbarWindow(_element, _sprite) constructor {
	__quantity = _quantity;
	__animateYScale = false;
}