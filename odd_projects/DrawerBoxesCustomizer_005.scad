///Designed by 1SPIRE, inspired from ALEXENDRE CHAPPEL assortment system boxes///
//Updated by Yashrg to add the possibility of flat inside bottom of boxes with grid indents on the outside bottom


/* [Drawer Parameters] */
// Inside Drawer Width
ID_W=335;
// Inside Drawer Length
ID_L=430; 
// Inside Drawer Height
ID_H=80; 

/* [Matrix and Grid Parameters] */
//Matrix Drawer Width
MAT_W=6; //[1:1:20]
//Matrix Drawer Length
MAT_L=8; //[1:1:20]
//Matrix Drawer Height
MAT_H=1; //[1:1:6]
//Tolerance (Space between boxes)
Tol=0.4; 
//Grid Tickness (radius value = height = half of the width)
G_rad=2;

/* [Boxes Parameters] */
//Wall Thickness Box
B_WT=1.6; 
//Bottom Thickness Box
B_BT=1.25; 
//Radius inside box
B_rad=2.5; 
//Sticker Lip
ST=1; //[0:No,1:Yes]
//Sticker Lip Width
ST_W=30; 
//Sticker Lip Height
ST_H=9; 
//Definition 
$fn=60; //[20:120]

/* [Grid to print, see ECHO for the exact size] */
//Number of grid sections on the width, must be < Matrix Drawer Width
GTP_W=3; //[1:1:20]
//Number of grid sections on the length, must be < Matrix Drawer Length
GTP_L=4; //[1:1:20]

/* [Box to print, Size of the box] */
//Grid Inlay
GI=1; //[0:No,1:Yes]
//Coef of matrix along width, must be < Matrix Drawer Width
BTP_W=1; //[1:1:20]
//Coef of matrix along length, must be < Matrix Drawer Length
BTP_L=1; //[1:1:20]
//Coef of matrix along height, must be < Matrix Drawer Height
BTP_H=1; //[1:1:6]

/* [Box to print, Separators] */
//Duplicate sticker lip
DST=0; //[0:No,1:Yes]
//Box separators, Coef of matrix along width, must be < BTP_W
BTP_SW=0; //[0:1:20]
//Box separators, Coef of matrix along length, must be < BTP_L
BTP_SL=0; //[0:1:20]

/* [Preview and Render] */
Preview=2; //[0:Drawer and grid preview,1:Grid to print,2:Setup Preview,3:Box to print]


///////
///////
///////


MAT_W_UNIT=ID_W/MAT_W;
MAT_L_UNIT=ID_L/MAT_L;
MAT_H_UNIT=ID_H/MAT_H;
echo("Matrix Width unit=",MAT_W_UNIT);
echo("Matrix Length unit=",MAT_L_UNIT);
echo("Matrix Height unit=",MAT_H_UNIT);
echo("Grid to print Width=",GTP_W*MAT_W_UNIT);
echo("Grid to print Length=",GTP_L*MAT_L_UNIT);


module Drawer() {
    difference() {
        translate([-ID_W/2-10,-ID_L/2-10,-5]) cube([ID_W+20,ID_L+20,ID_H+5]);
        translate([-ID_W/2,-ID_L/2,0]) cube([ID_W,ID_L,ID_H+5]);
    }
}

module GridUnit(orientation,length) {
    if(orientation=="L") {
        difference() {
            rotate([90,0,0]) cylinder(d=2*G_rad,h=length,$fn=4,center=true);
            translate([0,0,-1.5*G_rad]) cube([3*G_rad,length+2,3*G_rad],center=true);
        }
    }
    
    else if (orientation=="W") {
        difference() {
            rotate([0,90,0]) cylinder(d=2*G_rad,h=length,$fn=4,center=true);
            translate([0,0,-1.5*G_rad]) cube([length+2,3*G_rad,3*G_rad],center=true);
        }
    }
}

module Grid() {
    intersection() {
        union() {
            for(i=[0:1:MAT_W]) translate([i*MAT_W_UNIT-ID_W/2,0,0]) GridUnit("L",ID_L);
            for(i=[0:1:MAT_L]) translate([0,i*MAT_L_UNIT-ID_L/2,0]) GridUnit("W",ID_W);
        }
        cube([ID_W,ID_L,3*G_rad],center=true);
    }
}

