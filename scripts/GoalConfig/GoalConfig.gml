function Goal_ElementInCrate() : __GoalConfig() constructor {
	__isGoalUsable = function() {
		return instance_exists(oCrate);	
	}
	
	__setup = function() {
		__targetElement = new ElementGoal(SelectRandomElement(ELEMENT.CRATE));
		array_push(__subElements, new ElementGoal(0));
	}
	
	__onReset = function() {
		with(__targetElement.id) {
			objectToDetect = other.__subElements[0].id;
		}
	}
	
	__checkComplete = function() {
		return real(__targetElement.id.objectInBasket >= 1);	
	}
}

/// @param	{real} levelDataPos
function ElementGoal(_levelDataPos) constructor {
	levelDataPos = _levelDataPos;
	id = noone;
}

function __GoalConfig() constructor {
	__targetElement = undefined;
	__subElements = [];
	
	__isGoalUsable = undefined;
	__onReset = undefined;
	__setup = undefined;
	__checkComplete = undefined;
	
	/// @return	{bool}
	static IsGoalUsable = function() {
		return __isGoalUsable();	
	}
	
	static OnReset = function() {
		if (is_undefined(__targetElement))
			__setup();
			
		__targetElement.id = GetElementID(__targetElement.levelDataPos);
		for(var i = 0; i < array_length(__subElements); i++)
			__subElements[i].id = GetElementID(__subElements[i].levelDataPos);
		
		if (!is_undefined(__onReset))
			__onReset();
	};
	
	static CheckComplete = function() {
		var _result = __checkComplete();
	}
}