include <./KeyV2/includes.scad>
 
$font = "DejaVu Sans:style=Bold";
$font_size = 2;

pcb_points = [[81.740171,110.323135],[124.110371,108.485434],[128.598892,127.733396],[146.996902,123.971322],[166.055043,123.967253],[166.055043,123.967253],[184.617357,128.428034],[201.626725,137.085463],[215.993451,149.169715],[240.383745,120.615118],[226.372957,108.455818],[226.161832,54.667135],[217.209331,49.970723],[195.286002,49.2243],[195.285999,31.067171],[176.528893,30.77428],[176.235999,29.067181],[157.478899,28.774284],[157.186002,26.567173],[138.648897,26.56718],[138.356003,28.774278],[119.598893,29.067179],[119.306,32.314284],[77.780048,34.75951],[79.89412699992839,75.09852794741323],[60.85857,76.097056],[61.829661,94.593607],[80.86349449039737,93.59515583927146]];

top_point = [[81.740171,110.323135],[124.110371,108.485434],[128.598892,127.733396],[146.996902,123.971322],[166.055043,123.967253],[166.055043,123.967253],[184.617357,128.428034],[201.626725,137.085463],[215.993451,149.169715],[240.383745,120.615118],[226.372957,108.455818],/*cut*/[197,92],[195.286002,88],/*cut*/[195.286002,49.2243],[195.285999,31.067171],[176.528893,30.77428],[176.235999,29.067181],[157.478899,28.774284],[157.186002,26.567173],[138.648897,26.56718],[138.356003,28.774278],[119.598893,29.067179],[119.306,32.314284],[77.780048,34.75951],[79.89412699992839,75.09852794741323],[60.85857,76.097056],[61.829661,94.593607],[80.86349449039737,93.59515583927146]];



// Hole in comment are central and we make space for battery by remove it
hole1 = [[210.899641, 123.194258],[137.384115, 46.836171],/*[139.021284, 64.413276],[177.151281, 68.923262],*//*[80.333192, 89.113988],*/[99.48792, 90.613548],[97.46632, 51.538002],/*[98.49095, 71.589648],*/[168.023177, 107.422185],/*[145.253172, 107.34218],*/[190.393201, 112.772207],[177.524117, 48.836171]];

hole2 = [[223.247088, 101.330639],[200.247094, 89.630633],[223.247095, 56.930644]];

// Screw size for top
screwheadheight = 5; //TODO mesure it
screwheaddiameter = 4.5;
screwholesize = 2.4;

// Magnets place
magnet_pos = [[90,100],[90,70],[90,40],[187,100],[187,70],[187,40],[210,70],[225,120]];
magnet_size = 16;
magnet_height = 0.5;

top_plate_thickness = 1.5;
bottom_plate_thickness = 1.2; 
pcb_thickness = 1.4;

spacer_wall_size = 8;
top_plate_to_pcb = 5.0 - top_plate_thickness; // cherry space = 5mm ;// top spacer
bottom_plate_to_pcb = 6; // Bottom spacer (Space for battery)

bordersize = 0.5; // wall over the top  plate

keyhole_size = 14.1;
potsize_width = 8.0;    // Small rectangle to give space where potentiometer can be set
potsize_height = 17;  // 
keytol = 0;


    //w = 17.1;
    //h = 14.3;
EVQWGD001_widht = 17.1+0.4+3; //18.8;
EVQWGD001_height = 14.3+0.4+3+4;//16; //14;


tolerance=0.5; // distance between pcb and wall
wallsize=4; // wall thickness   
wallheight =  bottom_plate_to_pcb + pcb_thickness + top_plate_to_pcb + top_plate_thickness + bordersize; // The height of the wall (from inside the case aka bottom space)


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

keypos = [
     0,  1,  2,  3,  4,  5,                    40, 39, 38, 37, 36, 35,
     7,  8,  9, 10, 11, 12,                    47, 46, 45, 44, 43, 42,
28, 14, 15, 16, 17, 18, 19,                    54, 53, 52, 51, 50, 49, 63,
    21, 22, 23, 24, 25, 26, 27, 20,    55, 62, 61, 60, 59, 58, 57, 56,         
               30, 31, 32, 33, 34,      69, 68, 67, 66, 65,     
];

