use <materials.scad>
use <components.scad>

module shelves() {
    translate([0, 0, 30])
        shelfwithbeams(120, 50);
    translate([0, 0, 80])
        shelfwithbeams(120, 50);
    translate([0, 0, 120])
        shelfwithbeams(120, 50);
    translate([0, 0, 180])
        shelfwithbeams(120, 50);

    translate([0, 9.8, 0])
        rotate([90, -90, 0]) {
            translate([0, -120 - 4.8, 0])
                twobyfour(240);
            
            translate([0, -120 - 4.8, -50 + 9.8])
                twobyfour(240);
        }
}
