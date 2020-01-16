width = 61.4;
height = 14.75;
depth = 9;
thickness = 1.5;

module door_angle() {
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

    translate([11.1,0,0])
        door_angle();

    translate([width-3.4,0,0])
        door_angle();
}

difference() {
    door_solid();

    fingernail();
}