%cube([210,210,1],center=true);
diam = 2;
large = 105;
small = large * 0.6180;
$fn = 50;


union(){
hull(){
    translate([large,large,0])
    sphere(d=diam);
    translate([-small,-small,0])
    sphere(d=diam);
}
hull(){
    translate([-small,small,0])
    sphere(d=diam);
    translate([small,-small,0])
    sphere(d=diam);
}
translate([0,0,0.01*diam])
cube([4*diam,4*diam,diam],center=true);

translate([2-small,small-2,1.5*diam])
cylinder(d=diam, h=3*diam,center=true);
translate([small-2,2-small,1.5*diam])
cylinder(d=diam, h=3*diam,center=true);
translate([large-2,large-3,1.5*diam])
cylinder(d=diam, h=3*diam,center=true);
translate([2-small,3-small,1.5*diam])
cylinder(d=diam, h=3*diam,center=true);

}