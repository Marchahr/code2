float x;
float y;
float easing = 0.03;

color c;

void setup() {
  size(600, 600);
  background(210);

  rectMode(CENTER);
}

void draw() {

  if (mousePressed) {
    //x= mouseX -10; 
    //y=  mouseY - 100;
 
 float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;


  pushMatrix();
  translate(x, y);
  //x= x+5;
  rotate(radians(frameCount + y));
  c = color(map(x, 0, width, 0, 255), 
    map(y, 0, width, 100, 255), 175);
  fill(c);
  stroke(0, 255);
  //ellipse(50, 10, 50, 50);
  line(-25, -5, 50, 10);
  popMatrix();

  }


  //y+=5;

  //if (x > width) {
  //  x =0;
  //  y = y+80;


  //  //x = -100;
  //  //y += 70;
  //}
}
