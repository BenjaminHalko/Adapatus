/// @desc Default Entity Config

EnableLive;

persistent = true;

isUnlocked = false;
levelDataPos = array_length(global.placedElements);

// Store if the mouse is hovering over the element
isHovered = false;

// Dragging
dragXOffset = 0;
dragYOffset = 0;
dragRotationOffset = 0;
lastDragPositionX = 0;
lastDragPositionY = 0;

// Joints
joints = [];

// Snaps
snapPoints = [];