/// @desc DESTROY!!!

if (other.isDestructable) {
	CreateExplosion(other.x, other.y, 64, 10);
	instance_destroy(other);
}