keyrow = [   
    0, 0, 0, 0, 0, 0,                   0, 0, 0, 0, 0, 0,     
    1, 1, 1, 1, 1, 1,                   1, 1, 1, 1, 1, 1,
 2, 2, 2, 2, 2, 2, 2,                   2, 2, 2, 2, 2, 2, 2,
    3, 3, 3, 3, 3, 3, 3, 3,       3, 3, 3, 3, 3, 3, 3, 3,
             4, 4, 4, 4, 4,       4, 4, 4, 4, 4 // <-space bar shape
];

keycol  = [   
    1, 2, 3, 4, 5, 6,                   6, 5, 4, 3, 2, 1,     
    1, 2, 3, 4, 5, 6,                   6, 5, 4, 3, 2, 1,
 0, 1, 2, 3, 4, 5, 6,                   6, 5, 4, 3, 2, 1, 0,
    1, 2, 3, 4, 5, 6, 7, 8,       8, 7, 6, 5, 4, 3, 2, 1,
             4, 5, 6, 7, 8,       8, 7, 6, 5, 4 // <-space bar shape
];


// 3d print layout (put keys side by side for eazy print

// 3x6
/*
keyrow2 = [   
    0, 0, 0, 0, 0, 0,                   0, 0, 0, 0, 0, 0,     
    1, 1, 1, 1, 1, 1,                   1, 1, 1, 1, 1, 1,
 2, 2, 2, 2, 2, 2, 2,                   2, 2, 2, 2, 2, 2, 2,
    0, 0, 0, 0, 0, 0, 2, 2,       2, 2, 1, 1, 1, 1, 1, 1,
             0, 0, 0, 0, 0,       1, 1, 1, 1, 1 // <-space bar shape
];

keycol2  = [   
    1, 2, 3, 4, 5, 6,                   6, 5, 4, 3, 2, 1,     
    1, 2, 3, 4, 5, 6,                   6, 5, 4, 3, 2, 1,
 3, 1, 2, 3, 4, 5, 6,                   6, 5, 4, 3, 2, 1, 6,
    1, 2, 3, 4, 5, 6, 1, 2,       5, 4, 6, 5, 4, 3, 2, 1,
             1, 2, 3, 4, 5,       5, 4, 3, 2, 1 // <-space bar shape
];

keypage2  = [   
    0, 0, 0, 0, 0, 0,                   1, 1, 1, 1, 1, 1,     
    0, 0, 0, 0, 0, 0,                   1, 1, 1, 1, 1, 1,
 2, 0, 0, 0, 0, 0, 0,                   1, 1, 1, 1, 1, 1, 2,
    2, 2, 2, 2, 2, 2, 2, 2,       2, 2, 2, 2, 2, 2, 2, 2,
             3, 3, 3, 3, 3,       3, 3, 3, 3, 3 // <-space bar shape
];
*/

//4x6
keyrow2 = [   
    0, 0, 0, 0, 0, 0,                   0, 0, 0, 0, 0, 0,     
    1, 1, 1, 1, 1, 1,                   1, 1, 1, 1, 1, 1,
 2, 2, 2, 2, 2, 2, 2,                   2, 2, 2, 2, 2, 2, 2,
    3, 3, 3, 3, 3, 3, 2, 2,       2, 2, 3, 3, 3, 3, 3, 3,
             0, 0, 0, 0, 0,       1, 1, 1, 1, 1 // <-space bar shape
];

keycol2  = [   
    1, 2, 3, 4, 5, 6,                   6, 5, 4, 3, 2, 1,     
    1, 2, 3, 4, 5, 6,                   6, 5, 4, 3, 2, 1,
 3, 1, 2, 3, 4, 5, 6,                   6, 5, 4, 3, 2, 1, 3,
    1, 2, 3, 4, 5, 6, 1, 2,       1, 2, 6, 5, 4, 3, 2, 1,
             1, 2, 3, 4, 5,       5, 4, 3, 2, 1 // <-space bar shape
];

