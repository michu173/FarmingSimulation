Plant plant;
Field field;
int sectorSizeX, sectorSizeY;





void setup(){


size(1000, 1000);
  
  
  
   colorMode(HSB);
  background(0, 0, 30);
  
  //creates specific field
  //sizeX, sizeY, sunlight, cropType, avgWater, avgHummus, avgLime, avgFert, index
  field = new Field(1000, 1000, 30.0, "test", 100.0, 90.0, 120.0, 100.0, 4256);
  plant = new Plant(field);
  field.create(); //initializes field based on avg values with noise based on index
  
  //how big a sector is represented on screen so that every sector fits onto the screen
  sectorSizeX = width/field.getSectorsX();
  sectorSizeY = height/field.getSectorsY();
  
  //initial display
  drawField(1);
}

void draw(){
  
  
  
plant.update();

fieldDraw();
plant.show();

}
