enum ELEMENT {
	PLAYER,
	WALL
}

global.elementList = [];
global.elementList[ELEMENT.PLAYER] =		new ElementTypeConfig(oBall, "Player");
global.elementList[ELEMENT.WALL] =			new ElementTypeConfig(oWall, "Wall");