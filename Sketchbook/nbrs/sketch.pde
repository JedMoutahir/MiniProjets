int txtsz = 40;

void setup() {
  size(1000, 1700);
  background(0);
  fill(0, 255, 0);
  textSize(txtsz);
  strokeWeight(200);
}

void draw() {
  txtsz = int(random(20, 60));
  textSize(txtsz);
  //frameRate(30);
  //background(0);
  float x = 0;
  float y = 0;
  for (int i = 0; i < width; i += txtsz) {
    for (int j = 0; j < height; j += txtsz) {
      fill(0);
      text(int(random(0, 2)), x, y);
      y += txtsz;
    }
    y = 0;
    x += txtsz;
  }
  for (int i = 0; i < 300; i++) {
    if (mousePressed) {
      stroke(0, 255, 0);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
  }
}
