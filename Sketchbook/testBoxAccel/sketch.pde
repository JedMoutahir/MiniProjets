import android.content.Context; 
import android.hardware.Sensor; 
import android.hardware.SensorManager; 
import android.hardware.SensorEvent; 
import android.hardware.SensorEventListener; 
Context context; 
SensorManager manager; 
Sensor sensor; 
AccelerometerListener listener; 
float ax, ay, az, angX, angY, angZ; 
void setup() { 
    
    fullScreen(P3D);
  context = getActivity(); 
    
    manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE); 
    
    sensor = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER); 
    
    listener = new AccelerometerListener(); 
    
    manager.registerListener(listener,  sensor,  SensorManager.SENSOR_DELAY_GAME); 
       
    textFont(createFont("SansSerif", 30 * displayDensity));
} 
void draw() {
  background(0);
  angX = map(ax, -10, 10, 0, PI);
  angY = map(ay, -10, 10, 0, PI);
  angZ = map(az, -10, 10, 0, PI);
  translate(width/2,height/2);
  rotateX(angY);
  rotateY(angX);
  rotateZ(angZ);
  
  box(400);
  //text("X: " + ax + "\nY: " + ay + "\nZ: " + az + "\naX: " + angX + "\naY: " + angY + "\naZ: " + angZ, 0, 0, width, height);
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
