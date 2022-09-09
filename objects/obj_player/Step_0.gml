/// @description 


var up, left, right, down, vel_h, vel_v, desli, atak;

up			= keyboard_check(vk_up);
down		= keyboard_check(vk_down);
left			= keyboard_check(vk_left);
right		= keyboard_check(vk_right);
atak		= keyboard_check_pressed(ord("Z"));

if(up) face = 1;
if(down) face = 3;
if(left) face = 2;
if(right) face = 0;

if(place_meeting(x, y, obj_gelo)){
	desli = des_g;
}else {
	desli = des_n;	
}

//Ajustando a imagem_xscale
if(velh != 0){
	image_xscale = sign(velh) * -1;
}

vel_h = (right - left) * vel; 
vel_v = (down - up) * vel; 

switch(estado){
	case "parado":{
		velh = 0;
		velv = 0;
		
		image_index = 0;
		image_speed = 0;
		
		if(vel_v != 0 || vel_h != 0) estado = "movendo";
		if(atak){
			estado = "ataque";	
		}
		break;
	}
	
	case "movendo":{
		velv = lerp(velv, vel_v, desli);	
		velh = lerp(velh, vel_h, desli);
		
		image_speed = 1;
		
		//Animação
		//Checando se eu estou indo para cima
		if(face == 0 || face == 2){//Estou subindo
			sprite_index = esq;
		}else if(face == 3){
			sprite_index = baixo;
		}else if(face == 1){
			sprite_index = cima;	
		}
		
		if(abs(velh) < 0.5 && abs(velv) < 0.5) estado = "parado";
		if(atak) estado = "ataque";
		break;
	}
	case "ataque":{
		velh = 0;
		velv = 0;
		
		image_speed = 1;
		if(atacan == false){
			//Definindo qual o meu dano, com base na minha arma
			dano = global.item_index[# arma, item_stat.dano];
			
			
			sprite_antiga = sprite_index;
			image_index = 0;
			
			//Criar o objeto de dano
			var xx = (x - sprite_xoffset) + sprite_width / 2;//Estou no meio da sprite
			var yy = (y - sprite_yoffset) + sprite_height / 2;//Estou no meio da sprite
			
			xx += lengthdir_x(sprite_get_width(spr_player) / 2, face * 90);
			yy += lengthdir_y(sprite_get_width(spr_player) /2, face * 90);
			
			var hitbox =	instance_create_layer(xx, yy, "Instances", obj_hitbox);
			hitbox.dano = dano;
			hitbox.dire = face * 90;
		}
		
		
		
		atacan = true;	
		
		if(face == 3){
			sprite_index = spr_baixo_ataque;	
		}else if(face == 1){
			sprite_index = spr_cima_ataque;
		}else if(face == 2 || face == 0){
			sprite_index = spr_esquerda_ataque;	
		}
		
		//Se eu completei a animação, eu termino o ataque
		if(image_index > image_number - 1){
			atacan = false;	
		}
		
		if(!atacan) {
			
			sprite_index = sprite_antiga;
			estado = "parado"
		}
		break;
		
	}
	case "dano": {
			
			espera_dano--;
			image_blend = c_red;
			velv = 0;
			velh = 0;
			
			if(espera_dano <= 0){
				estado = "parado";
				espera_dano = room_speed / 4;
				image_blend = c_white;
			}
			
			break;
	}
}

//Checando colisão horizontal
if(place_meeting(x + velh, y, obj_block)){
	//Se estou colidindo
	while(!place_meeting(x + sign(velh), y, obj_block)){
		x += sign(velh);
	}
	//Terminei o laço de repetição e estou na parede horizontal
	velh = 0;
}

//Checando colisão vertical
if(place_meeting(x, y + velv, obj_block)){
	//Se estou tocando
	while(!place_meeting(x, y + sign(velv), obj_block)){
		y += sign(velv);	
	}
	//Terminei o laço de repetição e estou na parede vertical
	velv = 0;
}

x += velh;
y += velv;
hurtbox.x = x;
hurtbox.y = y;