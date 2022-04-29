class Block {
  float x, y, vy, r;
  float vm, vM, rm, rM;
  boolean still, selected;
  Block(float ix, boolean isStill) {
    vm = 2;
    vM = 5;
    rm = 10;
    rM = 20;
    x = ix;
    y = -random(1000);
    vy = random(vm, vM);
    r = random(rm, rM);
    still = isStill;
    selected = false;
  }

  void update() {
    if (!still) {
      y += vy;
      if (y > height) repop();
    } else {
      y = height - 10;
      r = rM;
    }
  }

  boolean isTouching(float pX, float pS) {
    return (y + r/2 > height - pS/2 && dist(x, 0, pX, 0) < r/2 + pS/2);
  }
  void repop() {
    x = random(width);
    y = 0;
    vy = random(vm, vM);
    r = random(rm, rM);
  }

  float distDir(float xP) {
    if (xP < x) {
      return -r/2;
    } else { 
      return r/2;
    }
  }

  void show(float xP, float yP) {
    if (dist(x, y, xP, yP) < visionField || !mousePressed) {
      noStroke();
      if (selected) fill(0, 255, 0);
      else fill(255, 0, 0);
      rect(x, y, r, r);
      image(block, x, y, r, r);
    }
  }
}
