use <desk.scad>;
use <printertable.scad>;
use <shelves.scad>;

// Floor
translate([0, 0, -1])
    %cube([352, 340, 1]);

// Wall
translate([0, -1, 0])
        %cube([352, 1, 256]);


translate([352, 0, 0])
    rotate([0, 0, 90])
            %cube([175, 1, 256]);


translate([90, 0, 0]) {
    desk();
    stuffondesk();
}

translate([5, 0, 0]) {
    printertable();
}

translate([210 + 4.8, 0, 0]) {
    shelves();
}