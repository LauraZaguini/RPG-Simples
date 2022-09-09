/// @description 

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