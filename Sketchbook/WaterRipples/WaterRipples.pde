
int cols;
int rows;
float[][] current;
float[][] previous;
float res = 4;
float dampening = 0.9999;

void setup() {
  size(1000, 1700);
  cols = int(width/res);
  rows = int(height/res);
  current = new float[cols][rows];
  previous = new float[cols][rows];
}

void mousePressed() {
  previous[int(mouseX/res)][int(mouseY/res)] = 50000;
}

void draw() {
  //background(0, 0, 255);
  //frameRate(20);
  for (int i = 1; i < cols-1; i++) {
    for (int j = 1; j < rows-1; j++) {
      current[i][j] = (
        previous[i-1][j] + 
        previous[i+1][j] +
        previous[i][j-1] + 
        previous[i][j+1]
        ) / 2
        - current[i][j];
      current[i][j] *= dampening;
      int index = i + j * cols;
      fill(current[i][j], current[i][j], 255);
      rect(i*res, j*res, res, res);
    }
  }
  obstacles();
  float[][] temp = previous;
  previous = current;
  current = temp;
}

void obstacles() {
  for (int i = cols / 2 - 5; i < cols / 2 + 5; i++) {
    for (int j = 0; j < rows-1; j+=10) {
      previous[i][j] = 0;
      current[i][j] = 0;
      fill(0);
      rect(i*res, j*res, res, res);
    }
  }
  for (int i = cols / 2; i < cols / 2 + 10; i++) {
    for (int j = 5; j < rows-1; j+=10) {
      previous[i][j] = 0;
      current[i][j] = 0;
      fill(0);
      rect(i*res, j*res, res, res);
    }
  }
}
