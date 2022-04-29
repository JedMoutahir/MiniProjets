int cols;
int rows;
float[][] current;
float[][] previous;
import peasy.*;

PeasyCam cam;

float res = 5;
float dampening = 0.99;
int max = 400;
void setup() {
  //size(1000,1000,P3D);
  fullScreen(P3D);
  fill(15,94,156);
  stroke(0);
  strokeWeight(0.2);
  cols = int(width/res);
  rows = int(height/res);
  current = new float[cols][rows];
  previous = new float[cols][rows];
  cam = new PeasyCam(this, 1000);
}

void mousePressed() {
  previous[int(mouseX/res)][int(mouseY/res)] = max;
  //previous[int(mouseX/res)+10][int(mouseY/res)+10] = max;
}

void draw() {
  //frameRate(1);
  translate(-width/2, -height/2, 0);
  //rotateX(QUARTER_PI);
  //rotateZ(QUARTER_PI);
  background(0);
  //frameRate(20);

  for (int i = 1; i < cols-1; i++) {

    beginShape(TRIANGLE_STRIP);
    for (int j = 1; j < rows-1; j++) {
      current[i][j] = (
        previous[i-1][j] + 
        previous[i+1][j] +
        previous[i][j-1] + 
        previous[i][j+1]
        ) / 2
        - current[i][j];
      current[i][j] = current[i][j] * dampening;
      //int index = i + j * cols;
      //fill(color(current[i][j]));
      vertex(i*res, j*res, current[i][j]);
      vertex((i+1)*res, j*res, current[i+1][j]);
    }
    endShape();
  }

  float[][] temp = previous;
  previous = current;
  current = temp;
}
