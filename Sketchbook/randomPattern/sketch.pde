int scl = 10;
float rate = 0.01;
void setup() {
  size(1000, 1000);
  textMode(CENTER);
  textSize(scl);
  background(0);
  for (int i = 0; i < width/scl; i++) {
    for (int j = 0; j < height/scl; j++) {
      if (random(1) < 0.5) {
        text("<", i*scl, j*scl);
      } else {
        text(">", i*scl, j*scl);
      }
    }
  }
}

void draw() {
  //background(0);
  for (int i = 0; i < width/scl; i++) {
    for (int j = 0; j < height/scl; j++) {
      if (random(1) < rate-10) {
        if (random(1) < 0.5) {
          text("(", i*scl, j*scl);
        } else {
          text(")", i*scl, j*scl);
        }
      }
    }
  }
}
