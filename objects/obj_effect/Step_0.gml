part_particles_create(Sname, x, y, particle1, 1)

x += (target.x - x) * 0.2;
y += ((target.y-32) - y) * 0.2;

if(distance_to_point(target.x, target.y-32) < 10) {
	
	instance_destroy()
	obj_player.x = target.x;
	obj_player.y = target.y-32;
	
}
