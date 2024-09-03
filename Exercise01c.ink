/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 * Variable types: integer, float, boolean
 * Variable assignment
 * Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR sister_name = ""
VAR torches = 0
VAR sword = 0


-> memory

== memory ==
Hiking in the woods around your house one day you stumble across the entrance to a cave. You wonder if you should call your sister over to explore it with you. What is her name?

* [Cindy]
    ~ sister_name = "Cindy" 
    -> outside_cave
* [Stephanie]
    ~ sister_name = "Stephanie"
    -> outside_cave
* [Maggie]
    ~ sister_name = "Maggie"
    -> outside_cave
    
    == outside_cave ==
    You decide it's best if you go in and take a look by yourself first.
    * [Explore the cave] -> cave_mouth

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.


You have {torches} torches

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.

*  {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel==
You are in the west tunnel. You hear a strange sound but can't see what is making it
* {torches > 0} [Light Torch] -> west_tunnel_lit
+ [Run in fear] -> cave_mouth
->END

== west_tunnel_lit ==
You light up the tunnel to see a large snake starfing right back at you.
{sister_name == "Maggie": It's a good thing you didn't bring Maggie, she is terrified of snakes.| }
* {torches > 0} [Throw Torch] -> mad_snake
* [Try to fight it] -> snake_bite
* [Turn tail and run] -> cave_mouth

== mad_snake ==
You made the snake angry. You should run if you value your life.
~ torches = 0 
[Run] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== snake_bite ==

{sword == 1: You use the sword to slay the snake -> cave_mouth}


What were you thinking? You are bitten by the snake before you even have the chance to attack and die a slow, agonizing death.
->END

=== east_tunnel_lit ===
The light of your torch glints off of the thousands of coins in the room.
* [Stuff as many coins as you can hold into your pockets] -> gold_pickup
+ [Return to cave mouth] -> cave_mouth_poor
-> END

=== gold_pickup ===
You see a small opening on the other side of the tunnel but sas you step toward it the room begins to shake and boulders start crashing down around you. 
* [Stand awestruck] -> boulder_death
* [Run for your life] -> cave_mouth_rich
* [Dive into the opening] -> cave_opening 
-> END

== cave_opening== 
You dive into the small opening and find yourself in a cramped cavern. The sound of rumbling and crashing debris slowly stops in the tunnel. You use your torch to light the small and see a gleaming sword mounted on the far wall.
* [Take the sword] -> sword_pickup
* [Return to the cave mouth] -> cave_mouth

== sword_pickup ==
~ sword = sword + 1
You now have a sword to protect you from the horrors of the cave
* [Go Back] -> cave_mouth

== boulder_death ==
You were crushed by the falling boulders and died young and poor.
-> END

=== cave_mouth_rich ===
Congratulations, you survived the tunnel collapse and are now richer than when you entered.
-> END

== cave_mouth_poor ==
You were to scared to risk taking any gold from the cave and walk home sad and poor.
-> END