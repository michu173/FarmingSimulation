Plant plant;
Field field;
int sectorSizeX, sectorSizeY;


 ArrayList<Plant> plants = new ArrayList();
  

void setup(){
    

size(1000, 1000);
  
  
  
  
   colorMode(HSB);
  background(0, 0, 30);
  
  //creates specific field
  //sizeX, sizeY, sunlight, cropType, avgWater, avgHummus, avgLime, avgFert, index
  field = new Field(500, 500, 30.0, "test", 100.0, 90.0, 120.0, 100.0, 4256);
  plant = new Plant(field, 400, 200);
  field.create(); //initializes field based on avg values with noise based on index
  
  
  for(int i = 0; i<100; i++){
    plants.add(new Plant(field, (int) random(0, 500), (int) random(0, 500)));
  }
  
  
  //how big a sector is represented on screen so that every sector fits onto the screen
  sectorSizeX = width/field.getSectorsX();
  sectorSizeY = height/field.getSectorsY();
  
  //initial display
  drawField(1);
}

void draw(){
 

for(int i= 0; i < plants.size(); i++){ plants.get(i).update(); plants.get(i).show(); }
  
  
plant.update();

fieldDraw();
plant.show();

}
