
public class WaterSpreader extends SpreaderDrone{  
    public WaterSpreader(Field field, float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
    super(field, workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
    
}

  //spreads Water on the field
  void updateField(float posX, float posY){
    for (int i=0; i<=implementWidth; i++)
    {
      try{
       // if(atWork){
          float deployPosX = posX - (implementWidth/2)+5 + i;
          
          int waterstate = (int) field.Water(deployPosX, posY);
          if (waterstate <= 100){
          field.updateWater(deployPosX, posY, (100-waterstate));
          product -= (100-waterstate);
          usedProduct += 1;
          }
        //}
      }
      catch(Exception e) {
        
      }
    }
  }
  

  
   void show(){
    push();
      colorMode(RGB);
      fill(0);
      line((this.posX*(1000/field.sizeX))-(this.implementWidth/2), (this.posY*(1000/field.sizeY)), (this.posX*(1000/field.sizeX))+(this.implementWidth/2), (this.posY*(1000/field.sizeY)));
      fill(0,0,220);
      circle((this.posX*(1000/field.sizeX)), (this.posY*(1000/field.sizeY)), 16);
      fill(0);
      text("WATER", (this.posX*(1000/field.sizeX))-10, (this.posY*(1000/field.sizeY))+25);
    pop();
  }
}
