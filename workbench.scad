use <materials.scad>;

// Worktop
translate([0, 0, 80.0]) {
    mdf(.9, width=80.0, length=350.0  / 2);
    translate([350.0 / 2, 0, 0])
    mdf(.9, width=80.0, length=(350.0 / 2));
}

// Tverrliggere
translate([0, 0, 80 - 9.6]) {
    translate([0, 80. - 4.8, 0])
        twobyfour(350.0);
    twobyfour(350.0);
}

// Ben
for(i=[0:4]) {
translate([i * (350.0 - 9.6) / 4.0, 80, 0])
    rotate([180, -90, 0]) {
        twobyfour(80.0 - 9.6);
        translate([0, 50, 2.40])
        rotate([90, 0, 0])
        twobyfour(80.0 - 4.8);
    }
}

for(i=[0:4]) {
translate([i * (350.0 / 4 - 2.4), 4.8, 80 - 4.8])
    rotate([90, 0, 90])
    twobyfour(80.0 - 9.6);
}

// Shelf
translate([0, 30, 35.0]) {
    mdf(.9, width=50.0, length=350. / 2);
    translate([350.0 / 2, 0, 0])
    mdf(.9, width=50.0, length=(350.0 / 2));
}


for(i=[0:4]) {
translate([2.4 + i * (350.0 / 4 - 2.4), 30 + 9.6, 30])
    rotate([90, 0, 90])
    twobytwo(50 - 9.6 - 4.8);
}


// Støtter
for(i=[0:4]) {
    translate([4.8 + 2.4 + i * (350.0 / 4 - 2.4), 0, 80 - 9.6])
    rotate([45, 0, 0])
    rotate([0, 90, 90])
        twobytwo(sqrt(30 * 30 + 30 * 30));
}