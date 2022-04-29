class Ball {
  int number = 0;
  int time = 0;
  float xb, yb, vxb, vyb, v, t;
  float begin;
  boolean playLaunched = false;
  Ball(float x, float y, int p) {
    xb = x;
    yb = y;
    t = 40;
    number = p;
  }

  void display() {
    if (playLaunched) {
      fill(0, 0, 255, 255);
      ellipse(xb, yb, t, t);
    } else HID();
  }

  boolean turn() {
    time++;
    println(number*10, time);
    if (time >= number*10) {
      println("launched");
      return true;
    } else return false;
  }

  void update() {
    if (playLaunched) {
      xb += vxb;
      yb += vyb;
      touchWall();
      touchBlock();
    }
    stroke(255);
    line(width/2, height - 20, mouseX, mouseY);
    noStroke();
  }

  void touchBlock() {
    for (int i = 0; i < Blocks.size(); i++) {
      if (in(Blocks.get(i).xr, Blocks.get(i).yr, Blocks.get(i).tr)) {
        println("toucheBlock");
        Blocks.get(i).life--;
        change(xb, yb, Blocks.get(i).xr, Blocks.get(i).yr, Blocks.get(i).tr);
      }
    }
  }

  void change(float x, float y, float a, float b, float tr) {
    boolean case1, case2;
    println(dist(x, y, a+tr/2, b+tr/2) + " " + dist(a-tr/2, b-tr/2, x, y) + " " + (dist(x, y, a+tr/2, b+tr/2) - dist(a-tr/2, b-tr/2, x, y)));
    if (dist(x, y, a+tr/2, b+tr/2) - dist(a-tr/2, b-tr/2, x, y) > 0) {
      case1 = true;
    } else case1 = false;
    if (dist(x, y, a+tr/2, b-tr/2) - dist(a-tr/2, b+tr/2, x, y) > 0) {
      case2 = true;
    } else case2 = false;
    if ((case1 && case2) || (!case1 && !case2)) vxb = -vxb;
    if ((case1 && !case2) || (!case1 && case2)) vyb = -vyb;
  }

  void touchWall() {
    if (xb > width || xb < 0) {
      println("toucheMur " + vxb + " " + vyb);
      vxb = -vxb;
    }
    if (yb < 0) {
      println("toucheMur " + vxb + " " + vyb);
      vyb = -vyb;
    }
  }

  boolean in(float a, float b, float tr) {
    if (xb-tr/2 < a && xb+tr/2 > a && yb-tr/2 < b && yb+tr/2 > b) {
      return true;
    } else return false;
  }

  void HID() {
    if (mousePressed && turn()) {
      float mx = mouseX;
      float my = mouseY;
      vxb = (mx - xb) / 100;
      vyb = -(yb - my) / 100;
      playLaunched = true;
    }
  }
}
