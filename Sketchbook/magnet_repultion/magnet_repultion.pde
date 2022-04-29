ArrayList<Magnet> M = new ArrayList<Magnet>();
float g = 9.81;
float F = 0.005;
void setup() {
  fullScreen();
  background(0);
  rectMode(CENTER);
  fill(255);
  M.add(new Magnet(100, 0.1, 100, false));
  M.add(new Magnet(height, 0.1, 1000, true));
  M.add(new Magnet(0, 0.1, 1000, true));
}

void draw() {
  background(0);
  if(mousePressed) g = -9.81;
  else g = 9.81;
  stroke(255);
  strokeWeight(10);
  line(width/2 - 40,0,width/2 - 40,height);
  line(width/2 + 40,0,width/2 + 40,height);
  stroke(150);
  strokeWeight(1);
  for (int i = 0 ; i < M.size() ; i++){
    float force = 0;
    for (int j = 0 ; j < M.size() ; j++){
      if (i!=j){
        force += M.get(j).forceExerced(M.get(i).y, M.get(i).t);
      }
      }
    M.get(i).update(force);
    M.get(i).show();
  }
}
