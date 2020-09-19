// AI Movement Logic

// Just Run
if justrun=true {
    move_towards_point(obj_player.x,obj_player.y,0.5);
} else {

// Initial Proximity Trigger for Chase
if runaway=false && chase=false && distance_to_object(obj_player) < 40 {
    chase=true;
    runaway=false;
}

// New Proximity Trigger for Chase (Only one for life of instance)
if chase=true && runaway=false && distance_to_object(obj_player) < 400{
    move_towards_point(obj_player.x,obj_player.y,5);
}

// If Char is more than 400 pixels away, stop Chase
if chase=true && runaway=false && distance_to_object(obj_player) > 400 {
    move_towards_point(obj_player.x,obj_player.y,0);
}

// Flee in random direction away from Char after Collision Event with Char
if chase=false && runaway=true {
    move_towards_point(obj_player.x,obj_player.y,5);
    playerdirection = point_direction(x,y,obj_player.x,obj_player.y);
    direction = (playerdirection + (180 + random(40)) );
}
}

// Stop and Start Animation
if speed = 0 {
    image_speed = 0;
} else {
    image_speed = 2;
}