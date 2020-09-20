// Instance Creation Variable Sets

healthenemy=100;
invincible=false;
chase=false;
runaway=false;
justrun=false;


if(has_weapon) {

	mygun = instance_create_layer(x,y,"Gun", obj_eGun)
	with (mygun) {

		owner = other.id

	}

} else mygun = noone;
