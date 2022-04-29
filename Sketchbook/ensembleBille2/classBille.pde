class Bille {
  float x, y, vx, vy, m, r, d, vm1, vm2;
  int c;
  float demp;
  Bille(float ix, float iy, float im, int ic) {
    x = ix;
    y = iy;
    m = im;
    r = 800*m;
    d = 0.9;
    vm1 = 10;
    vm2 = 10;
    c = ic;
    demp = 0.9;
    vx = 0;
    vy = 0;
  }

  void updateG(float acx, float acy) {
    vx += m*acx;
    vy += m*acy;
    vx = constrain(vx, -vm1, vm1);
    vy = constrain(vy, -vm1, vm1);
    x += vx;
    y += vy;
    //if (x<0 || x>width)vx=-vx*demp;
    //if (y<0 || y>height)vy=-vy*demp;
    x = constrain(x, r/4, width - r/4);
    y = constrain(y, r/4, height - r/4);
  }

  void updateVCollision(float px, float py) {
    vx += px;
    vy += py;
    vx *= demp;
    vy *= demp;
  }

  void show() {
    fill(c, 255, 255);
    ellipse(x, y, r, r);
  }
}
