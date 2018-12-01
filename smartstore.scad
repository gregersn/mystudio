module smartstore(size=2) {
    color("LightGray", 0.8)
    if(size == 2)
        cube([17, 21, 11]);
    
    else if(size == 10)
        cube([25, 34, 16]);

    else if(size == 15)
        cube([30, 40, 18]);
}