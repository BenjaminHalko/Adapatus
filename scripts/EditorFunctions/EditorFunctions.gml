enum EDITOR_TOOL {
	MOVE,
	ROTATE
}

global.editorTool = EDITOR_TOOL.MOVE;
global.elementInteracting = noone;

function LoadLevelEditor() {
	global.inLevelEditor = true;
	var _tempAllowedElements = {};
	for(var i = 0; i < ELEMENT.MAX; i++)
		_tempAllowedElements[$ i] = infinity;
	UpdateUsableElements(_tempAllowedElements);
}

function ExitLevelEditor() {
	global.inLevelEditor = false;
	UpdateUsableElements(levelData.elementQuantity);
}