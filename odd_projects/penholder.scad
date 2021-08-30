use <experimental/tile_penrose3.scad>;
use <experimental/ptf_c2sphere.scad>;
use <ptf/ptf_rotate.scad>;
use <hull_polyline3d.scad>;
use <hull_polyline2d.scad>;

radius = 50;
n = 2;
line_diameter = .7;
$fn = 3;

difference(){
    penrose_basket(radius, n, line_diameter);
    dome();
 };
 
module dome() {
translate([0,0,00])
difference(){
cylinder(d=250,h=200, $fn=50);    
    sphere(d=200, $fn=9);
 }
}

module penrose_basket(radius, n, line_diameter) {
	cos36 = cos(36);
	sin36 = sin(36);

	obtuse = [
		[2 * pow(cos36, 2), 2 * cos36 * sin36], 
		[1, 0],
		[0, 0]
	];

	acute = [
		[4 * pow(cos36, 2) - 1, 0],
		[2 * pow(cos36, 2), 2 * cos36 * sin36],
		[1, 0]
	];

	tris = tile_penrose3(n, [
		for(i = [0:4])
			each [
				["OBTUSE", 
					[for(p = obtuse) ptf_rotate(p, i * 72)]
				],
				["ACUTE",
					[for(p = acute) ptf_rotate(p, i * 72)]
				]	
			]
	]);
	
	r = radius * 2 * cos36;
    step=80;
    /*
	for(t = tris) {
        linear_extrude(height=2)
        hull(){
		hull_polyline2d(t[1]* radius,
		    //[for(p = t[1] * radius) ptf_c2sphere(p, r)], 
			line_diameter
		);	
        }
        step = step + 50;
        single_rand = rands(step,step*2,1)[0];
        linear_extrude(height=single_rand)
		hull_polyline2d(t[1]* radius,
		    //[for(p = t[1] * radius) ptf_c2sphere(p, r)], 
			line_diameter
		);	
    */
union(){    
    linear_extrude(height=step, twist = 17, scale=[1.3,1.3], slices=300, $fn=100)
	translate([0,0,0])
    for(t = tris) {
        if (abs(t[1][0][0] * radius) <= radius+35)
            hull_polyline2d(t[1] * radius,
                //[for(p = t[1] * radius) ptf_c2sphere(p, r)], 
                line_diameter
            );	
     	};

    //linear_extrude(height=1)
    for(t = tris) {
        if (abs(t[1][0][0] * radius)  <= radius+35)
            color(t[0] == "OBTUSE" ? "white" : "black")
            linear_extrude(1)
			#polygon(t[1] * radius);
/*
            //hull(){
            MultiRange()
            {               
                hull_polyline2d(t[1]* radius,
                //[for(p = t[1] * radius) ptf_c2sphere(p, r)], 
                line_diameter
                );
            } 
        */
     	}
    }
}
module MultiRange(){
   color("black") children([0:1]);
}
 