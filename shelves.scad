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

module endpiece(height=200, depth=50) {
    twobyfour(height);
    translate([0, depth - 4.8, 0]) {
        twobyfour(height);
    }
}

module newshelf(width=120, depth=50, spacing=.5) {
    pieces = floor(depth / (9.8 + spacing));
    spacing = (depth - (pieces * 9.8)) / (pieces - 1);

    rotate([0, 0, -90])
    {
        translate([-depth, 0, 0])
        {
            twobyfour(depth);
            translate([0, 0, width - 9.8]) {
                twobyfour(depth);
            }
        }
    }
    rotate([-90, -90, 0]) {
        translate([0, 4.8, 0]) {
            for(i=[0:pieces - 1]) {
                translate([0, 0, i * (spacing + 9.8)]) {
                    twobyfour(width);
                }
            }
        }
    }
}

module shelves2(width=120, height=200, depth=50, shelves=5, sections=1, bottomspace=30) {
    translate([width, 0, 0]) {
        shelfspacing = height / (shelves - 1);
        rotate([0, -90, 0]) {
            endpiece(height, depth);

            translate([0, 0, width - 9.8]) {
                endpiece(height, depth);
            }

            translate([bottomspace, 4.8, 0]) {
                for(i=[0:shelves - 1]) {
                    translate([i * (shelfspacing - 9.6), 0, 0])
                    newshelf(width, depth - (2 * 4.8), 2);
                }
            }
        }
    }
}

shelves2(height=240);
