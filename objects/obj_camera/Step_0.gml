/// @description 

switch(modo){
	case "normal":{
		
		taman_cam = lerp(taman_cam, 1, .05);
		
		camera_set_view_size(view_camera[0], camera_w_inicio * taman_cam, camera_h_inicio * taman_cam);
		
		x = lerp(x, alvo.x, vel);
		y = lerp(y, alvo.y, vel);
		
		if(instance_exists(obj_player)){
			alvo = obj_player;	
		}
		break;
	}
	
	case "mira":{
				
		taman_cam = lerp(taman_cam, 1.5, .05);
		
		camera_set_view_size(view_camera[0], camera_w_inicio * taman_cam, camera_h_inicio * taman_cam);
		
		break;	
	}
}