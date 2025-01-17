max_diameter=114;
inner_diameter=108;
bol_height=66;
module bol() {
    difference() {
        cylinder(bol_height,d=max_diameter);
        translate([0,0,-0.5])
            cylinder(bol_height+1,d=inner_diameter);
    }
}

module spout() {
    translate([-55,0,118])
        rotate([-45,0,0])
            import("spout_untested_v2.stl");

}

module grinder() {
    translate([-100,-258,150])
        rotate([-45,0,0])
            cube([200, 200, 500]);
}


module leg() {
    rotate([0,0,-180])
    translate([-60,120,0])
        import("rocky_legs_v4.stl");
}

module tilted_rancilio() {
leg();
grinder();
spout();
}

module base() {
    translate([0,0,bol_height-5])
    difference() {
        cylinder(3,d=inner_diameter);
        translate([0,0,-0.5])
            cylinder(3+1,d=inner_diameter-1);
    };
    translate([0,0,bol_height-3])
        difference() {
            cylinder(3,d=max_diameter+2);
            translate([0,0,-0.5])
                cylinder(3+1,d=inner_diameter-1);
        };
}

difference() {
    translate([0,32,bol_height])
        difference() {
            cylinder(250, d1=max_diameter,  d2=30);
            translate([0,0,-0.5])
                cylinder(181, d1=max_diameter-1,  d2=30-1);
        }
    tilted_rancilio();
}
translate([0,32,0])
    base();
//#tilted_rancilio();
//#translate([0,32,0])
//#   bol();

