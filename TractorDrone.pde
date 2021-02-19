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
  
  
  public boolean arrivedAtStation(){
    if (0 <= posX && posX <= 1 && 0 <= posY && posY <= 1)
    {
      atStation();
      return true;
    }
    return false;
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
  
  
  
  
  public boolean driveTo(float xPoint, float yPoint, float speed){
    
   while(xPoint-this.posX>1||xPoint-this.posX<-1||yPoint-this.posY>1||yPoint-this.posY<-1){
      if(xPoint>this.posX){
        this.posX+=speed;
      }else if(xPoint<this.posX){
        this.posX-=speed;
      }
      
      if(yPoint>this.posY){
        this.posY+=speed;
      }else if(yPoint<this.posY){
        this.posY-=speed;
      }
      
      return false;
    }
    
    return true;
  }


    public void workField(Field field){
    int[][] waypoints = new int[(field.sizeX/(this.implementWidth*2))*4][2];
    for(int i = 0; i<waypoints.length/4; i++){
      for(int j = 0; j<4; j++){
        
        if(j==2||j==3){
           waypoints[i*4+j][1]=this.implementWidth/2;
        }else{
           waypoints[i*4+j][1]=field.sizeY-this.implementWidth/2;
        }
        
        if(j==0){
          waypoints[i*4+j][0]=i*2*this.implementWidth;
        }else if(j==1||j==2){
          waypoints[i*4+j][0]=i*2*this.implementWidth+this.implementWidth;
        }else if(j==3){
          waypoints[i*4+j][0]=i*2*this.implementWidth+(2*this.implementWidth);
        }
      }
    }
    
     for(int i = 0; i<waypoints.length; i++){
        driveTo(waypoints[i][0],waypoints[i][1], this.workSpeed);
     }
  }

  
  public void goToStation(){
    driveTo(this.posX, this.implementWidth/2, this.movingSpeed);
    driveTo(0,0, this.movingSpeed);
  }
  
}
