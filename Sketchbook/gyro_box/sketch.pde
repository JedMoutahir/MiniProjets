import android.content.Context; 
import android.hardware.Sensor; 
import android.hardware.SensorManager; 
import android.hardware.SensorEvent; 
import android.hardware.SensorEventListener; 
Context context; 
SensorManager manager; 
Sensor sensor; 
AccelerometerListener listener; 
float ax, ay, az, vx, vy, vz, x, y, z; 
float speed = 1;
float demp = 0.5;
float r = 10;
void setup() { 
  fullScreen(P3D); 
  noStroke();
  x = width/2;
  y = height/2;
  z = width/2;
  vx = 0;
  vy = 0;
  vz = 0;
  context = getActivity(); 
    
    manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE); 
    
    sensor = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER); 
    
    listener = new AccelerometerListener(); 
    
    manager.registerListener(listener,  sensor,  SensorManager.SENSOR_DELAY_GAME); 
       
    textFont(createFont("SansSerif", 30 * displayDensity));
} 
void draw() { 
  if (!mousePressed)background(0); 
  vx += -ax/speed;
  vy+= ay/speed;
  vz += -az/speed;
  //vx = constrain(vx, -30, 30);
  //vy = constrain(vy, -30, 30);
  //vz = constrain(vz, -30, 30);
  x += vx;
  y += vy;
  z += vz;
  if (x<r || x>width-r)vx=-vx*demp;
  if (y<r || y>height-r)vy=-vy*demp;
  if (z<r-width || z>-r)vz=-vz*demp;
  x = constrain(x, r, width-r);
  y = constrain(y, r, height-r);
  z = constrain(z, r-width, -r);
  stroke(255);
  noFill();
  line(0,0,0,width,0,0);
  line(0,0,0,0,height,0);
  line(width,0,0,width,height,0);
  line(0,height,0,width,height,0);
  line(0,0,-width,width,0,-width);
  line(0,0,-width,0,height,-width);
  line(width,0,-width,width,height,-width);
  line(0,height,-width,width,height,-width);
  line(0,0,0,0,0,-width);
  line(width,0,0,width,0,-width);
  line(0,height,0,0,height,-width);
  line(width,height,0,width,height,-width);
  stroke(255,100);
  line(0,0,0,x,y,z);
  line(width,0,0,x,y,z);
  line(0,height,0,x,y,z);
  line(width,height,0,x,y,z);
  line(0,0,-width,x,y,z);
  line(width,0,-width,x,y,z);
  line(0,height,-width,x,y,z);
  line(width,height,-width,x,y,z);
  noStroke();
  fill(255);
  translate (x,y,z);
  sphere(r*2);
  //ellipse(x, y, 100, 100);
  //text("X: " + ax + "\nY: " + ay + "\nZ: " + az + "\ntot: " + (abs(ax)+abs(ay)+abs(az)), 0, 0, width, height);
} 
class AccelerometerListener implements SensorEventListener { 
    
    public void onSensorChanged(SensorEvent event) { 
        
      ax = event.values[0]; 
        
      ay = event.values[1]; 
        
      az = event.values[2];
           
  } 
    
    public void onAccuracyChanged(Sensor sensor, int accuracy) { 
      
  }
}
