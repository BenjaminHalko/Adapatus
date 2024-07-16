enum ELEMENT {
	PLAYER,
	WALL
}

global.elementConfigList = [];
global.elementConfigList[ELEMENT.PLAYER] =		new ElementTypeConfig(oBall, "Player");
global.elementConfigList[ELEMENT.WALL] =		new ElementTypeConfig(oWall, "Wall");