/// @desc Default Entity Config

EnableLive;

isUnlocked = false
levelDataPos = array_length(levelData.elements);

// Start off frozen
phy_active = false;

// Store if the mouse is hovering over the element
isHovered = false;
isPickedUp = false;

// Collision
isColliding = false;
collisionSurfaceW = 0;
collisionSurfaceH = 0;
collisionSurface = -1;

// Dragging
dragXOffset = 0;
dragYOffset = 0;
initialLayer = layer;
