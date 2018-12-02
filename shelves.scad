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
}
