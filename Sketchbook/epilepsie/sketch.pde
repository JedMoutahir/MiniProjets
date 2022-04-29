float R,G,B;
int l = 200;
void setup() {
  fullScreen(OPENGL);
  orientation (PORTRAIT);
  background(0);
  strokeWeight(2);
}

void draw() {
  if (mousePressed){
    for (int y = 0; y < height; y = y + l) {
    for (int x = 0; x < width; x = x + l) {
      rect(x,y,l,l);
      }
  }
  }
  else{
  for (int y = 0; y < height; y = y + l) {
    for (int x = 0; x < width; x = x + l) {
      R = random(255);
      G = random(255);
      B = random(255);
      fill(R,G,B);
      rect(x,y,l,l);
      }
  }
  }
}