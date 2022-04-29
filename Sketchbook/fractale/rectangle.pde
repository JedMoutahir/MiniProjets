void rectangle(float x, float y, float taille, float max, float r) {
  if (taille >= max) {
    rectangle(x + taille / 2 * (r-1), y + taille/2 * (r+1), taille * r, max, r);
    rectangle(x + taille / 2 * (-r-1), y + taille/2 * (r-1), taille * r, max, r);
    rectangle(x + taille / 2 * (r+1), y + taille/2 * (-r+1), taille * r, max, r);
    rectangle(x + taille / 2 * (-r+1), y + taille/2 * (-r-1), taille * r, max, r);
  }
  rect(x, y, taille, taille);
}

void update_thickness(){
  if(thick > 0.5){
    thick = 0.1;
    size = width/6;
  }
  thick += 0.005;
  size += (width/6)/((0.5-0.1)/0.005);
}