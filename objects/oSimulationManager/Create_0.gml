/// @desc Initialize Level

testingTimer = 0;

global.drawPhysicsDebug = false;

// Create GUI
instance_create_layer(0, 0, "GUI", oToolbar);

// Load Level
LoadLevel("level");