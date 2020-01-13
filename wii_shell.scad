// wii top case
// all measurements in mm

width = 157;
height = 206;
depth = 40.5;
// original depth is 40.5
// absolute minimum is 15
// as capacitors will be in the way


side_wall_thickness = 2.6;
connector_wall_thickness = 2.2;
ground_plane_thickness = 2;

triangle = 17.5;

intercase_line = 1.25;

height_back_line = 12.55;

line_thickness = 0.50;

gamecube_port_radius = 9;

feet_outer = 7.5;
feet_border = 0.5;
feet_height = 1;

front_lip = 1.75;

$fn = $preview ? 8 : 100;

module base_shape()
{
    difference()
    {
        polygon([[0,5],[width,5],[width,height],[triangle,height],[0,height-triangle]]);
        // gamecube port cover
        polygon([[width,0],[width,height-height_back_line],[width-2,height-height_back_line],[width-2,0]]);
        // front bezel
        polygon([[width,0],[width,5],[width-3,5],[width-3,0]]);
        polygon([[0,0],[0,5],[2,5],[2,0]]);    
    };
};

module battery_cutout()
{
    translate([0,5,depth-11.75])
        cube([side_wall_thickness,33.5,11.75]);
    
    translate([side_wall_thickness/2,5+side_wall_thickness/2,depth-13])
        cube([side_wall_thickness/2,35.15,13]);
}

module heatsink_cutout()
{
    translate([42,height-35-40,depth-6-32])
        cube([66,40,32]);
}

module intercase_cutout()
{
    // left
    // 1/2
    translate([-3,5,depth-intercase_line])
        cube([3+side_wall_thickness/2,height-triangle-5,intercase_line+10]);
    
    // triangle
    translate([0,height-triangle,depth])
        rotate([180,0,45])
            cube([triangle*sqrt(2),side_wall_thickness/2,intercase_line]);
    
    // connector side
    // they use 1/3 of the plastic thickness for the lip
    translate([triangle,height-2*connector_wall_thickness/3,depth-connector_wall_thickness/2])
        cube([width-triangle,2*connector_wall_thickness/3,connector_wall_thickness/2]);
    
    translate([triangle+12.5,height-connector_wall_thickness/2,depth-5-connector_wall_thickness/2])
        cube([5.5,connector_wall_thickness/2,connector_wall_thickness/2]);
    
    //right
    translate([width-side_wall_thickness/2,height-12.5,depth-intercase_line])
        cube([side_wall_thickness/2,12.5,intercase_line]);
    
    translate([width-5.75+side_wall_thickness/2,0,depth-11.25-intercase_line])
        cube([side_wall_thickness,height-12.5,intercase_line]);
    
}

module screwh(screw_radius)
{
    // a screw from the left side
    rotate([0,90,0])
            cylinder(h=6,r=screw_radius);

    // recessed
    rotate([0,90,0])
            cylinder(h=0.75,r=screw_radius+1);

}

module screwholes()
{
    // bigger ones have a diameter of 3mm
    screw_radius = 3 / 2;
    // left
    translate([0,37.5,6])
        screwh(screw_radius);
    translate([0,125.5,6])
        screwh(screw_radius);
    translate([0,110,depth-2.75])
        screwh(screw_radius);
    // right
    translate([width-3.15,30.5,7.5])
        rotate([0,180,0])
            screwh(screw_radius);
    translate([width-3.15,125.5,7.5])
        rotate([0,180,0])
            screwh(screw_radius);

    // the smaller ones are 2mm in diameter
    small_screw_radius = 2 / 2;
    // left
    translate([0,10,6.25])
        screwh(small_screw_radius);
    
    // right
    translate([width,10,6.25])
        rotate([0,180,0])
            screwh(small_screw_radius);

    // the screwholes for the black gc port plate are 1.5
    smaller_screw_radius = 1.5 / 2;

    translate([width,96,6.25])
        rotate([0,180,0])
            screwh(smaller_screw_radius);

    translate([width,height-23.5,6.25])
        rotate([0,180,0])
            screwh(smaller_screw_radius);

}

