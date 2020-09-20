/// @description Insert description here
// You can write your code in this editor

if (obj_wall.y < y && !place_free(x,y+vsp))
{
	move_contact_solid(90,0);
	vsp = 0;
	
}

if (place_meeting(x,y+vsp,obj_wall))
{
	vsp = 0;
	move_contact_solid(270,0);
}