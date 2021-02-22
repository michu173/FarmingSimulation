class Interface{


void plantIF(ArrayList<Plant> in){
  float counter = 0;
  float avg = 0;
for(int i = 0; i<in.size(); i++){
  counter += in.get(i).size;
}
if(in.size()>0){
avg = counter/in.size();
}
push();
colorMode(RGB);
fill(255,255,255);
rect(1010,10, 900,180);
fill(0);
push();
textSize(30);
text("Plants: ",1020, 50);
pop();
text("Amount of plants: "+ in.size(),1020, 80);
text("collective size: "+ counter,1020, 100);
text("Average plant Size: "+ avg,1020, 120);
pop();
}

void fieldIF(Field in){

push();
colorMode(RGB);
fill(255,255,255);
rect(1010,210, 900,180);
fill(0);
push();
textSize(30);
text("Field: ",1020, 250);
pop();
text("size: "+in.sizeX+"x"+in.sizeY,1020, 280);
text("natural Lime: "+in.avgLime,1020, 300);
text("natural Hummus: "+in.avgHummus,1020, 320);
text("natural Fertilizer: "+in.avgFert,1020, 340);
text("natural Water: "+in.avgWater,1020, 360);
pop();
}

void droneIF(ArrayList<TractorDrone[]> in){
push();
colorMode(RGB);
fill(255,255,255);
rect(1010,400, 900,180);
fill(0);
push();
textSize(30);
text("Drones: ",1020, 440);
pop();
text("size: "+"x",1020, 470);
text("natural Lime: ",1020, 490);
text("natural Hummus: ",1020, 510);
text("natural Fertilizer: ",1020, 530);
text("natural Water: ",1020, 550);
pop();


}
}
