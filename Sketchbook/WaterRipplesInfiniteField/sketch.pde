int cols;
int rows;
float[][] current;
float[][] previous;
float res = 10;
float dampening = 0.95;
int max = 500;
int zone = 5;
void setup() {
  size(1000, 1000, P3D);
  //fullScreen(P3D);
  noFill();
  stroke(255);
  cols = int(width/res);
  rows = int(height/res);
  current = new float[cols][rows];
  previous = new float[cols][rows];
}

void mouseDragged() {
  for (int i = -zone; i < zone; i++) {
    for (int j = -zone; i < zone; i++) {
      previous[int(mouseX/res)+i][int(mouseY/res)+j] = max;
    }
  }
}

void draw() {
  translate(width/2, 0, -width/2);
  rotateX(QUARTER_PI);
  rotateZ(QUARTER_PI);
  background(0);
  //frameRate(20);
  for (int i = 1; i < cols-1; i++) {
    beginShape();
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
      vertex(i*res, j*res, map(current[i][j], -max, max, -max, max));
      if (i == 0) current[i][j] = 0;
      if (j == 0) current[i][j] = 0;
      if (i == rows) current[i][j] = 0;
      if (j == cols) current[i][j] = 0;
    }
    endShape();
  }
  float[][] temp = previous;
  previous = current;
  current = temp;
}
