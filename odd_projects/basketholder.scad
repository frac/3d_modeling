$fn=30;
basket_pos = [-25,60,40];



module lock(){
    difference(){
    union(){
        hull(){
            translate([0,0,10])
            cube([11,10,1],center=true);
            translate([0,0,8])
            cube([11,12,1],center=true);
        }
        hull(){
            translate([0,0,10])
            cube([11,10,1],center=true);
            translate([0,0,-10])
            cube([11,11,1],center=true);
        }
    translate([0,0,-10])
    cube([11,21,4],center=true);
        
    }
        hull(){
            translate([0,0,10])
            cube([11,6,1],center=true);
            translate([0,0,-3])
            cube([11,3,1],center=true);
        }
        
    }
    }
fuu();
    
translate([50,0,0])
lock();

module fuu() {
    %cylinder(d=21, h=120);
    %cylinder(d=40, h=78);

    union() {
        translate(basket_pos)
        rotate([95,90,0])
        basketside();
        handleside();
        joint();
    }
}
module joint(){
    hull(){
        translate(basket_pos)
        translate([20,-5,0])
        rotate([0,0,-5])
        minkowski(){
            cube([33,4,25],center=true);
            sphere(r=3);
        }
        translate([0,32,-1])
        cylinder(d=20,center=true);
        translate([0,32,79])
        cylinder(d=20,center=true);
    }
    hull(){
        translate(basket_pos)
        translate([19,-10,0])
        minkowski(){
            cube([33,4,10],center=true);
            sphere(r=3);
        }
        translate(basket_pos)
        translate([-20,-35,0])
        minkowski(){
            cube([20,4,10],center=true);
            sphere(r=3);
        }
    }
}
module handleside(){
    union(){
        translate([0,0,78])
        hands(-1);
        hands(+1);
        
    }
}
module bolt(){
    union(){
            cylinder(d=4.9, h=40,center=true);
            translate([0,0,20])
            cylinder(d=8.5, h=10,$fn=6,center=true);
            translate([0,0,-15])
            cylinder(d=10, h=10,center=true);
        }
}

module hands(updown=1){
    translate([0,0,updown* -9])
    difference(){
        union() {
            hull(){
            translate([0,30,updown*0.5])
            cylinder(d=24, h=17,center=true);
            cylinder(d=38, h=15, center=true);
            }
            rotate(30)
            translate([-6,22,0])
            cube([9,18,15],center=true);
        }
        cylinder(d=32, h=120,center=true);
        rotate(30)
        translate([0,20,0])
        cube([3,60,80],center=true);
        rotate(-45)
        translate([-24,15,0])
        rotate([90,0,0])
        bolt();
        translate([0,0,updown*18])
        cylinder(d1=36,d2=41, h=20,center=true);
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