ht = 23;
$fn=100;
rotate([-90,0,0])
difference(){
    
    union(){
        extra = 2;
        translate([0,0,-extra])
        cylinder(h=ht+2*extra, d=3);

        hull(){
        cylinder(h=ht, d=6.25);
        translate([18.3,1.5,0])
        cylinder(d=1,h=ht);
        }
    }
    translate([-5,-5,ht/4])
    cube([15,15,ht/2]);
}