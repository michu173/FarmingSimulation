
public class LimeSpreader extends SpreaderDrone{
    public LimeSpreader(Field field, float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
    super(field, workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
    
}
  public void atStation(){
  tankProduct();
  tankFuel();
}
  
  void updateField(float posX, float posY){
    for (int i=0; i<=implementWidth; i++)
    {
      try{
        float deployPosX = posX - (implementWidth/2)+5 + i;
        
        int limestate = (int) field.Lime(deployPosX/10, posY/10);
        if (limestate <= 100){
        field.updateLime(deployPosX, posY, (100-limestate));
        }
      }
      catch(Exception e) {
        
      }


    }
  }
  
  public void fieldWork(Field field){
    
    if (!needsStation()){
      this.workField(field);
      updateField(this.getPosX(), this.getPosY());
    }   
  
  }

  boolean needProduct(){
    if (product <= 10){
      return true;
    }
    else
      return false;
  }
}
