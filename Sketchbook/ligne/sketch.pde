float a, e, y, x;
int i=0;
void setup() {
  size(1000, 1700);
  textSize(50);
  background(0);
  strokeWeight(10);
  x = 0;
  y = 0;
  a = 0;
  e = 0;
}
void draw() {
  for (int j=0 ; j<random(100,500) ; j++){
  float c1 = random(0, 255);
  float c2 = random(0, 255);
  float c3 = random(0, 255);
  stroke(c1, c2, c3);
  x = random(width);
  y = random(height);
  a = random(width);
  e = random(height);
  line(x, y, a, e);
  fill(0);
  rect(10, 10, 300, 100);
  fill(255);
  text(i, 40, 60);
  i++;
  }
}
