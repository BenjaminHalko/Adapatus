enum ELEMENT {
	WHEEL,
	WALL,
	BOX,
	SPIKE,
	LONG_BOX,
	MOTORIZED_WHEEL,
	
	MAX
}

global.elementConfigList = [];
global.elementConfigList[ELEMENT.WHEEL] =			new ElementTypeConfig(oBall, "Wheel");
global.elementConfigList[ELEMENT.WALL] =			new ElementTypeConfig(oWall, "Wall");
global.elementConfigList[ELEMENT.BOX] =				new ElementTypeConfig(oBox, "Box");
global.elementConfigList[ELEMENT.SPIKE] =			new ElementTypeConfig(oSpike, "Spike");
global.elementConfigList[ELEMENT.LONG_BOX] =		new ElementTypeConfig(oLongBox, "Long Box");
global.elementConfigList[ELEMENT.MOTORIZED_WHEEL] =	new ElementTypeConfig(oMotorizedBall, "Motor Wheel");
