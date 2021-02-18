
import java.util.Arrays;


class Field {
  
  private int sizeX, sizeY;
  private float sunlight, avgWater, avgHummus, avgLime, avgFert;
  private String cropType;
  
  private Sector[][] Field;
  
  public Field(int sizeX, int sizeY, float sunlight, String cropType, float avgWater, float avgHummus, float avgLime, float avgFert)
  {
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.sunlight = sunlight;
    this.avgWater = avgWater;
    this.cropType = cropType;
    this.avgHummus = avgHummus;
    this.avgLime = avgLime;
    this.avgFert = avgFert;
    
    Field = new Sector[sizeX/10][sizeY/10];
    
  }
  
  public void create()
  {
    for(int x = 0; x < Field.length ; x++)
    {
      for(int y = 0; y < Field[x].length; y++)
      {
        Field[x][y] = new Sector(avgWater, avgHummus, avgLime, avgFert);
      }
    }
       
  }
  
  
  //GLOBAL GETTERS
  public int getSizeX(){return sizeX;}
  public int getSizeY(){return sizeY;}
  
  
  //GETTERS FOR FIELD SECTORS
  public float Water(int x, int y)
  {
    return Field[x][y].getWater();
  }
  
  public float Hummus(int x, int y)
  {
    return Field[x][y].getHummus();
  }
  
  public float Lime(int x, int y)
  {
    return Field[x][y].getLime();
  }
  
  public float Fert(int x, int y)
  {
    return Field[x][y].getFert();
  }
  
  
  
  
  //SETTERS FOR FIELD SECTORS
  public void updateWater(int x, int y, float quantity)
  {
    Field[x][y].incWater(quantity);
  }
  
  public void updateHummus(int x, int y, float quantity)
  {
    Field[x][y].incHummus(quantity);
  }
  
  public void updateLime(int x, int y, float quantity)
  {
    Field[x][y].incLime(quantity);
  }
  
  public void updateFert(int x, int y, float quantity)
  {
    Field[x][y].incFert(quantity);
  }
}
