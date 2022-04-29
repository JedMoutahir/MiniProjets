class Ball {
  float x, y, vx, vy, r;
  Ball() {
    vx = 10;
    vy = 10;
    r = 50;
    x = width/2 +10;
    y = height/2 +20;
  }

  void update() {
    x += vx;
    y += vy;
    if (x > width || x < 0 || isTouching(j)) {
      vx = -vx;
    }

    if (y > height || y < 0) {
      vy = -vy;
    }
  }

  boolean isTouching(Joueur j) {
    return (x < j.L + r)&&(y < j.y + j.h/2 && y > j.y - j.h/2);
  }


  void show() {
    circle(x, y, r);
  }
}
