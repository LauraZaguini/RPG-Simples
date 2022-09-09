/// @description 

var x1 = x - sprite_xoffset - sprite_width / 2;
var y1 = y - sprite_yoffset - sprite_height / 2;
var x2 = x1 + sprite_width + sprite_width;
var y2 = y1 + sprite_height + sprite_height;

draw_self();

draw_rectangle(x1, y1, x2, y2, true);