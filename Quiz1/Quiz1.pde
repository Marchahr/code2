PVector position;
 float xSpeed;
 float x;
 //float circ_y, circ_x;
 //float circ_speed = 2;
 int size = 500;
 
void setup(){
  background (0);
  size(500, 500);
  
  //circ_x = width*.5;
  //circ_y = height*.5;
  
  position = new PVector (0,width/2);
    xSpeed = random(1,5);
}

void draw(){
  background(0);
  position.x++;
  ellipse(position.x, position.y, 50, 50);

  if(position.x>=400){
   //xSpeed = -xSpeed;
   position.x = 100;
  }
      
  //    x = x + xSpeed;
  //if (x >= width-(size/2) || x <= size/2){
  //  xSpeed = -xSpeed;
  //}
}
