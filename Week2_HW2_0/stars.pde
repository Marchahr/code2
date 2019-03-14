class Star{
 float x, y;

 //Constructor
 Star(){
   x = random (0, width);
   y = random(0,height);
 }
 
 //Method
 void display(){
   fill(245);
   rect(x-5,y-5,15,15);
   rect(x,y,5,5);
   rect(x+5,y+5,15,15);
 }


}
