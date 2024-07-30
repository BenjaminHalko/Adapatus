/// @desc	A window for the GUI reward
/// @param	{enum.ELEMENT} element
/// @param	{real} quantity
function ElementRewardWindow(_element, _quantity) {
	var _sprite = sprite_get_name(sRewardElement) + string_repeat("Plus", _element % 3);
	return new __ElementRewardWindow(_element, _quantity, asset_get_index(_sprite));
}

/// @desc	The backend for the window thing
/// @param	{enum.ELEMENT} element
/// @param	{real} quantity
/// @param	{Asset.GMSprite} sprite
function __ElementRewardWindow(_element, _quantity, _sprite) : __ElementToolbarWindow(_element, _sprite) constructor {
	__quantity = _quantity;
	__animateYScale = false;
	
	var _tempText = ["Common", "Uncommon", "Rare"];
	__text = _tempText[_element % 3];
	
	__textWidth = StringWidth(__text);
	__textLabelBaseWidth = sprite_get_width(sRewardRarityLabel);
	
	__height += 6;
	
	__onHoverCurve = animcurve_get_channel(RewardWindowCurves, "onHoverScale");
	
	__fixScale = true;
	
	static CheckIfHoveredAndAnimate = function() {
		if (oRewardMenu.xScale > 0.8 and oRewardMenu.active) {
			CheckIfHovered();
			Animate();
		}
	}
	
	Step = CheckIfHoveredAndAnimate;
	Draw = DrawReward;
	
	__onClick = function() {
		global.elementQuantity[$ __type] += __quantity;
		AddUsableElement(__type);
		with(oRewardMenu) {
			active = false;	
			if (array_length(menus) == 1)
				done = true;
		}
	}
}

function DrawReward() {
	live_auto_call
	
	__yScale = lerp(1, 1.2, animcurve_channel_evaluate(__onHoverCurve, __hoveredPercent));
	
	__y -= floor(2 * __hoveredPercent);
	__height = __baseHeight;
	
	DrawElement(true, __quantity);
	
	
		
	// Draw Label
	var _x = round(__x + __width / 2);
	var _y = round(__y - __yOffset + __height + 1 + 7 * __hoveredPercent - 6 * sin(__burstEffect * pi));
	draw_sprite_ext(sRewardRarityLabel, 0, _x, _y, round((__textWidth + 6) / 2) / __textLabelBaseWidth * 2, 1, 0, c_white, __alpha);
	ScribbleExt(__text).align(fa_center, fa_middle).blend(c_white, __alpha).draw(_x, _y - 2);	
	
	__height = __baseHeight + 60;
}