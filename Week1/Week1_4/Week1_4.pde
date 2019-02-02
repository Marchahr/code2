int size = 100;
float x, y;
boolean toggle;
float theta;

void setup() {
  size(600, 600);
}

void draw() {
  background(255);

  theta+= .01;

  if (dist(mouseX, mouseY, x, y)<=size & mousePressed) {
    toggle=!toggle;
  }
  if (toggle) {
    x = width/2 *sin(theta) + width/2; 
    y = height/2;
  } else if (!toggle) {
    y = height/2*sin(theta) + height/2; 
    x = width/2;
  }


  println(toggle);
  ellipse(x, y, size, size);
}
