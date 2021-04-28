

xdim = 80;
ydim = 140;
height= 150;

radius = 2.5;
/*
difference(){
    minkowski(){
    cube(size = [xdim, ydim,height]);
    sphere (radius, $fn=100);
    };
    translate([radius/12,radius/8,radius/8]) cube(size = [xdim, ydim,height+radius]);
}
*/
$fn=100;
difference()
{
    difference()
    {
        union(){
            union(){
                translate([0,0,18.5])
                cylinder(d1=31.8, d2=33.8, h=2.5);
                cylinder(d2=31.8, d1=33.8, h=2.5);
            }
            cylinder(d=31.8, h=21);
        }
        cylinder(d=26, h=22);
    }
    cube(size = [3.5, 40,22]);
   
}