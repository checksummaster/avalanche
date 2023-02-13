include <nutsnbolts/cyl_head_bolt.scad>;
include <nutsnbolts/data-access.scad>;

pcb_points = [[81.740171,110.323135],[124.110371,108.485434],[128.598892,127.733396],[146.996902,123.971322],[166.055043,123.967253],[166.055043,123.967253],[184.617357,128.428034],[201.626725,137.085463],[215.993451,149.169715],[240.383745,120.615118],[226.372957,108.455818],[226.161832,54.667135],[217.209331,49.970723],[195.286002,49.2243],[195.285999,31.067171],[176.528893,30.77428],[176.235999,29.067181],[157.478899,28.774284],[157.186002,26.567173],[138.648897,26.56718],[138.356003,28.774278],[119.598893,29.067179],[119.306,32.314284],[77.780048,34.75951],[79.89412699992839,75.09852794741323],[60.85857,76.097056],[61.829661,94.593607],[80.86349449039737,93.59515583927146]];

top_point = [[81.740171,110.323135],[124.110371,108.485434],[128.598892,127.733396],[146.996902,123.971322],[166.055043,123.967253],[166.055043,123.967253],[184.617357,128.428034],[201.626725,137.085463],[215.993451,149.169715],[240.383745,120.615118],[226.372957,108.455818],/*cut*/[197,92],[195.286002,88],/*cut*/[195.286002,49.2243],[195.285999,31.067171],[176.528893,30.77428],[176.235999,29.067181],[157.478899,28.774284],[157.186002,26.567173],[138.648897,26.56718],[138.356003,28.774278],[119.598893,29.067179],[119.306,32.314284],[77.780048,34.75951],[79.89412699992839,75.09852794741323],[60.85857,76.097056],[61.829661,94.593607],[80.86349449039737,93.59515583927146]];




// Hole in comment are central and we make space for battery by remove it
hole1 = [[210.899641, 123.194258],[137.384115, 46.836171],/*[139.021284, 64.413276],[177.151281, 68.923262],*/[80.333192, 89.113988],[99.48792, 90.613548],[97.46632, 51.538002],/*[98.49095, 71.589648],*/[168.023177, 107.422185],[145.253172, 107.34218],[190.393201, 112.772207],[177.524117, 48.836171]];



hole2 = [[223.247088, 101.330639],[200.247094, 89.630633],[223.247095, 56.930644]];


keys = [
    [87.507155, 43.52602, -177],    //0
    [106.531034, 42.529021, -177],
    [128.868521, 38.33478, 180],
    [147.918507, 35.834786, 180],
    [166.968543, 38.334748, 180],
    [186.018518, 40.334785, 180],
    [20,40,0],                          //6
    [88.504137, 62.549927, -177],
    [107.528047, 61.552929, -177],
    [128.868519, 57.384778, 180],
    [147.918519, 54.884788, 180],
    [166.968536, 57.38477, 180],
    [186.018528, 59.384752, 180],
    [20,60,0],                          // 13
    [89.501141, 81.573822, -177], 
    [108.525046, 80.576824, -177],
    [128.868529, 76.434783, 180],
    [147.918515, 73.93479, 180],
    [166.968518, 76.434753, 180],
    [186.018542, 78.43478, 180],
    [227.354911, 121.634885, 139.5], //20
    [90.498127, 100.597704, -177], // 21
    [109.522026, 99.600719, -177],
    [128.868537, 95.484775, 180],
    [147.918533, 92.977278, 180], 
    [166.968535, 95.484764, 180],
    [186.018519, 97.484784, 180],
    [206.040132, 107.395393, 153], // 27
    [70.59766, 84.86766, -177], // 28 pinky
    [20,80,0],                       //29,
    [135.72392, 116.753015, 12],        //30
    [156.52986, 114.558883,0],
    [177.541264, 117.058463, -13.5],
    [197.391605, 124.369038, -27],
    [214.982962, 136.120562, -40.5]
];

