ArrayList <Object> myObject;  

void setup(){
  size(600, 600); 
  
//  myObject = new Object(width/2, height/2); 

  myObject = new ArrayList <Object>(); 
}

void draw(){
  background(255); 
  
 

  for(int i = 0; i < myObject.size(); i++){
    Object o = myObject.get(i);

 PVector gravity = new PVector(0, .1*o.mass); 
  PVector wind = new PVector(0.1, 0); 

  o.move(); 
  o.checkBoundaries(); 
  o.display(); 
  o.addForce(gravity);
  o.addForce(wind);

  
  }
}

void mousePressed(){
  myObject.add(new Object(random(width), random(height)));

}
