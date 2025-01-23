include <Round-Anything/polyround.scad>
vArca_length = 20;
vArca_width = 38;
vArca_height = 7;
vArcaBase_cutout = 4;
vArcaBase_height = 1.5;
vArca_offsetX = 0;
vArca_offsetY = -vArca_width / 2;
vArca_offsetZ = vArca_height * 2;

vArcaEdgeCutoff = 3;
//arca =[[35,8],[35,10],[38,13],[38,15],[0,15],[0,13],[3,8],[3,8],[-4,0],[0,0],[1,1],[40,1],[42,0]];
arcar =[[35,8],[35,10],[38,13],[38,15],[0,15],[0,13],[3,8],[3,8],[-7,0],[-3,0],[-2,1],[43,1],[45,0],[48,0]];
arca=[[35,8],[35,10],[38,13],[38,15],[0,15],[0,13],[3,8],[3,8],[-7,0],[-5,-2],[-2,1],[43,1],[45,0],[48,0]];
tp = [
  [0, 1],
  [1, 0]
];
base1 = 88;
base2 = 80;
crossbar=[[0,base2,0],[0,0,0],[base1,0,0],[base1,10,10],[base1/2,10,100],[base1/4,base2/4,100],[20,base2,10]];
union() 
{
    difference()
//    union()
    {
        union() 
        {
//bottom
            rotate([90, 0, 0])
                linear_extrude(height = base1)
                    polygon(points = arca * tp);
//corner
            translate([0, -base1, 0])
                hull()
                    rotate_extrude(angle = -90)
                            polygon(points = arcar * tp);
//side
            translate([0, -base1, 0])
                rotate([90, 0, -90])
                    linear_extrude(height = base2)
                        polygon(points = arca * tp);
//corner
            translate([-base2, -base1, 0])
                hull()
                    rotate([0, 0, 180])
                        rotate_extrude(angle = 90)
                            polygon(points = arcar * tp);
//do the crossbar
            translate([0, -base1, -7])
                rotate([0, 0, 90])
                    linear_extrude(height = 2)
              polygon(polyRound(crossbar ));
//top
            translate([-base2, -base1, 0])
            rotate([90, 0, 180])
                linear_extrude(height = 15)
                    polygon(points = arca * tp);
        }
//do the slot
        union()
        {
            //lanyard hole
            translate([-base2+10,-base1-15, 7])
                rotate([-90, 0, -90])
                    union()
                    {
                      //  cutout(10,12,10);
                        cutout(15,4,10);
                        rotate([0, -90, 0])
                            cylinder(h=10,r1=19,r2=12);
                    };
                    //camera mount hole
            translate([15, -37, 10])
            union()
            {
                cutout(10,12,10);
                cutout(15,4,10);
//                    translate([0, 3, -10])                
//                        cutout(10,12,10);
            };
            translate([0, -base1+5, 35])
                rotate([90, 0, -90])
                    linear_extrude(height = 61)
                        square(15);
        };
  };
};

module cutout(h1,r1,w)
{
    rotate([0, -90, 0])
    hull()
    {
        translate([0, w/2,0 ])   
            cylinder(h=h1,r=r1);
        translate([0, -w/2,0 ])    
            cylinder(h=h1,r=r1);
    };
};
