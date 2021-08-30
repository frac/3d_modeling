
$fn=150;
difference(){
union(){
    cylinder(d=28, h=13, center=true);
    translate([0,0,-5])
    difference(){
        cylinder(d=32, h=3, center=true);
        translate([5,5,-20])
        cube(40);
    }
    lip();
}
    cylinder(d=25, h=13, center=true);
};


module lip(){
    translate([0,0,5])
    difference(){
        translate([0,0,-4])
        sphere(d=33);
        translate([0,0,-1.5-15])
        cylinder(d=40, h=30, center=true);
        translate([0,0,1.5+15])
        cylinder(d=40, h=30, center=true);
        translate([1,1,-20])
        cube(40);
    }
 }