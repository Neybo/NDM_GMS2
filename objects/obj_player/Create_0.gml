hsp = 0
vsp = 0
grav = 0.5
movespeed = 0
image_speed = 0.35
xscale = 1
landanim = false
jumpanim = false
facehurtanim = 0
enum states {
	normal,
	jump,
	crouch,
	crouchjump,
	ladder,
	taunt,
	attack,
	mach2,
	mach3,
	machslide,
	climbwall,
	mach3bump,
	sjump,
	sjumpprep,
	groundpound
}
state = states.normal
depth = -10
storedhsp = hsp
storedvsp = vsp
storedstate = state
storedimgindex = image_index
taunttimer = -1
storedsprite = sprite_index
grounded = false
trailbuffer = 0
climbbuffer = 0