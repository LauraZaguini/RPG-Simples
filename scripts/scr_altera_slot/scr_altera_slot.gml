// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_altera_slot(){
	///@desc scr_altera_slot(slot, qtd, sub)
	///@param slot
	///@param qtd
	///@param sub
	
	var slot = argument0;
	var qtd = argument1;
	var sub = argument2;
	
	//Checando se irei substituir o item
	if(sub == false){//Não quero substituir o item
		global.inv[# slot, 1] += qtd;
	}else {//Vou substituir o que tem lá
		global.inv[# slot, 1] = qtd;
	}
	
	//Se o meu slot esta vazio
	if(global.inv[# slot, 1] <= 0){//Estou sem nenhum item
		global.inv[# slot, 0] = item.none;
		global.inv[# slot, 1] = 0;
	}
}