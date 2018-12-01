use <tools.scad>;
use <materials.scad>;
use <smartstore.scad>;

module support(width, depth) {
    // Calculate number of support beams
    beams = max(2, (width / 60) + 1);

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

    beamdelta = width / (beams - 1);
    for(beam = [1:beams - 2]) {
        translate([beamdelta * beam + 2.4, 4.8, 0])
            rotate([0, 0, 90])
                twobyfour(depth - 2 * 4.8);
    }
}

module shelf(width, depth) {
    cube([width, depth, .8]);
}

module shelfwithsupport(width, depth) {
    support(width, depth);
    translate([0, 0, 9.8])
    shelf(width, depth);
}

module desk(width) {
    // Workbench lower shelf
    translate([0, 0, 45 - 9.8])
        shelfwithsupport(120, 50);

    // Bottom vertical supports
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

    // Main desk vertical supports
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
    
    translate([0, 0, 195])
        shelfwithsupport(120, 40);

    translate([0, 0, 240 - 9.8])
        shelfwithsupport(120, 80);

    translate([0, 0, 109])
        cube([120, 25, 1]);

    translate([0, 0, 180])
        cube([120, 25, 1]);


}



// Main veritcal beams
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


desk();

/* Add some tools to see how it all looks */
translate([4, 0, 110])
sortimentskuff();

translate([50, 0, 110])
oscilloskop();

translate([95, 0, 110])
hakko_base();

translate([50, 0, 130])
dataskjerm();

translate([6, 0, 45]) {
    for(box = [0:2])
        translate([box * 38, 0, 0])
            smartstore(size=15);
}

translate([1, 0, 181]) {
    for(box = [0:5])
        translate([box * 20, 0, 0])
        smartstore(size=2);
}

translate([3, 0, 205]) {
    for(box = [0:3])
        translate([box * 30, 0, 0])
        smartstore(size=10);
}