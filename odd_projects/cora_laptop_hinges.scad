ht = 10;
difference(){
    union(){
      cube([30,5,10 + ht]);
       cube([5,30,10 + ht]);
    };
translate([1.5,1.5,2])
cube([30,0.7,10 + ht]);
translate([1.5,1.5,2])
cube([0.7,30,10 + ht]);
translate([1.5,1.5,2])
cube([5,5,10 + ht]);
}