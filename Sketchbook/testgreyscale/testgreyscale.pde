import processing.video.*;

Capture cam;

int scale = 3;
int scl = int(scale*0.75);
int cols, rows;

void setup() {
  size(640, 640);
  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }

    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start(); 

    cols = int(width/scale);
    rows = int(height/scale);
  }

  fill(255);
  textSize(scale);
}

void draw() {
  textSize(scale);
  if (cam.available() == true) {
    cam.read();
  }
  cam.loadPixels();

  background(0);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      //rect(i*scale,j*scale,scale,scale);
      text(carac(i, j), i*scl, j*scl);
    }
  }
  //noLoop();
  textSize(20);
  text(frameRate, 50, height - 40);
}

char carac(int xi, int yi) {
  String list = " .:-=+*#%@";

  char s = 0;
  if (xi*scl + cam.width*yi*scl < cam.pixels.length) {
    s = list.charAt(int(map(red(cam.pixels[xi*scl + cam.width*yi*scl]), 0, 255, 0, list.length() -1)));
  }
  return s;
}

int moy(int x, int y) {
  int col = 0;




  return col;
}
