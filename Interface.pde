class Interface{
  
  int left = 1020;


void plantIF(ArrayList<Plant> in){
  float counter = 0;
  float fruitCounter = 0;
  float avgfruits = 0;
  float avg = 0;
for(int i = 0; i<in.size(); i++){
  counter += in.get(i).size;
  fruitCounter += in.get(i).fruit;
}

if(in.size()>0){
avg = counter/in.size();
avgfruits = fruitCounter/in.size();
}
push();
colorMode(RGB);
fill(255,255,255);
rect(1010,10, 900,190);
fill(0);
push();
textSize(30);
text("Plants: ",left, 50);
pop();
text("Harvest begins at: "+harvestBegin, 1760, 30);
text("current time: "+frameCount, 1760, 45);
text("total fruit Harvest: "+harvesterDrone.totalFruitHarvest, 1760, 60);
text("Amount of plants: "+ in.size(),left, 80);
text("collective size: "+ counter,left, 100);
text("Average plant Size: "+ avg,left, 120);
text("Average amount of Fruit: "+ avgfruits,left, 140);
text("Total amount of Fruit: "+ fruitCounter,left, 160);
pop();
}

void fieldIF(Field in){

 float avgWater = 0;
 float avgLime  = 0;
 float avgHummus = 0;
 float avgFert = 0;
 for(int i =0; i<in.sectors.length; i++){
   for(int j =0; j<in.sectors[0].length; j++){
     avgWater += in.sectors[i][j].water;
     avgLime += in.sectors[i][j].lime;
     avgHummus += in.sectors[i][j].hummus;
     avgFert += in.sectors[i][j].fert;
     
   }
 }
 int sectorCount = (in.sectors.length*in.sectors[0].length);
 
 avgWater = avgWater/sectorCount;
 avgFert = avgFert/sectorCount;
 avgLime = avgLime/sectorCount;
 avgHummus = avgHummus/sectorCount;
 
 
push();
colorMode(RGB);
fill(255,255,255);
rect(1010,210, 900,240);
fill(0);
push();
textSize(30);
text("Field: ",left, 250);
pop();
text("size: "+in.sizeX+"x"+in.sizeY,left, 280);
text("natural Lime: "+in.avgLime,left, 300);
text("natural Hummus: "+in.avgHummus,left, 320);
text("natural Fertilizer: "+in.avgFert,left, 340);
text("natural Water: "+in.avgWater,left, 360);
text("Average Water: "+avgWater,left, 380);
text("Average Fertilizer: "+avgFert,left, 400);
text("Average Lime: "+avgLime,left, 420);
text("Average Hummus: "+avgHummus,left, 440);
textSize(20);
float fieldHealth = 100-(100*((Math.abs(100-avgWater)+Math.abs(100-avgLime)+Math.abs(100-avgFert)+Math.abs(100-avgHummus))/400));
text("Field Health: "+fieldHealth+"%",1500, 300);
fill(255-(fieldHealth*2.55), fieldHealth*2.55, 0);
rect(1500, 310, 250, 40);
pop();

}

void droneIF(ArrayList<TractorDrone[]> in){
  int vert = 460;
push();
colorMode(RGB);
fill(255,255,255);
rect(1010,vert, 900,600);
fill(0);
push();
textSize(30);
text("Drones: ",left, vert+30);
pop();

fill(50,50,50);
rect(left, vert+50, 200, 200);
rect(left+210, vert+50, 200, 200);
rect(left+420, vert+50, 200, 200);
rect(left, vert+260, 200, 200);
rect(left+210, vert+260, 200, 200);
rect(left+420, vert+260, 200, 200);
fill(255);
text("Seeder", left+10, vert+70);
text("Water Drone", left+220, vert+70);
text("Lime Drone", left+430, vert+70);
text("Hummus Drone", left+10, vert+280);
text("Fertilizer Drone", left+220, vert+280);
text("Harvester", left+430, vert+280);
pop();

}
}
