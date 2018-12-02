use <materials.scad>;

module support(width, depth) {
    // Calculate number of support beams
    beams = ceil(max(2, (width / 60) + 1));
    echo(beams);

    translate([4.8, 0, 0])
    {
        rotate([0, 0, 90])
            twobyfour(depth);
        twobyfour(width - 2 * 4.8);
        translate([0, depth - 4.8, 0])
            twobyfour(width - 2 * 4.8);
    }
    translate([width, 0, 0])
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

module shelfwithbeams(width, depth) {
    translate([0, 0, 9.8])
        shelfwithsupport(width, depth);

    translate([width, 0, 0])
        rotate(90)
            twobyfour(depth);

    translate([4.8, 0, 0])
        rotate(90)
            twobyfour(depth);
}