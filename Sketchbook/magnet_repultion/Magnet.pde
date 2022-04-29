class Magnet {
  float ay, vy, y, m, t;
  float G = 1;
  float diam = 40;
  float speed = 1;
  boolean fix = false;
  Magnet(float yi, float mi, float ti, boolean fixed) {
    y = yi;
    m = mi;
    t = ti;
    fix = fixed;
    vy = 0;
  }

  float forceExerced(float yb, float tb) {
    return  M.get(0).m*g - G * (t*tb) / ((y-yb)*abs(y-yb));
  }

  void update(float forcey) {
    if (!fix) {
      ay = forcey;
      vy += ay * speed;
      vy -= F * vy;
      y += vy * speed;
      y = constrain(y, 0, height-10-diam);
      
      //println(ay,vy,y);
    }
  }

  void show() {
    rect(width/2, y, diam, diam);
  }
}
