/// @desc Draw Window

EnableLive;

draw_set_color(c_black);
draw_set_alpha(max(bgAlpha-0.6, 0));
draw_rectangle(0, 0, ResWidth, ResHeight, false);
draw_set_alpha(1);

var _width = lerp(textboxMinWidth, textboxWidth, xScale);
draw_sprite_ext(sWindowBG, 0, ResWidth / 2 - _width / 2, y - textboxHeight / 2, _width / textboxBaseSize, textboxHeight / textboxBaseSize, 0, c_white, alpha);

for (var i = 0; i < array_length(choiceQueue[0]); i++) {
	var _info = choiceQueue[0][i];
	_info.window.Draw(x + _info.x * xScale - (_info.window.width / 2-1), y - _info.window.height / 2 + 1, elementHovered == i, _info.quantity, true, alpha);
}