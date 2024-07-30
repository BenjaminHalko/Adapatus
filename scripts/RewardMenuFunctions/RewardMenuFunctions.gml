/// @desc	Sets the rewards in the reward menu
/// @param	{array<array<any>>} rewards
function RewardMenuQueueRewards(_rewards) {
	live_auto_call
	
	var _rewardNum = array_length(_rewards);
	if (!instance_exists(oRewardMenu))
		instance_create_layer(0, 0, "GUI", oRewardMenu);
	
	with (oRewardMenu) {
		var _rewardWidgets = array_create(_rewardNum);
		var _rewardTypes = array_create(_rewardNum);
		
		for(var i = 0; i < _rewardNum; i++) {
			_rewardWidgets[i] = ElementRewardWindow(_rewards[i][0], _rewards[i][1]);
			_rewardTypes[i] = MenuText("Common");
		}
			
		var _menu = MenuContainer([
			[MenuText("Select something!")],
			_rewardWidgets,
			_rewardTypes
		], sWindowBG).UniformWidth([false, true, true]).Gap(6, 6).Padding(10, 6).Align(fa_center, fa_middle);
		array_push(menus, _menu);
	}
}