global.goals = [
	//new Goal_ElementInCrate()
];

function NextRound() {
	with (pElement) {
		isUnlocked = false;
		EditElement(id);
	}
}

function GoalsOnSimulationReset() {
	array_foreach(global.goals, function(_goal) { _goal.OnReset(); });	
}