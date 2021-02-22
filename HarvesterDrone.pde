private class HarvesterDrone extends TractorDrone{
  public HarvesterDrone(float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
    super(workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
    
}
   
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

  private void fillUp(){
    try{
      //top and down
      if (!(posY < 1) || !(posY >= field.getSizeY() -1)){
        //to go through the whole list for each plant
       // //println("im starting to go over the lsit");
        for (int i= 0; i <= plants.size(); i++){
           ////println("im going over the whole list");
           for (int j = 0; j <= (implementWidth); j++){
             ////println("im looking through my width"); //no problems till here
             float plantX = posX - (implementWidth/2) + j;
             if(plants.get(i).getPosXOfPlant() == plantX && plants.get(i).getPosYOfPlant() == getPosY()){
               //println("im in the last if clause");
               Plant fruitsAtPlant = plants.get(i);
               int fruits = fruitsAtPlant.fruit;
               product += fruits;
               //println("i got " + fruits + " fruits from the plant at " + plantX + " " + getPosY() + " and " + product + "alltogether"); 
               plants.remove(i);
             } 
           }
         }
      }
    }
        
        /*for (int i = 0; i <= (implementWidth); i++){
   
                 
        float plantX = posX - (implementWidth/2) + i;
          if(plantX == Plant.getPosXOfPlant() && getPosY() == Plant.getPosYOfPlant() ){
          posOfPlant = plants.get(field, plantX, getPosY);
          //fruits of the plant at the given coordinates
          product += Plant.fruit;  
          //remove the plant from the arrayList
          plants.remove(Plant(field, plantX, getPosY()));  */   
    catch (Exception e){
    }
  }
  //@override
  public boolean atStation(){
    //println("im here");
    //println("I'm at: " + posX + ", " + posY);
    if (posX <= 30 && posY <= 30)
    {
      ////println("what do i do now?");
        tankProduct();
        tankFuel();
        emptyProduct(product);
      return true;
    }
    return false;
  }

  
  public void fieldWork(){
    if (!needsStation()){
      workField(field);
      fillUp();
    }
  }
  
 
 
  void show(){
    push();
      colorMode(RGB);
      fill(0,200,0);
      rect(this.posX-8, this.posY-8, 16, 16);
      fill(0);
      line(this.posX-(this.implementWidth/2), this.posY, this.posX+(this.implementWidth/2), this.posY);
      fill(100,100,100);
      rect(this.posX-8, this.posY-8, 16, 16);
      fill(0);
      text("HARVEST", this.posX-10, this.posY+25);
      noFill();  
      circle(this.posX, this.posY, 40);
    pop();
  }
 
}
