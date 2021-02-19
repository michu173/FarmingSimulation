private class HarvesterDrone extends TractorDrone{
  public HarvesterDrone(float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
    super(workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
    
}
 

  boolean needProduct(){
    if (product >= productTank - 10){
      return true;
    }
    else
      return false;
  }

//has to be finished latertakeFruits
//deletePlant at coordinates; -->isEmpty set to true}

  private fill(){
    if (posX == isEmpty && posY == isEmpty){
      //remove Fruits add to counter
      //remove plant
    }
  }
  
  public void atStation(){
  emptyProduct();
  tankFuel();
}
}
