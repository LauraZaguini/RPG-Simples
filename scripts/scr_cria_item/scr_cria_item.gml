// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_cria_item(){
	///@desc scr_cria_item(item_id, nome, desc, tipo, dano, cura)
	///@param item_id
	///@param nome
	///@param desc
	///@param tipo
	///@param dano
	///@param cura
	
	var iid = argument0;
	var nome = argument1;
	var desc = argument2;
	var tipo = argument3;
	var dano = argument4;
	var cura = argument5;
	
	global.item_index[# iid, item_stat.nome] = nome;
	global.item_index[# iid, item_stat.desc] = desc;
	global.item_index[# iid, item_stat.tipo] = tipo;
	global.item_index[# iid, item_stat.dano] = dano;
	global.item_index[# iid, item_stat.cura] = cura;
}