include <Round-Anything/polyround.scad>
include <Round-Anything/minkowskiRound.scad>
include <boltsos/BOLTS.scad>

//arca=[[35,8],[35,10],[38,13],[38,15],[0,15],[0,13],[3,8],[3,8],[-4,0],[0,0],[1,1],[40,1],[42,0]];
arca=[[35,8],[35,10],[38,13],[38,15],[0,15],[0,13],[3,10],[3,8],[0,5],[0,3],[38,3],[38,5]];

fitting=[[0,15],[0,0],[5,0],[5,13],[6,15]];
gap=[[0,0],[4,0],[0,100]];
tp = [
  [0, 1],
  [1, 0]
];
base1 = 50;
base2 = 42+6-.7;//84mm + 6mm for width of mount-.2 rounding?
union() 
{
     difference()
//   union()
    {
        union() 
        {                        
            //ring
             translate([-base2,0,  15])
                rotate([180,0,0])
                    rotate_extrude()
                        translate([-base2,0,  0])
                            polygon(fitting);

            minkowskiRound() 
            union()
            {
            //arca mount
             translate([8,-20,  0])
                linear_extrude(height = base1)
                    polygon(points = arca * tp);

            //offset
             translate([-5,-20, 0])
                        cube([17,38,15], center=false);
            }
        }
        union()
        {
            translate([-50,0, 0])    
                rotate([0,0,-90])
                    linear_extrude(height = base1)
                        polygon(points =gap);
//            cube([80,2,150], center=true);
            rotate([90,0,0])
                translate([.5,7, 0])
                    union()
                    {
                     translate([0,0,19])
                        cylinder( 6,4,4,true);
                     translate([0,0,-15])
                        ISO4014("M4",35);
                     translate([0,0,  -20])
                        cylinder( 6,4,4,true);
                    }
             cube([200,200,1], center=true);
        }
  };
};
