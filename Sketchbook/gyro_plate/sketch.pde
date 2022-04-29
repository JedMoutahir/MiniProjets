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
float speed = 2;
float demp = 0.9;
void setup() { 
    
    fullScreen(); 
    x = width/2;
  y = height/2;
  vx = 0;
  vy = 0;
  context = getActivity(); 
    
    manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE); 
    
    sensor = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER); 
    
    listener = new AccelerometerListener(); 
    
    manager.registerListener(listener,  sensor,  SensorManager.SENSOR_DELAY_GAME); 
       
    textFont(createFont("SansSerif", 30 * displayDensity));
} 
void draw() { 
    
    if(!mousePressed)background(0); 
    vx += -ax/speed;
  vy+=ay/speed;
  vx = constrain(vx,-30,30);
  vy = constrain(vy,-30,30);
  x += vx/speed;
  y += vy/speed;
  if(x<0 || x>width)vx=-vx*demp;
  if(y<0 || y>height)vy=-vy*demp;
  x = constrain(x,0,width);
  y = constrain(y,0,height);
  ellipse(x,y,100,100);
  text("X: " + ax + "\nY: " + ay + "\nZ: " + az + "\ntot: " + (abs(ax)+abs(ay)+abs(az)), 0, 0, width, height);
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
