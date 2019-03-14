float radius= width;
int scale = 5; 
boolean shrink; 


void setup(){
  size(500, 500); 
}

void draw(){
  background(0); 
  
  
  
//  text(printText(), width*.1, height*.1); 
  ellipse(width/2, height/2, radius, radius);  
  
  if(radius>=width){
    shrink = true; 
  }
  
  if(radius<= 0){
    shrink = false; 

  }
  
  if(shrink){
    radius-= scale; 
    text("SHRINK", width*.1, height*.1);

  }else{
    radius+= scale; 
     text("GROW", width*.1, height*.1);

  }
  
}

//float printText(){
  
 
//}
