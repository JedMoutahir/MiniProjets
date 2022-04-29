void rectangle(float x, float y, float taille, float max, float r) {
  if (taille >= max) {
    rectangle(x + taille / 2 * (r-1), y + taille/2 * (r+1), taille * r, max, r);
    rectangle(x + taille / 2 * (-r-1), y + taille/2 * (r-1), taille * r, max, r);
    rectangle(x + taille / 2 * (r+1), y + taille/2 * (-r+1), taille * r, max, r);
    rectangle(x + taille / 2 * (-r+1), y + taille/2 * (-r-1), taille * r, max, r);
  }
  translate(x, y, 0);
  box(taille);
  translate(-x, -y, 0);
}

int sens = 1;

void update_thickness() {
  if (thick > 0.5 || thick < 0.1 && size < height/6) {
    sens = -sens;
    //thick = 0.1;
    //size = height/6;
  }
  thick += 0.005 * sens;
  size += (height/6)/((0.5-0.1)/0.005) * sens;
}