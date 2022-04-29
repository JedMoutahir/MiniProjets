float p = 0.01;
float[][][] points;
float scl = 20;
void setup() {
  //size(700, 700);
  fullScreen();
  background(0);
  noFill();
  stroke(255);
  //colorMode(HSB, 100);
  //create array points
  points = new float[int(width/scl)][int(height/scl)][3];
  for (int i = 0; i < width / scl - 1; i ++) {
    for (int j = 0; j < height / scl - 1; j ++) {
      points[i][j][0] = random(i*scl, (i+1)*scl);
      points[i][j][1] = random(j*scl, (j+1)*scl);
      points[i][j][2] = random(0, 255);
    }
  }
  for (int i = 0; i < width / scl - 2; i ++) {
    for (int j = 0; j < height / scl - 2; j ++) {
      beginShape();
      vertex(points[i][j+1][0], points[i][j+1][1]);
      vertex(points[i][j][0], points[i][j][1]);
      vertex(points[i+1][j][0], points[i+1][j][1]);
      vertex(points[i+1][j+1][0], points[i+1][j+1][1]);
      endShape(CLOSE);
    }
  }
}

void draw() {
  background(0);
  for (int i = 0; i < width / scl - 1; i ++) {
    for (int j = 0; j < height / scl - 1; j ++) {
      if (random(1) < p) {
        points[i][j][0] = random(i*scl, (i+1)*scl);
        points[i][j][1] = random(j*scl, (j+1)*scl);
        points[i][j][2] = random(0, 255);
      }
    }
  }
  for (int i = 0; i < width / scl - 2; i ++) {
    for (int j = 0; j < height / scl - 2; j ++) {
      fill(30,points[i][j][2]-100,30);
      stroke(30,points[i][j][2],30);
      beginShape();
      vertex(points[i][j+1][0], points[i][j+1][1]);
      vertex(points[i][j][0], points[i][j][1]);
      vertex(points[i+1][j][0], points[i+1][j][1]);
      vertex(points[i+1][j+1][0], points[i+1][j+1][1]);
      endShape(CLOSE);
    }
  }
  //text(frameRate, 100, 100);
}
