private class SeederDrone extends TractorDrone{
  //seedType??

  public SeederDrone(float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
    super(workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);

}
//plants seeds onto the field
  public void plantIt(float posX, float posY){
/*    if (getPosY() < 1 || getPosY() >= field.getSizeY() -1)
    print("at the top or bottom");
    
    else if (0 <= getPosY() % 5 && getPosY() % 5 <= 5)
   {*/
    try{
      if (!(posY < 1) || !(posY >= field.getSizeY() -1)){
        //println("I passed the ifclause" + getPosX() + " " + getPosY());
        for (int i = 0; i <= (implementWidth); i++){
          //println("im planting seeds now");
          float plantX = posX - (implementWidth/2) + i;
          //println(plantX);
          plants.add(new Plant(field, plantX, getPosY()));
          product -= 1;  
         // Plant last = (plants.get(plants.size() -1)); 
         // println("PosX of the plant is " + last.getPosXOfPlant() + " and the PosY is " + last.getPosYOfPlant());
        }
      }
    }catch (Exception e){}
    
  }
//tests if more Product is needed
  boolean needProduct(){
    if (product <= 10){
      return true;
    }
    else
      return false;
  }
//as long as the drone doesnt have to refill something,
//it works the field and plants seeds
  public void fieldWork(){
    if (!needsStation()){
      workField(field);
      plantIt(this.getPosX(), this.getPosY());
    }
  }
}
