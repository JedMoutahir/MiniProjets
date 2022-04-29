void distribution() {
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
}
