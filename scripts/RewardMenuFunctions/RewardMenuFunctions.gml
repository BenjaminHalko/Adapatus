/// @desc	Sets the rewards in the reward menu
/// @param	{array<array<any>>} rewards
function RewardMenuQueueRewards(_rewards) {
	live_auto_call
	
	var _rewardNum = array_length(_rewards);
	if (!instance_exists(oRewardMenu))
		instance_create_layer(0, 0, "GUI", oRewardMenu);
	
	with (oRewardMenu) {
		var _rewardQueue = [];
		textboxWidth = 0;
		textboxHeight = 0;
		textboxMinWidth = 0;
		
		for (var i = 0; i < _rewardNum; i++) {
			var _info = _rewards[i];	
			var _window = ElementRewardWindow(_info[0], _info[1]);
			textboxHeight = max(textboxHeight, _window.__height);
			textboxMinWidth = max(textboxMinWidth, _window.__width);
			textboxWidth += _window.__width;
			
			array_push(_rewardQueue, _window);
		}
		
		textboxWidth += (_rewardNum - 1) * itemSpacing;
		
		var _x = - textboxWidth / 2;
		for (var i = 0; i < _rewardNum; i++) {
			_x += _rewardQueue[i].__width / 2;
			_rewardQueue[i].Pos(ResWidth/2 + _x, ResHeight / 2);
			_x += _rewardQueue[i].__width / 2 + itemSpacing;
		}
		
		textboxWidth += textboxMarginX * 2;
		textboxMinWidth += textboxMarginX * 2;
		textboxHeight += textboxMarginY * 2;
		
		array_push(choiceQueue, _rewardQueue);
	}
}