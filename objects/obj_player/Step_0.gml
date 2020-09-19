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

//Grappling Hook
active = false;
if (mouse_check_button(mb_left))
{
	
	mx = mouse_x;
	my = mouse_y;
	if (place_meeting(mx,my,obj_wall))
	{
		active = true;
	}
}

if (active)
{
	gravity = 0.1;
	x += (mx - x) * 0.1;
	y += (my - y) * 0.1;
}

if (mouse_check_button_released(mb_left))
{
	active = false;
}


