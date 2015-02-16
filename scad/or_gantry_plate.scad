use <bom.scad>

AnodizedBlack = [0.17, 0.17, 0.2];

or_gantry_plate_height=3.175;

d71 = 7.1;
d52 = 5.2;

i100 = 10;
i200 = 20;
i223 = 22.3;
i263 = 26.3;
i300 = 30;
i323 = 32.3;
i350 = 35;
i400 = 40;
i423 = 42.3;
i523 = 52.3;
i550 = 55;
i623 = 62.3;

or_gantry_plate_holes = [
	[],
	[
		// 80x80
		[[-i223,0],d71],[[-i223,i223],d71],[[-i223,-i223],d71],
		[[0,0],d52],[[i100,0],d52],[[0,i100],d52],[[-i100,0],d52],[[0,-i100],d52],
		[[i223,0],d52],[[i223,i223],d52],[[i223,-i223],d52],[[0,i223],d52],[[0,-i223],d52]
	], [
		// 100x120
		[[-i323,0],d71],
		[[-i223,i423],d71],[[-i323,i423],d71],[[-i223,-i423],d71],[[-i323,-i423],d71],
		[[0,0],d52],[[i100,0],d52],[[0,i100],d52],[[-i100,0],d52],[[0,-i100],d52],
		[[i200,i100],d52],[[i200,-i100],d52],[[-i200,i100],d52],[[-i200,-i100],d52],
		[[i100,i200],d52],[[i100,-i200],d52],[[-i100,i200],d52],[[-i100,-i200],d52],
		[[i100,i300],d52],[[i100,-i300],d52],[[-i100,i300],d52],[[-i100,-i300],d52],
		[[i323,0],d52],
		[[i400,i100],d52],[[i400,-i100],d52],[[-i400,i100],d52],[[-i400,-i100],d52],
		[[0,i423],d52],[[0,-i423],d52],[[i100,i423],d52],[[i100,-i423],d52],[[-i100,i423],d52],[[-i100,-i423],d52],
		[[i223,i423],d52],[[i323,i423],d52],[[i223,-i423],d52],[[i323,-i423],d52]
	], [
		// 120x140
		[[0,0],d52],[[i100,0],d52],[[0,i100],d52],[[-i100,0],d52],[[0,-i100],d52],
		[[i200,0],d52],[[i300,0],d52],[[-i200,0],d52],[[-i300,0],d52],
		[[0,i200],d52],[[0,i300],d52],[[0,-i200],d52],[[0,-i300],d52],
		[[i200,i300],d52],[[i200,-i300],d52],[[-i200,i300],d52],[[-i200,-i300],d52],
		[[i300,i200],d52],[[i300,-i200],d52],[[-i300,i200],d52],[[-i300,-i200],d52],

		[[i400,0],d52],[[i423,i100],d52],[[i423,-i100],d52],
		[[i400,i263],d52],[[i400,-i263],d52],

		[[-i400,0],d71],[[-i423,i100],d52],[[-i423,-i100],d52],
		[[-i400,i263],d71],[[-i400,-i263],d71],
		[[0,i523],d52],[[i100,i523],d52],[[i223,i523],d52],[[i323,i523],d52],[[i423,i523],d52],
		[[0,-i523],d52],[[i100,-i523],d52],[[i223,-i523],d52],[[i323,-i523],d52],[[i423,-i523],d52],
		[[0,i523],d52],[[-i100,i523],d52],[[-i223,i523],d71],[[-i323,i523],d71],[[-i423,i523],d71],
		[[0,-i523],d52],[[-i100,-i523],d52],[[-i223,-i523],d71],[[-i323,-i523],d71],[[-i423,-i523],d71]
	], [
		// 140x160
		[[0,0],d52],[[i100,0],d52],[[0,i100],d52],[[-i100,0],d52],[[0,-i100],d52],
		[[i300,0],d52],[[0,i300],d52],[[-i300,0],d52],[[0,-i300],d52],
		[[i400,i100],d52],[[i400,-i100],d52],[[-i400,i100],d52],[[-i400,-i100],d52],
		[[i100,i400],d52],[[i100,-i400],d52],[[-i100,i400],d52],[[-i100,-i400],d52],
		[[i300,i400],d52],[[i300,-i400],d52],[[-i300,i400],d52],[[-i300,-i400],d52],
		[[i400,i300],d52],[[i400,-i300],d52],[[-i400,i300],d52],[[-i400,-i300],d52],
		[[i100,i550],d52],[[i100,-i550],d52],[[-i100,i550],d52],[[-i100,-i550],d52],
		[[i523,0],d52],[[-i523,0],d71],
		[[i523,i350],d52],[[-i523,i350],d71],[[i523,-i350],d52],[[-i523,-i350],d71],
		[[0,i623],d52],[[i100,i623],d52],[[i223,i623],d52],[[i323,i623],d52],[[i423,i623],d52],[[i523,i623],d52],[[-i100,i623],d52],[[-i223,i623],d71],[[-i323,i623],d71],[[-i423,i623],d71],[[-i523,i623],d71],
		[[0,-i623],d52],[[i100,-i623],d52],[[i223,-i623],d52],[[i323,-i623],d52],[[i423,-i623],d52],[[i523,-i623],d52],[[-i100,-i623],d52],[[-i223,-i623],d71],[[-i323,-i623],d71],[[-i423,-i623],d71],[[-i523,-i623],d71]
	]
];

module or_gantry_plate(mod = 1) {
	$fn=50;
	r=10;
	w=80;
	h=80;
	sizes=[[-1,-1],[80,80],[100,120],[120,140],[140,160]];
	mw = sizes[mod][0];
	mh = sizes[mod][1];

	bom(str("ORGP_",mod), str("OpenRail Gantry Plate: ", mw, "x", mh, "mm"), "plates");

	color(AnodizedBlack)
		rotate([0,0,90]) difference() {
			hull()
				for(x = [-1,1], y = [-1,1])
					translate([x*(mw/2-10),y*(mh/2-10),-or_gantry_plate_height/2])
						cylinder(r=r,h=or_gantry_plate_height);
			translate([0,0,-or_gantry_plate_height]) {
				for(p = or_gantry_plate_holes[mod])
					translate (p[0])
						cylinder(r=p[1]/2,h=or_gantry_plate_height*2);
			}
		}
}