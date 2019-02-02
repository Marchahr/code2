PVector position;
float theta = 0;

int orbitSize = 100;

void setup(){
 background(0);
 size(600,600);
 
 position = new PVector(width/2, height/2);
}

void draw(){
  background(0);
  
  theta +=.1;
  
  position.x=width/2 + cos(theta)*orbitSize;
  position.y ++;

  
  //wave movement
  //position.y;
  
  if(position.y == height){
    position.y = 0;
}
  
 ellipse(position.x, 300, 50, 50);
  
  
}
