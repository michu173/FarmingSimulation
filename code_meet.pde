Plant plant;
Field field;
LimeSpreader limeDrone;
WaterSpreader waterDrone;
FertSpreader fertDrone;
SeederDrone seederDrone;
HarvesterDrone harvesterDrone;
int goMarkX = 200;
int goMarkY = 0;

int sectorSizeX, sectorSizeY;
static int harvested;

public  ArrayList<Plant> plants = new ArrayList();


void setup() {

  size(1000, 1000);
  colorMode(HSB);
  background(0, 0, 30);

  //creates specific field
  //sizeX, sizeY, sunlight, cropType, avgWater, avgHummus, avgLime, avgFert, index
  field = new Field(1000, 1000, 30.0, "test", 100.0, 100.0, 100.0, 100.0, 4256);
  field.create(); //initializes field based on avg values with noise based on index

  /*
   //plants random plants on the field without the seederdrone
  
   for(int i = 0; i<100; i++){
   plants.add(new Plant(field, random(0, field.getSizeX()), random(0, field.getSizeY())));
   }
   */

  //how big a sector is represented on screen so that every sector fits onto the screen
  sectorSizeX = width/field.getSectorsX();
  sectorSizeY = height/field.getSectorsY();

  //initial display
  drawField(0);
  
//initiating Drones with (field), workSpeed, movingSpeed, implementWidth, productTank, fuelTank, fuelConsumption
//initiates seederDrone
  seederDrone = new SeederDrone(5, 5, 10, 1500, 1500, 0);
  seederDrone.atStation();
  seederDrone.setStartingPos(0, 0);
  
  //initiates harvesterDrone
  harvesterDrone = new HarvesterDrone(5, 5, 10, 1500, 1500, 0);
  harvesterDrone.atStation();
  harvesterDrone.setStartingPos(0, 0);
  
  
//initiates fertilizer Drone
  fertDrone = new FertSpreader(field, 5, 5, 50, 5000, 5000, 0);
  fertDrone.setStartingPos(0,0);
  fertDrone.atStation();
  
//initiates Limespreader drone
  limeDrone = new LimeSpreader(field, 5, 5, 50, 5000, 5000, 0);
  limeDrone.atStation();
  limeDrone.setStartingPos(0,0);
  
//initiates Waterspreader drone
  waterDrone = new WaterSpreader(field, 5, 5, 50, 5000, 5000, 0); 
  waterDrone.setStartingPos(0,0);
  waterDrone.atStation();
}

void draw() {
  background(30, 30, 30);
  drawField(0);
  fieldDraw();
  for (int i= 0; i < plants.size(); i++)
  { 
    plants.get(i).update(); 
    plants.get(i).show();
  }

  /*println("Waterdrone: Im starting now!");
  waterDrone.fieldWork();
  waterDrone.show(); 
  if (waterDrone.taskComplete){
    println("Limedrone: Im starting now!");
    limeDrone.fieldWork();
    limeDrone.show();
  }
  if (limeDrone.taskComplete){
    println("Fertdrone: Im starting now!");
    fertDrone.fieldWork();
    fertDrone.show();
  }
  if (fertDrone.taskComplete){*/
    println("Seederdrone: Im starting now!");
    seederDrone.fieldWork();
    seederDrone.show(); 
  if (passed(seederDrone.getPosX(),seederDrone.getPosY())){
    println("Harvester is going to do his thang");
    harvesterDrone.fieldWork();
    harvesterDrone.show();
  }
}
//atm it has bugs... the 2nd drone disappears until the first drone passes the mark again..
public boolean passed(float posX, float posY){
  if (posX >= goMarkX && posY >= goMarkY){
    return true;
  }
  else
    return false;
}
