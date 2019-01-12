use <desk.scad>;
use <printertable.scad>;
use <shelves.scad>;

// Floor
translate([0, 0, -1])
    %cube([352, 348, 1]);

// Wall
translate([0, -1, 0])
        %cube([352, 1, 256]);


translate([352, 0, 0])
    rotate([0, 0, 90])
        %difference() {
            cube([348, 1, 256]);
            translate([175, -1, 0])
                cube([80, 5, 200]);
        }

translate([0, 0, 0])
    rotate([0, 0, 90])
        %difference() {
            cube([348, 1, 256]);
            translate([10, -1, 94])
                cube([110, 5, 100]);
            translate([130, -1, 94])
                cube([110, 5, 100]);
        }



translate([90, 0, 0]) {
    desk();
    stuffondesk();
}

translate([5, 0, 0]) {
    printertable();
}

translate([210 + 4.8, 0, 0]) {
    shelves(120, 200, 50);
}

translate([350, 56, 180])
    rotate([0, 90, 0])
        cube([80, 100, 1]);


translate([350, 346, 0])
    rotate(180)
        classhelve();
