ArrayList<particule> p = new ArrayList<particule>();
int nbparticules = 1000;
float taille = 100;
void setup() {
  //size(600, 600);
  fullScreen();
  background(0);
  fill(255);
  noStroke();
  for (int i = 0; i < nbparticules; i++) {
    p.add(new particule(width/2, height/2, taille, taille/2));
    p.get(i).display();
  }
}

void draw() {
  background(0);
  //translate(width/2, height/2);
  ellipse(0, 0, 5, 5);
  Display();
}

void Display() {
  for (particule part : p) {
    part.display();
    part.update();
  }
}
