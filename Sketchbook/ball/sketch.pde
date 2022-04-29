int xglob, yglob, x, y;
void setup(){
  fullScreen(OPENGL);
  xglob = width/2;
  yglob = height;
  fill(255);
}
void draw(){
  background(0);
  display();
  move();
  }
  void display(){
    x = xglob;
    y = yglob;
    ellipse(x,y,100,100);
  }
  void move(){
   if (xmove() == 1){
     xglob -= 10;
   }else if (xmove() == 2){
     xglob += 10;
   }
   println(xmove());
   if (ymove() > 0){
     yglob -= 10;
   }else if (ymove() == 1){
     yglob += 10;
   }
   println(ymove());
}
int xmove(){
  if (xglob == width){
    return 1;
  }else {
  // if (xglob <= 0){
    return 2;
  }
}
int ymove(){
  if (yglob == height){
    return 1;
  }else {
  // if (yglob <= 0){
    return 2;
  }
}
