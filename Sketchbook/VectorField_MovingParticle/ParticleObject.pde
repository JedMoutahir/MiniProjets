class Particle { 
  float x, y, xs, ys, xspeed, yspeed = 0;
  float maxS = 5;
  Particle (float xb, float yb) {  
    x = xb;
    y = yb;
    xs = xb;
    ys = yb;
  } 
  void update(float ax, float ay, float dt) { 
    xspeed += ax;
    yspeed += ay;
    if(abs(xspeed) > maxS) xspeed = xspeed/abs(xspeed) * maxS;
    if(abs(yspeed) > maxS) yspeed = yspeed/abs(yspeed) * maxS;
    x += xspeed;
    y += yspeed;
    if(x < 0){ x = xs; xspeed = 0; y = ys; yspeed = 0;}
    if(x > width){ x = xs; xspeed = 0; y = ys; yspeed = 0;}
    if(y < 0){ x = xs; xspeed = 0; y = ys; yspeed = 0;}
    if(y > height){ x = xs; xspeed = 0; y = ys; yspeed = 0;}
    
    //println(ax, ay, xspeed, yspeed, x, y);
  }
  void show(){
    point(x,y);
  }
} 
