float initC = 200;
float c = initC;
float angle = 0;
float incr = 0.01;
float zoom = 1000;

void setup() {
  fullScreen(P3D);
  camera(-zoom, -zoom, -zoom, 0, 0, 0, 0, 1.0, 0);
  background(0);
  fill(255);
  strokeWeight(2*initC/100);
  stroke(255);
  //noStroke();
}

void draw() {
  background(0);
  //translate(width/2, height/2, 0);

  for (int i = 0; i < width/c; i++) {
    for (int j = 0; j < width/c; j++) {
      for (int k = 0; k < width/c; k++) {
        //fill(sin(i)*125 + 125 + (sin(millis()/500) * 60), i%(j+1) * 10 + (sin(millis()/500) * 60), cos(i+j)*125 + 125 + (sin(millis()/500) * 60));
        fill(sin(i + (((float) millis()/500)))*125 + 125, i%(j+1 + (((float) millis()/500))) * 10, cos(i+j + ((float) millis()/500))*125 + 125);
        translate(i*1.5*c, j*1.5*c, k*1.5*c);
        rotateY(-angle*sin(i+j));
        rotateX(angle*cos(i+j));
        //rotateZ(angle);

        //c += random(-0.01, 0.01);
        //c = constrain(c, initC -15, initC + 15);

        box(c);
        //tetraedre();
        
        //rotateZ(-angle);
        rotateX(-angle*cos(i+j));
        rotateY(angle*sin(i+j));

        translate(-i*1.5*c, -j*1.5*c, -k*1.5*c);
      }
    }
  }
  if(! mousePressed) angle+=incr;
}

void tetraedre (){
  c /= 1.5;
        beginShape(); 
        vertex(-c, -c, -c); 
        vertex( c, -c, -c); 
        vertex( 0, 0, c ); 
        vertex( c, -c, -c); 
        vertex( c, c, -c ); 
        vertex( 0, 0, c); 
        vertex( c, c, -c); 
        vertex(-c, c, -c); 
        vertex( 0, 0, c); 
        vertex(-c, c, -c); 
        vertex(-c, -c, -c); 
        vertex( 0, 0, c); 
        endShape();
        c *= 1.5;
}