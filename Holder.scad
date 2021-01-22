
// Roll hole dimensions
HoleDiameter	= 25;	// This is safe with lots of tolerance on both sides
HoleDepth		= 58;	// Width of the roll, so to speak

// Screw hole dimensions
ScrewDiameter	= 2.5;
ScrewDistance	= 18;	// From center, measured 20.5 from each outside
ScrewLength		= 8;	// Longer than needed, just in case


difference(){
	// main holder
	translate([HoleDiameter/2,0,HoleDiameter/2]){
		rotate([-90,0,0])
			cylinder(h=HoleDepth,r1=HoleDiameter/2,r2=HoleDiameter/2,$fn=360);
	}

	translate([(HoleDiameter-ScrewDistance)/2,-1,HoleDiameter/2]){
		// left screw hole
		rotate([-90,0,0])
			screw_hole(ScrewDiameter,ScrewLength);

		// right screw hole
		translate([ScrewDistance,0,0]){
			rotate([-90,0,0])
				screw_hole(ScrewDiameter,ScrewLength);
		}
	}
}

// Lip on far end
translate([HoleDiameter/2,HoleDepth-2,(HoleDiameter/2)+4]){
	rotate([-90,0,0])
		cylinder(h=2,r1=(HoleDiameter/2)-2,r2=(HoleDiameter/2)-2,$fn=360);
}

module screw_hole(diameter,length){
	cylinder(h=length,r1=diameter/2,r2=diameter/2,$fn=360);
}