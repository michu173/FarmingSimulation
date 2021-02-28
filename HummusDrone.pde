class HummusDrone extends SpreaderDrone{

    public HummusDrone(Field field, float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
    super(field, workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
    
}

  //spreads Hummus on the field
  void updateField(float posX, float posY){
    for (int i=0; i<=implementWidth; i++)
    {
      try{
        
        float deployPosX = posX - (implementWidth/2)+5 + i;
        
        int hummusstate = (int) field.Hummus(deployPosX, posY);
        if (hummusstate <= 100){
          int usingProduct = 100-hummusstate;
          field.updateHummus(deployPosX, posY, usingProduct);
          product -= usingProduct;
          usedProduct += usingProduct;
        }
      }
      catch(Exception e) { }
    }
  }
  

  
  
   void show(){
    push();
      colorMode(RGB);
      fill(0);
      line((this.posX*(1000/field.sizeX))-(this.implementWidth/2), (this.posY*(1000/field.sizeY)), (this.posX*(1000/field.sizeX))+(this.implementWidth/2), (this.posY*(1000/field.sizeY)));
      fill(183, 168, 151);
      circle((this.posX*(1000/field.sizeX)), (this.posY*(1000/field.sizeY)), 16);
      fill(0);
      text("HUMMUS", (this.posX*(1000/field.sizeX))-10, (this.posY*(1000/field.sizeY))+25);
    pop();
  }
}
