/// @desc Notifications

for(var i = 0; i < array_length(notifications); i++) {
	notifications[i].alpha -= 0.05;
	if (notifications[i].alpha <= 0) {
		array_delete(notifications, i, 1);
		i--;
	}
}