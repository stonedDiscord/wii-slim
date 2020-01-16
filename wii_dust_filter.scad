width = 38.75;
height = 23.5;
depth = 1.5;

$fn = $preview ? 8 : 100;

// frame
cube([width,2.5,depth]);

cube([2.5,height,depth]);

translate([width-2.5,0,0])
    cube([2.5,height,depth]);

translate([0,height-1,0])
    cube([width,1,depth]);

// mesh
translate([2.5+13,0,0])
    cube([1,height,depth]);

translate([2.5+13+1+6,0,0])
    cube([1,height,depth]);

translate([0,2.5+6,0])
    cube([width,1,depth]);

translate([0,2.5+6+1+6,0])
    cube([width,1,depth]);

// clip
difference() {
    translate([0,1.5,0])
        cube([1.5,21,6]);

    translate([-1,6,4])
        rotate([0,90,0])
            cylinder(r=1 , h=3);

    translate([-1,5,4])
        cube([3,2,10]);

    translate([-1,20,4])
        rotate([0,90,0])
            cylinder(r=1 , h=3);

    translate([-1,19,4])
        cube([3,2,10]);
}
