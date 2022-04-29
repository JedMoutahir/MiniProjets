float[][] pos = new float[3][1];
float[][] posP = new float[1][2] ;
float c = 300.0;
float[][][] square = {{{0}, {0}, {0}}, {{c}, {0}, {0}}, {{c}, {c}, {0}}, {{0}, {c}, {0}}, {{0}, {c}, {c}}, {{c}, {c}, {c}}, {{c}, {0}, {c}}, {{0}, {0}, {c}}, {{0}, {0}, {0}}};
float ax, ay, az;

void setup() {
  fullScreen();
  background(0);
  fill(255);
  stroke(255);
  strokeWeight(10);
  ax = QUARTER_PI;
  ay = QUARTER_PI;
  az = QUARTER_PI;
  pos[0][0] = 100;
  pos[1][0] = 100;
  pos[2][0] = 100;
  posP = project(pos, ax, ay, az);
  for (int i = 0; i < posP.length; i++) {
    printArray(posP[i]);
  }
  translate(width/2, height/2);
  beginShape();
  for (int i = 0; i < square.length; i ++) {
    float x = project(square[i], ax, ay, az)[0][0];
    float y = project(square[i], ax, ay, az)[1][0];
    println(x, y);
    vertex(x, y);
  }
  endShape();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  noFill();
  beginShape();
  for (int i = 0; i < square.length; i ++) {
    float x = project(square[i], ax, ay, az)[0][0];
    float y = project(square[i], ax, ay, az)[1][0];
    vertex(x, y);
  }
  endShape();
  ax = map(mouseX, 0, width, 0, PI);
  ay = map(mouseY, 0, height, 0, PI);
}
