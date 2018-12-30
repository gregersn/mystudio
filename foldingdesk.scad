use <materials.scad>;



translate([0, 0, 80]) {
    twobytwo(80);
    translate([0, 80, 0])
        twobytwo(80);

    translate([0, 4.8, 0])
        twobytwo(80);

    translate([4.8, 9.6, 0])
        rotate(90)
        twobytwo(80 - 9.6);

    translate([80, 9.6, 0])
        rotate(90)
        twobytwo(80 - 9.6);

    translate([0, 4.8, 4.8])
    cube([80, 80, 1]);  
}

rotate([0, 0, 90]) {
    twobytwo(80);

    translate([0, 0, 80 - 4.8])
        twobytwo(80);

    translate([0, 0, 80 - 4.8])
        rotate([0, 90, 0])
        twobytwo(80 - 9.6);

    translate([80 - 4.8, 0, 80 - 4.8])
        rotate([0, 90, 0])
        twobytwo(80 - 9.6);
}