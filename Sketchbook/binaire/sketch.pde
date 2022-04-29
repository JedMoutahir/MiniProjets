int c = 0;
boolean vf;

void setup(){
  size(1000,1700);
  fill(255);
  textSize(80);
}
void draw(){
  background(0);
  text(c,100,850);
  text(binary(c,16),100,1000);
  println(binary(c,16));
  if(mousePressed){
  c++;
  }
  bouton();
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
    c = c - 2;
  }
  rect(200,200,200,200);
}