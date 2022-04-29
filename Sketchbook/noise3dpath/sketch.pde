float x, y, z;
float x1off, x2off;
float y1off, y2off;
float z1off, z2off;
float inc = 1;
void setup() {
  size(800, 800, P3D);
  //fullScreen(P3D);
  x = width/2;
  y = height/2;
  z = width/2;
  background(0);
  noStroke();
  //strokeWeight(10);
}

void consT() {
  if (x > width) x = width;
  if (y > width) y = height;
  if (z > width) z = width;
  if (x < 0) x = 0;
  if (y < 0) y = 0;
  if (z < 0) z = 0;
}

void draw() {
  background(0);
  beginShape();
  for (int i = 0; i < 1000; i ++) {
    //translate(-width/2, -height/2, -width/2);
    x += random(-inc, inc);
    y += random(-inc, inc);
    z += random(-inc, inc);
    consT();
    int r = (int) map(cos(x), -1, 1, 0, 255);
    int g = (int) map(cos(1), -1, 1, 0, 255);
    int b = (int) map(cos(1), -1, 1, 0, 255);
    fill(r, g, b);
    //translate(x, y, z);
    vertex(x,y,z);//box(10);
    //translate(-x, -y, -z);
    //println(x,y,z);
  }
  endShape();
}
