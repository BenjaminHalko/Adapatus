/// @desc Start / Stop Simulation

if (global.gameState == GameState.EDITING_ELEMENT)
	exit;

if (global.gameState == GameState.SIMULATION)
	SimulationReset();
else
	SimulationStart();