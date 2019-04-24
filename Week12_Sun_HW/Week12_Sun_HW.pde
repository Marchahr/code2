Star[] stars = new Star[800];
float speed;

PShape sun, planet1, planet2;
PImage sunText, planet1Text, planet2Text;

void setup(){
 fullScreen(P3D, 2); 
 noStroke();
 
 sunText = loadImage("sun.jpg");
 planet1Text = loadImage("earth.jpg");
 planet2Text = loadImage("jup.jpg");

fill(225);

sun = createShape(SPHERE, 250);
sun.setTexture(sunText);

planet1 = createShape(SPHERE, 150);
planet1.setTexture(planet1Text);

planet2 = createShape(SPHERE, 100);
planet2.setTexture(planet2Text);


 for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
}
}


void draw(){
  speed = map(mouseX, 0, width, 0, 15);

 background(0);
 
 pushMatrix();
   translate(width/2, height/2);
   for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
  popMatrix();

 
 pushMatrix();
 translate(width/2, height/2, -250);//translating the sun
 
 pushMatrix();
 rotateY(PI * frameCount / 500);
 shape(sun);
 popMatrix();
  
 
 rotateY(PI * frameCount / 300);
 translate(350,0,250);
 shape(planet2);
  
  translate(0, 0, 350);
  shape(planet1);
  
  popMatrix();
  
  //rotateY(PI * frameCount / 300);
  //translate(.75*width, .6 * height, 50);
  //shape(planet1);
}


//make rotation more realistic
//make starsfieled using a class of spheres and and arrays (also spotlights/pointlights_
