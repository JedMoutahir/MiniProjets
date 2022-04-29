float g = 0.99;
float px2 = -1;
float py2 = -1;
float cx, cy;
PGraphics canvas;
ArrayList<doublePendule> d = new ArrayList<doublePendule>();
int numD = 20;
float change = 0.001;
void setup() {
  size(1000, 1700);
  cx = width/2;
  cy = height/2;
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
  for (int i = 0; i < numD; i++) {
    d.add(new doublePendule(400+i*change, 250+i*change, 400+i*change, 250+i*change, width/2, height/2, 0, 0, HALF_PI, PI, 0, 0, (float) 255.0/numD*(numD-i)));
  }
}


void draw() {
  background(255);
  imageMode(CORNER);
  image(canvas, 0, 0, width, height);
  translate(0, -height/3);
  fill(0);
  textSize(50);
  text("change =" + str(change), 10,height/2);
  for (int i = 0; i < numD; i++) {
    d.get(i).show();
    d.get(i).update();
  }
}
