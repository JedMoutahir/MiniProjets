Ball b;
Joueur j;
void setup() {
  size(700, 700);
  background(0);
  fill(255);
  b = new Ball();
  j = new Joueur();
}


void draw() {
  background(0);
  b.update();
  j.update();
  b.show();
  j.show();
}
