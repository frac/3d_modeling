ht = 22;
$fn=100;
rotate([-90,0,0])
difference(){
    
    union(){

        translate([0,0,-2])
        cylinder(h=26, d=3);

        hull(){
        cylinder(h=ht, d=6.25);
        translate([18.3,1.5,0])
        cylinder(d=1,h=ht);
        }
    }
    translate([-5,-5,ht/4])
    cube([15,15,ht/2]);
}