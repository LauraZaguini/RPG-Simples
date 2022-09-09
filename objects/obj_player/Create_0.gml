/// @description 

vel			= 5;
velh		= 0;
velv		= 0;
des_n		= .1;
des_g		= .01;
estado   = "parado";
baixo      = spr_baixo;
cima		= spr_cima;
esq			= spr_esquerda;
atacan   = false
sprite_antiga = sprite_index;
face		= 0;
max_vida = 20;
vida = 5;
arma = 0;
dano = 0;
hurtbox = instance_create_layer(x, y, "Instances", obj_player_hurtbox);
hurtbox.pai = self;
espera_dano = room_speed / 4;