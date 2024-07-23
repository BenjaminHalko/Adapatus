/// @desc Start / Stop Simulation

if (global.elementInteracting)
	exit;

if (global.simulationActive)
	SimulationReset();
else
	SimulationStart();