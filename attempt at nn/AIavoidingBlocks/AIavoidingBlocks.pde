PImage sprite;
int numBlock = 30;
ArrayList<Block> blocks = new ArrayList<Block>();
ArrayList<Player> population, saved;
float TOTAL;
int Gens;
float counter;
float bestscore = 0;
PImage back;
int speedLearning = 1;
boolean faster = true;

Player best;

void setup() {
  fullScreen();
  //size(700, 700);
  rectMode(CENTER);
  imageMode(CENTER);
  background(0);
  stroke(255);
  //noStroke();
  fill(255);
  back = loadImage("background.png");
  back.resize(width*2, height*2);
  TOTAL = 500;
  population = new ArrayList<Player>();
  saved = new ArrayList<Player>();
  best = new Player();
  for (int i = 0; i < TOTAL; i++)
  {
    population.add(new Player());
  }
  for (int i = 0; i < numBlock; i++) {
    blocks.add(new Block(random(width), false));
  }
  counter = 0;
  blocks.add(new Block(10, true));
  blocks.add(new Block(width - 10, true));
}

void draw() {
  background(51);
  image(back, 0, 0);
  if (mousePressed) faster = !faster;
  if (faster) {
    speedLearning = 50;
  } else {
    speedLearning = 1;
  }
  for (int s  = 0; s < speedLearning; s++) {
    for (int i = blocks.size()-1; i > -1; i--) {
      Block b = blocks.get(i);
      b.update();

      for (int j = population.size()-1; j >= 0; j--) {
        Player pl = population.get(j);
        if (b.isTouching(pl.pos.x, pl.pSize) || pl.dead()) {
          saved.add(pl);
          population.remove(j);
        }
      }
    }

    if (population.size() == 0) {
      counter = 0;
      nextGeneration();
    }

    for (Player p : population) {
      p.update();
      p.think(blocks);
      if (p.score > bestscore) {
        bestscore = p.score; 
        best = p;
      }
    }


    counter++;
  }

  for (int i = blocks.size()-1; i > -1; i--) {
    blocks.get(i).show();
  }

  for (Player p : population) {
    p.show();
  }
  
  fill(255);
  stroke(255);
  text("population size: " + population.size(), 25, 25);
  text("best score so far: " + int(bestscore), 25, 50);
  text("generation: " + (Gens+1), 25, 75);
  //text(bestscore, 100, 100);
}
