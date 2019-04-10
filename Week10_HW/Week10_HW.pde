PImage img;

void setup() {
size(494, 305);
background(255);

img = loadImage("pooloutline.png"); 

}
void draw() {
  
// Get a gaussian random number w/ mean of 0 and standard deviation of 1.0
float val = randomGaussian();

//create standard deviation
float sd = 100;

// Define a mean value (middle of the screen along the x-axis)
float mean = width/2;

// Scale the gaussian random number by standard deviation and mean
float x = ( val * sd ) + mean;  

noStroke();
fill(#0c869b, 20);
ellipse(x, random (0,500), 32, 32);  
fill(#62c8cd, 30);
ellipse(x, random (0,500), 32, 32);
fill(#57b2a3, 40);
ellipse(x, random (0,500), 32, 32);

image(img, 0, 0);
}
