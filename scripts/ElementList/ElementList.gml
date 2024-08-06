enum ELEMENT {
	WHEEL,
	WALL,
	BOX,
	SPIKE,
	LONG_BOX,
	MOTORIZED_WHEEL,
	CRATE,
	SPRING,
	BALLOON,
	ROPE,
	
	MAX
}

global.elementSortList = [
	ELEMENT.ROPE,
	ELEMENT.WHEEL,
	ELEMENT.MOTORIZED_WHEEL,
	ELEMENT.BOX,
	ELEMENT.LONG_BOX,
	ELEMENT.CRATE,
	ELEMENT.WALL,
	ELEMENT.SPIKE,
	ELEMENT.SPRING
]

global.elementConfigList = [];
global.elementConfigList[ELEMENT.WHEEL] =			new ElementTypeConfig(oBall, "Wheel");
global.elementConfigList[ELEMENT.WALL] =			new ElementTypeConfig(oWall, "Wall");
global.elementConfigList[ELEMENT.BOX] =				new ElementTypeConfig(oBox, "Box");
global.elementConfigList[ELEMENT.SPIKE] =			new ElementTypeConfig(oSpike, "Spike");
global.elementConfigList[ELEMENT.LONG_BOX] =		new ElementTypeConfig(oLongBox, "Long Box");
global.elementConfigList[ELEMENT.MOTORIZED_WHEEL] =	new ElementTypeConfig(oMotorizedBall, "Motor Wheel");
global.elementConfigList[ELEMENT.CRATE] =			new ElementTypeConfig(oCrate, "Crate");
global.elementConfigList[ELEMENT.SPRING] =			new ElementTypeConfig(oSpring, "Spring");
global.elementConfigList[ELEMENT.ROPE] =			new ElementTypeConfig(oRopePlacable, "Rope");
