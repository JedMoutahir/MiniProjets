
ArrayList<bird> population, saved;
ArrayList<pipe> pipes;
float TOTAL;
int Gens;
float counter;
float bestscore = 0;
PImage back;
PImage sprite;

bird best;
void setup()
{
  size(640, 480);
  back = loadImage("flapground.jpg");
  back.resize(width, height);
  TOTAL = 500;
  pipes = new ArrayList<pipe>();
  population = new ArrayList<bird>();
  saved = new ArrayList<bird>();
  best = new bird();
  for (int i = 0; i < TOTAL; i++)
  {
    population.add(new bird());
  }
  counter = 0;
}

void draw()
{
  background(51);
  image(back, 0, 0);
  if (counter % 75 == 0)
  {
    pipes.add(new pipe());
  }


  for (int i = pipes.size()-1; i > -1; i--)
  {
    pipe p = pipes.get(i);
    p.show();
    p.update();
    if (p.offscreen())
    {
      pipes.remove(i);
    }

    for (int j = population.size()-1; j >= 0; j--)
    {
      bird b = population.get(j);
      if (p.hit(b) || b.dead())
      {
        saved.add(b);
        population.remove(j);
      }
    }
  }

  if (population.size() == 0)
  {
    counter = 0;
    nextGeneration();
    pipes.clear();
    pipes.add(new pipe());
  }



  for (bird b : population)
  {
    b.show();
    b.update();
    b.think(pipes);
    if (b.score > bestscore)
    {
      bestscore = b.score; 
      best = b;
    }
  }
  fill(255);
  stroke(255);
  text("population size: " + population.size(), 25, 25);
  text("best score so far: " + int(bestscore), 25, 50);
  text("generation: " + (Gens+1), 25, 75);
  //text(bestscore, 100, 100);


  counter++;
}
