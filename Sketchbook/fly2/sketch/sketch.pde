int cols, rows;

int scl = 40;

int w = 2000;

int h = 3000;

float speed = 0.2;

float flying = 0;


float[][] terrain;

int minH = 10;
int maxH = 500;
void setup() {
  strokeWeight(1);
  fullScreen(P3D);
  //size(1200, 2000, P3D);

  cols = w / scl;

  rows = 5*h/ scl;

  terrain = new float[cols][rows];
}



void draw() {
  frameRate(20);

  flying -= speed;


  float yoff = flying;

  for (int y = 0; y < rows; y++) {

    float xoff = 0;

    for (int x = 0; x < cols; x++) {
      if (x < cols*2.0/3 && x > cols*1.0/3) {
        terrain[x][y] = map(noise(xoff, yoff), 0, 1, 0, minH);
      } else if(x <= 1.0/3*cols) {
        terrain[x][y] = map(noise(xoff, yoff), 0, 1, 0, map(x, 0, 1.0/3*cols, maxH, minH));
      } else if(x >= 2.0/3*cols) {
        terrain[x][y] = map(noise(xoff, yoff), 0, 1, 0, map(x, 2.0/3*cols, cols, minH, maxH));
      }
      xoff += 0.1;
    }

    yoff += 0.1;
  }



  background(150, 150, 255);
  //stroke(250, 250, 0);
  //fill(200, 200, 0);
  //ellipse(width/3, height/5, 200, 200);
  stroke(255);
  // noFill();
  translate(width/2, height/2+50);
  rotateX(PI/3);
  translate(-w/2, -4.5*h);

  fill(50, 200, 50);
  stroke(50, random(230, 255), 50);

  for (int y = 0; y < rows-1; y++) {

    beginShape(TRIANGLE_STRIP);

    for (int x = 0; x < cols; x++) {
      fill(map(y, 0, rows, 100, 50), 0, map(y, 0, rows, 100, 50));

      stroke(map(y, 0, rows, 255, 50), 0, map(y, 0, rows, 255, 50));

      vertex(x*scl, y*scl, terrain[x][y]);

      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);

      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
}
