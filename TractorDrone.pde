import java.lang.Math;

abstract class TractorDrone {

  int implementWidth, productTank, fuelTank ;
  float fuelConsumption, posX, posY, workSpeed, movingSpeed, product, fuel;
  
  public TractorDrone(float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption)
  {
   this.workSpeed = workSpeed;
   this.movingSpeed = movingSpeed; 
   this.implementWidth = implementWidth;
   this.productTank = productTank;
   this.fuelTank = fuelTank;
   this.fuelConsumption = fuelConsumption;
   product = 0;
   fuel = fuelTank;
  }
  
  
  //GETTERS
  public float getPosX(){return posX;}
  public float getPosY(){return posY;}
  public int getImplementWidth(){return implementWidth;}
  public float getProductTank(){return productTank;}
  public float getFuelTank(){return fuelTank;}
  
  public boolean needFuel()
  {
   float distanceToStation = posX + posY;
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
  
  protected void tankFuel()
  {
    this.fuel = fuelTank;
  }
  
  protected void tankProduct()
  {
    this.product = productTank;
  }
  
  protected void emptyProduct()
  {
    this.product = 0;
  }
  
  
  abstract void atStation();
  
  
  
  //DRIVING
  public void needsStation()
  {
    if (needProduct() || needFuel())
    {
      goToStation();
    }
  }
  
  
  //TODO impement
  public void goToStation(){;}
  
  //TODO impement
  public void workField(){;}
  
  
  
}
