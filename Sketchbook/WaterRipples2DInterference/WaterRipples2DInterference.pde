int cols;
int rows;
float[][] current;
float[][] previous;
float res = 2;
float dampening = 0.999;
int max = 5000;
float T1 = 50;
float T2 = 50;
float x1, x2, y1, y2;
int counter = 0;
void setup() {
  fullScreen();
  noStroke();
  cols = int(width/res);
  rows = int(height/res);
  current = new float[cols][rows];
  previous = new float[cols][rows];
  x1 = 100;
  y1 = 100;
  x2 = 100;
  y2 = height - 100;
}

void mouseDragged() {
  previous[int(mouseX/res)][int(mouseY/res)] = max;
}

void draw() {
  background(0);
  //frameRate(20);
  if (counter % T1 == 0) previous[int(x1/res)][int(y1/res)] = max;
  if (counter % T2 == 0) previous[int(x2/res)][int(y2/res)] = max;
  for (int i = 1; i < cols-1; i++) {
    for (int j = 1; j < rows-1; j++) {
      current[i][j] = (
        previous[i-1][j] + 
        previous[i+1][j] +
        previous[i][j-1] + 
        previous[i][j+1]
        ) / 2
        - current[i][j];
      current[i][j] = current[i][j] * dampening;
      int index = i + j * cols;
      fill(color(current[i][j]));
      rect(i*res, j*res, res,res);
    }
  }
  float[][] temp = previous;
  previous = current;
  current = temp;
  counter ++;
}
