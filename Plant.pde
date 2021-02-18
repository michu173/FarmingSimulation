import java.lang.Math.*;

class Plant{
    int fruit = 0;
    float stage = -6;
    float size;
    int posX = 30; 
    int posY = 20;
    int MAXFRUIT = 10;
    float clr = 5;
    Field field;
    
    
    Plant(Field field){
      this.field=field;
    }
    
    private void addFruit(){
      fruit = (int) (size*MAXFRUIT);
      
      
    }
    
    public void growth(){
      float add = 0.01;
      float waterDist=Math.abs(100-field.Water(posX, posY));
      float humusDist=Math.abs(100-field.Hummus(posX, posY));
      float limeDist =Math.abs(100-field.Lime(posX, posY));
      float fertDist = Math.abs(100-field.Fert(posX, posY));
   
    // if(Math.abs(100-field.water(posX, posY))>max_Dist){
    // max_Dist=Math.abs(100-field.water(posX, posY));
    // }
     float variance;
     
     variance = ((100-waterDist)*(100-limeDist)*(100-humusDist)*(100-fertDist))/100000000;
     
     
     stage += variance*add; 
    
    }
    
    private void colorChange(){
      float limeDist =Math.abs(100-field.Lime(posX,posY));
     float fertDist = Math.abs(100-field.Fert(posX,posY));
         clr= 10-((limeDist+fertDist)/20 );
    }


     private void update(){
       
       size = 1/(1+exp(-stage));
       
      addFruit();
      growth();
      colorChange();
   println ("size: "+size+" fruits: "+fruit+" color: "+clr);
    }

    //float waterDist=Math.abs(100-field.water(posX, posY));
     //float humusDist=Math.abs(100-field.humus(posX, posY));
    // float lymeDist =Math.abs(100-field.lyme(posX, posY));
    // float fertDist = Math.abs(100-field.fert(posX, posY));
    
    public void show(){
      push();
      colorMode(RGB);
      fill(255-(clr*25.5), 200+(clr*5.5), 0);
      circle(posX, posY, 15*size);
       pop();
    }
     

}
