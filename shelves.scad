use <materials.scad>
use <components.scad>

module shelves(width=120, height=200, depth=50) {
    translate([0, 0, 30])
        shelfwithbeams(width, depth);
    translate([0, 0, 70])
        shelfwithbeams(width, depth);
    translate([0, 0, 110])
        shelfwithbeams(width, depth);
    translate([0, 0, 150])
        shelfwithbeams(width, depth);
    translate([0, 0, 180])
        shelfwithbeams(width, depth);

    translate([0, 0, 220])
        shelfwithbeams(width, depth);


    translate([0, 9.8, 0])
        rotate([90, -90, 0]) {
            translate([0, -width - 4.8, 0])
                twobyfour(height);
            
            translate([0, -width - 4.8, -depth + 9.8])
                twobyfour(height);
        }
}


module clasleg() {
    difference() {
        cube([5, 5, 177]);
        translate([1, 1, -1])
            cube([5, 5, 179]);
    }
}

module classhelf() {
    cube([90, 40, 8]);
}

module classhelve() {
    clasleg();
    translate([90, 0, 0])
        rotate(90)
            clasleg();
    translate([0, 40, 0])
        rotate(-90)
            clasleg();
    translate([90, 40, 0])
        rotate(180)
            clasleg();

    translate([0, 0, 20])
        classhelf();

    translate([0, 0, 50])
        classhelf();

    translate([0, 0, 90])
        classhelf();

    translate([0, 0, 130])
        classhelf();

    translate([0, 0, 177 - 8])
        classhelf();

}