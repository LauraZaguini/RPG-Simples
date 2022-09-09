/// @description Save

//Iniciando o ini
ini_open("Save.ini");

//Salvando os dados do meu inventario
var inv = ds_grid_write(global.inv);

//Checando se o player existe
if(instance_exists(obj_player)){
	//Salvando informações do player
	var player_maxvida = obj_player.max_vida;
	var player_vida = obj_player.vida;
	var player_arma = obj_player.arma;
	
}else {
	var player_maxvida = 0;
	var player_vida = 0;
	var player_arma = 0;	
}

//Salvando os dados do inventario
ini_write_string("Itens", "inv", inv);

//Salvando info do player
ini_write_real("Player", "max_vida", player_maxvida);
ini_write_real("Player", "vida", player_vida);
ini_write_real("Player", "arma", player_arma);

ini_close();
