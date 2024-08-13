/// @desc Delete Joints

array_foreach(joints, function(_joint) { _joint.Destroy(); });