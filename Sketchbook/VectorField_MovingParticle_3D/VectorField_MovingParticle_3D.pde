import peasy.*;
PeasyCam cam;

float[][][][] vectorField;
float res = 100;
float xSource = 300;
float ySource = 300;
float zSource = 300;
int numP = 2000;
int time;
float adj = 10;
float zoom = 100;
float r1, r2;
ArrayList<Particle> p = new ArrayList<Particle>();

void setup() {
  size(1000, 1000, P3D);
  r1 = 300/res;
  r2 = 400/res;
  camera(-zoom, -zoom, -zoom, -width/2, -height/2, -width/2, 0, 1, 0);
  vectorField = new float[int(width/res)][int(height/res)][int(width/res)][3];
  background(0);
  fill(255);
  stroke(255);
  strokeWeight(4);
  for (int i = 0; i < width/res; i++) {
    for (int j = 0; j < height/res; j++) {
      for (int w = 0; w < height/res; w++) {
        vectorField[i][j][w][0] = map(noise(i*res + random(-adj, adj)), 0, 1, -1, 1);
        vectorField[i][j][w][1] = map(noise(j*res + random(-adj, adj)), 0, 1, -1, 1);
        vectorField[i][j][w][2] = map(noise(w*res + random(-adj, adj)), 0, 1, -1, 1);
        line(i*res, j*res, w*res, i*res+vectorField[i][j][w][0]*res, j*res+vectorField[i][j][w][1]*res, w*res+vectorField[i][j][w][2]*res);
      }
    }
  }
  vectorSphere();
  cam = new PeasyCam(this, 3000);

  println("Field done");
  for (int i = 0; i < numP; i++) {
    p.add(new Particle(random(width/2 - xSource, width/2 + xSource), random(height/2 - ySource, height/2 + ySource), random(height/2 - zSource, height/2 + zSource)));
  }
  println("Particles created");
  time = second();
  background(0);
}

void draw() {
  translate(-width/2, -height/2, width);
  //rotateX((float) millis()/1000.0);
  //rotateY(PI/2);
  background(0);
  if (mousePressed) {
    strokeWeight(1);
    for (int i = 0; i < width/res; i++) {
      for (int j = 0; j < height/res; j++) {
        for (int w = 0; w < width/res; w++) {
          stroke(255, 0, 0);
          strokeWeight(1);
          //line(i*res, j*res, (i+1)*res, j*res);
          //line((i+1)*res, j*res, (i+1)*res, (j+1)*res);
          //line(i*res, j*res, i*res, (j+1)*res);
          //line(i*res, (j+1)*res, (i+1)*res, (j+1)*res);
          line((i+1.0/2)*res, (j+1.0/2)*res, (w+1.0/2)*res, (i+1.0/2)*res+vectorField[i][j][w][0]*res, (j+1.0/2)*res+vectorField[i][j][w][1]*res, (w+1.0/2)*res+vectorField[i][j][w][2]*res);
          stroke(0, 0, 255);
          strokeWeight(4);
          point((i+1.0/2)*res+vectorField[i][j][w][0]*res, (j+1.0/2)*res+vectorField[i][j][w][1]*res, (w+1.0/2)*res+vectorField[i][j][w][2]*res);
        }
      }
    }
  }
  text(frameRate, 50, 50);
  strokeWeight(4);
  stroke(255);
  for (int i = 0; i < p.size(); i++) {
    p.get(i).update(vectorField[int(p.get(i).x/res)][int(p.get(i).y/res)][int(p.get(i).z/res)][0], vectorField[int(p.get(i).x/res)][int(p.get(i).y/res)][int(p.get(i).x/res)][1], vectorField[int(p.get(i).x/res)][int(p.get(i).y/res)][int(p.get(i).x/res)][2], second()-time);  
    p.get(i).show();
    time = second();
  }
}

void vectorSphere() {
  for (int i = 0; i < width/res; i++) {
    for (int j = 0; j < height/res; j++) {
      for (int w = 0; w < height/res; w++) {
        if ((i-width/res/2)*(i-width/res/2) + (j-height/res/2)*(j-height/res/2) + (w-width/res/2)*(w-width/res/2) < r1*r1) {
          vectorField[i][j][w][0] = map((i-height/res/2)/(height/res/2),-height/res/2,height/res/2,-5,5);
          vectorField[i][j][w][1] = map((j-width/res/2)/(width/res/2),-height/res/2,height/res/2,-5,5);
          vectorField[i][j][w][2] = map((w-width/res/2)/(width/res/2),-height/res/2,height/res/2,-5,5);
        } else if ((i-width/res/2)*(i-width/res/2) + (j-height/res/2)*(j-height/res/2) + (w-width/res/2)*(w-width/res/2) > r2*r2) {
          vectorField[i][j][w][0] = map(-(i-height/res/2)/(height/res/2),-height/res/2,height/res/2,-10,10);
          vectorField[i][j][w][1] = map(-(j-width/res/2)/(width/res/2),-height/res/2,height/res/2,-10,10);
          vectorField[i][j][w][2] = map(-(w-width/res/2)/(width/res/2),-height/res/2,height/res/2,-10,10);
        } else {
          vectorField[i][j][w][0] = -(j-height/res/2)/(height/res/2);
          vectorField[i][j][w][1] = (i-width/res/2)/(width/res/2);
          vectorField[i][j][w][2] = 0;
        }
      }
    }
  }
}
