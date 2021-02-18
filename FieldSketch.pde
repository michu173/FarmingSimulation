
Field field;
int sectorSizeX, sectorSizeY;



void setup(){
  //for display
  size(1000, 1000);
  colorMode(HSB);
  background(0, 0, 30);
  
  //creates specific field
  //sizeX, sizeY, sunlight, cropType, avgWater, avgHummus, avgLime, avgFert, index
  field = new Field(1000, 1000, 30.0, "test", 200.0, 100.0, 50.0, 10.0, 4356);
  field.create(); //initializes field based on avg values with noise based on index
  
  //how big a sector is represented on screen so that every sector fits onto the screen
  sectorSizeX = width/field.getSectorsX();
  sectorSizeY = height/field.getSectorsY();
  
  //initial display
  drawField(0);
}


void draw(){
  
  
 
  //show maps for specific soil value with key presses
  //space for start
  //w for water
  //h for hummus
  //l for lime
  //f for fertilizer
  if(keyPressed) {
    if(key == ' ' || key == ' '){ //start key
      drawField(0);
    }
    
    else if(key == 'w' || key == 'W'){ //water key
      drawField(1);
    }
    
    else if(key == 'h' || key == 'H'){ //hummus key
      drawField(2);
    }
    
    else if(key == 'l' || key == 'L'){ //lime key
      drawField(3);
    }
    
    else if(key == 'f' || key == 'F'){ //fertilizer key
      drawField(4);
    }

      //insert other Buttons here
  }   
      
}   
  
  
  
  


//draws fieldmap based on soil status
//blue: too much
//green: optimal
//yellow: too meager

void drawField(int type){
  if(type == 0) //start
  {
    for(int x = 0; x < field.getSectorsX(); x++)
    {
      for(int y = 0; y < field.getSectorsY(); y++)
      {
        //println("type: " + type); //TODO for debugging purposes only
        //println("x: " + x); //TODO for debugging purposes only
        //println("y: " + y); //TODO for debugging purposes only
        fill(85, 255, 128);
        rect(x*sectorSizeX, y*sectorSizeY, sectorSizeX, sectorSizeY);    
      } 
    }    
  }  
  
  if(type == 1) //water
  {
    for(int x = 0; x < field.getSectorsX(); x++)
    {
      for(int y = 0; y < field.getSectorsY(); y++)
      {
        int col = (int)map(field.Water(x, y), 0.0, 200.0, 0.0, 170.0);
        fill(col, 255, 255);
        rect(x*sectorSizeX, y*sectorSizeY, sectorSizeX, sectorSizeY);    
      } 
    }    
  }
  
  else if(type == 2) //hummus
  {
    for(int x = 0; x < field.getSectorsX(); x++)
    {
      for(int y = 0; y < field.getSectorsY(); y++)
      {
        int col = (int)map(field.Hummus(x, y), 0.0, 200.0, 0.0, 170.0);
        fill(col, 255, 255);
        rect(x*sectorSizeX, y*sectorSizeY, sectorSizeX, sectorSizeY);    
      } 
    }    
  }
  
  else if(type == 3) //lime
  {
    for(int x = 0; x < field.getSectorsX(); x++)
    {
      for(int y = 0; y < field.getSectorsY(); y++)
      {
        int col = (int)map(field.Lime(x, y), 0.0, 200.0, 0.0, 170.0);
        fill(col, 255, 255);
        rect(x*sectorSizeX, y*sectorSizeY, sectorSizeX, sectorSizeY);    
      } 
    }    
  }
  
  else if(type == 4) //fertilizer
  {
    for(int x = 0; x < field.getSectorsX(); x++)
    {
      for(int y = 0; y < field.getSectorsY(); y++)
      {
        int col = (int)map(field.Fert(x, y), 0.0, 200.0, 0.0, 170.0);
        fill(col, 255, 255);
        rect(x*sectorSizeX, y*sectorSizeY, sectorSizeX, sectorSizeY);    
      } 
    }  
  }
  

  

  
  
}
