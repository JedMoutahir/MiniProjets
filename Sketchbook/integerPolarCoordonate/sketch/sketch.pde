int max = 1000000;
float scl = max/1000.0;

void setup(){
  fullScreen();
  background(0);
  stroke(255);
  strokeWeight(2);
  translate(width/2, height/2);
  for(int i = 0; i < max; i++){
    float x = i*cos(i)/scl;
    float y = i*sin(i)/scl;
    point(x,y);
  }
}
