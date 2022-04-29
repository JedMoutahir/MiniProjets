boolean vf;
void setup(){
  size(1000,1700);
}

void bouton(){
  fill(255);
  rect(200,200,200,200);
  if (mouseX<400 && mouseX>200 && mouseY<400 && mouseY>200 && mousePressed){
    vf = true;
  }
  else {
    vf = false;
  }
  if (vf == true){
    background(0,0,255);
  }
  else {
    background(0);
  }
  rect(200,200,200,200);
}