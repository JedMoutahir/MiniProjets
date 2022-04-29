int numCard = 100;
int cSup, cInf, ptsA, ptsB, nbTours = 0;
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
    for (int i=0; i<=numCard-1; i++) {
      jeuCartes.append(i+1);
      println("création du packet : " + (i+1) + " cartes");
    }
    while (jeuCartes.size()>0) {
      background(0);
      int choix = int(random(0, jeuCartes.size()));
      jA.append(jeuCartes.get(choix));
      jeuCartes.remove(choix);
      choix = int(random(0, jeuCartes.size()));
      jB.append(jeuCartes.get(choix));
      jeuCartes.remove(choix);
      println("distribution " + jA.size() +" "+ jeuCartes.size());
      text("distribution des cartes en cours...", 0, height/2);
    }
    while (jA.size()>0 && jB.size()>0) {
      if (jA.get(0)>jB.get(0)) {
        cSup = jA.get(0);
        cInf = jB.get(0);
        jA.append(jB.get(0));
        jA.append(jA.get(0));
        jA.remove(0);
        jB.remove(0);
        background(0);
        println("joueur A gagne avec " + cSup + " contre " + cInf);
        text("joueur A avec " + cSup + " contre " + cInf, 0, height/4);
        ptsA ++;
        nbTours ++;
      } else {
        cSup = jB.get(0);
        cInf = jA.get(0);
        jB.append(jA.get(0));
        jB.append(jB.get(0));
        jB.remove(0);
        jA.remove(0);
        background(0);
        println("joueur B gagne avec " + cSup + " contre " + cInf);
        text("joueur B avec " + cSup + " contre " + cInf, 0, height/4);
        ptsB ++;
        nbTours ++;
      }
    }
    if (jA.size()<1) {
      background(0);
      println("le joueur B a gagné en " + nbTours + " tours");
      text("le joueur B a gagné en " + nbTours + " tours", 0, height/2);
    } else {
      background(0);
      println("le joueur A a gagné en " + nbTours + " tours");
      text("le joueur A a gagné en " + nbTours + " tours", 0, height/2);
    }
    fin = true;
    println("fin du jeu le joueur A a " + ptsA + " et le B a " + ptsB );
    println("différence points : " + abs(ptsA-ptsB));
  }
}