/*

         0,  1,  2,  3,  4,  5,                    40, 39, 38, 37, 36, 35,
         7,  8,  9, 10, 11, 12,                    47, 46, 45, 44, 43, 42,
    28, 14, 15, 16, 17, 18, 19,                    54, 53, 52, 51, 50, 49, 63,
        21, 22, 23, 24, 25, 26, 27, 20,    55, 62, 61, 60, 59, 58, 57, 56,         
                   30, 31, 32, 33, 34,      69, 68, 67, 66, 65,     
 

*/

top_plate_thickness = 2.5;
bottom_plate_thickness = 1.2; 
pcb_thickness = 1.4;

spacer_wall_size = 8;
top_plate_to_pcb = 5.0 - top_plate_thickness; // cherry space = 5mm ;// top spacer
bottom_plate_to_pcb = 6; // Bottom spacer (Space for battery)

bordersize = 0.5; // wall over the top  plate

keyhole_size = 13.8;
potsize_width = 7.7;    // Small rectangle to give space where potentiometer can be set
potsize_height = 16.7;  // 


tolerance=0.5; // distance between pcb and wall
wallsize=4; // wall thickness   
wallheight =  bottom_plate_to_pcb + pcb_thickness + top_plate_to_pcb + top_plate_thickness + bordersize; // The height of the wall (from inside the case aka bottom space)

hole_m1 = 1.2;
hole_m2 = 2.4; 
hole_m3 = 3.4; 
head_m1  = 3.6;
head_m2  = 4.0;
nut_tol = 0.5; // Nut tolerance

head1_size = head_m2;
head2_size = head_m2;
hole1_size = hole_m2;
hole2_size = hole_m2;
hole1_type = "M2x10";
hole2_type = "M2x10";
nut1_type = "M2";
nut2_type = "M2";

magnet_size = 16;
magnet_height = 0.5;

magnet_pos = [[90,100],[90,70],[90,40],[187,100],[187,70],[187,40],[210,70],[225,120]];

module drawhole(height,wall_1 = 0, wall_2 = 0) {
    for (a = [ 0 : len(hole1) - 1 ]) {
        point=hole1[a];
        translate([point[0],point[1],0]){
          cylinder(d1=hole1_size + (wall_1/2),d2=hole1_size + (wall_2/2),h=height, $fn=100);
        }
    }
}

module drawdisplayhole(height,wall_1 = 0, wall_2 = 0) {
    for (a = [ 0 : len(hole2) - 1 ]){
        point=hole2[a];
        translate([point[0],point[1],0]){
          cylinder(d1=hole2_size + wall_1/2,d2=hole2_size + wall_2/2,h=height, $fn=100);
        }
    }
}

module draw_screw()
{
    for (a = [ 0 : len(hole1) - 1 ]) {
        point=hole1[a];
        color("green") translate([point[0],point[1],bottom_plate_thickness + bottom_plate_to_pcb + pcb_thickness + top_plate_to_pcb]) {
            screw(hole1_type);
        }
    }
    
    for (a = [ 0 : len(hole2) - 1 ]) {
        point=hole2[a];
        color("green") translate([point[0],point[1],bottom_plate_thickness + bottom_plate_to_pcb + pcb_thickness + top_plate_to_pcb]) {
            screw(hole2_type);
        }
    }
}

module drawnuts(height,wall = 0) { // Draw twice the deep to not have bolt that go to far bellow
    for (a = [ 0 : len(hole1) - 1 ]) {
        point=hole1[a];
        translate([point[0],point[1], 2 * _get_nut_height(hole1_type)  ]){
          
          nutcatch_parallel(nut1_type, clh=nut_tol);
          
        }
        translate([point[0],point[1], _get_nut_height(hole1_type)  ]){
          
          nutcatch_parallel(nut1_type, clh=nut_tol);
          
        }
    }
    
    for (a = [ 0 : len(hole2) - 1 ]) {
        point=hole2[a];
        translate([point[0],point[1], 2 * _get_nut_height(hole2_type) + nut_tol ]){
          nutcatch_parallel(nut2_type, clh=nut_tol);
        }
    }
    