module Box(DIV_W,DIV_L,DIV_H) { //DIV=coef matrix (width, length, height)
    difference() {
        hull() {
            for(i=[-1,1],j=[-1,1]) {
                translate([i*(DIV_W*MAT_W_UNIT/2-B_rad-B_WT-Tol/2),j*(DIV_L*MAT_L_UNIT/2-B_rad-B_WT-Tol/2),G_rad+0.2]) cylinder(r=B_rad+B_WT,h=DIV_H*MAT_H_UNIT-G_rad-0.2);
                translate([i*(DIV_W*MAT_W_UNIT/2-B_rad-B_WT-Tol/2-G_rad),j*(DIV_L*MAT_L_UNIT/2-B_rad-B_WT-Tol/2-G_rad),0]) cylinder(r=B_rad+B_WT,h=B_BT);
            }
        }
        
        if (GI==1) {
            for(i=[1:1:DIV_W-1]) translate([i*MAT_W_UNIT-DIV_W*MAT_W_UNIT/2,0,0]) rotate([90,0,0]) cylinder(d=2*G_rad+0.4,h=DIV_L*MAT_L_UNIT+2,$fn=4,center=true);
            for(i=[1:1:DIV_L-1]) translate([0,i*MAT_L_UNIT-DIV_L*MAT_L_UNIT/2,0]) rotate([0,90,0]) cylinder(d=2*G_rad+0.4,h=DIV_W*MAT_W_UNIT+2,$fn=4,center=true);
        }
        
        difference() {
            hull() {
                for(i=[-1,1],j=[-1,1]) translate([i*(DIV_W*MAT_W_UNIT/2-B_rad-B_WT-Tol/2),j*(DIV_L*MAT_L_UNIT/2-B_rad-B_WT-Tol/2),B_BT+B_rad]) cylinder(r=B_rad,h=DIV_H*MAT_H_UNIT);
                for(i=[-1,1],j=[-1,1]) translate([i*(DIV_W*MAT_W_UNIT/2-B_rad-B_WT-Tol/2-G_rad),j*(DIV_L*MAT_L_UNIT/2-B_rad-B_WT-Tol/2-G_rad),B_BT]) cylinder(r=B_rad,h=DIV_H*MAT_H_UNIT);
            }
            
            if (GI==1 &&B_BT<=(G_rad)) {
                translate([0,0,0]) {
                    for(i=[1:1:DIV_W-1]) translate([i*MAT_W_UNIT-DIV_W*MAT_W_UNIT/2,0,0]) rotate([90,0,0]) cylinder(d=2*G_rad+0.4+2*B_BT,h=DIV_L*MAT_L_UNIT+2,$fn=4,center=true);
                    for(i=[1:1:DIV_L-1]) translate([0,i*MAT_L_UNIT-DIV_L*MAT_L_UNIT/2,0]) rotate([0,90,0]) cylinder(d=2*G_rad+0.4+2*B_BT,h=DIV_W*MAT_W_UNIT+2,$fn=4,center=true);
                }
            }
            
        
            if (ST==1) {
                if (DST==0) {
                    translate([0,-DIV_L*MAT_L_UNIT/2,DIV_H*MAT_H_UNIT]) difference() {
                        hull() {
                                for(i=[-1,1],j=[-B_rad*2,ST_H-B_rad*2+B_WT]) {
                                    translate([i*(ST_W/2-B_rad),j-(-B_rad-Tol/2),-0.5]) cylinder(r=B_rad,h=1);
                                    translate([i*(ST_W/2-B_rad),-B_rad*2-(-B_rad-Tol/2),-1.5*ST_H-0.5]) cylinder(r=B_rad,h=1);
                                }
                        }
                        translate([-ST_W/2-1,-5,-1.5*ST_H-1]) cube([ST_W+2,B_WT+3.5,1.5*ST_H+2]);
                    }
                }
                if (DST==1) {
                        for(i=[0.5:1:BTP_SW+1],j=[0:1:BTP_SL]) translate([i*BTP_W*MAT_W_UNIT/(BTP_SW+1)-BTP_W*MAT_W_UNIT/2,j*BTP_L*MAT_L_UNIT/(BTP_SL+1)-BTP_L*MAT_L_UNIT/2,DIV_H*MAT_H_UNIT]) difference() {
                            hull() {
                                    for(i=[-1,1],j=[-B_rad*2,ST_H-B_rad*2+B_WT]) {
                                        translate([i*(ST_W/2-B_rad),j-(-B_rad-Tol/2),-0.5]) cylinder(r=B_rad,h=1);
                                        translate([i*(ST_W/2-B_rad),-B_rad*2-(-B_rad-Tol/2),-1.5*ST_H-0.5]) cylinder(r=B_rad,h=1);
                                    }
                            }
                            translate([-ST_W/2-1,-5,-1.5*ST_H-1]) cube([ST_W+2,B_WT+3.5,1.5*ST_H+2]);
                        }
                    
                    
                }
            }
            else{}
            
            
            for(i=[1:1:BTP_SW]) translate([i*BTP_W*MAT_W_UNIT/(BTP_SW+1)-BTP_W*MAT_W_UNIT/2,0,0]) cube([B_WT,BTP_L*MAT_L_UNIT,2.5*MAT_H_UNIT*DIV_H],center=true);
            for(i=[1:1:BTP_SL]) translate([0,i*BTP_L*MAT_L_UNIT/(BTP_SL+1)-BTP_L*MAT_L_UNIT/2,0]) cube([BTP_W*MAT_W_UNIT,B_WT,2.5*MAT_H_UNIT*DIV_H],center=true);
            
        }
    }
}

module GridToPrint(width,length) {
    intersection() {
        union() {
            for(i=[0:1:width]) translate([i*MAT_W_UNIT-width*MAT_W_UNIT/2,0,0]) GridUnit("L",length*MAT_L_UNIT);
            for(i=[0:1:length]) translate([0,i*MAT_L_UNIT-length*MAT_L_UNIT/2,0]) GridUnit("W",width*MAT_W_UNIT);
        }
        cube([width*MAT_W_UNIT,length*MAT_L_UNIT,2*G_rad],center=true);
    }
}


module Rendering(Render) {
    if (Render==0) {
        %Drawer();
        Grid();
    }
    else if (Render==1) {
        GridToPrint(GTP_W,GTP_L);
    }
    else if (Render==2) {
        %Drawer();
        if (GI==1) {translate([0,0,-0.1]) Grid();}
        for(i=[0:BTP_W:MAT_W-BTP_W],j=[0:BTP_L:MAT_L-BTP_L]) translate([-ID_W/2+MAT_W_UNIT/2*BTP_W+i*MAT_W_UNIT,-ID_L/2+MAT_L_UNIT/2*BTP_L+j*MAT_L_UNIT,0]) Box(BTP_W,BTP_L,BTP_H);
    }
    else if (Render==3) {
        Box(BTP_W,BTP_L,BTP_H);
    }
}

Rendering(Preview);

