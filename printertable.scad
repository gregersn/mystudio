use <components.scad>;
use <materials.scad>;

module printertable() {
    translate([0, 9.8, 0])
        rotate([90, -90, 0])
            twobyfour(90);

    translate([0, 80, 0])
        rotate([90, -90, 0])
            twobyfour(90);

    translate([80 + 4.8, 80, 0])
        rotate([90, -90, 0])
            twobyfour(90);


    translate([0, 0, 90 - 9.6 * 2])
        shelfwithbeams(80, 80);

    translate([0, 0, 30 - 9.6 * 2])
        shelfwithbeams(80, 80);

}