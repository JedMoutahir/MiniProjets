void playGame() {
  while (jA.size()>0 && jB.size()>0) {
    jAgagne();
    jBgagne();
    egalite();
  }
}
void gagnant() {
  if (jA.size()==0) {
    background(0);
    println("le joueur B a gagné en " + nbTours + " tours");
    text("le joueur B a gagné en " + nbTours + " tours", 0, height/2);
  } else if (jB.size() == 0) {
    background(0);
    println("le joueur A a gagné en " + nbTours + " tours");
    text("le joueur A a gagné en " + nbTours + " tours", 0, height/2);
  }
}
void jAgagne() {
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
    nbTours ++;
  }
}
void jBgagne() {
  if (jB.get(0)>jA.get(0)) {
    cSup = jB.get(0);
    cInf = jA.get(0);
    jB.append(jA.get(0));
    jB.append(jB.get(0));
    jB.remove(0);
    jA.remove(0);
    background(0);
    println("joueur B gagne avec " + cSup + " contre " + cInf);
    text("joueur B avec " + cSup + " contre " + cInf, 0, height/4);
    nbTours ++;
  }
}
void egalite() {
  int eg = 0;
  while(eg > -1){
    if(jA.get(eg+2 )> jB.get(eg+2)){
      range(eg,1);
      eg = -1;
    }
    if(jB.get(eg+2) > jA.get(eg+2)){
      range(eg,2);
      eg = -1;
    }
    if(jA.get(eg+2) == jB.get(eg+2)){
      eg=eg+2;
    }
  }
}
