
import java.util.Arrays;

class Sector{  
  
  public float water, hummus, lime, fert;
  
  
  public Sector(float water, float hummus, float lime, float fert)
  {
    this.water = water;
    this.hummus = hummus;
    this.lime = lime;
    this.fert = fert;    
  }
  
  public float getWater() {return water;}
  public float getHummus() {return hummus;}
  public float getLime() {return lime;}
  public float getFert() {return fert;}
  
  
  public void incWater(float quantity) {water += quantity;}
  public void incHummus(float quantity) {hummus += quantity;}
  public void incLime(float quantity) {lime += quantity;}
  public void incFert(float quantity) {fert += quantity;} 
}