keypage2  = [   
    0, 0, 0, 0, 0, 0,                   1, 1, 1, 1, 1, 1,     
    0, 0, 0, 0, 0, 0,                   1, 1, 1, 1, 1, 1,
 2, 0, 0, 0, 0, 0, 0,                   1, 1, 1, 1, 1, 1, 2,
    0, 0, 0, 0, 0, 0, 2, 2,       2, 2, 1, 1, 1, 1, 1, 1,
             2, 2, 2, 2, 2,       2, 2, 2, 2, 2 // <-space bar shape
];



esc = "Esc"; //or ??//"⎋";
pageup = "⇞"; 
pagedown = "⇟";
up = "↑";
left = "←";
right = "→";
down = "↓";
capslock = "⇪";
home = "⌂";
end = "End";
del = "Del"; //"␡";
backspace= "⌫";
tab = "⇥↹";
tab2 = "⇤";
shift = "⇧";
prevtrack = "⏮";
nexttrack = "⏭";
prevtrack2 = "⏪";
nexttrack2 = "⏩";
mediastop = "⏹";
mediaplaypause = "⏯";
space = "␣";
alt = "Alt";
print = "⎙";
mute = "🔇"; 
ins = "Ins";
win = "⌘";
ctrl = "⌃";
eject  = "⏏";
leftmouse = "🖰";
righmouse = "🖰";
enter = "⏎";
func = "func";


//▲▼◀▶ 


main_text = [   
            "Esc",    "1!", "2@", "3#", "4$", "5%",                                     "6^", "7&", "8 *", "9 (", "0 )", "\\ |",       
            "Tab",    "Q",  "W",  "E",  "R",  "T",                                      "Y",  "U",  "I",  "O",  "P",  "[ {",
   "Caps",  "Shift",    "A",  "S",  "D",  "F",  "G",                                      "H",  "J",  "K",  "L",  "; :", "' \"", "] }",
            "Ctrl",    "Z",  "X",  "C",  "V",  "B",  "Del", "⌘",           "Ins", "⌫", "N",  "M",  ", <", ". >", "/ ?", "Ctrl",
                                "🔇", "` ~", "=+", "␣",  "↵" ,         "↵", "Func",   "- _", "Func", "⎙" 
];

func_text = [   
            "",  "F1", "F2", "F3",  "F4",  "F5",                           "F6", "F7",  "F8","F9", "F10",  "F11",       
            "",  "",   "⬤", "▲", "⬤",  "⌫",                             "Del","⌂  ","▲", "END", "PgUp",   "",
       "Lock",  "",  "APP","◀", "▼", "▶",  "Del",                               "⌫", "◀",   "▼", "▶",   "PgDn",   "",   "F12",
            "",  "",   "",   "⬤",   "",   "",  "", "",          "",  "",  "",   "PgUp",    "PgDn", "",  "",     "",
                                "",   "",  "",  "", "" ,     "",  "Lower",  "", "Raise", ""
];

func_text2 = [   
            "",  "",   "NUM","/", "*",  "-",                           "", "", "","PrtSc", "ScrLK",  "Pause",       
            "",  "0",  "7",  "8", "9",  "+",                           "", "", "","",      "",       "",
       "",  "",  "0",  "4",  "5", "6",  "⏎",                          "", "", "", "",      "",      "",   "Pow",
            "",  "0",  "1",  "2", "3",   ".",  "", "",          "", "","", "", "", "",      "",      "",
                                "",   "",  "",  "", "Alt" ,     "Alt",  "", "", "", ""
];

module _testfont(font)
{
    color("black") translate([0,-($font_size+1),0]) text(font,size=$font_size);
    for (a = [0 : len (main_text) -1]) {
        color("black") translate([0,a*($font_size+1),0]) linear_extrude(0.1) text(main_text[a], size=$font_size,font=font);
    }
    for (a = [0 : len (func_text) -1]) {
        color("black") translate([10,a*($font_size+1),0]) linear_extrude(0.1) text(func_text[a], size=$font_size,font=font);
    }
    for (a = [0 : len (func_text2) -1]) {
        color("black") translate([20,a*($font_size+1),0]) linear_extrude(0.1) text(func_text2[a], size=$font_size,font=font);
    }
}

