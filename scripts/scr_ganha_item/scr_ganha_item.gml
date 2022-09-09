// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
/// @desc scr_ganha_item(item_id, qtd)
/// @param {real} item_id
/// @param {real} qtd
function scr_ganha_item(){
	var iid = argument0;
	var qtd = argument1;
	var tam = ds_grid_width(global.inv);
	
	
	//Checando se eu já possuo o item
	for(var i = 0; i < tam; i++){
		//Checando se o slot atual já possui este item
		var item_atual = global.inv[# i, 0];
		//Checando se os dois items são iguais
		if(item_atual == iid){
				global.inv[# i, 0] = iid;
				global.inv[# i, 1] += qtd;
				return true;
		}
	}
	
	//Checando se eu não possuo o item e ver se há espaço livre
	for(var i = 0; i < tam; i++){
		//Checando qual o item esta neste slot
		var item_atual = global.inv[# i, 0];
		//Checando se o slot esta vazio
		if(item_atual == item.none){
				global.inv[# i, 0] = iid;
				global.inv[# i, 1] = qtd;
				return true;
		}
	}
	
	//Não encontrei espaço para adicionar o item
	return false;
}