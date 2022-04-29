boolean vf;
void setup() {
  size(1000,1700);
  strokeWeight(20);
  stroke(255);
  textSize(30);
  fill(0,0,255);
  background(0);
}

void draw() {
  rect(20,20,50,50);
  line(0,850,1000,850);
  text("EFFACER",100,40);
  if (mouseX<70 && mouseX>20 && mouseY<70 && mouseY>20 && mousePressed) {
    vf = true;
  }
  else {
    vf = false;
  }
  
  if (vf == true) {
    background(0);
  }
  else {
    if (mousePressed) {
    line(pmouseX, pmouseY, mouseX, mouseY);
    line(mouseX, mouseY+850, pmouseX, pmouseY+850);
    }
  }
  rect(20,20,50,50);
  line(0,850,1000,850);
  text("EFFACER",100,40);
}