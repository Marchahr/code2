int sceneNumber = 0; 
ArrayList <Sky> skyRaining;
ArrayList <Snow> skySnowing;
Moon moon;

void setup() {
  //fullScreen(2); 
  size(800, 800);
  skyRaining = new ArrayList<Sky>();   
  skySnowing = new ArrayList<Snow>();
    moon = new Moon();
}
void draw() {
  switch(sceneNumber) {
  case 0 :
    scene0(); 
    break; 
  case 1: 
    scene1(); 
    break; 
    //case 2: 
    //      scene2(); 
    //break; 
    //case 3: 
    //      scene3(); 
    //break; 
  case 2:
    sceneNumber = 0; 
    break;
  }
  moon.display(155);
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      sceneNumber++;
    }
  }
  if (key == ' ') {
    moon.position.x++;
  }
}
void scene0() {
  background (204, 238, 252);
  //makes size change
  for (int i = 0; i < skyRaining.size(); i++) {
    Sky s = skyRaining.get(i);
    s.rain();
    s.gravity();
    s.display();

    //  if(s.position.y < height){
    // skyRaining.remove(i); 
    //}
  }

  skyRaining.add(new Sky());
  for (int i = 0; i < width; i+=10) {
    float distX = dist(i, 0, mouseX, 0);
    float r = map(distX, 0, width, 0, 244);
    fill(r, 196,  12);
  }
    //sun  
    ellipse(mouseX, 40, 125, 125);
  }
  void scene1() {
    background (54);
    //makes size change
    for (int i = 0; i < skySnowing.size(); i++) {
      Snow s = skySnowing.get(i);
      s.snow();
      s.gravity();
      s.display();

      //  if(s.position.y < height){
      // skyRaining.remove(i); 
      //}
    }

    skySnowing.add(new Snow());

    //mooon  
    for (int i = 0; i < width; i+=10) {
      float distX = dist(i, 0, mouseX, 0);
      float r = map(distX, 0, width, 0, 255);
      fill(r, 210, 250);
    }
    ellipse(mouseX, 40, 125, 125);
  }
  //void scene2(){
  //}
  //void scene3(){
  //}
