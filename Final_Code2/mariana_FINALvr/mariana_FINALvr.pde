import processing.pdf.*;

boolean saveOneFrame = false; 

int gridW = 10;
int gridH = 10;

PImage img;
//Brushstroke brushstroke [][];
color c [][]; 
int rows, cols;
int size = 15; 
Brushstroke brushstroke[][];




void setup() {
  size(785, 785);
  img = loadImage("doggo2.jpg");
  background(255);
  frameRate(500); 
  beginRecord(PDF, "Line.pdf"); 
  
  cols = width/size; 
  rows = height/size; 
  
  brushstroke = new Brushstroke[cols][rows]; 
  c = new color[cols][rows]; 
 
 for(int i = 0; i<cols; i++){
    for(int j = 0; j<rows; j++){
      c[i][j] = img.get(i*size, j*size); 
      brushstroke[i][j] = new Brushstroke(i*size, j*size);
  }
 }
}


float t; 
void draw() {  
  //int x = mouseX;
  //int y = mouseY;
  //color c = img.get(gridW, gridH);
  
  //noise makes the random controled to what pixals have already been drawn
  float n = noise(t); 
  
  //floor = rounds down
  int rI = floor(map(n, 0, 1, 0, cols)); 
 
   t+= 0.01; 
 //int rI = floor(random(0,cols));
 int rJ = floor(random(0,rows)); 
 
 brushstroke[rI][rJ].display(c[rI][rJ]); 
 for(int i = 0; i<cols; i++){
    for(int j = 0; j<rows; j++){
      //brushstroke[i][j] = map(j * gridW + i, 0, gridW * gridH, 0, 255); 

      
      //float b = brightness(c);
       
      //float v; 
      //if(b>150){
      //  v = 255; 
      //}else{
      //   v = 0; 
      //}
       
 
       //modulo conditional here 
       //every 60 frames, draw a new pixel 
       //add new pixel to the array list at 
    }
  }
}



void keyPressed(){
  if(key==CODED){
    if(keyCode==UP){
        endRecord(); 
        exit(); 
    }
  }

}
