class Block {

  float xr, yr, tr;
  int hitcounter = 0, life, coul = 255;
  boolean touched = false;
  Block(float x, float y, int l) {
    xr = x;
    yr = y;
    tr = 100;
    life = l;
  }

  void display() {
      fill(255, 0, 0, 150);
      rect(xr, yr, tr, tr);
      textSize(70);
      textMode(CENTER);
      fill(coul, coul-coul/2, 0);
      text(life, xr-tr/4, yr+tr/4);
  }

  void dead(){
    life -= 1;
    println(life);
    if(life == 0){
      coul = 0;
    }
    
  }

  void update() {
  }
}
