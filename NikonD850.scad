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
arca =[[35,8],[35,10],[38,13],[38,15],[0,15],[0,13],[3,8],[3,8],[-4,0],[0,0],[1,1],[40,1],[42,0]];

tp = [
  [0, 1],
  [1, 0]
];
base1 = 120;
base2 = 70;
crossbar=[[0,base2,0],[0,0,0],[base1,0,0],[base1,2,0],[base1/4,base2/4,100],[2,base2,0]];
union() 
{
    difference()
//    union()
    {
        union() 
        {
            rotate([90, 0, 0])
                linear_extrude(height = base1)
                    polygon(points = arca * tp);
            translate([0, -base1, 0])
                rotate_extrude(angle = -90)
                    polygon(points = arca * tp);
            translate([0, -base1, 0])
                rotate([90, 0, -90])
                    linear_extrude(height = base2)
                        polygon(points = arca * tp);
//do the crossbar
            translate([0, -base1, -4])
                rotate([0, 0, 90])
                    linear_extrude(height = 4)
              polygon(polyRound(crossbar ));
        }
//do the slot
    translate([15, -65, 19])
    union()
    {
        cutout(10,10,10);
        cutout(15,4,10);
    };
  };
  /*
  off=2;
  translate([-off,-2,-off])    
    minkowski() 
    {
        hull()        
        union()
            {
            base1o=base1-off;
            sq = [
            [0, 0],
            [1, 0],
            [1, 5],
            [0, 5]
            ];
            rotate([90, 0, 0])
                linear_extrude(height =base1o )
                    polygon(points = sq);
            translate([0, -base1o, 0])
                rotate_extrude(angle = -90)
                    polygon(points = sq);
            translate([0, -base1o, 0])
                rotate([90, 0, -90])
                    linear_extrude(height = base2-off*2)
                        polygon(points = sq);
    }
    sphere(2);
  }
*/
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