module testfont()
{
    fonts = [
        //"Segoe MDL2 asset:style=Bold",
        "Segoe UI Symbol",
        //"Segoe UI Emoji",
        //"Segoe UI",
        //"Lucida Bright",
        //"Stencil",
        //"Rafale:style=BG",
        //"Open Sans:style=Bold",
        //"Open Sans",
        "DejaVu Sans",
        "DejaVu Sans:style=Bold",
        "DejaVu Sans:style=Condensed",
        "DejaVu Sans:style=Book",
    ];
    for (a = [0 : len (fonts) -1]) {
        translate([a*40,0,0])  _testfont(fonts[a]);
    }
        

}





module drawhole(height,wall_1 = 0, wall_2 = 0) {
    for (a = [ 0 : len(hole1) - 1 ]) {
        point=hole1[a];
        translate([point[0],point[1],0]){
          cylinder(d1=screwholesize + (wall_1/2),d2=screwholesize + (wall_2/2),h=height, $fn=100);
        }
    }
}

module drawdisplayhole(height,wall_1 = 0, wall_2 = 0) {
    for (a = [ 0 : len(hole2) - 1 ]){
        point=hole2[a];
        translate([point[0],point[1],0]){
          cylinder(d1=screwholesize + wall_1/2,d2=screwholesize + wall_2/2,h=height, $fn=100);
        }
    }
}

module drawinsert()
{
    for (a = [ 0 : len(hole1) - 1 ]) {
        point=hole1[a];
        translate([point[0],point[1],2]){
          cylinder(d=3.4,h=30, $fn=100);
        }
    }
    for (a = [ 0 : len(hole2) - 1 ]) {
        point=hole2[a];
        translate([point[0],point[1],2]){
          cylinder(d=3.4,h=30, $fn=100);
        }
    }
}

module drawscrewhead() {
    for (a = [ 0 : len(hole1) - 1 ]) {
        point=hole1[a];
        translate([point[0],point[1],0]){
          cylinder(d=screwheaddiameter,h=screwheadheight, $fn=100);
        }
    }
}

module drawkey(height, have_EVQWGD001) {
    for (a = [ 0 : len(keys) - 1 ]) {
        point=keys[a];
        translate([point[0],point[1],0]) {
            rotate(a=[0,0,-point[2]]  ) {
                if (have_EVQWGD001 && a == 30) {
                    cube(size = [EVQWGD001_widht,EVQWGD001_height,height] , center = true);
                    //translate([0,3,0]) cube(size = [EVQWGD001_widht,EVQWGD001_height,height] , center = true); // Remove the notch
                }
                else {
                    cube(size = [keyhole_size+keytol,keyhole_size+keytol,height] , center = true);
                    if (a == 20 || a == 27 || a == 30 ) cube(size = [potsize_width+keytol,potsize_height+keytol,height] , center = true);
                }
            }
        }
    }
}

module drawmagnet() {
    for (a = [ 0 : len(magnet_pos) - 1 ]) {
        point=magnet_pos[a];
        translate([point[0],point[1],bottom_plate_thickness]) {
            //cube(size = [magnet_size,magnet_size,100] , center = true);
            difference() {
                cylinder(d=magnet_size,h = 4.4+0.2, center= false);
                cylinder(d=9,h = bottom_plate_to_pcb, center= false);
                

            }
        }
    }
}

module draw_topplate(isright=false) {
    difference() {
        union() {
            color("green",0.25) linear_extrude(height = top_plate_thickness) polygon(points = top_point);
            color("red") translate([0,0,-top_plate_to_pcb]) drawhole(top_plate_to_pcb,spacer_wall_size,spacer_wall_size);
        }
        union() {
            drawkey(3*top_plate_thickness,isright);
            translate([0,0,-top_plate_to_pcb]) drawhole(top_plate_thickness + top_plate_to_pcb);
            translate([0,0,0]) drawscrewhead();
        }
    }
}

