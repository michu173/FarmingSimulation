private abstract class WaterSpreader extends SpreaderDrone{
    public SpreaderDrone(float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
    super(workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
    
}
  public void atStation(){
  tankProduct();
  tankFuel();
}
  
  private void updateField(float positionX, float positionY){
    int limestate = Lime(posX/10, posY/10);
    if (limestate <= 100){
      updateLime (posX, posY, (100-waterstate));
    }
  }
  protected void fieldWork(){
  needsStation();
  updateField(this.getPosX(), this.getPosY());
  
  }

  boolean needProduct(){
    if (product <= 10){
      return true;
    }
    else
      return false;
  }
}
