int numBlock = 100;
int score = 0;
float x, y, vx;
boolean playing = true;
ArrayList<Block> Blocks = new ArrayList<Block>();
float pSize = 10;
float mVisionField = 200;
float visionField = mVisionField;
PImage player, block;
int speed = 30;
void setup() {
  //size(600, 600);
  fullScreen();
  rectMode(CENTER);
  imageMode(CENTER);
  background(0);
  stroke(255);
  //noStroke();
  fill(255);
  player = loadImage("player.png");
  block = loadImage("rock.png");
  for (int i = 0; i < numBlock; i++) {
    Blocks.add(new Block(random(width), false));
  }
  Blocks.add(new Block(10, true));
  Blocks.add(new Block(width - 10, true));
  vx = 1;
  x = width/2;
  y = height - pSize/2;
}

void draw() {
  background(0);
  text(frameRate, 20, 50);
  if (playing) {
    for (int i = 0; i < speed; i ++) {
      predictMove();
      stroke(255);
      noFill();
      ellipse(x, y, visionField*2, visionField*2);
      noStroke();
      fill(0, 0, 255);
      x = constrain(x, pSize/2, width - pSize/2);
      rect(x, y, pSize, pSize);
      image(player, x, y, pSize, pSize);
    }
    for (int i = 0; i < Blocks.size(); i++) {
      Blocks.get(i).update();
      Blocks.get(i).show(x, y);
      if (Blocks.get(i).isTouching(x, pSize)) {
        println("Game Over, your score is " + str(score) + " points" );
        playing = false;
      }
    }
  }
  score++;
}

//void keyPressed() {
//  if (key == CODED) {
//    if (keyCode == LEFT) {
//      left(20.0);
//    } else if (keyCode == RIGHT) {
//      right(20.0);
//    }
//  } else {
//    println("nothing");
//  }
//}

void predictMove() {
  float dist = 100000.0;
  int index = 0;
  for (int i = 0; i < Blocks.size(); i++) {
    Blocks.get(i).selected = false;
    if (dist(x, y, Blocks.get(i).x, Blocks.get(i).y) < dist && abs(Blocks.get(i).x - x) < Blocks.get(i).r/2 + pSize/2 + 1) {
      dist = dist(x, y, Blocks.get(i).x + Blocks.get(i).distDir(x), Blocks.get(i).y + Blocks.get(i).r/2);
      index = i;
    }
  }
  Blocks.get(index).selected = true;
  visionField = mVisionField * map(dist(x, 0, width/2, 0), 0, width/2, 1, 0.5); 
  if (dist < visionField) {
    //println("smth in");
    //background(0, 255, 0);
    if (Blocks.get(index).x < x) {
      right(1.0);
      //println("right");
    }
    if (Blocks.get(index).x > x) {
      left(1.0);
      //println("left");
    }
  } else {
    if (x > width/2 + 20) left(1.0);
    else if (x < width/2 - 20) right(1.0);
  }
}
void left(float prc) {
  x -= vx * prc;
}
void right(float prc) {
  x += vx * prc;
}
