String temps;
String api = "http://api.openweathermap.org/data/2.5/weather?q=";
String cle = "&APPID=a3097330861ee8ee657f826537bb841f";
String unite = "&units=metric";
String town = "Toulouse";
String data;
JSONObject gotdata;
int time = 10000;

String chercherMeteo() {
  String url  = api + town + unite + cle;
  return gotdata(loadJSONObject(url));
}

String gotdata(JSONObject data) {
  return data.getJSONArray("weather").getJSONObject(0).getString("description");
}

void drawMeteo() {
  //background(0);
  temps = chercherMeteo();
  //temps = "light rain";
  if (temps.equals("clear sky")) {
    background(0, 0, 150);
    fill(255, 255, 0);
    noStroke();
    ellipse(width/2, height/2, 100, 100);
  } else if (temps.equals("rain") || temps.equals("shower rain") || temps.equals("light rain")) {
    background(70, 70, 150);
    fill(200);
    noStroke();
    ellipse(width/3, height/2+20, 110, 110);
    ellipse(width/2, height/2, 140, 140);
    ellipse(2*width/3, height/2+20, 110, 110);
    fill(0, 0, 255);
    rect(width/3, height/2+80, 10, 30);
    rect(width/2, height/2+90, 10, 30);
    rect(2*width/3, height/2+80, 10, 30);
  } else if (temps.equals("few clouds") || temps.equals("scattered clouds") || temps.equals("overcast clouds") || temps.equals("light intensity drizzle") || temps.equals("drizzle")) {
    background(50, 50, 50);
    fill(255);
    noStroke();
    ellipse(width/3, height/2+20, 110, 110);
    ellipse(width/2, height/2, 140, 140);
    ellipse(2*width/3, height/2+20, 110, 110);
  } else if (temps.equals("broken clouds")) {
    background(100, 100, 200);
    fill(200);
    noStroke();
    ellipse(width/3, height/2+20, 110, 110);
    ellipse(width/2, height/2, 140, 140);
    ellipse(2*width/3, height/2+20, 110, 110);
  } else if (temps.equals("snow") || temps.equals("mist")) {
    background(150);
    textSize(300);
    noStroke();
    fill(255);
    text("*", width/2-150, height/2+200);
  } else if (temps.equals("thunderstorm")) {
    background(0);
    noStroke();
    fill(255, 255, 0);
    rect(width/2-80, 20, 50, height/2-20);
    rect(width/2-80, height/2-20, 160, 50);
    rect(width/2+80, height/2-20, 50, height/2-20);
  } else {
    background(100,0,0);
    println("temps Météo : \"" + temps + "\"");
  }
}

//void setup() {
  //fullScreen();
 //size(500, 850);
  //println("temps init: \"" + temps + "\"");
//}

void draw() {
  drawMeteo();
  delay(time);
}
