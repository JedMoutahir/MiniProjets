float x = width/2, y = height/2;
float x2 = width/2, y2 = height/2;
float c1 = 120, c2 = 120, c3 = 120;
float c = 200;
float taille = 5;
float t = 2;

void setup() {
  noStroke();
  fullScreen();
  //size(400,400);
  background(0);
  // rectMode(CENTER);
}

void draw() {
  // background(0);
  float a = random(0, 3);
  if (a<1) {
    c1 += random(-c, c);
  } 
  if (a<2 && a>1) {
    c2 += random(-c, c);
  } 
  if (a>2) {
    c3 += random(-c, c);
  }
  if (c1 < 0 || c1 > 255) {
    c1 = 120;
  }
  if (c2 < 0 || c2 > 255) {
    c2 = 120;
  }
  if (c3 < 0 || c3 > 255) {
    c3 = 120;
  }
  fill(c1, c2, c3);
  for (int i = 0; i<10000; i++) {
    ellipse(x, y, t, t);
    x = x2 + random(-taille, taille);
    y = y2 + random(-taille, taille);
    if (x < 0 || x > width) {
      x = width/2;
    } 
    if (y < 0 || y> height) {
      y = height/2;
    }
    x2 = x;
    y2 = y;
  }
  taille = random(0, 100);
}