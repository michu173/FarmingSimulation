Plant plant;
Field field;
LimeSpreader limeDrone;
WaterSpreader waterDrone;
FertSpreader fertDrone;
SeederDrone seederDrone;

int sectorSizeX, sectorSizeY;

public ArrayList<Plant> plants = new ArrayList();


void setup() {


  size(1000, 1000);




  colorMode(HSB);
  background(0, 0, 30);

  //creates specific field
  //sizeX, sizeY, sunlight, cropType, avgWater, avgHummus, avgLime, avgFert, index
  field = new Field(1000, 1000, 30.0, "test", 50.0, 100.0, 50.0, 100.0, 4256);
  //plant = new Plant(field, 0, 0);

  field.create(); //initializes field based on avg values with noise based on index

  /* 
   for(int i = 0; i<100; i++){
   plants.add(new Plant(field, random(0, field.getSizeX()), random(0, field.getSizeY())));
   }
   */

  //how big a sector is represented on screen so that every sector fits onto the screen
  sectorSizeX = width/field.getSectorsX();
  sectorSizeY = height/field.getSectorsY();

  //initial display
  drawField(0);

//initiates seederDrone
  seederDrone = new SeederDrone(5, 5, 10, 100, 3000, 0);
  seederDrone.atStation();
  seederDrone.setStartingPos(25, 25);
  
//initiates fertilizer Drone
  fertDrone = new FertSpreader(field, 5, 5, 50, 3000, 3000, 0);
  fertDrone.setStartingPos(150,150);
  fertDrone.atStation();
  
//initiates Limespreader drone
  limeDrone = new LimeSpreader(field, 5, 5, 50, 3000, 3000, 0);
  limeDrone.atStation();
  limeDrone.setStartingPos(0,0);
  
//initiates Waterspreader drone
  waterDrone = new WaterSpreader(field, 5, 5, 50, 3000, 3000, 0); 
  waterDrone.setStartingPos(300,300);
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

  /*  waterDrone.fieldWork();
   waterDrone.show();
   
   limeDrone.fieldWork();
   limeDrone.show();
   
   fertDrone.fieldWork();
   fertDrone.show();
   */
  seederDrone.fieldWork();
  seederDrone.show();
}
