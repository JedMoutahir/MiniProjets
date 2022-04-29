int xb = width/2, yb = height/2;
float x = 0, y = 0;
int ychange = 0;
int v = 10;
int vx = v, vy = v, px = 0, py = 0;
void setup() {
    fullScreen(OPENGL);
  orientation(PORTRAIT);
    rectMode(CENTER);
  background(0);
}


void draw() {
  noStroke();
  fill(random(0, 150), random(0, 150), random(120, 255));
  float j = random(0, 1);
  if (ychange > 20) {
    ychange = 0;
  }
  if (j < 0.01) {
    background(0);
    ychange +=10;
  }
  while (y <= height) {
    for (int i = 0; i<300; i++) {
      noStroke();
      ellipse(x, y, 5, 5);
      x = random(0, width);
      y += random(10+ychange-0.1, 10+ychange+0.1);
    }
  }
  ball_update();
  y = 0;
}

void ball_update() {
  stroke(255);//random(220, 255), random(0, 40), random(0, 40));
  strokeWeight(50);
  line(px, py, xb, yb);
  px = xb;
  py = yb;
  if (xb>=width || xb<=0) {
    vx = -vx;
  }
  if (yb>=height || yb<=0) {
    vy = -vy;
  }
  xb += vx;
  yb += vy;
}
