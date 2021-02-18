Plant plant;

void setup(){
plant = new Plant();
size(1080, 1920);
}

void draw(){
plant.update();
plant.show();
}
