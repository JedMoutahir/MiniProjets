import android.content.Context; 
import android.hardware.Sensor; 
import android.hardware.SensorManager; 
import android.hardware.SensorEvent; 
import android.hardware.SensorEventListener; 
Context context; 
SensorManager manager; 
Sensor sensor; 
AccelerometerListener listener; 
float ax, ay, az;
int nbBille = 15;
float gStr = 1;
float repStr = 100;
int speed = 10;
ArrayList<Bille> Billes = new ArrayList<Bille>();
void setup() { 
    
    fullScreen();
  colorMode(HSB, 3600, 255, 255);
  fill(255);
  context = getActivity(); 
    
    manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE); 
    
    sensor = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER); 
    
    listener = new AccelerometerListener(); 
    
    manager.registerListener(listener,  sensor,  SensorManager.SENSOR_DELAY_GAME); 
       
    textFont(createFont("SansSerif", 30 * displayDensity));

  for (int i = 0; i < nbBille; i++) {
    Billes.add(new Bille(random(50, width-50), random(50, height-50), random(0.1, 0.5), int(random(0, 3600))));
    Billes.get(i).show();
  }
} 
void draw() { 
  if (!mousePressed)background(0);
  for (int i = 0; i < Billes.size(); i++) {
    for (int s = 0; s < speed; s++) {
      Billes.get(i).updateG(ax, ay);
      for (int j = 0; j < Billes.size(); j++) {
        if (i != j && dist(Billes.get(i).x, Billes.get(i).y, Billes.get(j).x, Billes.get(j).y) < Billes.get(i).r/2 + Billes.get(j).r/2) {
          float xa = Billes.get(i).x;
          float ya = Billes.get(i).y;
          float xb = Billes.get(j).x;
          float yb = Billes.get(j).y;
          float accx = (xa-xb)/abs(xa-xb) * repStr * abs((xa-xb)/(ya-yb));
          float accy = (ya-yb)/abs(ya-yb) * repStr * abs((ya-yb)/(xa-xb));
          Billes.get(i).updateT(accx, accy);
          //Billes.get(j).updateT(-accx, -accy);
        }
      }
    }
    Billes.get(i).show();
  }
  // text("X: " + ax + "\nY: " + ay + "\nZ: " + az, 0, 0, width, height);
  // text(frameRate,0,400);
} 
class AccelerometerListener implements SensorEventListener { 
    
    public void onSensorChanged(SensorEvent event) { 
        
      ax = -event.values[0] * gStr; 
        
      ay = event.values[1] * gStr; 
        
      az = event.values[2] * gStr;
           
  } 
    
    public void onAccuracyChanged(Sensor sensor, int accuracy) { 
      
  }
}
