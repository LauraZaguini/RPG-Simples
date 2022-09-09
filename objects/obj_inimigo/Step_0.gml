/// @description 
event_inherited();

var dist = point_distance(x, y, obj_player.x, obj_player.y);

switch(estado){
	case "espera":{
		velh = 0;
		velv = 0;
		timer--;
		espera_ataque--;
		image_blend = c_lime;
		var persegue_player = collision_circle(x, y, area_pers, obj_player, false, true);
		if(timer <= 0){
			estado = choose("espera", "patrulha");
			timer = room_speed * irandom(espera) + 10;
			xx = irandom(room_width);
			yy = irandom(room_height);
			dir= point_direction(xstart, ystart, xx, yy);
		}
		if(persegue_player && espera_ataque < 0){
			estado = "persegue";	
			espera_ataque = room_speed;
		}
		break;	
	}
	case "patrulha":{
		timer--;
		espera_ataque--;
		image_blend = c_aqua;
		var persegue_player = collision_circle(x, y, area_pers, obj_player, false, true);
		
		//Ainda não estou muito longe da posição inicial
		if((abs(x - xstart) < 100 || abs(y - ystart) < 100) && patrulha_volta == false){
			velh= lengthdir_x(.5, dir);
			velv = lengthdir_y(.5, dir);	
		}else {//Tenho que voltar
			dir = point_direction(x, y, xstart, ystart);
			velh= lengthdir_x(.5, dir);
			velv = lengthdir_y(.5, dir);
			patrulha_volta = true;
		}
		
		if((abs(x - xstart < 20 ) && abs(y - ystart) < 20) && patrulha_volta == true){
			dir = point_direction(xstart, ystart, irandom(room_width), irandom(room_height));
			patrulha_volta = false;
		}
		
		if(timer <= 0){
			estado = choose("espera", "patrulha");
			timer = room_speed * irandom(espera) + 1;
		}
		
		if(persegue_player && espera_ataque < 0){
			estado = "persegue";	
		}
		
		break;
	}
	case "persegue":{
		image_blend = c_lime;
		var persegue_player = collision_circle(x, y, area_pers + 50, obj_player, false, true);
		var ataque_player = collision_circle(x, y, area_ataca, obj_player, false, true);
		
		if(!persegue_player){//O player esta muito longe
			estado = "espera";
			timer = room_speed * irandom(espera) + 1;
		}else {//Consigo ver o player ainda
			dir = point_direction(x, y, obj_player.x, obj_player.y);
			velh = lengthdir_x(1, dir);
			velv = lengthdir_y(1, dir);
		}
		
		if(ataque_player){
			estado = "ataque";	
		}
		
		break;	
	}
	case "ataque":{
		timer_ataque--;
		image_blend = c_red;
		
		//Checando se colidir com o hurtbox do player
		var col = instance_place(x, y, obj_player.hurtbox);
		
		if(col){
			var hitbox = instance_create_layer(col.pai.x, col.pai.y, "Instances",	obj_hitbox);
			hitbox.checa_player = true;
			hitbox.dano = dano;
			hitbox.dire = dir;
			estado = "espera";
			timer_ataque = room_speed / 4;
			espera_ataque = room_speed;
		}
		
		if(timer_ataque > 0){	
			velh = lengthdir_x(3, dir);
			velv = lengthdir_y(3, dir);
		}else {
			estado = "espera";
			timer_ataque = room_speed / 4;
			espera_ataque = room_speed;
		}
		break;
	}
	
	case "dano": {
		espera_dano--;
		image_blend = c_yellow;
		
		if(espera_dano > 0){	
			velh = lengthdir_x(2, dir);
			velv = lengthdir_y(2, dir);
		}
		
		if(vida <= 0){
			instance_destroy();	
		}
		if(espera_dano <= 0){
			espera_dano = room_speed;
			estado = "espera";
		}
		break;	
	}
}
show_debug_message(estado);