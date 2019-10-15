use <materials.scad>;

module sidesupport(height=85, depth=70, shelfheight=40) {
    translate([0, 0, height])
    rotate([0, 90, 0]) {
    translate([4.8, 0, 0])
        twobyfour(height - 4.8);

    translate([4.8, depth - 4.8, 0])
        twobyfour(height - 4.8);

    translate([4.8, 0, 0])   
    rotate([0, 0, 90])
        twobyfour(depth);
    
    translate([height - shelfheight + 4.8, 4.8, 0])
        rotate([0, 0, 90])
            twobyfour(depth - 2 * 4.8);
    }

}

module longbench(deskheight=90, benchlength=230.0, benchdepth=70, dividers=3) {
    shelfdepth = 40;
    supportheight = deskheight - 1;

    //bench plate
    translate([0, 0, deskheight])
        cube([benchlength, benchdepth, 1]);

    // bench undershelf
    translate([0, 9.6, deskheight / 2])
        cube([benchlength, shelfdepth, 1]);

    supportdepth = benchdepth - 2 * 4.8;

    // Supports
    divider_distance = (benchlength - 9.6) / (dividers - 1);
    translate([0, 4.8, 0]) {
        for(i = [0:dividers - 1]) {
            translate([divider_distance * i, 0, 0])
            sidesupport(height=supportheight, depth=supportdepth, shelfheight = deskheight / 2);

        }
    }

    // Side rails
    translate([0, 0, supportheight - 9.6]) {
        twobyfour(benchlength);
        translate([0, benchdepth - 4.8, 0])
        twobyfour(benchlength);
    }
}
benchlength = 230;
deskheight = 90;
translate([60, 0, 0])
longbench(deskheight=deskheight, benchlength=benchlength, dividers=3);
translate([-9.6, 120, 0])
rotate([0, 0, -90])
longbench(deskheight=deskheight, benchlength=120, dividers=2);

/*translate([60, 0, 0])
rotate([0, 0, 90])
    longbench(deskheight=90, benchlength=100, benchdepth=60);

translate([60 + 230 + 60, 0, 0])
rotate([0, 0, 90])
longbench(deskheight=90, benchlength=160, benchdepth=60);
*/