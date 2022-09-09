/// @description 

//Ajustando a posição
var xx = camera_get_view_x(view_camera[0]);
var yy = camera_get_view_y(view_camera[0]);

x = xx + pos_x;
y = yy + pos_y;

//Pegando itens do meu slot com o mouse
 var mouse_sobre = position_meeting(mouse_x, mouse_y, self);
 var mouse_left_click = mouse_check_button_pressed(mb_left);
 
 //Checando se o mouse esta sobre o item
 if(mouse_sobre){
	//Checando se o mouse clicou em mim
	if(mouse_left_click){
		//Guardando informações
		var iid = global.inv[# var_slot, 0];
		var qtd = global.inv[# var_slot, 1];
		
		//Guardando informações do mouse
		var mouse_iid = global.mouse_slot[# 0, 0];
		var mouse_qtd = global.mouse_slot[# 0, 1];
		
		//Checando se eu estou livre ou o mouse esta livre ou os items são diferente
		if(iid == item.none || mouse_iid == item.none || iid != mouse_iid){
			//Trocando os items
			
			//Pegando os items do mouse
			global.inv[# var_slot, 0] = mouse_iid;
			global.inv[# var_slot, 1] = mouse_qtd;
			
			//Colocando os items no mouse
			global.mouse_slot[# 0, 0] = iid;
			global.mouse_slot[# 0, 1] = qtd;
		}else if(mouse_iid == iid){//Checando se é o mesmo item
			//Pegando os items do mouse
			global.inv[# var_slot, 1] += mouse_qtd;
			
			//Zerando as informações do mouse
			global.mouse_slot[# 0, 0] = item.none;
			global.mouse_slot[# 0, 1] = 0;
		}
	}
 }
 
 //Usando items
 var mouse_right_click = mouse_check_button_released(mb_right);
 
 //O usuario clicou com o botão direito do mouse em mim
 if(mouse_sobre && mouse_right_click){
		var iid = global.inv[# var_slot, 0];
		//Checando se eu possuo o item
		if(iid != item.none){
			//Checando se o item é de cura
			if(global.item_index[# iid, item_stat.tipo] == item_tipo.cura){
					//Sim o item é de cura
					//Checando se o player existe
					if(instance_exists(obj_player)){
						//O player existe
						obj_player.vida += global.item_index[# iid, item_stat.cura];
						scr_altera_slot(var_slot, -1, false);
					}
			}
			//Eu tenho um item, mas ele não é de cura
			//Equipando armas
			else if(global.item_index[# iid, item_stat.tipo] == item_tipo.arma){	
				//O meu item é uma arma
				if(instance_exists(obj_player)){
					//O player existe
					if(obj_player.arma == item.none){
							//O player está desarmado
							//Posso colocar o equipamento nele sem problemas
							obj_player.arma = iid;
							scr_altera_slot(var_slot, -1, false);
					}else if(obj_player.arma != item.none && obj_player.arma != iid){//Caso o player esteja com alguma arma, diferente da minha
						//Salvando a arma do player
						var arma_nova = obj_player.arma;
						//Equipando a arma no player
						obj_player.arma = iid;
						scr_altera_slot(var_slot, -1, false);
						//Tentando adicionar a arma nova ao inventario
						if!(scr_ganha_item(arma_nova, 1)){
							//Se eu não conseguir adicionar a arma do player no inventario, ele irá para o mouse	
							//Vou colocar ela no mouse
							global.mouse_slot[# 0, 0] = arma_nova;
							global.mouse_slot[# 0, 1] = 1;
						}
					}
				}
			}
		}
 }