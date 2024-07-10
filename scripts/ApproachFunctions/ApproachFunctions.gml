/// @desc Moves "a" towards "b" by "amount" and returns the result
/// @param {Real} a The value to change
/// @param {Real} b The target value
/// @param {Real} amount The amount to move by
/// @return {Real}
function Approach(_a, _b, _amount) {
	if (_a < _b) {
		_a += _amount;
	    if (_a > _b)
	        return _b;
	} else {
	    _a -= _amount;
	    if (_a < _b)
	        return _b;
	}
	return _a;
}

/// @desc Moves a value to a target value with easing.
/// @param {Real} Value The target value
/// @param {Real} Target The target value
/// @param {Real} MaxSpd The maximum speed
/// @param {Real} Ease The ease amount from 0 - 1
/// @return {Real}
function ApproachEase(_value,_target,_maxSpd,_ease) {
	_value += median(-_maxSpd, _maxSpd, (1-_ease) * (_target - _value));
    return _value;
}

/// @desc Moves a value to a target value with easing, used for circles
/// @param {Real} Value The target value
/// @param {Real} Target The target value
/// @param {Real} MaxSpd The maximum speed
/// @param {Real} Ease The ease amount from 0 - 1
/// @return {Real}
function ApproachEaseCircle(_value,_target,_maxSpd,_ease) {
	_value += median(-_maxSpd,_maxSpd,(1-_ease)*angle_difference(_target,_value));
	return _value;
}