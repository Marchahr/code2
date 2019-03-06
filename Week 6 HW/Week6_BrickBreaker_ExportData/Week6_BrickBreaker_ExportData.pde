//how to export data that is an INT not a STRING
PrintWriter output;

int cols, rows; 
int w = 50;
int h = 25; 

int score;

//int scoreNum;
//String score;
int timeStart;
int timePassed;
int lives;


  //tried to use saveStrings way from class but didn't work
//String scoreData = new String(score);
//String [] scoreData = new String[score];

Ball b; 
Paddle p; 
Bricks myBricks [][]; //setting up a 2D grid to store instances of our bricks

void setup() {
  size(500, 500); 
  cols = width/w; 
  rows = int((height*.5)/h); 
  score=0;

output= createWriter("score.txt");

  lives = 1;
  timeStart = millis();

  noStroke(); 

  myBricks = new Bricks[cols][rows]; 

  b = new Ball(width/2, height*.75, random(3, 5), random(-5, -4)); 
  p = new Paddle(); 

  for (int i = 0; i<cols; i++) {
    for (int j = 0; j<rows; j++) {
      myBricks[i][j] = new Bricks(i*w+5, j*h+5, w-10, h-10);
    }
  }
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
  if (b.pos.x >= p.x
    && b.pos.x <= p.x+p.w 
    && b.pos.y>=(p.y-(b.size/2))
    && b.pos.y<=(p.y+(b.size/2))) { 
    b.paddleBounce();
  }

  //breaking bricks 
  for (int i = 0; i<cols; i++) {
    for (int j = 0; j<rows; j++) {
      float bl = map(i, 0, cols, 100, 255); 
      float g = map(j, 0, rows, 150, 255); 
      myBricks[i][j].display(color(50, g, bl));  

      // checking to see if ball is within the boundaries of our bricks 
      if (b.pos.x<= (myBricks[i][j].x + myBricks[i][j].w) 
        && b.pos.x>= 
        (myBricks[i][j].x - myBricks[i][j].w) 
        && b.pos.y<= (myBricks[i][j].y + myBricks[i][j].h) 
        && b.pos.y>= 
        (myBricks[i][j].y - myBricks[i][j].h) 
        && myBricks[i][j].detector == true) {
        myBricks[i][j].o = 0;  //just changing the opacity here but you can figure out how to remove the object using an array list 
        myBricks[i][j].detector = false;

        //myBricks[i][j].remove;
     
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
  
      //Tried but didn't work
   //String[] scoreData = new String[score];
  //String scoreData = new String(score);




  //game over
  if (lives <=-1) {
    fill(0);
    rect(0, 0, 500, 500);
    fill(255);
    text("GAME OVER", width/2-20, height/2);
    
    
    //Saves the score after you run out of lives
    output.println(score);
    output.flush(); 
    output.close();
  }
}

void keyPressed() {
}
