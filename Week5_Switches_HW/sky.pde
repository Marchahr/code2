class Sky{
  //data
  PVector position;
  PVector velocity;
  PVector gravity;

  color b;
  
  float size = 10;
  
  //no paramiters in constructor
 Sky(){
   //sets x and y the position of of the PVector
  position = new PVector(random(0,800),50);
  // position = new PVector(10,10);

  velocity = new PVector(0,5);
  //makes it go faster as it gets lower
  gravity = new PVector (0, 1);
  
 }
 
 //move up and down
 void rain(){
   //add position to the velocity
 
 position.add(velocity);
 println(position.y, position.x);
 }
 
 void gravity(){
  velocity.add(gravity);
 }
  
  
  void display(){
   noStroke();
   b = color(map(position.x, 0, width, 90, 192),
   map(position.y, 0, height, 90, 192), 255);
   fill(b);
   //size=map(position.y, 0, height, 10, 20);
   ellipse(position.x, position.y, 10, 10);
     //println(position.x, position.y);
  }
  
  
}
