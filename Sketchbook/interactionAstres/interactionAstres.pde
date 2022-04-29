ArrayList<StellarObject> S = new ArrayList<StellarObject>();


int numS = 30;
void setup() {
  size(700, 700);
  //fullScreen();
  background(0);
  //S.add(new StellarObject(width/2, height/4, 500*(numS-1), true));
  //S.add(new StellarObject(width/2, 3*height/4, 500*(numS-1), true));
  for (int i = 0; i < numS; i++) {
    S.add(new StellarObject(random(50 - width/2, width/2 - 50), random(50 - height/2, height/2 - 50), random(100, 8000), false));
  }
  println("Stellar Objects created");
}

void draw() {
  if (!mousePressed) background(0);
  //ellipse(0,0,5,5);

  // if (mousePressed) S.add(new StellarObject(mouseX, mouseY, random(10, 2000), false));
  int iHeaviest = 0;
  float mMax = S.get(iHeaviest).m;
  for (int i = 0; i < S.size(); i ++) {
    if (S.get(i).m > mMax) {
      mMax = S.get(i).m;
      iHeaviest = i;
    }
  }
  translate(width/2, height/2);

  float cx = 0;//S.get(iHeaviest).x;
  float cy = 0;//S.get(iHeaviest).y;
  float mL = 1;
  
  for (int i = 0; i < S.size(); i++) {
    if (S.get(i).x < cx - width/2 && (cx + width/2)/(cx - S.get(i).x) < mL) {
      mL = (cx + width/2)/(cx - S.get(i).x);
    } else if (S.get(i).x > cx + width/2 && (cx - width/2)/(cx - S.get(i).x) < mL) {
      mL = (cx - width/2)/(cx - S.get(i).x);
    }
    if (S.get(i).y < cy - height/2 && (cy + height/2)/(cy - S.get(i).y) < mL) {
      mL = (cy + height/2)/(cy - S.get(i).y);
    } else if (S.get(i).y > cy + height/2 && (cy - height/2)/(cy - S.get(i).y) < mL) {
      mL = (cy - height/2)/(cy - S.get(i).y);
    }
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
        if (dist(S.get(i).x, S.get(i).y, S.get(j).x, S.get(j).y)*2 < S.get(i).diam + S.get(j).diam) {
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
      S.get(i).show(cx, cy, mL);
      if (dist(S.get(i).x, S.get(i).y, cx, cy) > 2000) S.remove(i);
    }
    //println(S.get(i).x, S.get(i).y);
  }

  text(mL, 10 - width/2, 10 - height/2);
  if (S.size() == 1) {
    S.remove(0);
    for (int i = 0; i < numS; i++) {
      S.add(new StellarObject(random(50 - width/2, width/2 - 50), random(50 - height/2, height/2 - 50), random(10, 2000), false));
    }
  }
}
