private class SamplerDrone extends TractorDrone{
  public SamplerDrone(float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
    super(workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
    
}
  public void atStation(){
  tankFuel();
}
}
