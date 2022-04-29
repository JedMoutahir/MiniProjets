void track(){
  float X,Y;
  boolean bugg=false;
  float bug = random(0,100);
  if(bug<10){
    bugg = true;
  } else{
    bugg = false;
  }
  if(bugg){
    X = random(mouseX-200, mouseX+200);
    Y = random(mouseY-200, mouseY+200);
    if(mousePressed){
      background(20,55,20);
    }
  } else {
    X = mouseX;
    Y = mouseY;
  }
  float c = random(-5,5);
  stroke(random(100,255));
  strokeWeight(2);
  fill(0,random(150,255),random(150,255),50);
  if(mousePressed){
    line(0+c,0, X, Y);
    line(width,0+c, X, Y);
    line(width+c,height, X, Y);
    line(0,height+c, X, Y);
    line(width/2+c,0, X, Y);
    line(0,height/2+c, X, Y);
    line(width,height/2+c, X, Y);
    line(width/2+c,height, X, Y);
    ellipse(X, Y, r, r);
    ellipse(X, Y,random(200,300),random(200,300));
    ellipse(X, Y,random(400,500),random(400,500));
    //ellipse(X, Y,random(600,700),random(600,700));
  }
}