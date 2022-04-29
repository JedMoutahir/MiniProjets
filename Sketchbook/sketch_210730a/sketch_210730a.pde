float px, py, x, y, vx, vy, ax, ay;
float A = 0.1;
float mA = 1000;
float mV = 100;
int speed = 1;
void setup() {
  fullScreen();
  colorMode(HSB, 360, 100, 100);
  background(0);
  fill(255);
  stroke(255);
  strokeWeight(10);
}

void draw() {
  //background(0);
  for (int i = 0; i < speed; i++) {
    update();
    show();
  }
}

void show() {
  stroke(int(map(x, 0, width, 0, 360)), int(map(y, 0, height, 0, 360)), 360);
  line(px, py, x, y);
}

void update() {
  px = x;
  py = y;
  ax = A * (mouseX-x);
  ay = A * (mouseY-y);
  vx += constrain(ax, -mA, mA);
  vy += constrain(ay, -mA, mA);
  vx *= 0.9;
  vy *= 0.9;
  x += constrain(vx, -mV, mV);
  y += constrain(vy, -mV, mV);
}
