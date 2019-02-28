class Moon{
  //data
  PVector position;
  PVector velocity;
  PVector gravity;

  color b;
  
  float size = 10;
  
  //no paramiters in constructor
 Moon(){
   //sets x and y the position of of the PVector
  position = new PVector(random(0,800),50);
  // position = new PVector(10,10);

  velocity = new PVector(2,0);
  //makes it go faster as it gets lower
  gravity = new PVector (1, 0);
  
 }

 void gravity(){
  velocity.add(gravity);
 }
  
  
  void display(float c){
   noStroke();
    
   for (int i = 0; i < width; i+=10) {
      float distX = dist(i, 0, mouseX, 0);
      float r = map(distX, 0, width, 0, 255);
   fill(r,126,255);
    }
   ellipse(position.x, position.y, 120, 120);
  }
  
  
}
