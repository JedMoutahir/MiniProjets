int N = 10000;

void setup() {
  fullScreen();
  colorMode(HSB, 360, 100, 100);
  background(0);
  fill(255);
  stroke(255);
  strokeWeight(1);
  show();
}

void show() {
  for (int i  = 0; i < N; i ++) {
    for (int j  = 0; j < N; j ++) {
      stroke(int(map(i, 0, N, 0, 360)), int(map(j, 0, N, 0, 360)), 360);
      point(i * width / N, j * width / N);
    }
  }
}
