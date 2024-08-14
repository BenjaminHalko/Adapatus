/// @desc Default Entity Config

EnableLive;

persistent = true;

isUnlocked = false;
levelDataPos = array_length(global.placedElements);

// Texel Size
var _tex = sprite_get_texture(sprite_index, 0);
texelWidth = texture_get_texel_width(_tex);
texelHeight = texture_get_texel_height(_tex);
uvs = [];
array_copy(uvs, 0, texture_get_uvs(_tex), 0, 4);

// Store if the mouse is hovering over the element
isHovered = false;

// Dragging
dragXOffset = 0;
dragYOffset = 0;
dragRotationOffset = 0;
lastDragPositionX = 0;
lastDragPositionY = 0;
dragWave = new Wave(0, 1, 1, -0.2);

// Joints
joints = [];

// Snaps
snapPoints = [];