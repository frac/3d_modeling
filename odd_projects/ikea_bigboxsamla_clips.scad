/*
 * Variables for Thingiverse Customizer
 * ==================================================================
 *
 */

// The width of the clips in mm (I use 10 mm and have 4 clips per box)
Clips_Width = 20;


/*
 * Library function: edge
 * ==================================================================
 *
 * Used to make roundes edges on objects
 *
 */
module edge(radius, height)
{
	difference()
	{
		translate([radius/2-0.5, radius/2-0.5, 0])
			cube([radius+1, radius+1, height], center = true);

		translate([radius, radius, 0])
			cylinder(h = height+1, r1 = radius, r2 = radius, center = true, $fn = 100);
	}
}

module ikea_samla_clips(width)
{
	//length = 25;
	length = 35;
    //height = 12;
    height = 23;
    //depth = 4;
    depth = 6;
    //knob = 3;
    knob = 10;
    gh = 3;
	difference()
	{
		union()
		{
			
			translate([0, 0, -3/2])
				cube(size=[length, width, 3], center=true);
		
			translate([length/2-3/2, 0, -(8+3)/2])
				cube(size=[3, width, 8+3], center=true);
		
			difference()
			{
				translate([length/2, 0, -(8+3+1.5)/2])
					cube(size=[6, width, 8+3-1.5], center=true);
			
				translate([length/2+3+1, 0, -(8+3+1.5)/2-1])
				rotate(20, [0, 1, 0])
					cube(size=[6, width+1, 8+3], center=true);
			}
			
			translate([-length/2+3, 0, -3])
			rotate(-90, [1, 0, 0])
				edge(8, width);
		
			translate([-(length/2-3/2), 0, -(height+3+3)/2])
				cube(size=[3, width, height+3+3], center=true);
		
			translate([-(length/2-(3+depth+3)/2), 0, -height-3-3/2])
				cube(size=[3+depth+3, width, 3], center=true);
		
			translate([-(length/2-(3+depth+3)+(gh/2) ), 0, -height-3+knob/2])
				cube(size=[gh, width, knob+3], center=true);
				
			translate([length/2-3, 0, -3])
			rotate(-90, [1, 0, 0])
			rotate(90, [0, 0, 1])
				edge(2, width);				
		}
		
		union()
		{
			translate([-(length/2-(3+depth+3)+gh), 0, -height-3+knob + 3/2])
			rotate(-90, [1, 0, 0])
				edge(2, width+1);

			translate([-length/2, 0, 0])
			rotate(-90, [1, 0, 0])
				edge(8+3, width+1);
				
			translate([-length/2, 0, -height-3-3])
			rotate(-90, [1, 0, 0])
			rotate(-90, [0, 0, 1])
				edge(1, width+1);
			
			translate([-length/2+3+depth+3, 0, -height-3-3])
			rotate(-90, [1, 0, 0])
			rotate(-180, [0, 0, 1])
				edge(1, width+1);


			translate([length/2-3, 0, -8-3])
			rotate(-90, [1, 0, 0])
			rotate(-90, [0, 0, 1])
				edge(1, width+1);
		
			translate([length/2, 0, -8-3])
			rotate(-90, [1, 0, 0])
			rotate(-180, [0, 0, 1])
				edge(1, width+1);
		
			translate([length/2, 0, 0])
			rotate(-90, [1, 0, 0])
			rotate(90, [0, 0, 1])
				edge(1, width+1);
				}	
	}
}
rotate([90,0,0])
ikea_samla_clips(Clips_Width);