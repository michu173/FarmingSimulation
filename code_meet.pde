Plant plant;
Field field;
LimeSpreader drone;
int sectorSizeX, sectorSizeY;


ArrayList<Plant> plants = new ArrayList();
  

void setup(){
    

  size(1000, 1000);
  
  
  
  
  colorMode(HSB);
  background(0, 0, 30);
  
  //creates specific field
  //sizeX, sizeY, sunlight, cropType, avgWater, avgHummus, avgLime, avgFert, index
  field = new Field(1000, 1000, 30.0, "test", 100.0, 100.0, 50.0, 100.0, 4256);
  plant = new Plant(field, 400, 200);
  
  field.create(); //initializes field based on avg values with noise based on index
  
  
  for(int i = 0; i<100; i++){
    plants.add(new Plant(field, random(0, field.getSizeX()), random(0, field.getSizeY())));
  }
  
  
  //how big a sector is represented on screen so that every sector fits onto the screen
  sectorSizeX = width/field.getSectorsX();
  sectorSizeY = height/field.getSectorsY();
  
  //initial display
  drawField(0);
  
  
  
  
  
  drone = new LimeSpreader(field, 5, 5, 50, 1000, 1000, 0);
  drone.atStation();
  drone.setStartingPos(0,0);
  
}

void draw(){
  background(30, 30, 30);
  drawField(0);
  
  for(int i= 0; i < plants.size(); i++)
  { 
    plants.get(i).update(); plants.get(i).show(); 
  }
    
    
  plant.update();
  
  fieldDraw();
  plant.show();
  
  
  
  drone.fieldWork(field);
  drone.show();

}
