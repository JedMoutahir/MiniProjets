int cols, rows;

int scl = 50;

int w = 5000;

int h = 15000;

float speed = 0.2;

float flying = 0;


float[][] terrain;


void setup() {
  strokeWeight(1);
  fullScreen(P3D);
  //size(1200, 2000, P3D);

  cols = w / scl;

  rows = h/ scl;

  terrain = new float[cols][rows];
}



void draw() {
  flying -= speed;


  float yoff = flying;

  for (int y = 0; y < rows; y++) {

    float xoff = 0;

    for (int x = 0; x < cols; x++) {

      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -200, 200);

      xoff += 0.2;
    }

    yoff += 0.2;
  }



  background(150, 150, 255);
  //stroke(250, 250, 0);
  //fill(200, 200, 0);
  //ellipse(width/3, height/5, 200, 200);
  stroke(255);
  // noFill();
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -2*h/3,100);
  
  fill(50, 200, 50);
  stroke(50, random(230, 255), 50);
  
  for (int y = 0; y < rows-1; y++) {

    beginShape(TRIANGLE_STRIP);

    for (int x = 0; x < cols; x++) {
      fill(map(y,0,rows,255,0));

      stroke(map(y,0,rows,250,0));

      vertex(x*scl, y*scl, terrain[x][y]);

      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);

      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
}
