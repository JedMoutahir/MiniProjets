void nextGeneration()
{
  Gens++;
  println("Generation "+ Gens);
  calculateFitness();
  for (int i = 0; i < TOTAL; i++)
  {
    population.add(pickOne());
  }
  saved.clear();
}

Player pickOne() {
  int index = 0;
  float r = random(1);
  while (r > 0 && index < saved.size()) 
  {
    r -= saved.get(index).fitness;
    index++;
  }
  index--;
  Player b = saved.get(index);
  Player child = new Player(b.brain);
  child.mutate();
  return child;
}

void calculateFitness()
{
  float sum = 0;
  for (Player p : saved)
  {
    sum += p.score;
  }

  for (Player p : saved)
  {
    p.fitness = p.score/sum;
  }
}
