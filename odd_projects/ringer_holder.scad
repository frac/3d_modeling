$fn=100;

//gap();
holder();
rotate([0,90,0])
connector();

module connector(){
difference(){
    cylinder(d1=12, d2=13, h=8);
    cylinder(d=2.5, h=9);
    translate([-10,-0.25,0])
    gap();
}
}


module gap(){
difference(){
    union(){
        cube([20,0.5, 9]);
        translate([0,0,6])
        rotate([0,90,0])
        cylinder(d=1, h=20);
        translate([10,1.5/4 -0.1,0])
        sphere(r=1.5);
    }
    translate([0,0.6,6])
    rotate([0,90,0])
    cylinder(d=1, h=20);
}
}

module holder(){
difference(){
    hull(){
        translate([28,0,0])
        cylinder(d=23, h=10, center=true);
        translate([7,0,0])
        rotate([0,90,0])
        cylinder(d=13, h=8);
    }
    hull(){
        translate([28,0,0])
        cylinder(d=20, h=20, center=true);
        translate([2,0,0])
        cube([2,2,30], center=true);
    }
}
}
