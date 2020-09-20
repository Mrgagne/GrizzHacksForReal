x = owner.x+20;
y = owner.y+20;

image_xscale = abs(owner.image_xscale);
image_yscale = abs(owner.image_yscale);

if (instance_exists(obj_player)){
	
	if(obj_player.x < x) image_yscale = -image_yscale;
	if(point_distance(obj_player.x, obj_player.y,x,y) < 600) {
		
		image_angle = point_direction(x,y,obj_player.x,obj_player.y);
		countdown--;
		if(countdown <= 0) { 
		
		countdown = countdownrate;
		//bullet code here
		with (instance_create_layer(x-5,y+40,"Bullets", obj_bullet)){
			
			spd = 10;
			dir = other.image_angle;
			image_angle = dir;
		
		}
		}
		
	}
}