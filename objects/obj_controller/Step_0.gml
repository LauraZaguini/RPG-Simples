/// @description 
//Dropando items no chão
var iid = global.mouse_slot[# 0, 0];
var qtd = global.mouse_slot[# 0, 1];

//Soltar o item
if(iid != item.none){
	var mouse_clique = mouse_check_button_pressed(mb_left);
	var espaco_ocupado = position_meeting(mouse_x, mouse_y, obj_slot);
	
	//Se o mouse clicou em um local do mapa, que não seja algum slot
	if(mouse_clique && !espaco_ocupado){
		var item_criado = instance_create_layer(mouse_x, mouse_y, "Instances", obj_item);
		item_criado.iid = iid;
		item_criado.image_index = iid;
		item_criado.image_speed = 0;
		item_criado.qtd = qtd;
		
		//Zerando informações do mouse
		global.mouse_slot[# 0, 0] = item.none;
		global.mouse_slot[# 0 ,1] = 0;
	}
}

//DEBUGS
//Criando itens
var mouse_click = mouse_check_button_pressed(mb_left);
var posso = keyboard_check(vk_shift);

if(mouse_click && posso){
		//Criando o item no chão
		var item_criado = instance_create_layer(mouse_x, mouse_y, "Instances", obj_item);
		item_criado.iid = irandom_range(1, item.total -1);
		item_criado.image_index = item_criado.iid;
		item_criado.image_speed = 0;
		item_criado.qtd = 1;
}