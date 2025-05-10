include <Round-Anything/polyround.scad>
include <boltsos/BOLTS.scad>

//arca =[[35,8],[35,10],[38,13],[38,15],[0,15],[0,13],[3,8],[3,8],[-4,0],[0,0],[1,1],[40,1],[42,0]];
arca =[[35,8],[35,10],[38,13],[38,15],[0,15],[0,13],[4,10],[4,8],[0,4],[0,2],[38,2],[38,4]];

fitting=[[0,18],[0,0],[5,0],[5,18]];


tp = [
  [0, 1],
  [1, 0]
];
base1 = 50;
base2 = 40+5.25;//84mm + 6mm for width of mount-.2 rounding?
union() 
{
     difference()
//   union()
    {
        union() 
        {
            
             translate([-5,-19,  0])
                linear_extrude(height = base1)
                    polygon(points = arca * tp);
            //*/
                translate([-15,0, 0])
             translate([-base2,0,  0])
                rotate_extrude()
                    translate([-base2,0,  0])
                        polygon(fitting);
            //offset
                translate([-11.4, 0,8])
                    cube([18,38,16], center=true);
            //corner
            rotate([0,40,0])
                translate([-13.7, 0,6])
                    cube([2.1,38,16], center=true);

        }
        union()
        {
            cube([60,2,100], center=true);
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
        }
  };
};
