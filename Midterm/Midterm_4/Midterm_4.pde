int state = 0;

PVector pos, vel, vel2, accel, gravity;

float mass;

int x, y;

void setup() {
  size(600, 600);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  fill(250);
  noStroke();
  mass = 30;
  pos = new PVector(width/2, height/2);
  vel = new PVector(1, 0); 
  vel2 = new PVector (2, 0);
  accel = new PVector(0, 1);
  gravity = new PVector(0, .5);
}

void draw() {
  switch (state) {
  case 0:
    drawIntro();
    break;
  case 1:
    drawScene1();
    break;
  case 2:
    drawScene2();
    break;
  case 3:
    drawScene3();
    break;
  case 4:
    drawEnding();
  default:
    break;
  }
}

void keyPressed() {
  switch (state) {
  case 0:
    if (key == ' ') {
      state = 1;
    }
    break;
  case 1:
    if (key == 'a') {
      state = 2;
    } else if (key == 'z') {
      state = 0;
    }
    break;
  case 2:
    if (key == ' ') {
      state = 4;
    }
    break;
  case 3:
    if (key == ' ') {
      state = 4;
    }
    break;
  case 4:
    if (key == 'r') {
      state = 0;
    }
  default:
    break;
  }
}

void drawIntro() {
  background(#EA8FF5);

  ellipse(pos.x, pos.y, mass, mass);
  text("press spacebar to start", width/2, height- 150);

  // side bounce
  if (pos.x >= width-mass || pos.x <=mass/2) {
    vel.x = -vel.x;
  }

  //Bounce
  if (pos.y >= height) {
    vel.y = -vel.y;
  }
}

void drawScene1() {
  background(200, 120, 0);

  ellipse(pos.x, pos.y, mass, mass);
  pos.add(vel); 

  // side bounce
  if (pos.x >= width-mass || pos.x <=mass/2) {
    vel.x = -vel.x;
  }

  //Bounce
  if (pos.y >= height || pos.y <= mass/2) {
    vel.y = -vel.y;
  }

  textSize(24);
  text("to add acceleration, press a", width/2, height/2);
  text("to go back, press z", width/2, height/2 + 50);
}

void drawScene2() {
  background(120, 0, 200);


  ellipse(pos.x, pos.y, mass, mass);

  pos.add(vel); 
  vel.add(accel); 


  if (pos.x >= width-mass || pos.x <=mass/2) {
    vel.x = -vel.x;
  }

  if (pos.y >= height || pos.y <= mass/2) {
    vel.y = -vel.y;
  }

  text("press spacebar to add gravity", width/2, height- 150);
}

void drawScene3() {
  background(0, 120, 200);
  
  ellipse(pos.x, pos.y, mass, mass);
  pos.add(vel); 

  if (pos.x >= width-mass || pos.x <=mass/2) {
    vel.x = -vel.x;
  }

  if (pos.y >= height || pos.y <= mass/2) {
    vel.y = -vel.y;
  }
}

void drawEnding() {
  background(10);

  ellipse(pos.x, pos.y, mass, mass);
  pos.add(vel); 
  vel.add(gravity);

  if (pos.x >= width-mass || pos.x <=mass/2) {
    vel.x = -vel.x;
  }

  if (pos.y >= height || pos.y <= mass/2) {
    vel.y = -vel.y;
  }

  textSize(24);
  text("press r to restart", width/2, height- 150);
}
