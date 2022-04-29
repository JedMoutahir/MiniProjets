class particule {
  float x, y, xo, yo, a, b, angle, speed, conSpeed, lim;
  boolean state = ( 1 > random(2));
  float timeMovingX1, timeMovingX2, timeMovingY1, timeMovingY2;
  float adapt;
  float size;
  particule(float X, float Y, float r1, float r2) {
    xo = X;
    yo = Y;
    angle = random(TWO_PI);
    if (state) {
      a = r1; 
      b = r2;
    } else {
      a = r2; 
      b = r1;
    }
    x = xo + a;
    y = yo + b;
    conSpeed = random(10, 50);
    timeMovingX1 = 0;
    timeMovingX2 = 0;
    timeMovingY1 = 0;
    timeMovingY2 = 0;
    adapt = 0.01;
    size = 5;
    lim = 1;
  }

  void display() {
    ellipse(x, y, size, size);
  }

  void update() {
    follow();
    //glissement();
    x = xo + a * cos(angle);
    y = yo + b * sin(angle);
    angle += TWO_PI / 100;
    speed = conSpeed + dist(xo, yo, mouseX, mouseY)/20;
  }

  void follow() {
    if (xo > mouseX+lim) { 
      xo -= speed; 
      timeMovingX1 += adapt;
    }
    if (xo < mouseX-lim) { 
      xo += speed; 
      timeMovingX2 += adapt;
    }
    if (yo > mouseY+lim) { 
      yo -= speed; 
      timeMovingY1 += adapt;
    }
    if (yo < mouseY-lim) { 
      yo += speed; 
      timeMovingY2 += adapt;
    }
    speed += random(-0.1, 0.1);
  }
  
  void glissement(){
    if(timeMovingX1 > 1.01){
      xo -= speed * timeMovingX1;
      timeMovingX1 -= 0.1;
      //println("there");
    }
    if(timeMovingX2 > 1.01){
      xo += speed * timeMovingX2;
      timeMovingX2 -= 0.1;
    }
    if(timeMovingY1 > 1.01){
      yo -= speed * timeMovingY1;
      timeMovingY1 -= 0.1;
    }
    if(timeMovingY2 > 1.01){
      yo += speed * timeMovingY2;
      timeMovingY2 -= 0.1;
    }
    //println(timeMovingX1);
  }
}
