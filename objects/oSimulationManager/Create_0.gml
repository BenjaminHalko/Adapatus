/// @desc Initialize Level

globalvar levelData;
levelData = new LevelSaveData();
levelData.allowedElements = [
	ELEMENT.BOX,
	ELEMENT.LONG_BOX,
	ELEMENT.WHEEL,
	ELEMENT.MOTORIZED_WHEEL,
	ELEMENT.WALL,
	ELEMENT.SPIKE
];

SimulationReset();

testingTimer = 0;

// Create GUI
instance_create_layer(0, 0, "GUI", oToolbar);