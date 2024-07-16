/// @desc  Toggle Level Editor

global.inLevelEditor = !global.inLevelEditor;
Notification($"Editor: {global.inLevelEditor ? "On" : "Off"}");