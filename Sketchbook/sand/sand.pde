ArrayList<Ball> B = new ArrayList<Ball>();
int numB = 10;
float Rcoef = 0.8;
float f = 0.95;
void setup() {
  //size(700, 700);
  fullScreen();
  background(0);
  for (int i = 0; i < numB; i++) {
    B.add(new Ball(random(50, width - 50), random(50, height-50), random(1, 10), false));
  }
  println("Balls created");
}

void draw() {
  if (!mousePressed) background(0);

  for (int n = 0; n < 10; n++) {
    for (int i = 0; i < B.size(); i++) {
      for (int j = 0; j < B.size(); j++) {
        if (i != j && i < B.size() && j < B.size()) {
          if (dist(B.get(i).position.x, B.get(i).position.y, B.get(j).position.x, B.get(j).position.y) < (B.get(i).diam + B.get(j).diam)/2) {
            collision(B.get(i), B.get(j));
          }
        }
      }
    }
  }

  for (int i = 0; i < B.size(); i++) {
    B.get(i).update();
    B.get(i).show();
  }
}

void collision(Ball b1, Ball b2) {
  // Get distances between the balls components
  PVector distanceVect = PVector.sub(b2.position, b1.position);

  // Calculate magnitude of the vector separating the balls
  float distanceVectMag = distanceVect.mag();

  // Minimum distance before they are touching
  float minDistance = b1.diam + b2.diam;

  if (distanceVectMag < minDistance) {
    float distanceCorrection = (minDistance-distanceVectMag)/4.0;
    PVector d = distanceVect.copy();
    PVector correctionVector = d.normalize().mult(distanceCorrection);
    b2.position.add(correctionVector);
    b1.position.sub(correctionVector);

    // get angle of distanceVect
    float theta  = distanceVect.heading();
    // precalculate trig values
    float sine = sin(theta);
    float cosine = cos(theta);

    /* bTemp will hold rotated ball positions. You 
     just need to worry about bTemp[1] position*/
    PVector[] bTemp = {
      new PVector(), new PVector()
    };

    /* this ball's position is relative to the b2
     so you can use the vector between them (bVect) as the 
     reference point in the rotation expressions.
     bTemp[0].position.x and bTemp[0].position.y will initialize
     automatically to 0.0, which is what you want
     since b[1] will rotate around b[0] */
    bTemp[1].x  = cosine * distanceVect.x + sine * distanceVect.y;
    bTemp[1].y  = cosine * distanceVect.y - sine * distanceVect.x;

    // rotate Temporary velocities
    PVector[] vTemp = {
      new PVector(), new PVector()
    };

    vTemp[0].x  = cosine * b1.velocity.x + sine * b1.velocity.y;
    vTemp[0].y  = cosine * b1.velocity.y - sine * b1.velocity.x;
    vTemp[1].x  = cosine * b2.velocity.x + sine * b2.velocity.y;
    vTemp[1].y  = cosine * b2.velocity.y - sine * b2.velocity.x;

    /* Now that velocities are rotated, you can use 1D
     conservation of momentum equations to calculate 
     the final velocity along the x-axis. */
    PVector[] vFinal = {  
      new PVector(), new PVector()
    };

    // final rotated velocity for b[0]
    vFinal[0].x = ((b1.m - b2.m) * vTemp[0].x + 2 * b2.m * vTemp[1].x) / (b1.m + b2.m);
    vFinal[0].y = vTemp[0].y;

    // final rotated velocity for b[0]
    vFinal[1].x = ((b2.m - b1.m) * vTemp[1].x + 2 * b1.m * vTemp[0].x) / (b1.m + b2.m);
    vFinal[1].y = vTemp[1].y;

    // hack to avoid clumping
    bTemp[0].x += vFinal[0].x;
    bTemp[1].x += vFinal[1].x;

    /* Rotate ball positions and velocities back
     Reverse signs in trig expressions to rotate 
     in the opposite direction */
    // rotate balls
    PVector[] bFinal = { 
      new PVector(), new PVector()
    };

    bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
    bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
    bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
    bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;

    // update balls to screen position
    b2.position.x = b1.position.x + bFinal[1].x;
    b2.position.y = b1.position.y + bFinal[1].y;

    b1.position.add(bFinal[0]);

    // update velocities
    b1.velocity.x = cosine * vFinal[0].x - sine * vFinal[0].y;
    b1.velocity.y = cosine * vFinal[0].y + sine * vFinal[0].x;
    b2.velocity.x = cosine * vFinal[1].x - sine * vFinal[1].y;
    b2.velocity.y = cosine * vFinal[1].y + sine * vFinal[1].x;
    
    b1.velocity.x *= Rcoef;
    b1.velocity.y *= Rcoef;
    b2.velocity.x *= Rcoef;
    b2.velocity.y *= Rcoef;
  }
}
