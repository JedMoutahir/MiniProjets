float x = 0, y = 0, xi = 20;
int ychange = 0;
void setup() {
    fullScreen(OPENGL);
    rectMode(CENTER);
  background(0);
}


void draw() {
  fill(random(0, 255), random(0, 255), random(0, 255));
  float j = random(0, 1);
  x += xi;
  if(x<0 || x>width){
  xi = random(-20,20);
  }
  if (ychange > 100) {
    ychange = 0;
  }
  if (j < 0.01) {
    background(0);
    ychange +=10;
  }
  while (y <= height) {
    for (int i = 0; i<100; i++) {
       ellipse(x, y, 10, 10);
       // x += xi;
       y += random(10+ychange-0.1, 10+ychange+0.1);
    }
  }
  y = 0;
}
