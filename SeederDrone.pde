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
    if (getPosY() < 1 || getPosY() > field.getSizeY() -1)
    print("lets plant it");
    
    else if (0 <= posY % 5 && posY % 5 <= 1)
   {
    for (int i = 0; i <= implementWidth; i++){
      float plantX = posX - (implementWidth / 2) + i;
      product -= 1;
      plants.add(new Plant(field, plantX, posY));
    }
    
  }
}
  boolean needProduct(){
    if (product <= 10){
      return true;
    }
    else
      return false;
  }
  
  
  public void fieldWork(){
    needsStation();
    plant();
  }
}
