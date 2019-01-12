use <tools.scad>;
use <materials.scad>;
use <smartstore.scad>;
use <components.scad>;

shelf1 = 240;
shelf2 = 200;
maindesk = 90;
shelf3 = 45;

module desk(width=120, deskheight=90, shelf1=240, shelf2=200, shelf3=45) {
    // Workbench lower shelf
    translate([0, 0, shelf3 - 9.8])
        shelfwithsupport(width, 50);

    // Lower shelf supports
    translate([4.8, 0, shelf3 - 9.8 - 4.8])
    rotate(90)
        twobytwo(80);

    translate([width, 0, shelf3 - 9.8 - 4.8])
    rotate(90)
        twobytwo(80);

    // Workbench main desk
    translate([0, 0, deskheight - 9.8])
        shelfwithsupport(width, 80);

    // Main desk supports
    translate([4.8, 0, deskheight - 9.8 - 9.8])
    rotate(90)
        twobyfour(80);

    translate([width, 0, deskheight - 9.8 - 9.8])
    rotate(90)
        twobyfour(80);



    translate([0, 0, shelf2])
        shelfwithsupport(width, 50);

    translate([4.8, 0, shelf2 - 4.8])
    rotate(90)
        twobytwo(80);

    translate([width, 0, shelf2 - 4.8])
    rotate(90)
        twobytwo(80);

    

    /*translate([0, 0, shelf1 - 9.8])
        shelfwithsupport(width, 50);

    translate([4.8, 0, shelf1 - 9.8 - 4.8])
        rotate(90)
            twobytwo(80);

    translate([width, 0, shelf1 - 9.8 - 4.8])
        rotate(90)
            twobytwo(80);*/



    translate([0, 0, 109])
        cube([width, 25, 1]);

    translate([0, 0, 180])
        cube([width, 25, 1]);

// Main veritcal beams
    translate([0, 9.8, 0])
        rotate([90, -90, 0]) {
            twobyfour(240);
            translate([0, -width - 4.8, 0])
                twobyfour(240);
            
            translate([0, 0, -80 + 9.8])
                twobyfour(240);
        
            translate([0, -width - 4.8, -80 + 9.8])
                twobyfour(240);
        }
}



module stuffondesk() {
    /* Add some tools to see how it all looks */
    translate([4, 0, 110])
    sortimentskuff();

    translate([50, 0, 110])
    oscilloskop();

    translate([95, 0, 110])
    hakko_base();

    translate([50, 0, 130])
    dataskjerm();

    translate([6, 0, shelf3]) {
        for(box = [0:2])
            translate([box * 38, 0, 0])
                smartstore(size=15);
    }

    translate([1, 0, 181]) {
        for(box = [0:5])
            translate([box * 20, 0, 0])
            smartstore(size=2);
    }

    translate([3, 0, shelf2 + 10]) {
        for(box = [0:3])
            translate([box * 30, 0, 0])
            smartstore(size=10);
    }
}

desk();
stuffondesk();