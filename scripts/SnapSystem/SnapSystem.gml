#macro SNAP_DIST 3

global.snapList = [];

/// @param	{real} x
/// @param	{real} y
function SnapPoint(_x, _y) {
	array_push(snapPoints, new __SnapPoint(_x, _y));
}

/// @desc	Represents a point that you can snap to
/// @param	{real} x
/// @param	{real} y
function __SnapPoint(_x, _y) constructor {
	__x = _x;
	__y = _y;
	__parent = other.id;
	
	static GetPos = function() {
		var _vector = RotateVector(__x, __y, __parent.image_angle);
		return {
			x: __parent.x + _vector.x,
			y: __parent.y + _vector.y
		}
	}
	
	/// @param	{real} x
	/// @param	{real} y
	/// @return	{bool}
	static CanSnap = function(_x, _y) {
		var _pos = GetPos();
		return point_distance(_x, _y, _pos.x, _pos.y) < SNAP_DIST + 4;
	}
	
	/// @return	{struct}
	static Snap = function() {
		return GetPos();
	}
}

/// @param	{real} x1
/// @param	{real} y1
/// @param	{real} x1
/// @param	{real} y2
function SnapLine(_x1, _y1, _x2, _y2) {
	array_push(snapPoints, new __SnapLine(_x1, _y1, _x2, _y2));
}

/// @desc	Represents a line that you can snap to
/// @param	{real} x1
/// @param	{real} y1
/// @param	{real} x1
/// @param	{real} y2
function __SnapLine(_x1, _y1, _x2, _y2) constructor {
    __x1 = _x1;
    __y1 = _y1;
    __x2 = _x2;
    __y2 = _y2;
    __parent = other.id;

    /// @return {struct} - The rotated and translated positions of the line's endpoints
    static GetPos = function() {
        var _vector1 = RotateVector(__x1, __y1, __parent.image_angle);
        var _vector2 = RotateVector(__x2, __y2, __parent.image_angle);
        return {
            x1: __parent.x + _vector1.x,
            y1: __parent.y + _vector1.y,
            x2: __parent.x + _vector2.x,
            y2: __parent.y + _vector2.y
        };
    }

    /// @param  {real} x
    /// @param  {real} y
    /// @return {bool}
    static CanSnap = function(_x, _y) {
        var _pos = GetPos();

        // Find the closest point on the line to the given point
        var _px, _py;
        var _denominator = sqr(_pos.x2 - _pos.x1) + sqr(_pos.y2 - _pos.y1);
        if (_denominator == 0) {
            _px = _pos.x1;
            _py = _pos.y1;
        } else {
            var _t = ((_x - _pos.x1) * (_pos.x2 - _pos.x1) + (_y - _pos.y1) * (_pos.y2 - _pos.y1)) / _denominator;
            _t = clamp(_t, 0, 1); // Clamp to line segment
            _px = _pos.x1 + _t * (_pos.x2 - _pos.x1);
            _py = _pos.y1 + _t * (_pos.y2 - _pos.y1);
        }

        // Check if within snap distance
        return point_distance(_x, _y, _px, _py) < SNAP_DIST;
    }

    /// @param  {real} x
    /// @param  {real} y
    /// @return {struct}
    static Snap = function(_x, _y) {
        var _pos = GetPos();

        // Find the closest point on the line to the given point
        var _px, _py;
        var _denominator = sqr(_pos.x2 - _pos.x1) + sqr(_pos.y2 - _pos.y1);
        if (_denominator == 0) {
            _px = _pos.x1;
            _py = _pos.y1;
        } else {
            var _t = ((_x - _pos.x1) * (_pos.x2 - _pos.x1) + (_y - _pos.y1) * (_pos.y2 - _pos.y1)) / _denominator;
            _t = clamp(_t, 0, 1); // Clamp to line segment
            _px = _pos.x1 + _t * (_pos.x2 - _pos.x1);
            _py = _pos.y1 + _t * (_pos.y2 - _pos.y1);
        }

        // Return snapped position
        return {
            x: _px,
            y: _py
        };
    }
}

/// @desc Find the intersection of two lines (if any)
/// @param {real} x1, y1, x2, y2 - Coordinates of the first line
/// @param {real} x3, y3, x4, y4 - Coordinates of the second line
/// @return {struct.__SnapPoint|undefined} - Intersection point if lines intersect, otherwise undefined
function GetLineIntersection(_x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4) {
    var _denominator = (_y4 - _y3) * (_x2 - _x1) - (_x4 - _x3) * (_y2 - _y1);
    if (_denominator == 0) {
        return undefined; // Lines are parallel or coincident
    }
    
    var _ua = ((_x4 - _x3) * (_y1 - _y3) - (_y4 - _y3) * (_x1 - _x3)) / _denominator;
    var _ub = ((_x2 - _x1) * (_y1 - _y3) - (_y2 - _y1) * (_x1 - _x3)) / _denominator;
    
    if (_ua >= 0 && _ua <= 1 && _ub >= 0 && _ub <= 1) {
        // The lines intersect within the segments
        var _intersectionX = _x1 + _ua * (_x2 - _x1);
        var _intersectionY = _y1 + _ua * (_y2 - _y1);
        return new __SnapPoint(_intersectionX, _intersectionY);
    } else {
        return undefined; // Lines do not intersect within the segments
    }
}

function CollectAllSnaps() {
    global.snapList = [];
    with (pElement) {
        // Collect all snap points
        for (var i = 0; i < array_length(snapPoints); i++)
            array_push(global.snapList, snapPoints[i]);
        
        // Check for line intersections and add intersection points to global.snapList
        for (var i = 0; i < array_length(snapPoints); i++) {
            var _line1 = snapPoints[i];
            if (is_instanceof(_line1, __SnapLine)) { // Check if snapPoint[i] is a line
                for (var j = i + 1; j < array_length(snapPoints); j++) {
                    var _line2 = snapPoints[j];
                    if (is_instanceof(_line2, __SnapLine)) { // Check if snapPoint[j] is a line
                        var _intersection = GetLineIntersection(
                            _line1.__x1, _line1.__y1, _line1.__x2, _line1.__y2,
                            _line2.__x1, _line2.__y1, _line2.__x2, _line2.__y2
                        );
                        if (!is_undefined(_intersection)) {
                            array_push(global.snapList, _intersection);
                        }
                    }
                }
            }
        }
    }
	
	array_sort(global.snapList, function(_a, _b) {
		return is_instanceof(_b, SnapPoint) - is_instanceof(_a, SnapPoint);
	});
}

/// @param  {real} x
/// @param  {real} y
/// @return {struct|undefined}
function SnapToPoint(_x, _y) {
	for (var i = 0; i < array_length(global.snapList); i++) {
		var _snap = global.snapList[i];
		
		if (!_snap.CanSnap(_x, _y))
			continue;
			
		var _pos = _snap.Snap(_x, _y);
		
		return {
			x: _pos.x,
			y: _pos.y,
			snap: _snap
		};
	}
	
	return undefined;
}