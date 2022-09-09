/// @description 

alvo = self;
modo = "normal";
vel = .1;

camera_w_inicio = camera_get_view_width(view_camera[0]);
camera_h_inicio = camera_get_view_height(view_camera[0]);

taman_cam = 1;

if(instance_exists(obj_player)){
	x = obj_player.x;
	y = obj_player.y;
}