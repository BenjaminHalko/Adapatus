/// @desc Initialize GUI

EnableLive;

// Scaling
toolbarBaseWidth = sprite_get_width(sToolbar);
toolbarBaseHeight = sprite_get_height(sToolbar);
toolbarXScale = ResWidth / toolbarBaseWidth;

// Elements
elementInHand = noone;
elementHovered = -1;
elementListXStart = 40;
usableElements = [];

UpdateUsableElements(levelData.allowedElements);