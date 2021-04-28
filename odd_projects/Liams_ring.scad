ring = 14.07;
wd = 2;
detail = 7.5;
detailsz = 6;
$fn=100;
ht = 10;

module lantern(){
    union(){
        translate([0,detail/4,0.5]){
            cube([detail/2, detail/10, 1], center=true) ;
        }
        translate([0,-detail/4,0.5]){
            cube([detail/2, detail/10, 1], center=true) ;
        }
        difference(){
            cylinder(d=detail/2, h=1);
            cylinder(d=detail/3, h=1.1);
        }
    };
}

difference(){
hull(){

translate([0,0,ht/2]) {   
cylinder(d=ring+wd, h=ht/4, center=true);
}
//translate([0,ring/2 + wd -1, ht/4 + detailsz/2])
translate([0, ring/2 + wd -1, ht/2])
rotate([90,90,0])
#cylinder(d=detailsz , h=2, center=true);
}
cylinder(d=ring, h=20, center=true);
translate([0,ring/2 + wd, ht/2])
rotate([90,0,0])
lantern();
}
%cylinder(d=ring, h=20);

   
 