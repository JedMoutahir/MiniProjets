float[][][] vectorField;
float res = 10;
float xSource = 300;
float ySource = 300;
int numP = 1000;
int time;
float adj = 10;
ArrayList<Particle> p = new ArrayList<Particle>();
void setup() {
  size(1000, 1700);
  vectorField = new float[int(width/res)][int(height/res)][2];
  background(0);
  fill(255);
  stroke(255);
  strokeWeight(4);
  for (int i = 0; i < width/res; i++) {
    for (int j = 0; j < height/res; j++) {
      vectorField[i][j][0] = map(noise(i*res + random(-adj, adj)), 0, 1, -1, 1);
      vectorField[i][j][1] = map(noise(j*res + random(-adj, adj)), 0, 1, -1, 1);
      line(i*res, j*res, i*res+vectorField[i][j][0]*res, j*res+vectorField[i][j][1]*res);
    }
  }
  /*for(int i = 0 ; i < width/res ; i++){
   vectorField[0][i][0] = 10;
   vectorField[0][i][1] = 0;
   vectorField[int(width/res)-1][i][0] = -10;
   vectorField[int(width/res)-1][i][1] = 0;
   vectorField[i][int(height/res)-1][0] = 0;
   vectorField[i][int(height/res)-1][1] = -10;
   vectorField[i][0][0] = 0;
   vectorField[i][0][1] = 10;
   }*/
   //vector1();
   vector1();
  println("Field done");
  for (int i = 0; i < numP; i++) {
    p.add(new Particle(random(width/2 - xSource, width/2 + xSource), random(height/2 - ySource, height/2 + ySource)));
  }
  println("Particles created");
  time = second();
  background(0);
}

void draw() {
  background(0);
  if (mousePressed) {
    strokeWeight(1);
    for (int i = 0; i < width/res; i++) {
      for (int j = 0; j < height/res; j++) {
        stroke(255, 0, 0);
        strokeWeight(1);
        line(i*res, j*res, (i+1)*res, j*res);
        line((i+1)*res, j*res, (i+1)*res, (j+1)*res);
        line(i*res, j*res, i*res, (j+1)*res);
        line(i*res, (j+1)*res, (i+1)*res, (j+1)*res);
        line((i+1.0/2)*res, (j+1.0/2)*res, (i+1.0/2)*res+vectorField[i][j][0]*res, (j+1.0/2)*res+vectorField[i][j][1]*res);
        stroke(0, 0, 255);
        strokeWeight(4);
        point((i+1.0/2)*res+vectorField[i][j][0]*res, (j+1.0/2)*res+vectorField[i][j][1]*res);
      }
    }
  }
  text(frameRate, 50, 50);
  strokeWeight(4);
  stroke(255);
  for (int i = 0; i < p.size(); i++) {
    p.get(i).update(vectorField[int(p.get(i).x/res)][int(p.get(i).y/res)][0], vectorField[int(p.get(i).x/res)][int(p.get(i).y/res)][1], second()-time);  
    p.get(i).show();
    time = second();
  }
}

void vectorCircle() {
  for (int i = 0; i < width/res; i++) {
    for (int j = 0; j < height/res; j++) {
      vectorField[i][j][0] = -(j-height/res/2)/(height/res/2);
      vectorField[i][j][1] = (i-width/res/2)/(width/res/2);
    }
  }
}

void vectorSpiral(){
  for (int i = 0; i < width/res; i++) {
    for (int j = 0; j < height/res; j++) {
      vectorField[i][j][0] = (j-height/res/2)/(height/res/2);
      vectorField[i][j][1] = (-100*sin((i-width/res/2)) -(j-height/res/2))/(height/res/2);
    }
  }
}

void vector1(){
  for (int i = 0; i < width/res; i++) {
    for (int j = 0; j < height/res; j++) {
      vectorField[i][j][1] = (i-width/res/2)/(width/res/2);
      vectorField[i][j][0] = (1*(1-(j-height/res/2)*(j-height/res/2))*(i-width/res/2) -(j-height/res/2))/((width/res/2)*(width/res/2));
    }
  }
}

