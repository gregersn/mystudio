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

module longbench(deskheight=90, benchlength=230, benchdepth=70) {
    shelfdepth = 50;

    //bench plate
    translate([0, 0, deskheight])
        cube([benchlength, benchdepth, 1]);

    // bench undershelf
    translate([0, 0, deskheight / 2])
    cube([benchlength, shelfdepth, 1]);

    // Side supports
    sidesupport(height=deskheight-1, depth=benchdepth, shelfheight = deskheight / 2);

    translate([benchlength - 9.6, 0, 0])
    sidesupport(height=deskheight-1, depth=benchdepth, shelfheight = deskheight / 2);
    translate([benchlength / 2 - 4.8, 0, 0])
    sidesupport(height=deskheight-1, depth=benchdepth, shelfheight = deskheight / 2);
}