void creation() {
  for (int i=0; i<=(numCard/4)-1; i++) {
    jeuCartes.append(i+1);
    jeuCartes.append(i+1);
    jeuCartes.append(i+1);
    jeuCartes.append(i+1);
    println("création du packet : " + (i+1) + " cartes");
  }
}
void range(int x, int g) {
  if(g==1){
    jA.append(jA.get(0));
    jA.append(jA.get(1));
    jA.append(jA.get(2));
    jA.remove(jA.get(0));
    jB.remove(jB.get(0));
    jA.remove(jA.get(1));
    jB.remove(jB.get(1));
    jA.remove(jA.get(2));
    jB.remove(jB.get(2));
  }
  if(g==2){
    jB.append(jB.get(0));
    jB.append(jB.get(1));
    jB.append(jB.get(2));
    jB.remove(jB.get(0));
    jA.remove(jA.get(0));
    jB.remove(jB.get(1));
    jA.remove(jA.get(1));
    jB.remove(jB.get(2));
    jA.remove(jA.get(2));
  }
  for (int i = 2; i<x+2; i++) {
    if (g==1) {
      jA.append(jA.get(i));
      jA.append(jB.get(i));
      jA.append(jA.get(i+1));
      jA.append(jB.get(i+1));
      jA.append(jA.get(i+2));
      jA.append(jB.get(i+2));
      jA.remove(jA.get(i));
      jB.remove(jB.get(i));
      jA.remove(jA.get(i+1));
      jB.remove(jB.get(i+1));
      jA.remove(jA.get(i+2));
      jB.remove(jB.get(i+2));
    }
    if (g==2) {
      jB.append(jB.get(i));
      jB.append(jA.get(i));
      jB.append(jB.get(i+1));
      jB.append(jA.get(i+1));
      jB.append(jB.get(i+2));
      jB.append(jA.get(i+2));
      jB.remove(jB.get(i));
      jA.remove(jA.get(i));
      jB.remove(jB.get(i+1));
      jA.remove(jA.get(i+1));
      jB.remove(jB.get(i+2));
      jA.remove(jA.get(i+2));
    }
  }
}
