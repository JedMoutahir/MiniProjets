void setup(){
  fullScreen();
  textSize(300);
  
}

void draw(){
  background(0);
  fill(255);
  if(mousePressed) fill(255,0,0);
  text("Jami !", 0, height/2);
}