$fn=100;
ht = 6;
union(){
translate([10,0,0])
fin();
translate([-10,0,0])
fin();
knob();
blackplate();
}
module fin(){
    translate([-1,2,14])
    hull(){
        cube([2,2,25]);
        cube([2,33,2]);
    }
}

module knob(){
    translate([0,25/2-ht/2,15/2])
    union(){
        difference(){
            hull(){
                cube([24,24,15], center=true);
                translate([0,33,0])
                cylinder(d=24, h=15, center=true);
            };
            translate([0,33,-3])
            cylinder(d=19, h=13, center=true);
        };
        translate([0,36,7.5])
        sphere(r=1.5);
    }
}


module blackplate(){
    translate([0,0,10/2])
    difference(){
        hull(){
            cube([37,ht,10], center=true);
            translate([0,0,30])
            rotate([90,0,0])
            cylinder(d2=26 ,d1=24, h=ht, center=true);
        }
        hull(){
            translate([2,0,17+5])
            rotate([90,0,0])
            cylinder(d=4, h=10, center=true);
            translate([-2,0,12+5])
            rotate([90,0,0])
            cylinder(d=4, h=10, center=true);
        }
    }
}
