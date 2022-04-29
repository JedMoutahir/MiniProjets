var maVideo;

function setup() {
  createCanvas(800, 600);
  maVideo=createCapture();
  maVideo.hide();
}

function draw() {
  background(255);
  image(maVideo);
}