module _draw_testplate(add=0) {
    add2 = add + keytol;
    difference() {
        color("green",0.25) cube([65,25,top_plate_thickness]);
        translate([0,10,0]) union() {
            translate([15,0,0]) {
                //union() { // EVQWGD001 or pot
                    cube(size = [EVQWGD001_widht+add2,EVQWGD001_height+add2,3*top_plate_thickness] , center = true);
                    //cube(size = [potsize_width+add2,potsize_height+add2,3*top_plate_thickness] , center = true);
                //}
            }
            
            translate([35,0,0]) { 
            union() { // Potentio
                    cube(size = [keyhole_size+add2,keyhole_size+add2,3*top_plate_thickness] , center = true);
                    cube(size = [potsize_width+add2,potsize_height+add2,3*top_plate_thickness] , center = true);
                } 
            }
            
            translate([55,0,0]) { //swith
                cube(size = [keyhole_size+add2,keyhole_size+add2,3*top_plate_thickness] , center = true);
            }
        }
    }
}

module draw_testplate(add=0) {
    translate([0,0*25,0]) _draw_testplate(-0.1);
    translate([0,1*25,0]) _draw_testplate(0.0);
    translate([0,2* 25,0]) _draw_testplate(0.1);
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
                
                
                color("orange") drawmagnet(); 
                
                
             
            }  
        }
        union() {
            drawinsert();
            //color("orange") drawmagnet(bottom_plate_thickness - magnet_height/2);           
            color("green") translate([200,45,bottom_plate_thickness+bottom_plate_to_pcb+pcb_thickness]) cube([14,10,wallheight]);
            color("red") translate([226,70,bottom_plate_thickness+bottom_plate_to_pcb]) cube([10,9,wallheight]);
            color("blue") translate([226,90,bottom_plate_thickness+bottom_plate_to_pcb]) cube([10,9,wallheight]);  
            
        }
    }     
}


module drawkeycap(height,offset,makelegend=false)
{
    for (a = [ 0 : len(keys) - 1 ]) {
        if (a == 6 || a == 13 || a == 29 ) {
        } else if (a == 30 ) {
            draw_pot(a,height,offset);
        } else {
            drawkeycap_single(a,height,offset,offset==0?true:false,null,0,makelegend);
        }
    }
}

module drawkeycap_inline(offset,page,makelegend) 
{
    for (a = [ 0 : len(keys) - 1 ]) {
        if (a == 6 || a == 13 || a == 29 ) {
        } else if (a == 30 ) {
        } else {
            drawkeycap_single(a,0,offset,offset==0?true:false,true,page,makelegend);
        }
    }
}

module draw_pot(a,height,offset)
{
    point=keys[a];
    translate([point[0],point[1],height+5]) {
        cylinder(d=20,h=15,center= true);
    }
    
}



module drawkeycap_single(a,height,offset,inv,layoutmode,page,makelegend) {
    
    ind = search(a+offset,keypos);
    row = keyrow[ind[0]]+1;
    col = keycol[ind[0]]+1;
    
    row2 = keyrow2[ind[0]];
    col2 = keycol2[ind[0]];
    page2 = keypage2[ind[0]];
    
    angle_3d_print = 0; //225;
    dist_x_3d_print = 19;
    dist_y_3d_print = 19;
    
    // nova elfin = 132 x 74 = 8x4  = 144 x 72
    
    //point=layoutmode?[col2 * 19,row2 * 19, 180]:keys[a];
    
    point=layoutmode?[col2 * dist_x_3d_print,row2 * dist_y_3d_print, 180]:keys[a];
    
    text1 = main_text[ind[0]]; // str(a); 
    funckey = func_text[ind[0]];
    funckey2 = func_text2[ind[0]];
    
    r = layoutmode?180:(point[2] + [0,0,0,0,0,180][row]);

