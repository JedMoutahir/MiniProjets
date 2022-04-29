int taille = 20;
int x = 0,y = 0;
int ctr = 0;
void setup() {
  fullScreen();
  background(0,255,0);
  textSize(taille);
  fill(255,0,0);
}

String randPar() {
  int r = int(random(0, 2));
  if (r==0) {
    return "/";
  } else if (r==1) {
    return "\";
  } else if (r==3){
    return "¶";
  } else {
    return "∆";
  }
}

int nextA(int a){
  for (int i = 0; i < height; i += taille) {
      if(i>a){
        a = i;
        break;
      }
  }
  return a;
}

int nextB(int b){
  for (int j = 0; j < width; j += taille) {
      if(j>b){
        b = j;
        if(b>=width){
          b = 0;
        }
        break;
      }
  }
  return b;
}


void update(){
  
  x = nextB(x);
  y = nextA(y);
  
}

void draw() {
  //background(0);
  //frameRate(2);
      String carac = randPar();
      fill(0);
      rect(x,y,taille,taille);
      fill(255,0,0);
      text(carac, x, y);
      println(carac);
      update();
}
