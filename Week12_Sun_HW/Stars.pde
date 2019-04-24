// Creds to Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/17WoOqgXsRM


class Star {
  float x;
  float y;
  float z;
  float prevZ;

  Star() {
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width/2);
    prevZ = z;
  }

  void update() {
    
    z = z - speed;
    
    if (z < 1) {
      z = width/2;
      x = random(-width/.5, width/.5);
      y = random(-height/.5, height/.5);
      prevZ = z;
    }
  }

  void show() {
    fill(255);
    noStroke();

    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);;

    float r = map(z, 0, width/2, 16, 0);
    ellipse(sx, sy, r, r);

    float px = map(x / prevZ, 0, 1, 0, width/2);
    float py = map(y / prevZ, 0, 1, 0, height/2);

    prevZ = z;

    stroke(255);
    line(px, py, sx, sy);

  }
}
