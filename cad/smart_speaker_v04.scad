/* ESP32-S3 Smart-Lautsprecher v0.4 – USB auf urspruenglicher Seite zum Aussenrand versetzt, 2026-10-15.
   Alle Maße mm. FRONTANSICHT: Lautsprecher oben, Elektronik unten,
   USB links auf der urspruenglichen Seite wie IMG_3184.
   x nach rechts, y nach oben, z von Rueckwand zum Gitter.
   part = "body", "lid", "print", "assembly", "exploded", "components".
   body/lid sind druckorientiert. Details und Annahmen: README.md.
*/
part="print";
$fn=64;
/* [Gehaeuse] */
W=82; H=110; D=35;
wall=2.4; lid_t=2.4; corner=6;
/* [Platine] */
pcb_w=70; pcb_h=50; pcb_x=6; pcb_y=11;
hole_dx=65; hole_dy=45;
standoff=12.5; // v0.2: 9.5 -> nochmals +3.0; v0.1: 6.5
min_front_clearance=1.5; // mindestens 1.5 zum hoechsten Bauteil
pcb_pilot=2.0; pcb_post_d=6;
pins=5; total_electronics=21; pcb_t=1.6;
/* [Mikrofon] */
// Korrigierte Achsenzuordnung nach Fotos: 41 entlang 70-mm-Kante;
// 13 von der oberen 50-mm-Kante nach unten. Mittelpunkt (47,48).
mic_along_long_edge=41;
mic_from_pcb_top=13;
mic_d=14.3; mic_clearance=1.2;
/* [USB] */
usb_side="left"; // urspruengliche USB-Wand, wie im Probedruck / Foto
usb_start=7; usb_end=27; // von AUSSERER unterer Platinenkante zur Trennwand
usb_w=25; usb_h=15; usb_top=12.5; usb_chamfer=1.2;
/* [Lautsprecher] */
spk_w=26.8; spk_h=30; spk_depth=15.2;
spk_pitch=36.5; spk_clearance=3.3;
spk_mount_drop=7; // v0.1: 4 -> +3.0
spk_ear_depth=7; // Laschenloch liegt 7 HINTER der Schall-Vorderseite!
// Gitterlage wie v0.1, in bestätigter Frontorientierung.
spk_grid_first=71.8; spk_grid_count=8;
spk_slot_pitch=3.6; spk_slot_h=2;
/* [Trennung und Kabel] */
partition_y=62.6; partition_t=2.4;
wire_w=5; wire_depth=6.6;
wire_centers=[11.5,70.5]; // bestehend links, NEU rechts beim Antennenkabel
/* [Antenne und Front] */
antenna_d=6.25; antenna_allowance=0.25;
antenna_x=72; antenna_y=100;
front_pilot=2.1; front_clearance=2.8;
/* [Hidden] */
front_z=D-lid_t;
mic_x=pcb_x+mic_along_long_edge;
mic_y=pcb_y+pcb_h-mic_from_pcb_top;
spk_cy=spk_grid_first+((spk_grid_count-1)*spk_slot_pitch+spk_slot_h)/2;
spk_y=spk_cy-spk_h/2;
seats=[[5,5],[W-5,5],[5,H-5],[W-5,H-5]];
pcb_holes=[for(x=[pcb_x+(pcb_w-hole_dx)/2,pcb_x+(pcb_w+hole_dx)/2],y=[pcb_y+(pcb_h-hole_dy)/2,pcb_y+(pcb_h+hole_dy)/2]) [x,y]];
assert(standoff>pins,"Pins brauchen Abstand zur Rueckwand");
assert(front_z-(wall+standoff+total_electronics-pins)>=min_front_clearance,"Zu wenig Freiraum zur Front");
assert(spk_mount_drop>=spk_ear_depth,"Lautsprecher wuerde in die Front ragen");
module rounded(w,h,r,z){linear_extrude(z) hull() for(x=[r,w-r],y=[r,h-r]) translate([x,y]) circle(r=r);}
module block(p,s){translate(p) cube(s);}
module bore(x,y,z,h,d){translate([x,y,z]) cylinder(h=h,d=d);}
module usb_cut(){
 yc=pcb_y+(usb_start+usb_end)/2; // Mitte y=28, vorher y=44: 16 zum Aussenrand
 zc=wall+standoff+usb_top+1-usb_h/2;
 // Außen 25x15; innen 27.4x17.4, Aufweitung durch die Wand.
 if(usb_side=="right") hull(){
  block([W-0.01,yc-usb_w/2,zc-usb_h/2],[0.02,usb_w,usb_h]);
  block([W-wall-0.01,yc-usb_w/2-usb_chamfer,zc-usb_h/2-usb_chamfer],[0.02,usb_w+2*usb_chamfer,usb_h+2*usb_chamfer]);
 } else hull(){
  block([-0.01,yc-usb_w/2,zc-usb_h/2],[0.02,usb_w,usb_h]);
  block([wall-0.01,yc-usb_w/2-usb_chamfer,zc-usb_h/2-usb_chamfer],[0.02,usb_w+2*usb_chamfer,usb_h+2*usb_chamfer]);
 }
}
module body(){difference(){union(){
 difference(){rounded(W,H,corner,front_z); translate([wall,wall,wall]) rounded(W-2*wall,H-2*wall,corner-wall,D);}
 for(p=pcb_holes) bore(p[0],p[1],wall-0.1,standoff+0.1,pcb_post_d);
 for(p=seats) bore(p[0],p[1],wall-0.1,front_z-wall+0.1,7);
 block([wall,partition_y,wall-0.1],[W-2*wall,partition_t,front_z-wall+0.1]);
 }
 for(p=pcb_holes) bore(p[0],p[1],wall+1,standoff+1,pcb_pilot);
 for(p=seats) bore(p[0],p[1],front_z-10,11,front_pilot);
 usb_cut();
 bore(antenna_x,antenna_y,-0.1,wall+0.2,antenna_d+antenna_allowance);
 for(x=wire_centers) block([x-wire_w/2,partition_y-0.1,front_z-wire_depth],[wire_w,partition_t+0.2,wire_depth+1]);
}}
module lid(){difference(){union(){
 rounded(W,H,corner,lid_t);
 translate([wall+0.3,wall+0.3,-1.2]) difference(){
  rounded(W-2*wall-0.6,H-2*wall-0.6,corner-wall-0.3,1.3);
  translate([1.2,1.2,-0.1]) rounded(W-2*wall-3,H-2*wall-3,corner-wall-1.5,2);
 }
 // Lochachse exakt auf Mittelpunkt des vorhandenen Lautsprechergitters.
 for(x=[W/2-spk_pitch/2,W/2+spk_pitch/2]) bore(x,spk_cy,-spk_mount_drop,spk_mount_drop+0.1,7);
 }
 for(p=seats) bore(p[0],p[1],-2,6,front_clearance);
 for(x=[W/2-spk_pitch/2,W/2+spk_pitch/2]) bore(x,spk_cy,-spk_mount_drop-0.1,spk_mount_drop+lid_t+0.2,spk_clearance);
 for(i=[0:spk_grid_count-1]) block([W/2-spk_w/2+1,spk_grid_first+i*spk_slot_pitch,-0.1],[spk_w-2,spk_slot_h,lid_t+0.2]);
 for(y=[10:4:54]) block([13,y,-0.1],[56,2,lid_t+0.2]);
 bore(mic_x,mic_y,-0.1,lid_t+0.2,mic_d+2*mic_clearance);
 block([0,partition_y-0.3,-2],[W,partition_t+0.6,2]);
 for(p=seats) bore(p[0],p[1],-2,2.01,8);
}}
module components(){
 // Nur vereinfachte Bauteilhüllen, nicht Bestandteil der Druckteile.
 color([0.12,0.55,0.34]) block([pcb_x,pcb_y,wall+standoff],[pcb_w,pcb_h,pcb_t]);
 color("silver") bore(mic_x,mic_y,wall+standoff+pcb_t,8,mic_d);
 color([0.22,0.24,0.27]) block([W/2-spk_w/2,spk_y,front_z-spk_mount_drop+spk_ear_depth-spk_depth],[spk_w,spk_h,spk_depth]);
}
module lid_print(){translate([W,0,lid_t]) rotate([0,180,0]) lid();}
if(part=="body") body();
else if(part=="lid") lid_print();
else if(part=="components") components();
else if(part=="assembly"){color("LightSlateGray")body();translate([0,0,front_z])color("Orange")lid();components();}
else if(part=="exploded"){color("LightSlateGray")body();translate([0,0,D+26])color("Orange")lid();components();}
else if(part=="print"){body();translate([W+12,0,0])lid_print();}
else assert(false,"Unbekanntes part");
