use <desk.scad>;
use <printertable.scad>;
use <shelves.scad>;
use <longbench.scad>;

module studio() {
    // Floor
    translate([0, 0, -1])
        cube([352, 348, 1]);

    // Wall
    translate([0, -1, 0])
            cube([352, 1, 256]);


    translate([352, 0, 0])
        rotate([0, 0, 90])
            difference() {
                cube([348, 1, 256]);
                translate([175, -1, 0])
                    cube([80, 5, 200]);
            }

    translate([0, 0, 0])
        rotate([0, 0, 90])
            difference() {
                cube([348, 1, 256]);
                translate([10, -1, 94])
                    cube([110, 5, 100]);
                translate([130, -1, 94])
                    cube([110, 5, 100]);
            }
}


color("LightGray", 0.8)
    studio();

/*translate([90, 0, 0]) {
    desk();
    stuffondesk();
}

translate([5, 0, 0]) {
    printertable();
}

translate([210 + 9.8, 0, 0]) {
    shelves2(126, 220, 60, 6);
}

translate([350, 86, 180])
    rotate([0, 90, 0])
        cube([80, 80, 1]);
*/

translate([350, 346, 0])
    rotate(180)
        classhelve();

/*
translate([60, 0, 0])
longbench(deskheight=90, benchlength=230);

translate([60, 0, 0])
rotate([0, 0, 90])
    longbench(deskheight=90, benchlength=100, benchdepth=60);

translate([60 + 230 + 60, 0, 0])
rotate([0, 0, 90])
longbench(deskheight=90, benchlength=160, benchdepth=60);*/
