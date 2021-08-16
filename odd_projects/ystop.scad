$fn=200;
translate([-14,-30,0])
pusher();


module plate() {
    union(){
        hingepin(0);
        difference(){
            cube([40,5,10]);
            translate([0,0,0.5])
            cylinder(h=9, d=12);
        }
     }
}

module pusher() {
    difference(){
        union(){
            translate([14,30,0])
            cylinder(h=10, d=10);
            cube([14,30,10]);
            translate([14,0,0])
            cube([2,10,10]);
        }
            translate([14,30,0])
        hingepin(.8);
        #hull(){
            translate([14,2,3])
            cube([.7,1,4]);
            translate([14,15,2])
            cube([1,5,6]);
        }
    }
}

module hingepin(extra){
    
union(){
    cylinder(h=3, d1=10+extra, d2=5+extra);
    cylinder(h=10, d=5+extra);
    translate([0,0,7])
    cylinder(h=3, d2=10+extra, d1=5+extra);
}
    
}