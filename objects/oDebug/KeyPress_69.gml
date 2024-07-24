/// @desc  Toggle Level Editor

EnableLive;

if (global.inLevelEditor) {
	ExitLevelEditor();
} else {
	LoadLevelEditor();
}