/// @desc Lock All

global.colorPaletteInvert = !global.colorPaletteInvert;
SimulationReset();

with (pElement) {
	isUnlocked = false;
	EditElement(id);
}
