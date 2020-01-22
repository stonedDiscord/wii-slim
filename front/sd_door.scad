width = 61.4;
height = 14.75;
depth = 9;
thickness = 1.5;

$fn = $preview ? 12 : 100;

module door_angle() {
    rotate([90,0,-90])
    linear_extrude(0.45)
    intersection() {
        circle(7);

    polygon([[0,0],[7,0],[7,-7],[2,-4],[3.5,-2.75],[0,-2.75]]);
    
    }
}

module door_nipple() {
    rotate([0,90,0])
        cylinder(d=1.5,h=2.35);
}

module door_angle_holder() {
    cube([0.9,9,3.5]);
}

module clip() {
    cube([6,0.9,3.5]);

    translate([3,0.9,3])
        rotate([90,0,0])
            cylinder(d = 1, h = 1.4);
}

module fingernail() {
    translate([25.5,-1,0.5])
        cube([10,0.5+1,1+1]);
}

module door_solid() {
    cube([width,9,thickness]);

    translate([0,9,0])
        rotate([45,0,0])
            cube([width,4.5,thickness]);

    translate([17.5,0,0])
        clip();

    translate([width-23.75,0,0])
        clip();

    // left
    translate([11.1,0,0])
        door_angle_holder();

    * translate([11.1,height-1.25,depth-1])
        door_angle();

    * translate([11.1-1.4,height-2,depth-3.25])
        door_nipple();

    // right
    translate([width-3.4,0,0])
        door_angle_holder();

    * translate([width-3.4+0.9+0.45,height-1.25,depth-1])
        door_angle();

    * translate([width-3.4,height-2,depth-3.25])
        door_nipple();
}

difference() {
    door_solid();

    fingernail();
}