Plant plant;
Field field;
HummusDrone hummusDrone1;
HummusDrone hummusDrone2;
LimeSpreader limeDrone;
WaterSpreader waterDrone;
FertSpreader fertDrone;
SeederDrone seederDrone;
HarvesterDrone harvesterDrone;
Interface interf;
int goMarkX = 200;
int goMarkY = 0;

int fieldw=1000;
int fieldh=1000;

int sectorSizeX, sectorSizeY;

public  ArrayList<Plant> plants = new ArrayList();
ArrayList<TractorDrone[]> drones = new ArrayList();
   
   int harvestBegin = 12500;
   
void setup() {
  
  interf = new Interface();

  size(1920, 1080);
  colorMode(HSB);
  background(0, 0, 30);

  //creates specific field
  //sizeX, sizeY, sunlight, cropType, avgWater, avgHummus, avgLime, avgFert, index
  field = new Field(500, 500, 30.0, "test", 50.0, 50.0, 70.0, 60.0, 4256);
  field.create(); //initializes field based on avg values with noise based on index

  /*
   //plants random plants on the field without the seederdrone
  
   for(int i = 0; i<100; i++){
   plants.add(new Plant(field, random(0, field.getSizeX()), random(0, field.getSizeY())));
   }
   */

  //how big a sector is represented on screen so that every sector fits onto the screen
  sectorSizeX = fieldw/field.getSectorsX();
  sectorSizeY = fieldh/field.getSectorsY();

  //initial display
  drawField(0);
  
//initiating Drones with (field), workSpeed, movingSpeed, implementWidth, productTank, fuelTank, fuelConsumption

//innitiates hummusDrone
hummusDrone1 = new HummusDrone(field, 1, 10, 50, 2000, 5000, 1);
hummusDrone1.atStation();
hummusDrone1.setStartingPos(0, 0);

hummusDrone2 = new HummusDrone(field, 1, 10, 50, 2000, 5000, 1);
hummusDrone2.atStation();
hummusDrone2.setStartingPos(10, 0);

//initiates seederDrone
  seederDrone = new SeederDrone(5, 5, 10, 1500, 10000, 1);
  seederDrone.atStation();
  seederDrone.setStartingPos(0, 0);
  
  //initiates harvesterDrone
  harvesterDrone = new HarvesterDrone(5, 5, 10, 1500, 5000, 1);
  harvesterDrone.atStation();
  harvesterDrone.setStartingPos(0, 0);
  
  
//initiates fertilizer Drone
  fertDrone = new FertSpreader(field, 3, 3, 50, 8000, 5000, 1);
  fertDrone.setStartingPos(0,0);
  fertDrone.atStation();
  
//initiates Limespreader drone
  limeDrone = new LimeSpreader(field, 5, 5, 50, 8000, 5000, 1);
  limeDrone.atStation();
  limeDrone.setStartingPos(0,0);
  
//initiates Waterspreader drone
  waterDrone = new WaterSpreader(field, 5, 5, 50, 8000, 5000, 1); 
  waterDrone.setStartingPos(0,0);
  waterDrone.atStation();
}

void draw() {
  background(30, 30, 30);
  
  push();
  noStroke();
  drawField(0);

  
  fieldDraw();
  for (int i= 0; i < plants.size(); i++)
  { 
    plants.get(i).update(); 
    plants.get(i).show();
  }
  pop();

 //println("Waterdrone: Im starting now!");
    waterDrone.fieldWork();
    waterDrone.show(); 
  
    limeDrone.fieldWork();
    limeDrone.show();
    
    hummusDrone1.fieldWork();
    hummusDrone1.show();
  
    hummusDrone2.fieldWork();
    hummusDrone2.show();
  

    //println("Fertdrone: Im starting now!");
    fertDrone.fieldWork();
    fertDrone.show();
  
if (interf.getFieldHealth()>70){
    //println("Seederdrone: Im starting now!");
    if(!sseederDrone.taskComplete){
    seederDrone.fieldWork();
    }
    seederDrone.show(); 
}else{
  harvestBegin=frameCount+5000;
}

if(frameCount>harvestBegin && interf.getFieldHealth()>70){
    harvesterDrone.fieldWork();
    harvesterDrone.show();
}
    
    interf.plantIF(plants);
    interf.fieldIF(field);
    interf.droneIF(drones);
  
}
//atm it has bugs... the 2nd drone disappears until the first drone passes the mark again..
//edit: put the mark at o for the y axis, works now
public boolean passed(float posX, float posY){
  if (posX >= goMarkX && posY >= goMarkY){
    return true;
  }
  else
    return false;
}
