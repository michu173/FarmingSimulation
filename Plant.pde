import java.lang.Math.*;

class Plant{
    int fruit = 0;
    float stage = -6;
    float size;
    float posX = 100; 
    float posY = 200;
    int MAXFRUIT = 8;
    float clr = 5;
    Field field;
    
    
    Plant(Field field){
      this.field=field;
    }
    
    private void addFruit(){
     
      fruit = (int) (size*MAXFRUIT);
      
      
    }
    
    public void growth(){
     float add = 0.05;
     float waterDist=Math.abs(100-field.water);
     float humusDist=Math.abs(100-field.humus);
     float limeDist =Math.abs(100-field.lime);
     float fertDist = Math.abs(100-field.fert);
     
    // if(Math.abs(100-field.water(posx, posy))>max_Dist){
    // max_Dist=Math.abs(100-field.water(posx, posy));
    // }
     float variance;
     
     variance = ((100-waterDist)*(100-limeDist)*(100-humusDist)*(100-fertDist))/100000000;
     
     
     stage += variance*add; 
    
    }
    
    private void colorChange(){
      float limeDist =Math.abs(100-field.lime);
     float fertDist = Math.abs(100-field.fert);
         clr= 10-((limeDist+fertDist)/20 );
    }


     private void update(){
       
       size = 1/(1+exp(-stage));
       
      addFruit();
      growth();
      colorChange();
   println ("size: "+size+" fruits: "+fruit+" color: "+clr);
    }

    //float waterDist=Math.abs(100-field.water(posx, posy));
     //float humusDist=Math.abs(100-field.humus(posx, posy));
    // float lymeDist =Math.abs(100-field.lyme(posx, posy));
    // float fertDist = Math.abs(100-field.fert(posx, posy));
    
    public void show(){
      push();
      fill(255-(clr*25.5), 200+(clr*5.5), 0);
      circle(posx, posy, 15*size);
       pop();
    }
     

}
