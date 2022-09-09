/// @description 

image_blend		= c_lime;

estado					= "espera";
espera					= 5;
timer						= room_speed * irandom(espera) + 1;
timer_ataque		= room_speed / 4;
espera_ataque    = room_speed;

area_pers				= sprite_width * 5;
area_ataca			= sprite_height * 3;

xx							= x;
yy							= y;
dir							= -1;

patrulha_volta	= false;

velh = 0;
velv = 0;

espera_dano = room_speed;

vida = 5;

dano = 1;