//https://processing.org/examples/button.html
//35 points: Create a circle button. When clicked, it changes the color behind it
//35 points: Create a square button. When clicked, it changes the color behind it
//20 points: Create a rollover state for each button (repeatable once)
//25 points: transition the color smoothly for the background
//10 points: Have text show up below the buttons
//10 points: Change the text when you click a button
//20 points: Have 4 distinct quotes show up.

int rectX, rectY;    
int circleX, circleY;  
int rectSize = 75;     
int circleSize = 80; 
color rectColor, circleColor, baseColor, bgColorL, bgColorR;
color rectHighlight, circleHighlight;
color currentColor;
boolean rectOver = false;
boolean circleOver = false;

void setup() {
  size(500, 250);
  rectColor = color(0);
  rectHighlight = color(51);
  circleColor = color(255);
  circleHighlight = color(204);
  baseColor = color(102);
  currentColor = baseColor;
  circleX = width/2+circleSize/2+90;
  circleY = height/2;
  rectX = width/2-rectSize-90;
  rectY = height/2-rectSize/2;
  ellipseMode(CENTER);
}

void draw() {
  update(mouseX, mouseY);
  background(currentColor);
  rect (0,0,250,250);
  
  if (rectOver) {
    fill(rectHighlight);
  } else {
    fill(rectColor);
  }
  stroke(255);
  rect(rectX, rectY, rectSize, rectSize);
  
  if (circleOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  stroke(0);
  ellipse(circleX, circleY, circleSize, circleSize);
}

void update(int x, int y) {
  if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    rectOver = false;
  } else if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    circleOver = false;
  } else {
    circleOver = rectOver = false;
  }
}

void mousePressed() {
  if (circleOver) {
    currentColor = circleColor;
    //bgColorR =
  }
  if (rectOver) {
    currentColor = rectColor;
    //bgColorL = 
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
