button gauche;
button droite;
button tir;
boolean bp = false;
void setup() {
  fullScreen(OPENGL);
  background(255);
  translate(width/2, height/2);
  gauche = new button(300,200,width/4, height-200);
  droite = new button(300,200,3*width/4, height-200);
  tir = new button(200,200,width/2, height-200);
}
void draw() {
  background(255);
  gauche.display();
  droite.display();
  tir.display();
}

class button {
  int locX;
  int locY;
  int xSize;
  int ySize;
  button (int sizeX, int sizeY, int x, int y) {
    xSize = sizeX;
    ySize = sizeY;
    locX = x;
    locY = y;
  }
  void display() {
    rectMode(CENTER);
    rect(locX, locY, xSize, ySize);    
    if (pressed()) {
      //fait ce qu'il faut
      
    } else {
      
    }
  }
  boolean pressed() {
    if (mousePressed && mouseX<locX+xSize/2 && mouseX>locX-xSize/2 && mouseY<locY+ySize/2 && mouseY>locY-ySize/2) {
      return true;
    } else return false;
  }
}