$fn=150;
difference(){
    rotor();
    bowl();
}
%translate([160,0,0])
bowl();


module rotor(){
    union(){
        cylinder(h=130-7-4.7,d1=31, d2=30, center=true);
        translate([0,0,130/2-2.35])
        cylinder(h=7,d1=30, d2=26, center=true);
        translate([0,0,130/2+3.5])
        cylinder(h=4.7,d=17, center=true);
        paddle();
    }
}

module paddle(){
    union(){
        //upper
        difference(){
            hull(){
            translate([65/2,10,-65])
            cube([65,3,3],center=true);

            translate([65/2+10,-40,45])
            cube([30,3,3],center=true);
            }
        translate([0,0,+10])
        cylinder(h=80,d=75, center=true);
        translate([0,-30,+10])
        cube([70,70,80], center=true);
        }
        //support
        //cylinder()
        //shaker
        rotate(60)
            hull(){
            translate([-65/2,13.5,-40])
            rotate([0,0,0]) 
            cube([65,3,3],center=true);
            translate([-65/2,-13,-10])
            rotate([-45,0,0]) 
            cube([65,3,3],center=true);
            }
        rotate(-60)
            hull(){
            translate([-65/2,13,11])
           rotate([-45,40,0]) 
            cube([80,3,3],center=true);

            translate([-65/2,-13,37])
           rotate([-45,40,0]) 
            cube([80,3,3],center=true);
            }
           rotate(-47)
           translate([0,0,42])
           rotate([-45,0,0]) 
          cube([55,3,8]);
    }
}



module bowl(){
    union(){
        difference(){
            translate([0,0,-5.1])
            cylinder(h=140,d=160, center=true);
            innercyl();
        }
        translate([0,0,75 -5])
        cube([13,7.5,27.8],center=true);
    }
}
module innercyl(){
    difference(){
        cylinder(h=130,d1=122,d2=123.8, center=true);
        translate([0,0,57.5])
        cylinder(h=15,d1=24, d2=1, center=true);
        translate([0,0,-5])
        cylinder(h=110,d=24, center=true);
        translate([0,0,-46.1])
        cylinder(h=15,d1=26, d2=24, center=true);
        translate([0,0,-65+5])
        cylinder(h=13,d2=45, d1=55, center=true);
    }
}

