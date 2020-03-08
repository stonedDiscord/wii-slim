// front of the case with the drive slot

wall_thickness = 2;

height = 40 + wall_thickness*2;
width = 153 + wall_thickness*2;
depth = 14.15;

slope = 6.5;

door_width = 61.75;

$fn = $preview ? 8 : 100;

module button(button_width) {
    cube([button_width,14,100]);
}

module main_buttons(eject=true) {
    // power
    translate([wall_thickness+13,height-3.25-14,-1])
        button(6);

    // reset
    translate([29.75,height-3.25-14,-1])
        button(4.5);

    // eject
    if (eject)
        translate([width-wall_thickness-12-6,height-3.25-14,-1])
            button(6);

    // sync
    translate([51.5,height-18,-1])
        cube([5.5,10.25,100]);
}

module button_angle(bheight) {
    difference() {
        cube([1.5,3.5,bheight]);

        translate([-1,3.5/2,bheight])
            rotate([0,90,0])
                cylinder(d=1.5 ,h=3);
    }
}

module button_angles() {
    // power
    translate([13,height-21,0])
        button_angle(wall_thickness+1);

    translate([23.5,height-21,0])
        button_angle(wall_thickness+1);

    // reset
    translate([26,height-21,0])
        button_angle(wall_thickness+1);

    translate([36.5,height-21,0])
        button_angle(wall_thickness+1);

    // eject
    translate([width-22,height-21,0])
        button_angle(wall_thickness+1);

    translate([width-13,height-21,0])
        button_angle(wall_thickness+1);

    // sync
    translate([42.5,height-17+1.5,0])
        rotate([0,0,270])        
            button_angle(wall_thickness+3);

    translate([42.5,height-10.25+1.5,0])
        rotate([0,0,270])        
            button_angle(wall_thickness+3);
}

module disk_slot() {
    disk_slot_width = 129.25;
    disk_slot_height = 6.25;

    translate([16.75,11.5,-1])
    linear_extrude(100)
    hull() {
        circle(d = disk_slot_height);

        translate([disk_slot_width/2,0,0])
            circle(d = 7.75);

        translate([disk_slot_width-disk_slot_height,0,0])
            circle(d = disk_slot_height);  
    }
}

module sd_door() {
    // widest outer plate
    translate([wall_thickness+44.5,height-19.5,2])
        cube([65,19.5,2]);

    // narrow block
    translate([wall_thickness+55.5,height-19.5,0])
        cube([51,19.5,5]);

    // highest part
    translate([wall_thickness+55.5,height-17.6,0])
        cube([51,17.6,8]);

    // inner border
    translate([58.5-1,27-1.5,depth-11])
        cube([51,1.5,5]);
}

module sd_cutout() {
    // the biggest hole that goes through the entire thing
    translate([58.75,height-12-5,-1])
        cube([49,12,10]);

    // left space for the sd door angle that goes through
    translate([wall_thickness+55.5,height-4-1.75,-1])
        cube([3.5,1.75,10]);

    // right space for the sd door angle that goes through
    translate([width-48-3.5,height-4-1.75,-1])
        cube([3.5,1.75,10]);

    // inside
    translate([wall_thickness+71.25,height-19.5-1,wall_thickness+1])
        cube([10.5,1.25+1,10]);

    // holes for the clip on the door to go in z direction
    translate([wall_thickness+65.25,height-19.5-1,wall_thickness+0.1])
        cube([3,1.9+1,10]);
    translate([wall_thickness+85.25,height-19.5-1,wall_thickness+0.1])
        cube([3,1.9+1,10]);

    // same but in y direction
    translate([wall_thickness+65.25,height-19.5-1,wall_thickness+0.1])
        cube([3,10,1]);
    translate([wall_thickness+85.25,height-19.5-1,wall_thickness+0.1])
        cube([3,10,1]);

    // around sync button
    translate([48, 25.75, -1]) {
        cube([10.75,200,3.15+1]);
    }

