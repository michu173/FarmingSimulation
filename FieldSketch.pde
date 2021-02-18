Field field;
int sectorSizeX, sectorSizeY;
void setup(){
  size(1000, 1000);
  colorMode(HSB);
  background(0, 0, 30);
  field = new Field(10, 10, 30.0, "test", 10.0, 10.0, 10.0, 10.0);
  field.create();
  
  
  //public Field(int sizeX, int sizeY, float sunlight, String cropType, float avgWater, float avgHummus, float avgLime, float avgFert)
  sectorSizeX = width/field.getSizeX();
  sectorSizeY = height/field.getSizeY();
  
}


void draw(){
  
  
  
  
  
  
  
  
  
 
  
  if(keyPressed) {
    if(key == 'w' || key == 'W'){
      drawField(1);
    }
      //otherButtons
  }   
      
}   
  
  
  
  



void drawField(int type){
  if(type == 1) //water
  {
    for(int x = 0; x < field.getSizeX()-1; x++)
    {
      for(int y = 0; y < field.getSizeY()-1; y++)
      {
        println("x: " + x);
        println("y: " + y);
        int col = (int)map(field.Water(x, y), 0.0, 200.0, 128.0, 170.0);
        fill(col, 255, 255);
        rect(x*sectorSizeX, y*sectorSizeY, sectorSizeX, sectorSizeY);    
      } 
    }    
  }
  
  else if(type == 2) //hummus
  {
    for(int x = 0; x < field.getSizeX(); x++)
    {
      for(int y = 0; y < field.getSizeY(); y++)
      {
        int col = (int)map(field.Hummus(x, y), 0.0, 200.0, 43.0, 0.0);
        fill(col, 255, 255);
        rect(x*sectorSizeX, y*sectorSizeY, sectorSizeX, sectorSizeY);    
      } 
    }    
  }
  
  else if(type == 3) //lime
  {
    for(int x = 0; x < field.getSizeX(); x++)
    {
      for(int y = 0; y < field.getSizeY(); y++)
      {
        int col = (int)map(field.Lime(x, y), 0.0, 200.0, 43.0, 85.0);
        fill(col, 255, 255);
        rect(x*sectorSizeX, y*sectorSizeY, sectorSizeX, sectorSizeY);    
      } 
    }    
  }
  
  else if(type == 4) //fertilizer
  {
    for(int x = 0; x < field.getSizeX(); x++)
    {
      for(int y = 0; y < field.getSizeY(); y++)
      {
        int col = (int)map(field.Fert(x, y), 0.0, 200.0, 0.0, 191.0);
        fill(col, 255, 255);
        rect(x*sectorSizeX, y*sectorSizeY, sectorSizeX, sectorSizeY);    
      } 
    }  
  }
  

  

  
  
}
