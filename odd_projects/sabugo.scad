lm = 270;
wd = 20;
ht =  2;

$fn = 50;
union(){
difference(){
    cube([lm,wd,ht]);
    translate([wd/3, wd/3,0])
    cylinder(d=ht, h=ht);
    translate([wd/3, 2 * wd/3,0])
    cylinder(d=ht, h=ht);
}

    translate([lm, wd/3,0]){
    cube([4*ht/3,1,ht]);
    translate([4*ht/3, ht/4,0])
    cylinder(d=ht, h=ht);
    }

    translate([lm, 2 * wd/3,0]){
    cube([4*ht/3,1,ht]);
    translate([4*ht/3, ht/4,0])
    cylinder(d=ht, h=ht);
    }
font1 = "Liberation Sans"; // here you can select other font type
content = "SABUGO";

translate ([lm/3, wd/4, ht]) {
linear_extrude(height = 2) {
text(content, font = font1, size = 12, direction = "ltr", spacing = 1 );
}
}
}
