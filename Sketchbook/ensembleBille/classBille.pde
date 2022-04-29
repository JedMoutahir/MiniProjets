class Bille {
  float x, y, v1x, v1y, v2x, v2y, m, r, d, vm1, vm2;
  int c;
  float demp;
  Bille(float ix, float iy, float im, int ic) {
    x = ix;
    y = iy;
    m = im;
    r = 800*m;
    d = 0.9;
    vm1 = 50;
    vm2 = 50;
    c = ic;
    demp = 0.9;
    v1x = 0;
    v1y = 0;
    v2x = 0;
    v2y = 0;
  }

  void updateG(float acx, float acy) {
    v1x += m*acx;
    v1y += m*acy;
    v1x = constrain(v1x, -vm1, vm1);
    v1y = constrain(v1y, -vm1, vm1);
    x += v1x/20;
    y += v1y/20;
    //if (x<0 || x>width)vx=-vx*demp;
    //if (y<0 || y>height)vy=-vy*demp;
    x = constrain(x, r/4, width - r/4);
    y = constrain(y, r/4, height - r/4);
  }

  void updateT(float acx, float acy) {
    v2x += acx;
    v2y += acy;
    v2x *=d;
    v2y *=d;
    v2x = constrain(v2x, -vm2, vm2);
    v2y = constrain(v2y, -vm2, vm2);
    x += v2x/20;
    y += v2y/20;
    //if (x<0 || x>width)vx=-vx*demp;
    //if (y<0 || y>height)vy=-vy*demp;
    x = constrain(x, r/4, width - r/4);
    y = constrain(y, r/4, height - r/4);
  }

  void show() {
    fill(c, 255, 255);
    ellipse(x, y, r, r);
  }
}
