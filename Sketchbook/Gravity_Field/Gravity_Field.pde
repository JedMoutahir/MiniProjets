ArrayList<StellarObject> S = new ArrayList<StellarObject>();


int numS = 10;

void setup() {
  //size(700, 700);
  fullScreen();
  background(0);
  //S.add(new StellarObject(width/2, height/4, 500*(numS-1), true));
  //S.add(new StellarObject(width/2, 3*height/4, 500*(numS-1), true));
  for (int i = 0; i < numS; i++) {
    S.add(new StellarObject(random(50, width - 50), random(50, height-50), random(10, 2000), false));
  }
  println("Stellar Objects created");
}

void draw() {
  if (!mousePressed) background(0);
  // if (mousePressed) S.add(new StellarObject(mouseX, mouseY, random(10, 2000), false));
  for (int n = 0; n< 10; n++) {
    for (int i = 0; i < S.size(); i++) {
      float fx = 0;
      float fy = 0;
      boolean fusion = false;
      for (int j = 0; j < S.size(); j++) {
        if (i != j && i < S.size() && j < S.size()) {
          if (S.get(i).x < S.get(j).x) {
            fx += S.get(i).forceExerced(S.get(j).x, S.get(j).y, S.get(j).m)*sqrt(dist(S.get(i).x, S.get(i).y, S.get(j).x, S.get(j).y)*dist(S.get(i).x, S.get(i).y, S.get(j).x, S.get(j).y) - abs(S.get(i).y - S.get(j).y)*abs(S.get(i).y - S.get(j).y));
          } else {
            fx -= S.get(i).forceExerced(S.get(j).x, S.get(j).y, S.get(j).m)*sqrt(dist(S.get(i).x, S.get(i).y, S.get(j).x, S.get(j).y)*dist(S.get(i).x, S.get(i).y, S.get(j).x, S.get(j).y) - abs(S.get(i).y - S.get(j).y)*abs(S.get(i).y - S.get(j).y));
          }
          if (S.get(i).y < S.get(j).y) {
            fy += S.get(i).forceExerced(S.get(j).x, S.get(j).y, S.get(j).m)*sqrt(dist(S.get(i).x, S.get(i).y, S.get(j).x, S.get(j).y)*dist(S.get(i).x, S.get(i).y, S.get(j).x, S.get(j).y) - abs(S.get(i).x - S.get(j).x)*abs(S.get(i).x - S.get(j).x));
          } else {
            fy -= S.get(i).forceExerced(S.get(j).x, S.get(j).y, S.get(j).m)*sqrt(dist(S.get(i).x, S.get(i).y, S.get(j).x, S.get(j).y)*dist(S.get(i).x, S.get(i).y, S.get(j).x, S.get(j).y) - abs(S.get(i).x - S.get(j).x)*abs(S.get(i).x - S.get(j).x));
          }
          if (dist(S.get(i).x, S.get(i).y, S.get(j).x, S.get(j).y) < 1) {
            println("fusion !!!");
            //background (255);
            fusion = true;
            if (S.get(i).m > S.get(j).m) {
              S.get(i).m += S.get(j).m;
              S.get(i).diam += S.get(j).diam/5;
              S.remove(j);
            } else {
              S.get(j).m += S.get(i).m;
              S.get(j).diam += S.get(i).diam/5;
              S.remove(i);
            }
            fx = 0;
            fy = 0;
          }
        }
      }
      if (!fusion) {
        S.get(i).update(fx, fy);
        S.get(i).show();
      }
      //println(S.get(i).x, S.get(i).y);
    }
  }
}
