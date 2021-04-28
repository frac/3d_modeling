

xdim = 85;
ydim = 140;
height = 100;
wall = 5;
radius = 5;
hex_size = 20;

total_x_hex = (xdim - 2*radius - 2*wall) / (hex_size) ;
total_y_hex =  (ydim - 2*radius - 2*wall) / (hex_size) ;
remain_x = ((total_x_hex * 10) % 10) /10;
remain_y = ((total_y_hex * 10) % 10) /10;
echo("total x", total_x_hex, "remain", remain_x);
echo("total y", total_y_hex, "remain", remain_y);
total_z_hex = (height - 2 * radius - 2*wall) / (hex_size * .87);
echo("total z", total_z_hex);
$fn=100;

module hex_y_wall ()  {
    for(j=[0:total_z_hex-1]){
        slide = ((j % 2) == 1) ?  hex_size/2 : 0;
        total_y = ((j % 2) == 1) ?  total_y_hex -1  : total_y_hex;
        translate([0, slide, j * hex_size * 0.87 ])
        for(i=[0:total_y - 1]){
            translate([0, i * ( hex_size), 0]) 
            rotate(a=[0,-90,0])
            cylinder($fn=6, d=hex_size, h=xdim);
        }
    }
 }

module hex_x_wall ()  {
    for(j=[0:total_z_hex-1]){
        slide = ((j % 2) == 1) ?  hex_size/2 : 0;
        total_x = ((j % 2) == 1) ?  total_x_hex -1 : total_x_hex ;
        translate([slide, 0,  j * hex_size * 0.87 ])
        for(i=[0:total_x-1]){
            translate([i * ( hex_size), 0, 0]) 
            rotate(a=[-90,0,0])
            rotate(30)
            cylinder($fn=6, d=hex_size, h=ydim);
        }
    }
 }


difference(){
    minkowski(){
    cube(size = [xdim -2*radius, ydim-2*radius,height-4]);
    cylinder (r=radius, h=2, center=true);
    };
    translate([wall, wall, wall]) 
    minkowski(){
        cube(size = [xdim -2*(radius+wall), ydim-2*(radius+wall), height]);
       sphere (r=radius);
    };
    /**/
    #translate([xdim - radius, ((remain_y/2 )* hex_size ) + wall + 0.5* hex_size, wall + radius + hex_size/2])
    hex_y_wall ();
    #translate([((remain_x/2 )* hex_size ) + wall + 0.5* hex_size, -radius,wall + radius + hex_size/2])
    hex_x_wall ();
    
}


//cylinder($fn=6, d1=10, d2=14, h=10);
//