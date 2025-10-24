include <Round-Anything/polyround.scad>;
include <Round-Anything/minkowskiRound.scad>;
include <boltsos/BOLTS.scad>;


squsize = 50;
bordersiz = 20;
sqHeight=.5;
squsize10=squsize*8+bordersiz*2;

module mytext(t)
{
text(t,halign ="right",valign="center",font="Stardos Stencil:style=Bold");
}
module board() 
{   
    for (i = [0,1,2,3,4,5,6,7])
        for (j = [0,1,2,3,4,5,6,7])
        {
            if(((i+j)%2)==1)
            {
                translate([i*squsize, j*squsize, 0])
                         cube([squsize,squsize,sqHeight]);
            };
        };        
     for (i = [1,2,3,4,5,6,7])
        for (j = [1,2,3,4,5,6,7])
        {
                translate([i*squsize, j*squsize, 0])
                       rotate([0,0,45])
                            translate([-sqHeight/4, -sqHeight/4, 0])
                                cube([sqHeight/2,sqHeight/2,sqHeight]);
        };    
};

module lettering(rangle)
{
 linear_extrude(height = sqHeight)
 rotate([0,0,270])
    {
    //lettering     
        translate([-bordersiz/2, -bordersiz/2, 0])
        {
        rotate([0,0,rangle])
            mytext("h");
            translate([-squsize, 0, 0])
        rotate([0,0,rangle])
                 mytext("g");
            translate([-squsize*2, 0, 0])
        rotate([0,0,rangle])
                 mytext("f");
            translate([-squsize*3, 0, 0])
        rotate([0,0,rangle])
                 mytext("e");
            translate([-squsize*4, 0, 0])
        rotate([0,0,rangle])
                 mytext("d");
            translate([-squsize*5, 0, 0])
        rotate([0,0,rangle])
                 mytext("c");
            translate([-squsize*6, 0, 0])
        rotate([0,0,rangle])
                 mytext("b");
            translate([-squsize*7, 0, 0])
        rotate([0,0,rangle])
                 mytext("a");
        };
    };
}
module numbering(rangle)
{
     linear_extrude(height = sqHeight)
     rotate([0,0,270])
        {
        //lettering     
            translate([-bordersiz/2, -bordersiz/2, 0])
            {
            rotate([0,0,rangle])
                mytext("8");
                translate([-squsize, 0, 0])
            rotate([0,0,rangle])
                     mytext("7");
                translate([-squsize*2, 0, 0])
            rotate([0,0,rangle])
                     mytext("6");
                translate([-squsize*3, 0, 0])
            rotate([0,0,rangle])
                     mytext("5");
                translate([-squsize*4, 0, 0])
            rotate([0,0,rangle])
                     mytext("4");
                translate([-squsize*5, 0, 0])
            rotate([0,0,rangle])
                     mytext("3");
                translate([-squsize*6, 0, 0])
            rotate([0,0,rangle])
                     mytext("2");
                translate([-squsize*7, 0, 0])
            rotate([0,0,rangle])
                     mytext("1");
            };
        };
}
//union()
difference()
{
    if(1)
    {
    //Border    
         translate([-bordersiz, -bordersiz, 0])
            cube([squsize10,bordersiz,sqHeight]);
         translate([-bordersiz, -bordersiz, 0])
            cube([bordersiz,squsize10,sqHeight]);
         translate([-bordersiz, squsize*8, 0])
            cube([squsize10,bordersiz,sqHeight]);
         translate([squsize*8, -bordersiz, 0])
            cube([bordersiz,squsize10,sqHeight]);
         board() ;
    };    
    if(1)
    {
        translate([0 ,squsize/4, 0])
            lettering(0);        
        translate([squsize10-bordersiz, squsize/4, 0])
            lettering(180);  
        translate([-bordersiz/4+squsize*8,-bordersiz/4,0])
            rotate([0,0,90])
                numbering(270);              
        translate([-bordersiz/4+squsize*8,bordersiz+squsize*8,0])
            rotate([0,0,90])
                numbering(90);              
    }
    if(1)
    {
         translate([-bordersiz, squsize*4, 0])         
            cube([squsize10,.5,sqHeight*2]);
         translate([ squsize*4,-bordersiz, 0])         
            cube([.5,squsize10,sqHeight*2]);
    }
};
         
