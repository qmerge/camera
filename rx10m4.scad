

arca =[[35,8],[35,10],[38,13],[38,15],[0,15],[0,13],[3,8],[3,8],[-2,1],[0,1],[1,1],[40,1],[41,1]];

fitting=[[0,15],[0,0],[5,0],[5,13],[6,15]];

tp = [
  [0, 1],
  [1, 0]
];
base1 = 100;
base2 = 42+6-.7;//84mm + 6mm for width of mount-.2 rounding?
union() 
{
     difference()
//   union()
    {
        union() 
        {
            translate([-4, -21, 0])
                rotate([ 0,-90, 0])
            union()
            {
                linear_extrude(height = 11)
                    polygon([[40,-13],[55,-2],[55,-18]]);
                linear_extrude(height = 11)
                    polygon([[40,55],[55,44],[55,60]]);
                linear_extrude(height = 10)               
                    polygon([[55,-18],[55,60],[0,42],[0,0]]);
                linear_extrude(height = 11)
                    polygon([[0,42],[0,0],[1,0],[1,42]]);
            }
             translate([-5,-19,  0])
                linear_extrude(height = base1)
                    polygon(points = arca * tp);
         }
                     translate([20, 0, 10])
           rotate([ -90,0, 0])
     union()
            {
                cutout(30,12,10);
                translate([-20, 0, 0])
                    cutout(15,4,10);
//                    translate([0, 3, -10])                
//                        cutout(10,12,10);

                rotate([ 0,-40, 0])
                    translate([-80, 0, -11])                   
                        cube([100,100,20], center=true);
                rotate([ 0,40, 0])
                    translate([-80, 0, 12])  
                        cube([100,100,20], center=true);
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

