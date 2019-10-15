use <materials.scad>;

module endshelves(width=160, height=240, depth=60) {
    /*twobyfour(width);
    translate([0, -60, 0])
        twobyfour(width);
    */
    translate([0, 0, height]) {
        rotate([0, 90, 0]){
            twobyfour(height);
            translate([0, depth, 0])
            twobyfour(height);
        }
        translate([width - 9.6, 0, 0])
        rotate([0, 90, 0]){
            twobyfour(height);
            translate([0, depth, 0])
            twobyfour(height);
        }
    }
}

module bench(width=230, height=90, depth=70) {
    segments = 3;
    translate([0, 0, height - 9.6]) {
        // Top
        twobyfour(230);
        translate([0, depth  - 4.8, 0])
        twobyfour(230);

        // Supports
        translate([0, 4.8, 9.6]) {
            segment_spacing = (width - 9.6) / (segments - 1);
            for(i = [0:segments - 1]) {
                translate([i * segment_spacing, 0, 0]) {
                    rotate([0, 90, 0]) {
                        twobyfour(height);
                        translate([0, depth - 3 * 4.8, 0])
                            twobyfour(height);
                    }
                    translate([4.8 * 1.5, 4.8, - 70])
                        rotate([0, 0, 90])
                            twobyfour(depth - 4 * 4.8);
                    
                    translate([0, 4.8, -4.8])
                        rotate([90, 0, 90])
                            twobyfour(depth - 4 * 4.8);
                    
                }
            }
        }

        // Top plate
        translate([0, 0, 9.6])
            cube([width, depth, 1.2]);
    }
}


/*translate([60, 0, 0])
    bench();
*/

//translate([290 + 4.8, 0, 0])
//    rotate([0, 0, 90])
        endshelves(160);
/*
translate([4.8, 4.8, 0])
    rotate([0, 0, 90])
        endshelves(100);
*/