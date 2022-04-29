import peasy.*;

PeasyCam cam;

int scl = 5;
int rows, cols;
float zoff = 0;
float ruffness = 0.05;
void setup() {
  fullScreen(P3D);
  background(0);
  fill(255);
  stroke(255);
  rows = int(width/scl);
  cols = int(height/scl);
  cam = new PeasyCam(this, 500);
}

void draw() {
  translate(-width/2, -height/2);
  background(0);
  zoff += ruffness;
  for (int i = 0; i < rows; i++) {
    beginShape(TRIANGLE_STRIP);

    for (int j = 0; j < cols; j++) {
      float z1, z2;
      z1 = map(noise(i*ruffness, j*ruffness, zoff), 0, 1, -100, 100);
      z2 = map(noise((i+1)*ruffness, j*ruffness, zoff), 0, 1, -100, 100);
      //strokeWeight(map(noise(i, j), 0, 1, 1, 5));
      noFill();
      stroke(255);
      //point(i*scl, j*scl, z1);
      vertex(i*scl, j*scl, z1);
      vertex((i+1)*scl, j*scl, z2);
    }
    endShape();
  }
}
