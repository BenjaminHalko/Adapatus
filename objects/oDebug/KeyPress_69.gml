/// @desc  Toggle Level Editor

global.inLevelEditor = !global.inLevelEditor;
Notification($"Editor: {global.inLevelEditor ? "On" : "Off"}");

if (global.inLevelEditor) {
	levelData.allowedElements = array_create_ext(ELEMENT.MAX, function(_index) { return _index; });
} else {
	levelData.allowedElements = [
		ELEMENT.BOX,
		ELEMENT.LONG_BOX,
		ELEMENT.WHEEL,
		ELEMENT.MOTORIZED_WHEEL,
		ELEMENT.WALL,
		ELEMENT.SPIKE,
	];
}

UpdateUsableElements(levelData.allowedElements);