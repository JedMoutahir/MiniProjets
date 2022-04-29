//-----------BRIC_BREAKERZ-----------//
int x = 0, y = 0, vx = 0, vy = 0, v = 0, t = 5;
int speed = 20;
int nbBall = 10, nbBlock = 10;
float coun = 160.0;
float Y = 10, X = 10;
int broke = 0;
ArrayList<Ball> Balls = new ArrayList<Ball>();
ArrayList<Block> Blocks = new ArrayList<Block>();

void setup() {
  size(1500, 600);
  //translate(width/2, height/2);
  rectMode(CENTER);
  background(0);
  for (int i = 0; i < nbBall; i++) {
    Balls.add(new Ball(width/2, height-20, i));
    Balls.get(i).display();
  }
  consBlock();
}

float X(float tz) {
  if (coun <= width/t) {
    X = coun*tz;
    return X;
  } else {
    coun = t/2 + 10;
    Y += 2*t;
    return 0;
  }
}

void consBlock() {
  for (int i = 0; i < nbBlock; i++) {
    float pix = random(10, width-10);
    float piy = random(10, height-10);
    while (inList(pix, piy)) {
      pix = random(10, width-10);
      piy = random(10, height-10);
    }
    Blocks.add(new Block(pix, piy, int(random(3, 10))));
    Blocks.get(i).display();
  }
}

void adaptFR() {
  if (frameRate < 25) {
    speed -= 1;
  } else speed += 1;
}

void draw() {
  adaptFR();
  for (int a = 0; a < speed; a++) {
    background(0);
    fill(255);
    textSize(30);
    text(frameRate, 20, 40);
    text(speed, 20, 80);
    for (int i = 0; i < Balls.size(); i++) {
      Balls.get(i).update();
      Balls.get(i).display();
      down();
    }
    for (int i = 0; i < Blocks.size(); i++) {
      Blocks.get(i).display();
      Blocks.get(i).update();
    }
  }
  newSerieBall();
  newSerieBlock();
  supBlock();
}

void newSerieBall() {
  if (Balls.size()<=0) {
    for (int i = 0; i < nbBall; i++) {
      println("new serie");
      Balls.add(new Ball(width/2, height-20, i));
      Balls.get(i).display();
    }
  } else println("ballsize " + Balls.size());
}

void newSerieBlock() {
  if (Blocks.size()<=0) {
    consBlock();
  } else println("blocksize " + Blocks.size());
}

void down() {
  for (int i = 0; i < Balls.size(); i++) {
    if (Balls.get(i).yb >= height+20) {
      println("kill " + i);
      Balls.remove(i);
    }
  }
}

void supBlock() {
  for (int i = 0; i < Blocks.size(); i++) {
    println("check " + i);
    if (Blocks.get(i).life <= 0) {
      Blocks.remove(i);
    }
  }
}

void won() {
  if (broke >= Blocks.size()) {
    textSize(40);
    text("You Won!", 20, height/3);
  }
}

boolean inList(float x,float y){
  for (int i = 0; i < Blocks.size(); i++) {
    if(dist(Blocks.get(i).xr,Blocks.get(i).yr,x,y) < Blocks.get(i).tr) return true;
    }
    return false;
}
