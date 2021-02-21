private class SeederDrone extends TractorDrone{
  //seedType??

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
      }
      }
    }catch (Exception e){}
    
  }

  boolean needProduct(){
    if (product <= 10){
      return true;
    }
    else
      return false;
  }

  public void fieldWork(){
    if (!needsStation()){
      workField(field);
      plantIt();
    }
  }
}
