/// @desc Returns a value that will wave back and forth between [from-to] over [duration] seconds
/// @param {Real} from The minimum wave range
/// @param {Real} to The maximum wave range
/// @param {Real} duration The duration of the wave in seconds
/// @param {Real} offset The offset of the wave from 0 to 1
/// @return {Real}
function WaveTime(_from, _to, _duration, _offset) {
	var a4 = (_to - _from) * 0.5;
	return _from + a4 + sin((((current_time * 0.001) + _duration * _offset) / _duration) * (pi*2)) * a4;
}

/// @desc Returns a value that will wave back and forth between [from-to] over [duration] seconds
/// @param {Real} from The minimum wave range
/// @param {Real} to The maximum wave range
/// @param {Real} duration The duration of the wave in seconds
/// @param {Real} offset The offset of the wave from 0 to 1
/// @param {Bool} [ignoreDeltaTime] Ignores deltatime
function Wave(_from, _to, _duration, _offset, _ignoreDeltaTime=false) constructor {
	static step = function() {
		time += 1/60;
		var _a4 = (to - from) * 0.5;
		value = from + _a4 + sin(((time + duration * offset) / duration) * (pi*2)) * _a4;
	}
	
	from = _from;
	to = _to;
	duration = _duration;
	offset = _offset;
	ignoreDeltaTime = _ignoreDeltaTime;
	time = 0;
	var _a4 = (to - from) * 0.5;
	value = from + _a4 + sin(((duration * offset) / duration) * (pi*2)) * _a4;
}