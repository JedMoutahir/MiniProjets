float x, y, d, dx, dy, a;
float[][] mur;
void setup() {
  size(1000,1000);
  background (0);
  mur = new float[4][2];
  x = width/2;
  y = height/2;
  //a = QUARTER_PI;
  //dx = cos(a)*d;
  //dy = sin(a)*d;
  mur[0][0]= width/4;
  mur[0][1]= height/4;
  mur[1][0]= 3*width/4;
  mur[1][1]= height/4;
  mur[2][0]= 3*width/4;
  mur[2][1]= 3*height/4;
  mur[3][0]= width/4;
  mur[3][1]= 3*height/4;
  mur[4][0]= width/4;
  mur[4][1]= height/4;
  beginShape();
  for (int i = 0; i < 4; i++) {
    vertex(mur[i][0], mur[i][1]);
  }
  endShape();
}
