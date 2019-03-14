class Object{
  PVector pos, vel, accel; 

  Object(){
    pos = new PVector(width/2, height/2); 
    vel = new PVector(0, 0); 

    
  }
  
  void move(){
      PVector mouse = new PVector(mouseX,mouseY);
      accel = PVector.sub(mouse,pos);

    accel.normalize();
    
    //normalize your accel vector here
    
    vel.limit(4); 
    vel.add(accel);
    pos.add(vel); 
    
    //basic movement vector addition here...
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(pos.x,pos.y,30,30);
  }
  
  void checkBoundaries(){
    //add logic here so when the ellipse gets to the edge of the (did you mean mouse?)
    //it is positioned on the opposite side (of the mouse?)
    
      if (pos.x > width) {
      pos.x = 0;
    }else if (pos.x < 0) {
     pos.x = width;

  }
  
}

}
