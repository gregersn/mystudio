use <tools.scad>;
use <materials.scad>;

module support(depth) {
    translate([4.8, 0, 0])
    {
        rotate([0, 0, 90])
            twobyfour(depth);
        twobyfour(120 - 2 * 4.8);
        translate([0, depth - 4.8, 0])
            twobyfour(120 - 2 * 4.8);
    }
    translate([120, 0, 0])
        rotate([0, 0, 90])
            twobyfour(depth);

    translate([42.4, 4.8, 0])
        rotate([0, 0, 90])
            twobyfour(depth - 2 * 4.8);

    translate([84.8, 4.8, 0])
        rotate([0, 0, 90])
            twobyfour(depth - 2 * 4.8);

}

module shelf(width, depth) {
    cube([width, depth, .8]);
}

module shelfwithsupport(width, depth) {
    support(depth);
    translate([0, 0, 9.8])
    shelf(width, depth);
}


// Workbench lower shelf
translate([0, 0, 45 - 9.8])
    shelfwithsupport(120, 50);

translate([4.8, 9.8, 0])
    rotate([90, -90, 0]) {
        twobyfour(45 - 9.8);
        translate([0, -120 + 4.8, 0])
            twobyfour(45 - 9.8);
        
        translate([0, 0, -50 + 9.8])
            twobyfour(45 - 9.8);
    
        translate([0, -120 + 4.8, -50 + 9.8])
            twobyfour(45 - 9.8);
    }

// Workbench main desk
translate([0, 0, 90 - 9.8])
    shelfwithsupport(120, 80);

translate([4.8, 9.8, 45])
    rotate([90, -90, 0]) {
        twobyfour(45 - 9.8);
        translate([0, -120 + 4.8, 0])
            twobyfour(45 - 9.8);
        
        translate([0, 0, -50 + 9.8])
            twobyfour(45 - 9.8);
    
        translate([0, -120 + 4.8, -50 + 9.8])
            twobyfour(45 - 9.8);
    }


translate([0, 9.8, 0])
    rotate([90, -90, 0]) {
        twobyfour(240);
        translate([0, -120 - 4.8, 0])
            twobyfour(240);
        
        translate([0, 0, -80 + 9.8])
            twobyfour(240);
    
        translate([0, -120 - 4.8, -80 + 9.8])
            twobyfour(240);
    }


//twobyfour(350);

//cube([80, 120, 2]);

/* Add some tools to see how it all looks */
translate([4, 0, 110])
sortimentskuff();

translate([50, 0, 110])
oscilloskop();

translate([95, 0, 110])
hakko_base();

translate([50, 0, 130])
dataskjerm();

translate([0, 0, 109])
cube([120, 25, 1]);

