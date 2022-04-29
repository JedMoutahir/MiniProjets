int nWall = 10;
int N = 10;
ArrayList<Wall> w = new ArrayList<Wall>();
float a = 1;
float b = 2;
float[] X = new float[N];
float[] Y = new float[N];
void setup() {
  fullScreen();
  background(0);
  fill(255);
  stroke(255);
  for (int i = 0; i < nWall; i++) {
    w.add(new Wall(random(50, width - 50), random(50, height-50), random(50, width - 50), random(50, height-50)));
  }
  println("Walls created");
  showWalls();
  X[0] = 0;
  Y[0] = 0;
  for(int i = 0 ; i < N ; i++){
    
    
  }
}

void showWalls() {
  for (int i = 0; i < nWall; i++) {
    w.get(i).show();
  }
}

float[] pv(float xa, float ya, float za, float xb, float yb, float zb) {
  float[] p = new float[3];
  p[0] = ya*zb - yb*za;
  p[1] = za*xb - xa*zb;
  p[2] = xa*yb - ya*xb; 
  return p;
}

float[] intersection(float a1, float b1, float a2, float b2) {
  float[] p = new float[2];
  p[0] = 0;
  p[1] = 0;
  if (a1 != a2) {
    p[0] = (b2 - b1)/(a1 - a2);
    p[1] = a1*p[0] + b1;
  }
  return p;
}

float ps(float xa, float ya, float za, float xb, float yb, float zb) {
  float p;
  p = xa*xb + ya*yb + za*zb;
  return p;
}