    for (a = [ 0 : len(hole2) - 1 ]) {
        point=hole2[a];
        translate([point[0],point[1], _get_nut_height(hole2_type) + nut_tol ]){
          nutcatch_parallel(nut2_type, clh=nut_tol);
        }
    }
}

module drawscrewhead() {
    for (a = [ 0 : len(hole1) - 1 ]) {
        point=hole1[a];
        translate([point[0],point[1],0]){
          cylinder(d=head1_size + nut_tol,h=_get_head_height(hole1_type) + nut_tol, $fn=100);
        }
    }
}

    

module drawkey(height) {
    for (a = [ 0 : len(keys) - 1 ]) {
        point=keys[a];
        translate([point[0],point[1],0]) {
            rotate(a=[0,0,-point[2]]  ) {
                cube(size = [keyhole_size,keyhole_size,height] , center = true);
                if (a == 20 || a == 27 || a == 30 ) cube(size = [potsize_width,potsize_height,height] , center = true);
            }
        }
    }
}

module drawmagnet(offset) {
    for (a = [ 0 : len(magnet_pos) - 1 ]) {
        point=magnet_pos[a];
        translate([point[0],point[1],offset]) {
            //cube(size = [magnet_size,magnet_size,100] , center = true);
            cylinder(d=magnet_size,h = magnet_height + 1, center= true);
        }
    }
}

module draw_topplate() {
    difference() {
        union() {
            color("green",0.25) linear_extrude(height = top_plate_thickness) polygon(points = top_point);
            color("red") translate([0,0,-top_plate_to_pcb]) drawhole(top_plate_to_pcb,spacer_wall_size,spacer_wall_size);
        }
        union() {
            drawkey(3*top_plate_thickness);
            translate([0,0,-top_plate_to_pcb]) drawhole(top_plate_thickness + top_plate_to_pcb);
            translate([0,0,-(_get_head_height(hole1_type) + nut_tol-top_plate_to_pcb)]) drawscrewhead();
        }
    }
}

module draw_bottomplate() {
    difference() {
        union() {
            union() {
                linear_extrude(height=bottom_plate_thickness + wallheight) {
                    difference() {
                        minkowski(){
                            polygon(pcb_points);
                            square(tolerance*2+wallsize, center=true);
                        };

                        minkowski(){
                            polygon(pcb_points);
                            square(tolerance*2, center=true);
                        };
                    }
                }
                linear_extrude(height=bottom_plate_thickness) {
                    minkowski(){
                        polygon(pcb_points);
                        square(tolerance*2+wallsize, center=true);
                    };
                }
                color("red")translate([0,0,bottom_plate_thickness])  {
                    drawhole(bottom_plate_to_pcb,spacer_wall_size*2,spacer_wall_size);
                    drawdisplayhole(bottom_plate_to_pcb,spacer_wall_size*2,spacer_wall_size);
                }   
            }  
        }
        union() {
            drawhole(bottom_plate_to_pcb+bottom_plate_thickness+1);
            drawdisplayhole(bottom_plate_to_pcb+bottom_plate_thickness+1);
            color("orange") drawmagnet(bottom_plate_thickness - magnet_height/2);
            drawnuts();            
            color("green") translate([200,45,bottom_plate_thickness+bottom_plate_to_pcb+pcb_thickness]) cube([14,10,wallheight]);
            color("red") translate([226,58,bottom_plate_thickness+bottom_plate_to_pcb]) cube([10,9,wallheight]);
            color("blue") translate([226,83,bottom_plate_thickness+bottom_plate_to_pcb]) cube([10,9,wallheight]);
            
        }
    }     
}

module drawkeyboard()
{
    draw_bottomplate();
    //translate([0,0,bottom_plate_thickness + bottom_plate_to_pcb + pcb_thickness + top_plate_to_pcb ]) rotate([0,0,0]) draw_topplate();
    
    //draw_screw();
}


translate([-250,0,0]) drawkeyboard();

//translate([250,0,0]) mirror([1,0,0]) drawkeyboard();







