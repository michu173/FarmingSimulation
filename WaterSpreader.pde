
public class WaterSpreader extends SpreaderDrone{
    public WaterSpreader(Field field, float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
    super(field, workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
    
}

  //spreads Water on the field
  void updateField(float posX, float posY){
    for (int i=0; i<=implementWidth; i++)
    {
      try{
        float deployPosX = posX - (implementWidth/2)+5 + i;
        
        int waterstate = (int) field.Water(deployPosX, posY);
        if (waterstate <= 100){
        field.updateWater(deployPosX, posY, (100-waterstate));
        product -= (100-waterstate);
        }
      }
      catch(Exception e) {
        
      }
    }
  }
  
   void show(){
    push();
      colorMode(RGB);
      fill(0,200,0);
      rect(this.posX-8, this.posY-8, 16, 16);
      fill(0);
      line(this.posX-(this.implementWidth/2), this.posY, this.posX+(this.implementWidth/2), this.posY);
      fill(0,0,220);
      rect(this.posX-8, this.posY-8, 16, 16);
      fill(0);
      text("WATER", this.posX-10, this.posY+25);
    pop();
  }
}