    //$cherry_bevel = false;
    //$stem_support_type = disabled;
    //$support_type = disable;
    
    
    ///////////////////////
    //$bottom_key_width = $unit - 0.5;
    //$bottom_key_height = $unit - 0.5;
  

    
    $dish_type = "disable";
    $key_shape_type = "rounded_square";
    $total_depth = 6;
    $keytop_thickness = 1;
    $wall_thickness = -1;
    $top_tilt = 0;
    $top_skew = 0;
    $width_difference = 0;
    $height_difference = 0;
    
    $stem_support_type = "disable";
    
    
    
    $inverted_dish = (row == 5);
    $inset_legend_depth = 1;
    
    

 
   
    if (!layoutmode || page == page2 ){ 
    
    
    

    
        color([1.0,1.0,1.0,0.2]) translate([point[0],point[1],height]) {
             rotate(a=[layoutmode?angle_3d_print:0,0,-r ] ) mirror([inv?1:0,0,0]) {
                specialcar = (text1 == "↵" || text1 == "␣" || text1 == "⌘")?true:false;
                
                if (makelegend) {
                        //key();
                        legend(text1, position = specialcar?[0,0]:[0,-0.8] , size=specialcar?10:len(text1) <4?4.5:3.5)
                        legend(funckey, position = [0,+0.8] , size=len(funckey) == 1?4.5:3.5)
                        legend(funckey2, position = len(funckey2) == 1 ? [1.0,0]:[+0.8,+1.4] , size=len(funckey2) == 1 ? 4.0:2.1)
                        legends($inset_legend_depth);
                } else {
                    legend(text1, position = specialcar?[0,0]:[0,-0.8] , size=specialcar?10:len(text1) <4?4.5:3.5)
                    legend(funckey, position = [0,+0.8] , size=len(funckey) == 1?4.5:3.5)
                    legend(funckey2, position = len(funckey2) == 1 ? [1.0,0]:[+0.8,+1.4] , size=len(funckey2) == 1 ? 4.0:2.1)
                    key();
                }   
            }
        }
    }
}

module keycap(page,legend)
{
    drawkeycap_inline(35,page,legend);
    translate([133,0,0]) mirror([1,0,0]) drawkeycap_inline(0,page,legend);
}


module draw_samplekey() 
{
    drawkeycap_single(3,20,35);
    drawkeycap_single(2,20,35);
    drawkeycap_single(10,20,35);
    drawkeycap_single(17,20,35);
    drawkeycap_single(24,20,35);
    drawkeycap_single(30,20,35);
    drawkeycap_single(31,20,35);
    drawkeycap_single(34,20,35);
}

module draw_singlekey_test()
{
    //drawkeycap_single(2,20,35,false,false,0,true);
    drawkeycap_single(2,20,35,false,false,0,false);
    

}



module drawkeyboard(keyoffset)
{
    color("black") draw_bottomplate();
    color("black") translate([0,0,bottom_plate_thickness + bottom_plate_to_pcb + pcb_thickness + top_plate_to_pcb ]) rotate([0,0,0]) draw_topplate(keyoffset==35);
    drawkeycap(20,keyoffset);

}


module printdemo() {
    translate([-250,0,0])   drawkeyboard(35);
    translate([250,0,0]) mirror([1,0,0])   drawkeyboard(0);
}

module test_insert()
{
    bottom = 2;
    bwidth = 6;
    cube([bwidth,60,bottom], 0,0);
    difference(){
        translate([0,0,bottom]) cube([bwidth,60,bottom_plate_to_pcb], 0,0);
        union() {
            translate([bwidth/2,5,bottom])cylinder(d=3.0,h=30, $fn=100);
            translate([bwidth/2,10,bottom])cylinder(d=3.1,h=30, $fn=100);
            translate([bwidth/2,15,bottom])cylinder(d=3.2,h=30, $fn=100);
            translate([bwidth/2,20,bottom])cylinder(d=3.3,h=30, $fn=100);
            translate([bwidth/2,25,bottom])cylinder(d=3.4,h=30, $fn=100);
            translate([bwidth/2,30,bottom])cylinder(d=3.5,h=30, $fn=100);
            translate([bwidth/2,35,bottom])cylinder(d=3.6,h=30, $fn=100);
            translate([bwidth/2,40,bottom])cylinder(d=3.7,h=30, $fn=100);
            translate([bwidth/2,45,bottom])cylinder(d=3.8,h=30, $fn=100);
            translate([bwidth/2,50,bottom])cylinder(d=3.9,h=30, $fn=100);
            translate([bwidth/2,55,bottom])cylinder(d=4.0,h=30, $fn=100);   
        } 
    }
}

