float x,y;
float easing = 0.03;

color c;

int r = 0; 

void setup() {
  size(600, 600);
  background(210);

  rectMode(CENTER);
}

void draw() {
  

    //easing 
    float targetX = mouseX;
    float dx = targetX - x;
    x += dx * easing;

    float targetY = mouseY;
    float dy = targetY - y;
    y += dy * easing;

 c = color(map(x, 0, width, 0, 255), 
      map(y, 0, width, 100, 255), 175);
      
      
   

    pushMatrix();
    translate(x, y);
    x= x+5;
    
    //animation of abstract charactor
    rotate(radians(frameCount + y));
  
  
    
    //abstract charactor
    fill(c);
    stroke(0, 255);
    ellipse(-50, -10, 100, 100);
    ellipse(50, 10, 50, 50);
    line(-25, -5, 50, 10);
    popMatrix();
    
    
     pushMatrix();
    translate(x,y);
    r++; 
    rotate(r/5);
    //rotate(radians(frameCount + y));
    fill(c);
    rect(0,0, 50,50);
    popMatrix();
}
