use <materials.scad>;

module support(width, depth) {
    // Calculate number of support beams
    beams = ceil(max(2, (width / 60) + 1));

    translate([3.0, 0])
    {
        rotate([0, 0, 90])
            lekt30x48(depth);
        lekt30x48(width - 2 * 3.0);
        translate([0, depth - 3.0])
            lekt30x48(width - 2 * 3.0);
    }
    translate([width, 0, 0])
        rotate([0, 0, 90])
            lekt30x48(depth);

    beamdelta = width / (beams - 1);
    for(beam = [1:beams - 2]) {
        translate([beamdelta * beam + 2.4, 3.0])
            rotate([0, 0, 90])
                lekt30x48(depth - 2 * 3.0);
    }
}

module shelf(width, depth) {
    cube([width, depth, .8]);
}

module shelfwithsupport(width, depth) {
    support(width, depth);
    translate([0, 0, 4.8])
    shelf(width, depth);
}

module shelfwithbeams(width, depth) {
    translate([0, 0, 3.0])
        shelfwithsupport(width, depth);

    translate([width, 0, 0])
        rotate(90)
            lekt30x48(depth);

    translate([3, 0, 0])
        rotate(90)
            lekt30x48(depth);
}