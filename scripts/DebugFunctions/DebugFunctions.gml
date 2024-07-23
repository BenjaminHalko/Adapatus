/// @desc	Shows a notification
/// @param	{string} text
function Notification(_text) {
	with(oDebug) {
		array_push(notifications, {text: _text, alpha: 3});	
	}
}