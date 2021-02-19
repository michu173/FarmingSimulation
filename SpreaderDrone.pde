
public abstract class SpreaderDrone extends TractorDrone{
  private Field field;
  public SpreaderDrone(Field field, float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
  super(workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
    this.field = field;
}
  public void atStation(){
  tankProduct();
  tankFuel();
}
  abstract void updateField(float posX, float posY);
  
  public void fieldWork(Field field){
  
    if (!needsStation()){
      updateField(this.getPosX(), this.getPosY());
      lastX = posX;
      lastY = posY;
      }
    
    if(isBack == false)
    {
      goBack();  
    }
    else{ workField(field);}
  }
  
  boolean needProduct(){
  if (product <= 10){
    return true;
  }
  else
    return false;
  }
  
  public void atStation(){
    tankProduct();
    tankFuel();
  }

}
