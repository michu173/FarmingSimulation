private abstract class SpreaderDrone extends TractorDrone{
    public SpreaderDrone(float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
    super(workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
    
}
  public void atStation(){
  tankProduct();
  tankFuel();
}
  private updateField(float posX, float posY){
  }
  
  protected void fieldWork(){
  needsStation();
  updateField(this.getPosX, this.getPosY);
  
  }

}
