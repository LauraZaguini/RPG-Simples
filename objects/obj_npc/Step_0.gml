/// @description 

var x1 = x - sprite_xoffset - sprite_width / 2;
var y1 = y - sprite_yoffset - sprite_height / 2;
var x2 = x1 + sprite_width + sprite_width;
var y2 = y1 + sprite_height + sprite_height;

var alcance = collision_rectangle(x1, y1, x2, y2, obj_player, false, true);


if(alcance){
	if(place_meeting(x, y, obj_player)){
		if(keyboard_check_pressed(vk_space)){
			//Criando o texto
			var texto = instance_create_layer(0, 0, "Level", obj_texto);
			texto.text = txt[0];
		}
	}	
}
