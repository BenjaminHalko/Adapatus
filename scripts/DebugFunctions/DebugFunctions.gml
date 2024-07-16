function Notification(_text) {
	with(oDebug) {
		array_push(notifications, {text: _text, alpha: 3});	
	}
}