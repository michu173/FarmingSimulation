public class HarvesterDrone extends TractorDrone{
  public HarvesterDrone(float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption ){
    super(workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
    
}

int radius = 20;
int totalFruitHarvest =0;
   
//needs to deliver product when producttank is filled to the brim (-10)
  boolean needProduct(){
    //println("do I need to empty my Tank?");
    if (product >= productTank - 10){
      //println("Yes I do");
      return true;
    }
    else{
      //println("No i dont");
      return false;
      }
  }
  
  
  
  
  void harvest(){
  for(int i =0; i<plants.size(); i++){ 
    if(Math.abs(plants.get(i).posX-this.posX)<radius && Math.abs(plants.get(i).posY-this.posY)<radius){
       this.product+=plants.get(i).fruit;
       this.totalFruitHarvest+=plants.get(i).fruit;
       plants.remove(i);
    }
  }
}
  
  //@override
  public boolean atStation(){
    //println("im here");
    //println("I'm at: " + posX + ", " + posY);
    if (posX <= 30 && posY <= 30)
    {
      ////println("what do i do now?");
        visitStation += 1;
        tankFuel();
        emptyProduct();
      return true;
    }
    return false;
  }

  
  public void fieldWork(){
      if (!needsStation()){
        harvest();
      }      
      if(this.atWork&&needsStation()){
         this.atWork=false;
        lastX = posX;
        lastY = posY;
      }
      if(!needsStation()&&!this.atWork){
        if(driveToWork()){
          this.atWork=true;
        }    
      }       
      if (this.atWork){
        workField(field);
      }
  }
  
 

  
   void show(){
    push();
      colorMode(RGB);
      fill(0);
      line((this.posX*(1000/field.sizeX))-(this.implementWidth/2), (this.posY*(1000/field.sizeY)), (this.posX*(1000/field.sizeX))+(this.implementWidth/2), (this.posY*(1000/field.sizeY)));
      fill(100, 100, 100);
      circle((this.posX*(1000/field.sizeX)), (this.posY*(1000/field.sizeY)), 16);
      fill(0);
      text("HARVEST", (this.posX*(1000/field.sizeX))-10, (this.posY*(1000/field.sizeY))+25);
    pop();
  }
 
}
