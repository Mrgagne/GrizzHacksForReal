//Get the player's input
key_right = keyboard_check(ord("D"));
key_left = -keyboard_check(ord("A"));
key_jump = keyboard_check_pressed(vk_space);
key_down = keyboard_check(ord("S"));
key_up = -mouse_check_button(mb_left)
//key_up = -keyboard_check(ord("W"));

switch (state)
{
	case states.moving:
	{
		
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
			tetherAngleVelocity = 0;
			
			hook = instance_create_depth(x, y, 0, obj_grapple_hook);
			hook.x = x;
			hook.y = y;
			hook.target_x = mx;
			hook.target_y = my;
			shotGrapple = true;
			
			tetherLength = point_distance(x,y,mx,my);
		}
		
		if(shotGrapple) {
			if (hook.x = hook.target_x && hook.y = hook.target_y) {
				state = states.grappling;
			}
		}
		
	} break;
	
	case states.grappling:
	{
			shotGrapple = false;
			tetherX = x;
			tetherY = y;
			tetherAngle = point_direction(mx,my,x,y);
			
			var _tetherAngleAcceleration = tetherAccelerationRate * dcos(tetherAngle);
			_tetherAngleAcceleration += (key_right + key_left) * manualTetherAcceleration;
			tetherLength += (key_down + key_up) * manualTetherLength;
			tetherLength = max(tetherLength,3);
		
			tetherAngleVelocity += _tetherAngleAcceleration;
			tetherAngle += tetherAngleVelocity;
			tetherAngleVelocity *= 0.99;
		
			tetherX = mx + lengthdir_x(tetherLength, tetherAngle);
			tetherY = my + lengthdir_y(tetherLength, tetherAngle);
		
			hsp = tetherX - x;
			vsp = tetherY - y;
		
			if (key_jump)
			{
				with (hook) instance_destroy();
				state = states.moving;
				vsp = -jumpspeed;
			}
		
	}	
}

//Horizontal Collision
if (place_meeting(x+hsp,y,obj_wall))
{
    while(!place_meeting(x+sign(hsp),y,obj_wall))
    {
        x += sign(hsp);
    }
	if (state == states.grappling)
	{
		tetherAngle = point_direction(mx,my,x,y);
		tetherAngleVelocity = 0;
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
	if (state == states.grappling)
	{
		tetherAngle = point_direction(mx,my,x,y);
		tetherAngleVelocity = 0;
	}
    vsp = 0;
}
y += vsp;


