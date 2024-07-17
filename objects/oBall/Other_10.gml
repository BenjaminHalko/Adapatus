/// @desc Check Binding

var _list = ds_list_create();
var _num = instance_position_list(x, y, pElement, _list, false);

for(var i = 0; i < _num; i++) {
	if (_list[| i] != id) {
		bindPercent = 1;
		break;
	}
}

ds_list_destroy(_list);
