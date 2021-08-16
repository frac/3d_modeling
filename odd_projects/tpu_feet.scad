$fn=100;

%chairfeet(2,27);
plug_chairfeet(2,27);

translate([0,40,0]){
%chairfeet(1,28);
plug_chairfeet(1,28);
    
    
}

module plug_chairfeet(displacement, size){
    ht = 20;
    thickness = 1.5;
    difference(){
        hull(){
            translate([-displacement/2,0,-thickness+1])
            cylinder(d=26, h=0.1, center=true);
            translate([-displacement/2,0,-thickness])
            cylinder(d=25, h=0.1, center=true);
            translate([displacement,0,ht])
            cylinder(d=size+1.2, h=0.1, center=true);
        }
        chairfeet(displacement,size);
    }
}
module chairfeet(displacement, size){
    feet_dim = 25;
    ht = 20;
    hull(){
    translate([0,0,feet_dim/2])
    difference(){
        sphere(d=feet_dim);
        translate([0,0,feet_dim/2])
        cylinder(d=26, h=feet_dim, center=true);
    }
    translate([displacement,0,ht])
    cylinder(d=size, h=0.1, center=true);
    }
}