/// @desc 
/*
for(var _next = nextObject; instance_exists(_next); _next = _next.nextObject) {
	with(_next) {
		if (array_length(joints) == 2) {
			physics_joint_delete(joints[0]);
			physics_joint_delete(joints[1]);
			joints = [];
		}
	}
}

for(var _next = previousObject; instance_exists(_next); _next = _next.previousObject) {
	with(_next) {
		if (array_length(joints) == 2) {
			physics_joint_delete(joints[0]);
			physics_joint_delete(joints[1]);
			joints = [];
		}
	}
}