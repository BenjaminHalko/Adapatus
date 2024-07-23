/// @desc  Toggle Level Editor

EnableLive;

global.inLevelEditor = !global.inLevelEditor;
Notification($"Editor: {global.inLevelEditor ? "On" : "Off"}");

if (global.inLevelEditor) {
	levelData.allowedElements = {};
	for(var i = 0; i < ELEMENT.MAX; i++)
		levelData.allowedElements[$ i] = infinity;
} else {
	levelData.allowedElements = {};
	levelData.allowedElements[$ ELEMENT.BOX] = 5;
	levelData.allowedElements[$ ELEMENT.LONG_BOX] = 10;
	levelData.allowedElements[$ ELEMENT.SPIKE] = 1;
	levelData.allowedElements[$ ELEMENT.WHEEL] = 4;
	levelData.allowedElements[$ ELEMENT.MOTORIZED_WHEEL] = 2;
	levelData.allowedElements[$ ELEMENT.WALL] = 5;
}

UpdateUsableElements(levelData.allowedElements);