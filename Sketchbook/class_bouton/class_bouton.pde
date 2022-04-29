button btn1;
button btn2;
void setup() {
  size (1000, 1000);
  fill(0);
  background(255);
  btn1 = new button(100, 100, width/2, height/2);
  btn2 = new button(20, 300, width/4, height/2);
}

void draw() {
  background(255);
  btn1.display();
  btn2.display();
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
      background(0);
    }
  }
  boolean pressed() {
    if (mousePressed && mouseX<locX+xSize/2 && mouseX>locX-xSize/2 && mouseY<locY+ySize/2 && mouseY>locY-ySize/2) {
      return true;
    } else return false;
  }
}