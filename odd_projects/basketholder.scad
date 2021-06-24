$fn=100;


%cylinder(d=21, h=120);

translate([0,80,40])
rotate([75,90,0])
basketside();
handleside();

hull(){
#translate([20,81,40])
rotate([0,0,15])
minkowski(){
    cube([33,4,35],center=true);
    sphere(r=3);
}
translate([0,40,0])
#cube(20,center=true);
translate([0,40,80])
#cube(20,center=true);
}

module handleside(){
    union(){
        translate([0,0,80])
        hands(-1);
        hands(+1);
        
    }
}

module hands(updown=1){
    translate([0,0,updown* -22.4])
    difference(){
        hull(){
        translate([0,40,updown*20])
        cube([20,20,15],center=true);
        cylinder(d=40, h=15, center=true);
        }
        cylinder(d=21, h=120,center=true);
        cube([1,60,80],center=true);
    }
}
module basketside(){
ht = 4;
difference(){
slab1();
translate([0,71,0])
cube([26,2*ht,2*ht],center=true);
translate([0,45,ht/2])
cube([12,11,3*ht],center=true);

}
module slab1(){
union(){
hull(){
    translate([0,59,0])
    minkowski(){
        cube([35,ht,ht-1],center=true);
        cylinder(r=10,h=1,center=true);
    }
cube([60,ht,ht+2],center=true);
}
translate([0,0,ht])
hull(){
    translate([0,55,0])
    minkowski(){
        cube([32,ht,ht-1],center=true);
        cylinder(r=10,h=1,center=true);
    }
    cube([52,ht,ht],center=true);
}
}
}
}