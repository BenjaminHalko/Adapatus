/// @desc Draw Notifications

draw_set_font(fFont);
draw_set_color(c_white);
var _notificationsX = 8;
var _notificationsY = 8;
for(var i = 0; i < array_length(notifications); i++) {
	draw_set_alpha(notifications[i].alpha);
	draw_text(_notificationsX, _notificationsY, notifications[i].text);
	_notificationsY += 8;
}
draw_set_alpha(1);