module standoff(standoff_height)
{
    difference()
    {
        cylinder(h=standoff_height, r=2.25);
        cylinder(h=standoff_height, r=1.25) ;       
    };    
};

module shield_standoffs()
{
    // standoffs for metal shield
    // left
    translate([15.25-2.25,68-2.25,ground_plane_thickness])
        standoff(3);
        
    translate([15.25-2.25,115-2.25,ground_plane_thickness])
        standoff(3);
        
    translate([16-2.25,132-2.25,ground_plane_thickness])
        standoff(4);

    // right
    translate([width-11.75-2.25,68-2.25,ground_plane_thickness])
        standoff(3);

    translate([width-11.75-2.25,115-2.25,ground_plane_thickness])
        standoff(3);

    translate([width-12.5-2.25,132-2.25,ground_plane_thickness])
        standoff(4);
        
    // front
    translate([14-2.25,1,ground_plane_thickness+front_lip/2])
        standoff(5.5);
        
    translate([width-11.25-2.25,3.5,ground_plane_thickness+front_lip])
        standoff(3);
}

module screw_posts()
{
    // for case screws    
    translate([10.25-2.25,68+123.5-4.5-2.25,ground_plane_thickness])
        standoff(depth-ground_plane_thickness-19);
        
    translate([width-11.25+2.25,height-11+2.25,ground_plane_thickness])
        standoff(depth-ground_plane_thickness-19);

    // supports
    translate([10.25-3.25,68+123.5-4.5-1.25,ground_plane_thickness])
        rotate([0,0,45])
            cube([0.75,4.25,depth-ground_plane_thickness-19]);
        
    translate([width-11.25+3.25,height-11+1.25,ground_plane_thickness])
        rotate([0,0,250])
            cube([0.75,4.25,depth-ground_plane_thickness-19]);
}

module connector_standoffs()
{
    // connector standoffs
    // AC
    // outer
    *translate([triangle+4,height-connector_wall_thickness-4.25,ground_plane_thickness])
        cube([0.75,4.25+connector_wall_thickness,depth-22.5]);
    *translate([triangle+4.75+5.25,height-connector_wall_thickness-4.25,ground_plane_thickness])
        cube([0.75,4.25+connector_wall_thickness,depth-22.5]);

    // inner
    translate([triangle+4,height-connector_wall_thickness-4.25,ground_plane_thickness])
        cube([0.75,4.25+connector_wall_thickness,depth-22.5]);
    translate([triangle+4.75+5.25,height-connector_wall_thickness-4.25,ground_plane_thickness])
        cube([0.75,4.25+connector_wall_thickness,depth-22.5]);

    // sensor bar

}

module case()
{
    // this creates the base shape of the case without any cutouts
    //bottom
    linear_extrude(ground_plane_thickness)
        base_shape();
    
    // left
    translate([0,5,0])
        cube([side_wall_thickness,height-triangle-5,depth]);
    
    // triangle
    translate([0,height-triangle,depth])
        rotate([180,0,45])
            cube([triangle*sqrt(2),side_wall_thickness,depth]);
    
    // connector side
    translate([triangle,height-connector_wall_thickness,0])
        cube([width-triangle,connector_wall_thickness,depth]);
    
    //right
    translate([width-side_wall_thickness,height-12.5,0])
        cube([side_wall_thickness,12.5,depth]);
    
    translate([width-5,height-15,1.5])
        cube([side_wall_thickness,4.75,depth-14.25]);
    
    translate([width-side_wall_thickness-3.15,0,0])
        cube([side_wall_thickness,height-11.25-connector_wall_thickness,depth-11.25]);

    // front lip
    translate([2.25,0,2.25])
        cube([width-2.25-3.25,7,front_lip]);
        
    // left side of the front lip
    translate([2.25,0,2.25])
        cube([1.5,7,depth-15.25]);
    
}

module controller_port()
{
    // a single gc controller port
    rotate([0,270,0])
        cylinder(h=3.75,r=gamecube_port_radius);
    rotate([0,270,0])
        translate([11.5/-2,13.5/-2,0])
            cube([11.5,13.5,22]);

}


