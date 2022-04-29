class Joueur {
  float x, y, vx, vy, L, h;
  Joueur() {
    vx = 10;
    vy = 10;
    L = 50;
    h = 200;
    x = 0;
    y = height/2;
  }

  void update() {
    y = mouseY;
  }

  void show() {
    fill(255);
    rect(x, y, L, h);
  }
}
