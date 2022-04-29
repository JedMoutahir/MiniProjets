class StellarObject {
  float ax, ay, vx, vy, x, y, m;
  float G = 0.1;
  float diam = 5;
  float speed = 0.001;
  boolean fixed = false;
  color col = color(int(random(150,255)),int(random(150,255)),int(random(150,255)));
  StellarObject(float xi, float yi, float mi, boolean fix) {
    x = xi;
    y = yi;
    m = mi;
    fixed = fix;
    diam *= map(m, 10, 2000, 0.5, 1.5);
    vx = random(-3, 3);
    vy = random(-3, 3);
  }

  float forceExerced(float xb, float yb, float mb) {
    return G * (m*mb) / (dist(x, y, xb, yb)*dist(x, y, xb, yb));
  }

  void update(float forcex, float forcey) {
    if (!fixed) {
      ax = forcex;
      ay = forcey;
      vx += ax * speed;
      vy += ay * speed;
      x += vx * speed;
      y += vy * speed;
      x = constrain(x, 0, width);
      y = constrain(y, 0, height);
    }
  }

  void show() {
    noStroke();
    fill(col);
    ellipse(x, y, diam, diam);
  }
}