module evqwg001()
{
    foot = 2 + 1.6; // Space under metal part (should include plastic foot + room for wire
    size = 6 + foot;
    w = 17.1;
    h = 14.3;
    wall = 2.5;
    pinsize = 1.2;
    pinspace = 2.54;
    correction = 1; // make cut longer 
    addtopbottom=2;
    difference(){
        union() {
            difference(){
                cube([w+wall,h+wall+2*addtopbottom,size]); // Wall
                translate([wall/2,wall/2+addtopbottom,-correction/2]) cube([w,h,size+correction]); // Big cut
            }
            
            translate([w+wall-12,h+.5+addtopbottom,size-6]) difference(){ // Small upper right block
                cube([12,1.2,6]); 
                translate([12-2,-correction/2,-correction/2]) cube([2,1.2+correction,4+correction]);
            }
        }
        
        correction2 = 0.2;
        pinlen = size ;
        //w/2-(4*pinsize)/2
        translate([wall/2+w/2-(2*pinspace+pinsize)/2,wall/2-pinsize/2+correction2-pinsize/2+addtopbottom,-1]) union() {
            // pin            
            union() {
                color("red") cube([pinsize,h+1.5*pinsize,pinlen] );
                color("red") translate([pinspace,0,0]) cube([pinsize,h+1.5*pinsize,pinlen]);
                color("red") translate([2*pinspace,0,0])cube([pinsize,h+1.5*pinsize,pinlen]);
            }
            
            translate([-4.5,-1* pinsize,0]) color("red") cube([15,h+3.5*pinsize,4]);
        }
        
        translate([-1,0,7]) rotate([45,0,0]) color("green") cube([w+wall*2,4+2,4]);
        translate([-1,h+wall+2*addtopbottom,7]) rotate([45,0,0]) color("green") cube([w+wall*2,4+2,4]);
        
        //color("red") translate([(w+wall)/2-6,-wall/2,7]) cube([12,2*wall,3]); 
        
    }    
}

module maketemplate() {
    rotate([0,0,180]) projection(){
        color("black") translate([-250,0,0]) drawkeycap(20,35, true); 
        color("black")  translate([250,0,0]) mirror([1,0,0]) drawkeycap(20,0,true);
    }
}

module makeallkey() {
    rotate([0,0,180]) union(){
        translate([-250,0,0]) drawkeycap(20,35); 
        translate([250,0,0]) mirror([1,0,0]) drawkeycap(20,0);
    }
}






//drawkeyboard(0); // Draw all right side
//printdemo();     // Draw all

//evqwg001();      // Draw insert for and evqwg001 to convert to encoder

                 
makeallkey(); // Draw all keycaps
//maketemplate(); // Draw all keycaps text
//draw_singlekey_test();                                                                          // Draw one keycap 
// draw_samplekey();                                                                               // Draw some selected keycaps 

// testfont();          // Draw keycaps text with multiple font to choose a good font

//test_insert();                                                            // Make a small print to test insert
//draw_testplate();                                                         // Draw a plate to test key tolerances

//draw_bottomplate();                                                       // Draw right bottom plate (case)
//rotate ([0,180,0] )draw_topplate(35);                                     // Draw right top plate
//rotate ([0,180,0] ) mirror([1,0,0]) draw_topplate(0);                     // Draw left top plate  


// Print keycaps in 4 block for easy printing
//keycap(0,false);
//keycap(1,false);
//keycap(2,false);

//keycap(0,true);
//keycap(1,true);
//keycap(2,true);











