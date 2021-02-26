class Interface{
  
  int left = 1020;
  float fieldHealth;

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

public float getFieldHealth(){
  return fieldHealth;
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
  fieldHealth = 100-(100*((Math.abs(100-avgWater)+Math.abs(100-avgLime)+Math.abs(100-avgFert)+Math.abs(100-avgHummus))/400));
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
  
  //for SeederDrone
  fill(50,50,50); //rectangle color
  rect(left, vert+50, 200, 200);
  fill(255); //textcolor
  text("Seeder:", left+10, vert+70);
  text("Amount of Seeds planted: " + seederDrone.addedPlants, left+10, vert+90);
  text("Amount of Seeds left \nuntill refill: " + seederDrone.product, left+10, vert+110);
  
  text("Amount of fuel left: " + seederDrone.fuel, left+10, vert+160);
  text("Refilled: " + seederDrone.getVisitStation() + " times", left+10, vert+180);
  text("Used Fuel: " + seederDrone.getUsedFuel() + " liters", left+10, vert+200);
  
  //for WaterDrone
  fill(111,133,242); //rectangle color
  rect(left+210, vert+50, 200, 200);
  fill(255); //textcolor
  text("Water Drone:", left+220, vert+70);
  text("Amount of water left \nuntill refill: " + waterDrone.product, left+220, vert+90);
  
  text("Amount of fuel left: " + waterDrone.fuel, left+220, vert+140);
  text("Refilled: " + waterDrone.getVisitStation() + " time" + (waterDrone.getVisitStation() == 1 ? "" : "s"), left+220, vert+160);
  text("Used water: " + waterDrone.usedProduct + " liter" + (waterDrone.usedProduct == 1 ? "" : "s"), left +220, vert+180);
  text("Used Fuel: " + waterDrone.getUsedFuel() + " liters", left+220, vert+200);
  
  //for LimeDrone
  fill(199,234,70); //rectangle color
  rect(left+420, vert+50, 200, 200);
  fill(255); //textcolor
  text("Lime Drone:", left+430, vert+70);
  text("Amount of lime left \nuntill refill: " + limeDrone.product, left+430, vert+90);

  text("Amount of fuel left: " + limeDrone.fuel, left+430, vert+140);
  text("Refilled: " + limeDrone.getVisitStation() + " time" + (limeDrone.getVisitStation() == 1 ? "" : "s"), left+430, vert+160);
  text("Used Lime: " + limeDrone.usedProduct + " kilogram" + (limeDrone.usedProduct == 1 ? "" : "s"), left+430, vert+180);
  text("Used Fuel: " + limeDrone.getUsedFuel() + " liters", left+430, vert+200);

  //for HumusDrone?
  fill(183,168,151); //rectangle color
  rect(left, vert+260, 200, 200);
  fill(255); //textcolor
  text("Hummus Drone:", left+10, vert+280);
  text("Refilled: " + " time", left+10, vert+300);
  text("Used Fuel: " + " liters", left+10, vert+320);
  
  
  
  
  
  //for fertDrone
  fill(#6B4423); //rectangle color
  rect(left+210, vert+260, 200, 200);
  fill(255); //textcolor
  text("Fertilizer Drone:", left+220, vert+280);
  text("Amount of fertilizer left \nuntill refill: " + fertDrone.product, left+220, vert+300);

  text("Amount of fuel left: " + fertDrone.fuel, left+220, vert+350);
  text("Refilled: " + fertDrone.getVisitStation() + " time" + (fertDrone.getVisitStation() == 1 ? "" : "s"), left+220, vert+370);
  text("Used Fertilizer: " + fertDrone.usedProduct + " kilogram" + (fertDrone.usedProduct == 1 ? "" : "s"), left+220, vert+390);
  text("Used Fuel: " + fertDrone.getUsedFuel() + " liters", left+220, vert+410);

  //for HarvesterDrone
  fill(50,50,50); //rectangle color
  rect(left+420, vert+260, 200, 200);
  fill(255); //textcolor
  text("Harvester:", left+430, vert+280);
  text("Amount of space left \nuntill return to Station: " + (harvesterDrone.productTank - harvesterDrone.product), left+430, vert+300);
  
  text("Amount of fuel left: " + harvesterDrone.fuel, left+430, vert+350);
  text("Emptied fruittank: " + (harvesterDrone.getVisitStation() - 1) + " time" + (harvesterDrone.getVisitStation() == 1 ? "" : "s"), left+430, vert+370);
  text("Harvested Fruits: " + harvesterDrone.totalFruitHarvest, left+430, vert+390);
  text("Used Fuel: " + harvesterDrone.getUsedFuel() + " liters", left+430, vert+410);

  fill(255);
  pop();
  
  }
}
