import processing.video.*;
import peasy.*;

//PeasyCam camera;
Capture cam;

int scale = 3;
int scl = int(scale*0.75);
int cols, rows;

void setup() {
  size(640, 640, P3D);
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

    //camera = new PeasyCam(this, 500);
    strokeWeight(10);
    stroke(255);
  }

  fill(255);
  textSize(scale);
}

void draw() {
  translate(-width/2, -height/2);
  background (0);
  textSize(scale);
  if (cam.available() == true) {
    cam.read();
  }
  cam.loadPixels();

  background(0);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      //rect(i*scale,j*scale,scale,scale);
      point(i*scl, j*scl, h(i, j));
      //println(h(i,j));
    }
  }
  //noLoop();
  textSize(20);
  text(frameRate, 50, height - 40);
}

float h(int xi, int yi) {
  println(cam.pixels[xi*scl + cam.width*yi*scl]);

  return map(blue(cam.pixels[xi*scl + cam.width*yi*scl]), 0, 255, 0, 500);
}
