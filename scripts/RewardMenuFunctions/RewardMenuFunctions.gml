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
			var _window = new ElementToolbarWindow(_info[0], sRewardElement);
			textboxHeight = max(textboxHeight, _window.height);
			textboxMinWidth = max(textboxMinWidth, _window.width);
			textboxWidth += _window.width;
			
			array_push(_rewardQueue, {
				quantity: _info[1],
				window: _window,
				x: 0
			});
		}
		
		textboxWidth += (_rewardNum - 1) * itemSpacing;
		
		var _x = - textboxWidth / 2;
		for (var i = 0; i < _rewardNum; i++) {
			_x += _rewardQueue[i].window.width / 2;
			_rewardQueue[i].x = _x;
			_x += _rewardQueue[i].window.width / 2 + itemSpacing;
		}
		
		textboxWidth += textboxMarginX * 2;
		textboxMinWidth += textboxMarginX * 2;
		textboxHeight += textboxMarginY * 2;
		
		array_push(choiceQueue, _rewardQueue);
	}
}