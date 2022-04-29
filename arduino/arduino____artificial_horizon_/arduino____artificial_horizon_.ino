// NavBall Code 

//https://www.instructables.com/How-to-Measure-Angle-With-MPU-6050GY-521/

// library link for MPU6050 or GY-521
// https://github.com/jarzebski/Arduino-MPU6050

#include<Wire.h>  // wire library

const int MPU_addr=0x68;   // MPU address

int16_t AcX,AcY,AcZ,Tmp,GyX,GyY,GyZ;  // 16 bit data array

int minVal=265; 
int maxVal=402;

double x; double y; double z;

void setup() { 
  
  Serial.begin(9600);
  
  Wire.begin();
  Wire.beginTransmission(MPU_addr);
  Wire.write(0x6B); 
  Wire.write(0); 
  Wire.endTransmission(true); 
  
  
   } 

void loop() {
 
  Wire.beginTransmission(MPU_addr);
  Wire.write(0x3B); 
  Wire.endTransmission(false); 
  Wire.requestFrom(MPU_addr,14,true); 
 
  AcX=Wire.read()<<8|Wire.read(); 
  AcY=Wire.read()<<8|Wire.read(); 
  AcZ=Wire.read()<<8|Wire.read(); 
  
  int xAng = map(AcX,minVal,maxVal,-90,90);
  int yAng = map(AcY,minVal,maxVal,-90,90); 
  int zAng = map(AcZ,minVal,maxVal,-90,90);

x= RAD_TO_DEG * (atan2(-yAng, -zAng)+PI); 
y= RAD_TO_DEG * (atan2(-xAng, -zAng)+PI); 
z= RAD_TO_DEG * (atan2(-yAng, -xAng)+PI);

      
      Serial.print(x); 
      Serial.print(" "); 
     
      Serial.print(y); 
      Serial.print(" "); 
      
      Serial.print(z); 
      Serial.print(" ");
      
      Serial.print("\n"); 

   }
