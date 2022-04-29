float xr, yr;
float thick = 0.3;
float size = width/6;
void setup() {
  //size(500, 1000);
  fullScreen();
  background(0);
  fill(255);
  rectMode(CENTER);
  xr = width/2;
  yr = height/2;
}

void draw() {
  update_thickness();
  frame();
}

void frame() {
  float max = 3;
  background(0);
  float mili = int(millis() / 1000) * 1000;
  float frame = mili - millis();
  // println(millis());
  if (abs(frame) > -10 && abs(frame) < 10) {
  // println("frame" + frame);
  // println("there");
    fill(random(0, 255), random(0, 255), random(0, 255));
  // rectangle(xr, yr, width/3, max, thick);
  }
  rectangle(xr, yr, size, max, thick);
  rectangle(xr/2, yr/2, size/4, max, thick);
  rectangle(6*xr/4, 6*yr/4, size/4, max, thick);
}
