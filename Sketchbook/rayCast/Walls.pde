class Wall {
  float x1, y1, x2, y2, a, b;
  Wall(float xi1, float yi1, float xi2, float yi2) {
    x1 = xi1;
    y1 = yi1;
    x2 = xi2;
    y2 = yi2;
    if (x1 != x2) {
      a = (y2-y1)/(x2-x1);
    } else {
      a = 0;
    }
  }

  boolean appartient(float x, float y) {
    float[] PV = pv(x - x1, y - y1, 0, x2 - x1, y2 - y1, 0);
    if (PV[0] == 0.0 && PV[1] == 0.0 && PV[2] == 0.0) {
      float Kac = ps(x2 - x1, y2 - y1, 0, x - x1, y - y1, 0);
      float Kab = ps(x2 - x1, y2 - y1, 0, x2 - x1, y2 - y1, 0);
      if (0 <= Kac && Kac <= Kab) return true;
    }
    return false;
  }

  void show() {
    line(x1, y1, x2, y2);
  }
}
