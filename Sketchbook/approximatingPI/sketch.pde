int a = 1;
double p = 0;
double sum = 1;
double c = -1;
int speed = 50;

void setup(){
  size(1000, 1700);
  textSize(50);
  nf(1,10);
}

void draw(){
  background(0);
  for(int i = 0 ; i < speed ; i++){
  sum += c / (2*a +1);
  p = 4 * sum;
  c = -c;
  a++;
  }
  println(PI, p);
  String pi = nf((float)p, 1, 20);
  String Pi = nf(PI, 1, 20);
  text(millis()/60000 + " min " + "iterations : " + a, 10, 100);
  text("approx : " + pi, 10, height/2);
  text("PI : " + Pi, 10, height/3);
  text("frameRate : " + (int)frameRate + " frame/sec", 10, height-200);
  text("speed : " + speed + " iter/frame", 10, height-100);
  text("SPEED : " + (int)frameRate*speed/1000 + " Kiter/sec", 10, height-300);
  if(frameRate < 25) speed -= log(a);
  else speed += log(a);
}