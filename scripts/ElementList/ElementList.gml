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
	ELEMENT.SPRING,
	ELEMENT.WHEEL,
	ELEMENT.SPIKE,
	ELEMENT.WALL,
	
	ELEMENT.BOX,
	ELEMENT.LONG_BOX,
	ELEMENT.CRATE,
	ELEMENT.MOTORIZED_WHEEL,
	
	
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
global.elementConfigList[ELEMENT.ROPE] =			new ElementTypeConfig(oRopePlacable, "Rope", ["x2", "y2"]);
global.elementConfigList[ELEMENT.BALLOON] =			new ElementTypeConfig(oBalloon, "Balloon");
