int cols;
int rows;
float[][] current;
float[][] previous;
float res = 3;
float dampening = 0.99;
int max = 500;
void setup() {
  size(1000,1000,P3D);
  //fullScreen(P3D);
  noFill();
  stroke(255);
  //strokeWeight(res);
  cols = int(width/res);
  rows = int(height/res);
  current = new float[cols][rows];
  previous = new float[cols][rows];
}

void mousePressed() {
  previous[int(mouseX/res)][int(mouseY/res)] = max;
  //previous[int(mouseX/res)+10][int(mouseY/res)+10] = max;
}

void draw() {
  translate(width/2,0,-width/2);
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
    }
    endShape();
  }
  float[][] temp = previous;
  previous = current;
  current = temp;
}
