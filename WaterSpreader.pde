private class WaterSpreader extends SpreaderDrone{
    public WaterSpreader(Field field, float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
    super(field, workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
    
}
  public void atStation(){
  tankProduct();
  tankFuel();
}
  public void updateField(float posX, float posY){
    int waterstate = (int) field.Water(posX/10, posY/10);
    if (waterstate <= 100){
      field.updateWater(posX, posY, (100-waterstate));
    }
  }

  public void fieldWork(){
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
