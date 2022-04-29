int r = 200;
void setup(){
  stroke(random(100,255));
  strokeWeight(2);
  fill(0,random(150,255),random(150,255),50);
}
void draw(){
  float c = random(-10,10);
  background(0);
  stroke(random(100,255));
  strokeWeight(2);
  fill(0,random(150,255),random(150,255),50);
  if(mousePressed){
    line(0,0,mouseX,mouseY);
    line(width,0,mouseX,mouseY);
    line(width,height,mouseX,mouseY);
    line(0,height,mouseX,mouseY);
    line(width/2+c,0,mouseX,mouseY);
    line(0,height/2+c,mouseX,mouseY);
    line(width,height/2+c,mouseX,mouseY);
    line(width/2+c,height,mouseX,mouseY);
    ellipse(mouseX,mouseY,r,r);
  }
}