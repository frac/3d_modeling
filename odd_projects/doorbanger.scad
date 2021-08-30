//$fn=200;
union(){

difference(){
    translate([0,0,-11])
    sphere(r=23);
    translate([0,0,-11])
    sphere(r=23-1.6);
    
    translate([0,0,-30])
        cylinder(r=60, h=60,center=true);
}

difference(){
    cylinder(d=28, h=7);
    cylinder(d=23, h=7.01);
}
}