public abstract class SpreaderDrone extends TractorDrone{
  private Field field;
  public SpreaderDrone(Field field, float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
  super(workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
    this.field = field;
}
  //for spreading the product on the field
  abstract void updateField(float posX, float posY);
  
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
      updateField(this.getPosX(), this.getPosY());
  
    if (this.atWork){
      workField(field);
      updateField(this.getPosX(), this.getPosY());
      //lastX = posX;
     // lastY = posY;
      }
      
  }
  //tests if more Product is needed
  boolean needProduct(){
  if (product <= 10){
    return true;
  }
  else
    return false;
  }
  

}
