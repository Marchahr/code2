class Brushstroke {
  float x, y;
  float vx, vy;
  float siz;
  float lifetime = 10;
  color c; 
  Brushstroke(float x, float y) {
    this.x = x;
    this.y = y;
    vx = 15;
    vy = 0; 
  }

  void update() {
    x += vx;
    
   y += vy;
   
   
  //   if (y > height) {
  //  y = 0;
  //} else {
  //  y+=10;
  //}
  
  }

  void display(color c) {
    this.c = c; 
    fill(c);
    //stroke(0);
     noStroke();

    rect(x, y, size, size);
   

//  for (int i = 0; i < x; i++) {
//    for (int j = 0; j < y; j++) {
//      brushstroke[i][j]+=1;
//      fill(brushstroke[i][j]);
//    fill(c);
//      rect(i*(width/x), j*(height/y), width/x, height/y);
    
//    if(brushstroke[i][j]>=255){
//        brushstroke[i][j]=0;
//      }  
//}
//  }
  
    }
  
}
