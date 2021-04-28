sm = 0.1;
hei = 10;

$fn=50;
module banana(){
        {
        {
                cylinder(r=sm, h=hei);
                translate([0,0,hei])
                rotate([30,0,0])
                cylinder(r=sm, h=hei);
                translate([0,0,hei])
                rotate([-40,0,0])
                cylinder(r=sm, h=hei);
            
            
        }
    }
    
 }
 minowski(){
 banana();
 }