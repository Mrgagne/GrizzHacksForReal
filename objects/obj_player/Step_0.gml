//Get the player's input
key_right = keyboard_check(vk_right);
key_left = -keyboard_check(vk_left);
key_jump = keyboard_check_pressed(vk_space);

//React to inputs
move = key_left + key_right;
hsp = move * movespeed;
if (vsp < 10) vsp += grav;

if (place_meeting(x,y+1,obj_wall))
{
    vsp = key_jump * -jumpspeed
}

//Horizontal Collision
if (place_meeting(x+hsp,y,obj_wall))
{
    while(!place_meeting(x+sign(hsp),y,obj_wall))
    {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,obj_wall))
{
    while(!place_meeting(x,y+sign(vsp),obj_wall))
    {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;



//Portal stuff. Nick dont worry.
var portal, dest;

portal = instance_place(x, y+1, obj_portal)

if(place_meeting(x, y, portal)) {
	
	if(keyboard_check_pressed(vk_shift)) {
		for(i = 0; i < instance_number(obj_dest); i++){
			dest = instance_find(obj_dest, i);
			
			effect = instance_create_depth(x,y,-1,obj_effect);
			effect.target = dest;	
			break;
		}
	}
}





