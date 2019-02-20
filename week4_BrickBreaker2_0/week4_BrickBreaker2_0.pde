int cols, rows;
int w = 50;
int h = 25; 

int score;
int timeStart;
int timePassed;
int lives;

ArrayList<Bricks> myBricks;

Ball b; 
Paddle p; 
//Bricks myBricks [][]; //setting up a 2D grid to store instances of our bricks

void setup() {
  size(500, 500); 
  cols = width/w; 
  rows = int((height*.5)/h); 
  score=0;


  lives = 5;
  timeStart = millis();

  noStroke(); 

  myBricks = new ArrayList <Bricks>(); 

  b = new Ball(width/2, height*.75, random(3, 5), random(-5, -4)); 
  p = new Paddle(); 

  for (int i = 0; i<cols; i++) {
    for (int j = 0; j<rows; j++) {
     myBricks.add(new Bricks(i*w+5, j*h+5, w-10, h-10));
    }
  }
  println(myBricks.size());
}



void draw() {


  background(0); 

  b.move(); 
  b.display();

  p.display(); 
  p.reset(); 


  //making sure our ball stays within the boundaries of our screen 
  if (b.pos.x<= b.size/2 || b.pos.x>= width-b.size/2) {
    b.bounceSide();
  }

  //top
  if (b.pos.y<=b.size/2) {
    b.bounceTop();
  }

  //lives + bottom bounce
  if ( b.pos.y>= height-b.size/2) {
    b.bounceBottom();
    lives-= 1;
  }


  //ball bouncing off of the paddle 
  //FIX PADDLE COLLISION
  if (b.pos.x >= p.x
    && b.pos.x <= p.x+p.w 
    && b.pos.y>=(p.y-(b.size/2))
    && b.pos.y<=(p.y+(b.size/2))) { 
    b.paddleBounce();
  }

  //breaking bricks 
  for (int j = 0; j<cols; j++) {
    for (int i = 0; i<rows; i++) {
      float bl = map(i, 0, cols, 100, 255); 
      float g = map(j, 0, rows, 150, 255); 
      color brickColor = color(50,g,bl);
      println(myBricks.size());
      Bricks brick = myBricks.get(j*cols+i);
      brick.display(brickColor);  
      println(j*cols+i);

      // checking to see if ball is within the boundaries of our bricks 
      if (b.pos.x<= (myBricks.get(j*cols+i).x + myBricks.get(j*cols+i).w) 
        && b.pos.x>= 
        (myBricks.get(j*cols+i).x - myBricks.get(j*cols+i).w) 
        && b.pos.y<= (myBricks.get(j*cols+i).y + myBricks.get(j*cols+i).h) 
        && b.pos.y>= 
        (myBricks.get(j*cols+i).y - myBricks.get(j*cols+i).h) 
        && myBricks.get(j*cols+i).detector == true) {
        myBricks.get(j*cols+i).o = 0;  //just changing the opacity here but you can figure out how to remove the object using an array list 
        myBricks.get(j*cols+i).detector = false;

        myBricks.remove(j*cols+i);

        score += 1;
      }
    }
  }

  //  if (myBricks[i][j].o = 0) {
  //  myBrick.remove(i);
  //}

  if (keyPressed) {
    if (key==CODED) {
      if (keyCode == LEFT) {
        p.moveLeft();
      }
      if (keyCode == RIGHT) {
        p.moveRight();
      }
    }
  }

  text("score:" + str(score), 400, 400);

  float timePassed = (millis() - timeStart)/1000;
  text("time:" + str(timePassed), 400, 420);

  text("lives:" + str(lives), 400, 440);



  //game over
  if (lives <=-1) {
    fill(0);
    rect(0, 0, 500, 500);
    fill(255);
    text("GAME OVER", width/2-20, height/2);
  }
}

void keyPressed() {
}
