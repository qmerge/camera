// loading the base configuration
include <baseconfig.scad>;

// some modules such as hex, countersunk screws, roof, wedge are available in a module file
use <modules.scad>;


vArca_length = 120;
vArca_width = 38;
vArca_height = 7;
vArcaBase_cutout = 4;
vArcaBase_height = 1.5;
vArca_offsetX = 0;
vArca_offsetY = -vArca_width/2;
vArca_offsetZ = vArca_height*2;

vArcaEdgeCutoff = 3;


union(){
    ArcaPlate();     
    translate([0, 0, vArca_offsetZ])
        mirror([0,0,1])
            ArcaPlate();                
};
module ArcaPlate()
{
	difference(){
		union(){
			cube([vArca_length, vArca_width, vArcaBase_height ]);
			translate([0, 0, vArcaBase_height])
				roof(vArca_length, vArca_width, vArca_width/2);
			translate([0,0,vArcaBase_height+vArcaBase_cutout])
				cube([vArca_length, vArca_width, vArca_width]);
		};
		translate([0,0,vArca_height])
			cube([vArca_length, vArca_width, vArca_width]);
		
		// cut off edges
		translate([0, 0, 0])
			rotate([0, 270, 0])
				wedge( vArca_height, vArcaEdgeCutoff, -vArcaEdgeCutoff);
		
		translate([vArca_length, 0, 0])
			rotate([0, 270, 0])
			 wedge(vArca_height, vArcaEdgeCutoff, vArcaEdgeCutoff);
		
		translate([0, vArca_width, 0])
			rotate([0, 270, 0])
				wedge(vArca_height, -vArcaEdgeCutoff, -vArcaEdgeCutoff);
		
		translate([vArca_length, vArca_width, 0])
			rotate([0, 270, 0])
				wedge(vArca_height, -vArcaEdgeCutoff, vArcaEdgeCutoff);
		
	};
};
