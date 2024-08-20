/// @desc Setup Flameable Area

flameTriggered = false;

distOffset = point_distance(x, y, creator.x, creator.y);
dirOffset = point_direction(x, y, creator.x, creator.y);
creatorAngleStart = creator.image_angle;
myAngleStart = image_angle;