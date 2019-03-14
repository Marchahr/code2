//array list of a class and then names it
Rain raining2;
//ArrayList
ArrayList<Rain> raining;
//Array
Star stars[] = new Star[15]; 

void setup(){
  size(800, 800);
  noStroke();
  raining = new ArrayList<Rain>();
  raining2= new Rain();
 // raining2 = new Rain((random(0,width), random(width*.5, height)),(random(0,width), random(width*.5, height)),(random(0,width), random(width*.5, height)));
    noStroke();

  for (int i=0; i<stars.length; i++){
    stars[i] = new Star();
  }
}

void draw(){
  background(99);
  for (int i=0; i<stars.length; i++){
  stars[i].display();
  }
 //makes size fluctuate 
  for(int i = 0; i < raining.size(); i++){
    //get(i) bc index is always changing
    Rain r = raining.get(i);
    
    r.fall();
    r.gravity();
    r.display();
    if(r.position.y >= height){
      r.bounce();
    }
    if(r.position.x >= width-r.size/2 || r.position.x <= r.size/2){
      r.sideBounce();
    }
    
    if(r.position.y < 0){
     raining.remove(i); 
    }  
    
    //Single Instance
  raining2.display();
  raining2.fall();
  raining2.gravity();
    
  }
  println(raining.size());
  
}

void keyPressed(){
 //creates an instances and pushes it
  raining.add(new Rain());
 
}
