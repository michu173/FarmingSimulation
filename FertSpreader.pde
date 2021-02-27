
public class FertSpreader extends SpreaderDrone{
    public FertSpreader(Field field, float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
    super(field, workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
    
}

  //spreads fert on the field
  void updateField(float posX, float posY){
    for (int i=0; i<=implementWidth; i++)
    {
      try{
        float deployPosX = posX - (implementWidth/2)+5 + i;
        
        int fertstate = (int) field.Fert(deployPosX, posY);
        if (fertstate <= 100){
        field.updateFert(deployPosX, posY, (100-fertstate));
        product -= (100-fertstate);
        usedProduct += 1;
        }
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
      fill(0,10,100);
      circle((this.posX*(1000/field.sizeX)), (this.posY*(1000/field.sizeY)), 16);
      fill(0);
      text("FERT", (this.posX*(1000/field.sizeX))-10, (this.posY*(1000/field.sizeY))+25);
    pop();
  }

}
