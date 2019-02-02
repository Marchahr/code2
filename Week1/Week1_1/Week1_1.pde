String myString [] = {"(▀̿Ĺ̯▀̿ ̿)", "ಠ_ಠ", "＼( °□° )／", "(◣_◢)"};
float xPos[] = new float [4];
int size = 100;
int index = 0;


void setup() {
  size(600, 600);
  float spacing = width/4;

  for (int i = 0; i< 4; i++) {
    xPos[i] = i*spacing + size*.75;
  }
}

void draw() {
  background(255);

 // float spacing = width/4;

  for (int i = 0; i< 4; i++) {


    if (dist(mouseX, mouseY, xPos[i], 100)<=size
      && mousePressed) {
      index = i;
      println(i);
      fill(255);
    } else {
      fill(0);
    }
        ellipse(xPos[i], 100, 100, 100);  

  }

  fill(0);
  text(myString[index], width/2-textWidth(myString[index])/2, height/2);
}
