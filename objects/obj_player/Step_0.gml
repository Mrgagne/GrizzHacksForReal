//Get the player's input
key_right = keyboard_check(ord("D"));
key_left = -keyboard_check(ord("A"));
key_jump = keyboard_check_pressed(vk_space);

//React to inputs
move = key_left + key_right;
hsp = move * movespeed;
if (vsp < 10) vsp += grav;

if (place_meeting(x,y+1,obj_wall))
{
    vsp = key_jump * -jumpspeed
}



//Grappling Hook
if (mouse_check_button_pressed(mb_left))
{
	mx = mouse_x;
	my = mouse_y;
	grapple_dir = point_direction(x, y, mx, my);
	if (place_meeting(mx,my,obj_wall)) {
		active = true;
	} else {
		active = false;
	}
}

if (active)
{
	//gravity = 0.1;
	//x += (mx - x) * 0.125;
	//y += (my - y) * 0.125;
	x += lengthdir_x(point_distance(x, y, mx, my)/grapple_speed, grapple_dir);
	y += lengthdir_y(point_distance(x, y, mx, my)/grapple_speed, grapple_dir);
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

if (mouse_check_button_released(mb_left))
{
	active = false;
}


