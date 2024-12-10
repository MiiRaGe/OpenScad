length = 240;
width = 200;
min_height = 90;
max_height = 150;
cylinder_radius = 66;
padding = 4;
handle_radius = 1;

module box() {difference() {
difference() {
    difference () {
    cube([length, width, max_height]);
    translate([padding,padding,padding])
        cube([length-2*padding, width-2*padding, max_height]);
    };
    translate([-130-padding/2,-padding/2,min_height])
        cube([length+padding, width+padding, max_height]);
    };
translate([110,width+padding/2, min_height + cylinder_radius])
    rotate([90,0,0])
        cylinder(width+padding, cylinder_radius, cylinder_radius);
}}

module box_with_handle() {
    difference() {
        box();        
        translate([length-2*padding, width/4+40, max_height])
            rotate([90, 0, 90])
                linear_extrude(padding+10)
                    handle_hole_2d();
    }
}

module handle_hole_2d() {
    hull() {
    translate([20,0,0]) circle(50);
    circle(50);
    }
}

$fn=50;
 
minkowski()
{
  box_with_handle();
  cylinder(r=handle_radius,h=1);
}
