private class SeederDrone extends TractorDrone{
  //seedType??
  
  public SeederDrone(float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
    super(workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
    
}
  public void atStation(){
  tankProduct();
  tankFuel();
}

  public void plant(){
    plants.add(new Plant(field, getPosX(), getPosY()));

  }
}
