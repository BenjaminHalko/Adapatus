/// @desc Initialize Level

globalvar levelData;
levelData = new LevelSaveData();
levelData.allowedElements = {};
levelData.allowedElements[$ ELEMENT.BOX] = 5;
levelData.allowedElements[$ ELEMENT.LONG_BOX] = 10;
levelData.allowedElements[$ ELEMENT.SPIKE] = 1;
levelData.allowedElements[$ ELEMENT.WHEEL] = 4;
levelData.allowedElements[$ ELEMENT.MOTORIZED_WHEEL] = 2;
levelData.allowedElements[$ ELEMENT.WALL] = 5;

SimulationReset();

testingTimer = 0;

// Create GUI
instance_create_layer(0, 0, "GUI", oToolbar);