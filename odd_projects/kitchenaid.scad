$fn = 48;

// length of the side of the connector that slots into the kitchenaid motor port
connector_side = 12;
max_connector_length = 20;

// diameter of the shaft that you can attach things to!
shaft_diameter = 12;

// separates the sleeve from the connector by shortening the connector. helps to not fuse them together
sleeve_separation = 2;
// top outer diameter of the sleeve. sleeve is the outer section that the kitchenaid screws into that doesn't rotate
sleeve_top_d = 23.6;
// top inner diameter of the sleeve
sleeve_bottom_d = 21.4;
// how long the sleeve is
sleeve_length = 27.5;


// how much space there is between the shaft and sleeve. must be smaller than pip_height
slop = 1;
// pips help lock the sleeve and connector in place to each other
pip_height = 2.5;

// virtual vars
total_height = max_connector_length + sleeve_length;
connector_length = max_connector_length - sleeve_separation;
half_shaft = connector_length / 2;
pip_position_one = sleeve_length / 6;
pip_position_two = 4 * sleeve_length / 6;
sleeve_id = shaft_diameter + slop;

// the rectangular prism that connects into the kitchenaid port
module connector() {
  translate([0,0,half_shaft]) cube([connector_side,connector_side,connector_length], center= true);
}

// the shaft, which attaches to the motor coupling and rotates
module shaft(extra_height = 0) {
  cylinder(d=shaft_diameter, h=sleeve_length+sleeve_separation+3);
   /* hull() {
    cube([connector_side + extra_diameter, connector_side + extra_diameter, 0.001], center=true);
    translate([0,0,sleeve_length]) cylinder(d=shaft_diameter + extra_diameter, h=0.001);
  } */
  translate([0,0,extra_height]) pips(shaft_diameter);
}

module pips(diameter) {
  translate([0,0,pip_position_one]) pip_band(diameter);
  translate([0,0,pip_position_two]) pip_band(diameter);
}

// the sleeve, which attaches to the kitchenaid case, and does not rotate
module sleeve() {
    difference() {
      cylinder(d1=sleeve_bottom_d, d2=sleeve_top_d, h=sleeve_length);
      cylinder(d=sleeve_id, h=sleeve_length);
      pips(sleeve_id);
    }
}

// a small band that keeps the shaft in place via a cutout in the sleeve
module pip_band(starting_diameter, height=pip_height) {
  cylinder(d1=starting_diameter, d2 = starting_diameter + height, h = 2);
  translate([0,0,2]) cylinder(d1=starting_diameter + height, d2 = starting_diameter, h = 2);
}

difference() {
  union() {
    connector();
    translate([0,0,max_connector_length]){
      translate([0,0,-sleeve_separation]) {
        shaft(sleeve_separation);
      }
        sleeve();
    }
  }
  // to display cross section
  /* cube(1000); */
}
