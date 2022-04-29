class Particle { 
  float x, y, z, xs, ys, zs, xspeed, yspeed, zspeed = 0;
  float maxS = 5;
  Particle (float xb, float yb, float zb) {  
    x = xb;
    y = yb;
    z = zb;
    xs = xb;
    ys = yb;
    zs = zb;
  } 
  void update(float ax, float ay, float az, float dt) { 
    xspeed += ax;
    yspeed += ay;
    zspeed += az;
    if(abs(xspeed) > maxS) xspeed = xspeed/abs(xspeed) * maxS;
    if(abs(yspeed) > maxS) yspeed = yspeed/abs(yspeed) * maxS;
    if(abs(zspeed) > maxS) zspeed = zspeed/abs(zspeed) * maxS;
    x += xspeed;
    y += yspeed;
    z += zspeed;
    if(x < 0){ x = xs; xspeed = 0; y = ys; yspeed = 0; z = zs; zspeed = 0;}
    if(x > width){ x = xs; xspeed = 0; y = ys; yspeed = 0; z = zs; zspeed = 0;}
    if(y < 0){ x = xs; xspeed = 0; y = ys; yspeed = 0; z = zs; zspeed = 0;}
    if(y > height){ x = xs; xspeed = 0; y = ys; yspeed = 0; z = zs; zspeed = 0;}
    if(z < 0){ x = xs; xspeed = 0; y = ys; yspeed = 0; z = zs; zspeed = 0;}
    if(z > width){ x = xs; xspeed = 0; y = ys; yspeed = 0; z = zs; zspeed = 0;}
    //println(ax, ay, xspeed, yspeed, x, y);
  }
  void show(){
    point(x,y,z);
  }
} 
