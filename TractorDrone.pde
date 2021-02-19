java.lang.Math

abstract class TractorDrone {
  int posX, posY, workSpeed, movingSpeed, implementWidth;
  float productTank, fuelTank, fuelConsumption;
  
  public TractorDrone(int posX, int posY, int workSpeed, int movingSpeed, int implementWidth, float productTank, float fuelTank, float fuelConsumption)
  {
   this.posX = posX;
   this.posY = posY;
   this.workSpeed = workSpeed;
   this.movingSpeed = movingSpeed; 
   this.implementWidth = implementWidth;
   this.productTank = productTank;
   this.fuelTank = fuelTank;
   this.fuelConsumption = fuelConsumption;
  }
  
  
  //GETTERS
  abstract int getPosX();
  abstract int getPosY();
  abstract int getImplementWidth();
  abstract float getProductTank();
  abstract float getFuelTank();
  
  public boolean needFuel()
  {
   int distanceToStation = posX + posY;
   float fuelToStation = distanceToStation * fuelConsumption;
   return fuelTank < fuelToStation - 10;
  }
  
  abstract boolean needProduct(); //if empty then true for seeds and spreader, if full then true for harvester
  
  
  
  
  //SETTERS
  public void setStartingPos(int x, int y)
  {
    this.posX = x;
    this.posY = y;
  }
  
  public void setFuel(float fuel)
  {
    this.fuelTank = fuel;
  }
  
 
  
  
  
  //DRIVING
  public void needsStation()
  {
    if (needProduct() || needFuel())
    {
      goToStation();
    }
  }
  
  abstract void goToStation();
  
  abstract void workField();
  //inplement width
  
  
  
}
