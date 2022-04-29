class Block {
  float x, y, vy, vx, r;
  float vm, vM, rm, rM;
  boolean still, selected;
  PImage block;
  Block(float ix, boolean isStill) {
    vm = 2;
    vM = 5;
    rm = 10;
    rM = 50;
    x = ix;
    block = loadImage("rock.png");
    y = -random(1000);
    vy = random(vm, vM);
    vx = random(-vm, vm);
    r = rM;
    still = isStill;
    selected = false;
  }

  void update() {
    if (!still) {
      y += vy;
      x += vx;
      if (y > height || x < 0 || x > width) repop();
    } else {
      y = height - 10;
      r = rM;
    }
  }

  boolean isTouching(float pX, float pY, float pS) {
    return (abs(x - pX) < r/2 + pS/2 && abs(y - pY) < r/2 + pS/2);
  }

  void repop() {
    x = random(width);
    y = 0;
    vy = random(vm, vM);
    r = rM;
  }

  float distDir(float xP) {
    if (xP < x) {
      return -r/2;
    } else { 
      return r/2;
    }
  }

  void show() {
    if (!mousePressed) {
      noStroke();
      if (selected) fill(0, 255, 0);
      else fill(255, 0, 0);
      //rect(x, y, r, r);
      image(block, x, y, r, r);
    }
  }
}
