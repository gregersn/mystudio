module twobyfour(length=120) {
    echo("2x4: ", length);
    color("BurlyWood")
    cube([length, 4.8, 9.8]);   
}

module twobytwo(length) {
    echo("2x2: ", length);
    color("BurlyWood")
    cube([length, 4.8, 4.8]);   
}

module lekt30x48(length) {
    echo ("30x48: ", length);
    color("Burlywood")
    cube([length, 3.0, 4.8]);
}

module lekt36x48(length) {
    echo ("36x48: ", length);
    color("Burlywood")
    cube([length, 4.8, 4.8]);
}

module lekt48x48(length) {
    echo ("48x48: ", length);
    color("Burlywood")
    cube([length, 4.8, 4.8]);
}

module mdf(thickness, width=122.0, length=244.0) {
    echo ("MDF: ", thickness, min(width, 122.0), min(length, 244.0));
    color("Burlywood");
    cube([min(length, 244.0), min(width, 122.0), thickness]);

}