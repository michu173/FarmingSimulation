public class SeederDrone extends TractorDrone{
  //seedType??
public int addedPlants = 0;
  public SeederDrone(float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
    super(workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
}

  public void plantIt(){
/*    if (getPosY() < 1 || getPosY() >= field.getSizeY() -1)
    print("at the top or bottom");
    
    else if (0 <= getPosY() % 5 && getPosY() % 5 <= 5)
   {*/
    try{
      
      if (!(posY < 1) || !(posY >= field.getSizeY() -1)){
        if(atWork){
          //overseeds:
          
          /*for (int i = 0; i <= (implementWidth); i++){
            float plantX = posX - (implementWidth/2) + i;
            plants.add(new Plant(field, plantX, getPosY()));
            product -= 1;  
           
          }*/
          
          float plantAtX = this.posX+random(-3,3);
          float plantAtY = this.posY+random(-3,3);
          if(random(0,1)<0.3){
            plants.add(new Plant(field, plantAtX, plantAtY));
            product -= 1;
            addedPlants++;
          }
        }
      }
    }catch (Exception e){}
    
  }

  boolean needProduct(){
    if (product <= 100){
      return true;
    }
    else
      return false;
  }

 /* public void fieldWork(){
    if (!needsStation()){
      workField(field);
      plantIt();
    }
  }*/
   public void fieldWork(){
      
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
    plantIt();
  
    if (this.atWork){
      workField(field);
      plantIt();
    //lastX = posX;
     // lastY = posY;
      }
      
  }
  

  
   void show(){
    push();
      colorMode(RGB);
      fill(0);
      line((this.posX*(1000/field.sizeX))-(this.implementWidth/2), (this.posY*(1000/field.sizeY)), (this.posX*(1000/field.sizeX))+(this.implementWidth/2), (this.posY*(1000/field.sizeY)));
      fill(100, 100, 0);
      circle((this.posX*(1000/field.sizeX)), (this.posY*(1000/field.sizeY)), 16);
      fill(0);
      text("SEEDER", (this.posX*(1000/field.sizeX))-10, (this.posY*(1000/field.sizeY))+25);
    pop();
  }
}
