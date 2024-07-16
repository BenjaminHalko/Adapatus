enum ELEMENT {
	PLAYER,
	WALL,
	BOX,
	SPIKE,
	LONG_BOX
}

global.elementConfigList = [];
global.elementConfigList[ELEMENT.PLAYER] =		new ElementTypeConfig(oBall, "Player");
global.elementConfigList[ELEMENT.WALL] =		new ElementTypeConfig(oWall, "Wall");
global.elementConfigList[ELEMENT.BOX] =			new ElementTypeConfig(oBox, "Box");
global.elementConfigList[ELEMENT.SPIKE] =		new ElementTypeConfig(oSpike, "Spike");
global.elementConfigList[ELEMENT.LONG_BOX] =	new ElementTypeConfig(oLongBox, "Long Box");
