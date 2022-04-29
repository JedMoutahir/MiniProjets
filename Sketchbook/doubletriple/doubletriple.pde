float x, y;
float w = 0.01;
float A = 1;
float t = 0;
float r = 40;
int N = 1000;
void setup() {
  size(700, 700);
  background(0);
  fill(255, 1);
  noStroke();
  x = width/3;
  y = height/2;
}

void draw() {
  background(0);
  for (int i = 0; i < N; i++) {
    x += fdouble(t);
    ellipse(x, y, r, r);
    t++;
  }
}

float fdouble(float t) {
  return A*pow(sin(w*t), 9)*exp(abs(sin(w*t)));
}
float ftriple(float t) {
  return A*pow(sin(w*t), 9)*pow(cos(w*t), 10)*exp(10*abs(sin(w*t)));
}
