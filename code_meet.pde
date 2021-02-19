Plant plant;
Field field;
LimeSpreader limeDrone;
WaterSpreader waterDrone;
FertSpreader fertDrone;
SeederDrone seederDrone;

int sectorSizeX, sectorSizeY;


ArrayList<Plant> plants = new ArrayList();
  

void setup(){
    

  size(1000, 1000);
  
  
  
  
  colorMode(HSB);
  background(0, 0, 30);
  
  //creates specific field
  //sizeX, sizeY, sunlight, cropType, avgWater, avgHummus, avgLime, avgFert, index
  field = new Field(1000, 1000, 30.0, "test", 50.0, 30.0, 60.0, 80.0, 4256);
  plant = new Plant(field, 400, 200);
  
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
  
  
  seederDrone = new SeederDrone(5, 5, 50, 3000, 3000, 0);
  fertDrone = new FertSpreader(field, 5, 5, 50, 3000, 3000, 0);
  waterDrone = new WaterSpreader(field, 5, 5, 50, 3000, 3000, 0); 
  limeDrone = new LimeSpreader(field, 5, 5, 50, 3000, 3000, 0);
  limeDrone.atStation();
  seederDrone.atStation();
  fertDrone.atStation();
  waterDrone.atStation();
  limeDrone.setStartingPos(0,0);
  seederDrone.setStartingPos(200,200);
  fertDrone.setStartingPos(150,150);
  waterDrone.setStartingPos(300,300);
}

void draw(){
  background(30, 30, 30);
  drawField(0);
  fieldDraw();
  for(int i= 0; i < plants.size(); i++)
  { 
    plants.get(i).update(); plants.get(i).show(); 
  }
    
    
  plant.update();
  
  
  plant.show();
  
  waterDrone.fieldWork(field);
  waterDrone.show();
  
  limeDrone.fieldWork(field);
  waterDrone.show();
  
  fertDrone.fieldWork(field);
  waterDrone.show();
  
  seederDrone.fieldWork();
  waterDrone.show();

}
