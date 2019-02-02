//grid of ellipses that change color when clicked

int num = 20;
int size;
// 2D arrays to store data for both the X and the Y coordinates
int [][] grid = new int [num] [num];
boolean [] [] clicked = new boolean [num] [num];
color [] [] color2 = new color [num] [num];


void setup(){
  size(600,600);
background(0);
noStroke();
smooth();
size = width/num;

for(int i = 0; i<num; i++){
for (int j = 0; j<num; j++){
  clicked[i][j] = false;
  color2[i][j] = color(255);
//creates default values for all ellopses + initially won't be clicked (so will be white)
    }
  }
}

void draw(){
//treack each positon that so colors only changed when clicked 
  
  for(int i = 0; i<num; i++){
for (int j = 0; j<num; j++){
  
  if(clicked[i][j] == false){
   if(mousePressed){
  //coonditional to check if the mouse position is inbetween the boundaries fo the shapes
  //double loops allow checking between 0 and 10 for every/all boundaries for X+Y
      if(mouseX>=(i*size) && mouseX<((i+1)*size) && mouseY>=(j*size) && mouseY<((j+1)*size)){
      color2[i][j] = color(random(0,255), random(0,255), random(0,255));
     
     // set ellipse click boolean to true so the colors only change once
     clicked[i][j] =true;
  
     }
  } 
}

fill(color2[i][j]);
  rect(i*size, j*size, size, size); 
    }
  }
}
