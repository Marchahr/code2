class Rain {
  //data
  PVector position;
  PVector velocity;
  PVector gravity;

  color b;

  float size = 20;

  //no peramiters in constructor 
  Rain() {
    //sets x and y postion pvector to our mouse position
    position = new PVector(random(100,700), random(100,700));

    velocity = new PVector(random(-5, 5), random(1, 5));

    gravity = new PVector(0, .1);
  }

  //move up and down
  void fall() {
    //add position to velocity
    position.add(velocity);
  }

  void gravity() {
    velocity.add(gravity);
  }

  //doesn't go all the way up bc of gravity
  void bounce() {
    velocity.y = -velocity.y;
  }

  void sideBounce() {
    velocity.x = -velocity.x;
  }

  void display() {
       noStroke();
   b = color(map(position.x, 0, width, 90, 192),
   map(position.y, 0, height, 90, 192), 255);
   fill(b);
   size=map(position.y, 0, height, 10, 20);
   ellipse(position.x, position.y, 10, 10);
     //println(position.x, position.y);
  }
}
