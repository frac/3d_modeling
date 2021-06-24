rd = 2;
wd = 80;
lt = 130;
ht = 2;



difference(){
    union(){
        minkowski(){
        cube([wd,lt,ht], center=true);
        sphere(r=rd);
        }
        translate([0,lt/2 - ht/4,0 ])
        cylinder(r=rd*2,h=ht+rd*2, center=true);
        translate([0,-lt/2 +ht/4,0 ])
        cylinder(r=rd*2,h=ht+rd*2, center=true);
    
    }
    translate([0,lt/2 - ht/4,0 ])
    cylinder(d=rd*2,h=ht+rd*2, center=true);
    translate([0,-lt/2 +ht/4,0 ])
    cylinder(d=rd*2,h=ht+rd*2, center=true);
}

translate([-wd - 20,0,0]) {
    difference(){
            union(){
                minkowski(){
                    difference(){
                    cube([wd,lt,ht], center=true);
                    cube([wd-ht,lt-ht,ht], center=true);
                    }
                sphere(r=rd);
            }
            translate([0,lt/2 - ht/4,0 ])
            cylinder(r=rd*2,h=ht+rd*2, center=true);
            translate([0,-lt/2 +ht/4,0 ])
            cylinder(r=rd*2,h=ht+rd*2, center=true);
        }
        translate([0,lt/2 - ht/4,0 ])
        #cylinder(d=rd*2,h=ht+rd*2, center=true);
        translate([0,-lt/2 +ht/4,0 ])
        #cylinder(d=rd*2,h=ht+rd*2, center=true);
    }
}