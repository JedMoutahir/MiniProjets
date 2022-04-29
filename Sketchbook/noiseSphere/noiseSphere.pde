import peasy.*;

PeasyCam cam;

float res = 50;
float dT = TWO_PI/res;
float dL = dT;
float radius = 200;
float roff = 0;
float ruffness = 0.05;

void setup() {
  size(700, 700, P3D);
  cam = new PeasyCam(this, 500);
  fill(255);
  stroke(255);
  strokeWeight(2);
}

void draw() {
  translate(-width/2, -height/2);
  background(0);
  //line(0,0,0,200,200,200);
  roff += ruffness;
  for (float i = 0; i < TWO_PI; i += dT) {
    for (float j = 0; j < TWO_PI; j += dL) {
      float r = radius + map(noise(i*ruffness, j*ruffness, roff), 0, 1, -50, 50);
      float x = r*sin(i)*cos(j);
      float y = r*sin(i)*sin(j);
      float z = r*cos(i);
      //println(i,j);
      
      point(x, y, z);
    }
  }
  
}
