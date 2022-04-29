class Ball {
  PVector position;
  PVector velocity;
  float m;
  float g = 0.01*9.81;
  float diam = 10;
  float dt = 0.01;
  boolean fixed = false;
  color col = color(int(random(150, 255)), int(random(150, 255)), int(random(150, 255)));

  Ball(float x, float y, float mi, boolean fix) {
    position = new PVector(x, y);
    velocity = PVector.random2D();
    velocity.mult(3);
    m = mi;
    fixed = fix;
    diam = m*random(0.5*diam, 1.5*diam);
  }

  void update() {
    if (!fixed) {
      velocity.add(0, g);
      position.add(velocity);
      checkBoundaryCollision();
      velocity.x *= f;
      velocity.y *= f;
    }
  }

  void checkBoundaryCollision() {
    if (position.x > width-diam) {
      position.x = width-diam;
      velocity.x *= -Rcoef;
    } else if (position.x < diam) {
      position.x = diam;
      velocity.x *= -Rcoef;
    } else if (position.y > height-diam) {
      position.y = height-diam;
      velocity.y *= -Rcoef;
    } else if (position.y < diam) {
      position.y = diam;
      velocity.y *= -Rcoef;
    }
  }

  void show() {
    noStroke();
    fill(col);
    ellipse(position.x, position.y, diam, diam);
  }
}
