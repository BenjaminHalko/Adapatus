/// @desc Create Goals

if (global.gameState == GameState.IDLE) {
	RewardMenuQueueRewards([
		[ELEMENT.BOX, 2],
		[ELEMENT.LONG_BOX, 10],
		[ELEMENT.MOTORIZED_WHEEL, 4],
	]);
	RewardMenuQueueRewards([
		[ELEMENT.WALL, 1],
		[ELEMENT.WHEEL, 1],
		[ELEMENT.SPIKE, 1],
	]);	
}