    // right side
    translate([width-49.25, 25.75, -1]) {
        cube([2.25, 200, 3.15+1]);    
    }

    translate([width-49.25-22, 25.75, -1]) {
        cube([22, 200, 3.65+1]);    
    }

    // left side
    translate([58.5, 25.75, -1]) {
        cube([13.6, 200, 3.65+1]);    
    }

    // middle
    translate([48, 25.75, -1]) {
        cube([door_width,200,1.5+1]);
    }

    // angle side
    translate([48, height-5.5, -1]) {
        cube([door_width,200,depth-9.15+1]);
    }
}

module sticker() {
    cube([8,0.1+1,5.5]);
}

module light_holder() {
    rotate([90,0,90])
        linear_extrude(1.25)
            polygon([[0,0],[0,7.5+2],[1.25,7.5+2],[2.15,5+2],[2.15,4+2],[1.25,4+2],[1.25,0]]);
}

module light_holders() {
    for(i=[0:3]) {
        translate([24.40+33.75*i,2,0])
            light_holder();
    }
}

module screwhole(screw_radius) {
    // a screw from the left side
    rotate([0,90,270])
            cylinder(h=6,r=screw_radius);

    // recessed
    rotate([0,90,270])
            cylinder(h=0.75,r=screw_radius+1);

}

module screwholes() {
    translate([9,height,depth-3])
        screwhole(1.5);
    translate([width-8,height,depth-3])
        screwhole(1.5);
}

module screwhole_supports() {
    translate([6,height-2.5,depth-5])
        cube([6,2.5,5]);
    translate([width-11,height-2.5,depth-5])
        cube([6,2.5,5]);
}

module screw_flap() {
    cube([1,12,8]);

    translate([0,4,0])
        difference() {
            cube([1,8,22.15]);

            translate([-1,3,22.15-2])
                rotate([0,90,0])
                    cylinder(d = 1.75, h = 3);
        }
}

module screw_flaps() {
    translate([6,0,0])
        screw_flap();

    translate([width-wall_thickness-3,0,0])
        screw_flap();

    // supports
    translate([0,7.5,0])
        cube([7,1,8]);

    translate([width-5,7.5,0])
        cube([5,1,8]);
}

module screwpost(standoff_height)
{
    difference()
    {
        cylinder(h=standoff_height, d=3.75);
        cylinder(h=standoff_height+1, d=1.75) ;       
    };    
};

module screwposts() {
    translate([11,height-13.5,0])
        screwpost(8.75);

    translate([width-43,height-11.5,0])
        screwpost(8.75);

    translate([width-26,height-13,0])
        screwpost(8.75);
}

module sticker_cutouts() {
    translate([4.5,height-0.1,depth-5.5])
        sticker();
    translate([width-4-8,height-0.1,depth-5.5])
        sticker();
}

module slope_cutaway() {
    translate([-1, height-slope, 0])
    rotate([0,90,0])
        linear_extrude(width+2)
            polygon([[0,0],[0,slope+1],[0-slope-1,slope+1]]);
}

module base() {
    cube([width,height-slope,wall_thickness]);

    cube([width,wall_thickness,depth]);

    // left and right
    cube([wall_thickness,height,depth]);
    translate([width-wall_thickness,0,0])
        cube([wall_thickness,height,depth]);

    // slope
    translate([0,height-slope,0])
        rotate([45,0,0])
            cube([width,slope*sqrt(2),wall_thickness]);

    translate([0,height-wall_thickness,depth-8])
        cube([width,wall_thickness,8]);

    // door borders
    sd_door();

    light_holders();
    button_angles();
    screw_flaps();

    screwposts();

    screwhole_supports();    
}

difference() {
    base();

    slope_cutaway();

    if ( height > 32) {
        disk_slot();
        main_buttons();
    } else {
        main_buttons(eject=false);
    }

    sd_cutout();
    sticker_cutouts();
    screwholes();
}