module gamecube_controller_ports()
{
    translate([width-3.15,16.5+gamecube_port_radius,depth-2.4-gamecube_port_radius])
        for (y=[0:3])
            translate([0,y*(gamecube_port_radius*2+9.75),0])
                controller_port();
    
}

module gamecube_memory_slot(slots = 2)
{
    slot_width  = 38.6;
    slot_height = 10.6;

    connector_height = 29;

    // slot b
    translate([width-34,height-21.75-slot_width,depth-4-10.5])
        cube([34,slot_width,slot_height]);
    
    // slot a
    if (slots == 2) 
        translate([width-34,height-21.75-slot_width,depth-20.5-10.5])
            cube([34,slot_width,slot_height]);
    
    // connector behind
    translate([width-side_wall_thickness-3.25-30.5,height-61.5,depth-6-29])
        cube([30.5,40.25,connector_height]);
}

module gamecube_port_cover()
{
    // slot where it clips in
    translate([width-4.5,0,0])
        cube([4.5,height-height_back_line,1.5]);
    
};

module foot()
{
    difference()
    {
        cube([feet_height,feet_outer,feet_outer]);
        translate([0,feet_border,feet_border])
            cube([feet_height,feet_outer-feet_border*2,feet_outer-feet_border*2]);
    }
    
};

module fan_grille(columns,rows=4)
{
    for (x=[0:columns])
        for (y=[0:rows])
            translate([x*7,y*7])
                square(5.5);
}

module main_fan_cutout()
{
    //35mm fan
    translate([triangle+49.25,height-side_wall_thickness-15,ground_plane_thickness])
        cube([35,15,35]);
}

module main_vent_cutout()
{
    translate([triangle+49.25,height,4.12])
        rotate([90,0,0])
            linear_extrude(connector_wall_thickness)
                 fan_grille(4);
    
};

module sub_vent_cutout()
{
    translate([0,135,5.6])
        rotate([90,0,90])
            linear_extrude(side_wall_thickness)
                fan_grille(2);  
    
};

module usb_cutout()
{
    translate([width-20.35-15.4,height-connector_wall_thickness-17,depth-22.65])
        cube([15.4,20,22.65]);
}

module ac_multiout_cutout()
{
    translate([triangle+2.25,height-connector_wall_thickness-11,depth])
        rotate([-90,0,0])
            linear_extrude(connector_wall_thickness+11)
                polygon([[0,0],[0,20.5],[7.5,20.5],[10.25,18],[10.25,5],[15.75,5],[15.75,17.5],[36,17.5],[39.25,14.25],[39.25,0]]);

    // multiout insides
    translate([triangle+2.25+16,height-17.75-1.75,depth-13-4.75])
        cube([23,17.75,13]);

    // ac connector border
    translate([triangle+1.75,height-connector_wall_thickness-1.75,depth-21.25])
        cube([12,1.75,18.5]);
}

module sensorbar_cutout()
{
    translate([triangle+25,height-13,depth-22])
        rotate([-90,0,0])
            linear_extrude(13)
                polygon([[0,0],[0,7],[7,7],[9,5],[9,0]]);  
}

module exterior()
{
    case();

    // feet
    // bottom
    translate([-1,7.5,2.25])
        foot();
    translate([-1,height-23-feet_outer,2.5])
        foot();

    // top left
    if ( depth > 35)
        translate([-1,height-23-feet_outer,34.5])
            foot();
    // top right is on battery cover

    shield_standoffs();
    connector_standoffs();

    screw_posts();
}

difference()
{
    exterior();

    intercase_cutout();
    battery_cutout();

    gamecube_controller_ports();
    gamecube_memory_slot();
    gamecube_port_cover();

    main_fan_cutout();
    main_vent_cutout();
    sub_vent_cutout();

    usb_cutout();
    sensorbar_cutout();    
    ac_multiout_cutout();

    heatsink_cutout();

    screwholes();
};

;