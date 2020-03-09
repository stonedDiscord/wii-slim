/* [Dimensions] */
width = 38.75; // [0:0.25:50]
height = 23.5; // [0:0.25:40]
depth = 1.5; // [0:0.25:3]

frame_thickness = 2.5; // [0:0.25:5]

mesh_thickness = 1; // [0:0.25:4]

hole_thickness = 2; // [0:0.25:4]

$fn = $preview ? 8 : 100;

// frame
cube([width,frame_thickness,depth]);

cube([frame_thickness,height,depth]);

translate([width-frame_thickness,0,0])
    cube([frame_thickness,height,depth]);

translate([0,height-1,0])
    cube([width,1,depth]);

// mesh
translate([frame_thickness+13,0,0])
    cube([mesh_thickness,height,depth]);

translate([frame_thickness+13+mesh_thickness+6,0,0])
    cube([mesh_thickness,height,depth]);

translate([0,frame_thickness+6,0])
    cube([width,mesh_thickness,depth]);

translate([0,frame_thickness+6+mesh_thickness+6,0])
    cube([width,mesh_thickness,depth]);

// clip
difference() {
    translate([0,1.5,0])
        cube([1.5,21,6]);

    // hole 1
    translate([-1,6,4])
        rotate([0,90,0])
            cylinder(d=hole_thickness , h=3);

    translate([-1,6-hole_thickness/2,4])
        cube([3,hole_thickness,10]);

    // hole 2
    translate([-1,20,4])
        rotate([0,90,0])
            cylinder(d=hole_thickness , h=3);

    translate([-1,20-hole_thickness/2,4])
        cube([3,hole_thickness,10]);
}
