class Player {
  PVector pos, vel;
  float pSize = 10;
  float mVisionField = 200;
  int numChampVision = 4;
  float visionField = mVisionField;
  boolean alive = true;
  float[] inputs = new float[2+3*numChampVision];
  float score = 0;
  float fitness = 0;
  float d = pSize *2;
  float mAcc = 100;
  float mVel = 100;
  NeuralNetwork brain;

  Player() {
    sprite = loadImage("player.png");
    sprite.resize(int(d), int(d));
    pos = new PVector(width/2, height-pSize);
    vel = new PVector();
    score = 0;
    fitness = 0;
    brain = new NeuralNetwork(2+3*numChampVision, 4, 1);
  }

  Player(NeuralNetwork b) {
    pos = new PVector(width/2, height-pSize);
    vel = new PVector();
    score = 0;
    fitness = 0;
    brain = b.copy();
  }

  void mutate() {
    brain.mutate(0.05);
  }

  void show() {
    stroke(255);
    fill(255, 100);
    //rect(pos.x, pos.y, pSize, pSize);
    image(sprite, pos.x, pos.y);
  }
  void update() {
    score++;
    pos.add(vel);
  }



  void move(float v) {
    vel = new PVector(constrain(v,-mVel, mVel), 0);
    pos.add(vel);
  }

  boolean dead() {
    return (pos.x+pSize > height || pos.x < pSize);
  }

  void think(ArrayList<Block> blocks) {
    ArrayList<Block> closests = new ArrayList<Block>();

    float previousRecordD = 0;

    for (int n  = 0; n < numChampVision; n++) {
      Block closest = null;
      float recordD = Float.POSITIVE_INFINITY;
      for (int i = 0; i < blocks.size(); i++) {
        Block p = blocks.get(i);
        float d = 0;
        //if (p.x - p.r > pos.x + pSize) {
        //  d = abs((p.x-p.r) - (pos.x+pSize/2));
        //} else if (p.x + p.r < pos.x-pSize) {
        //  d = abs((p.x+p.r) - (pos.x-pSize/2));
        //} else {
        //  d = -abs(p.x - pos.x);
        //}
        d = dist(p.x, p.y, pos.x, pos.y);
        if (d < recordD && d > previousRecordD) {
          closest = blocks.get(i);
          recordD = d;
        }
      }

      previousRecordD = recordD;
      closests.add(closest);
    }
    inputs[0] = pos.x / width;
    inputs[1] = vel.x / 1000;
    //println(vel.x);
    for ( int i = 0; i < numChampVision; i++) {
      inputs[2+3*i] = closests.get(i).x / width;  
      inputs[3+3*i] = closests.get(i).y / height;
      inputs[4+3*i] = closests.get(i).vy / 100;
    }
    float[] guess = brain.feedforward(inputs);
    move(map(guess[0], 0, 1, -mAcc, mAcc));
    //println(guess[0]);
    //if (guess[0] > 0.5) {
    //  move(1);
    //} else {
    //  move(-1);
    //}
  }
}
