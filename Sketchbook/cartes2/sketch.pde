int numCard = 52;
int cSup, cInf, nbTours = 0;
boolean fin = false;
IntList jA = new IntList();
IntList jB = new IntList();
IntList jeuCartes = new IntList();
void setup() {
  size(1000, 1000);
  textSize(40);
  fin = false;
  background(0, 0, 255);
}
void draw() {
  if (mousePressed && !fin) {
    background(0);
    
    creation();
    distribution();
    playGame();
    gagnant();
    
    fin = true;
    println("fin du jeu le joueur A a " + jA.size() + " et le B a " + jB.size() );
  }
}
