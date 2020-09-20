/// @description Initialize Variables
grav = 0.2;
hsp = 0;
vsp = 0;
jumpspeed = 7;
movespeed = 4;

mx = x;
my = y;
manualTetherAcceleration = 0.08;
manualTetherLength = 20;
tetherAccelerationRate = -0.2;
shotGrapple = false;

state = states.moving;

enum states
{
	moving,
	grappling
}

active = false;
grapple_dir = 0;
grapple_speed = 10;

health = 100;
