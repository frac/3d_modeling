$fn=100;

module importsvg(angle=30){
    difference(){
        rotate([0,0,angle]) import(file="six_pt_star.svg");
        translate([-50,0]) square([100,100], center = true); //remove negative x values because openscad doesn't like it 
    }
};

rotate_extrude(angle=180, convexity=10) importsvg(30);
//rotate([0,60,0]) rotate_extrude(angle=-180, convexity=10) importsvg(30); //uncomment to view full shape
