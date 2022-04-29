class doublePendule {
  float r1, r2, m1, m2, x1, x2, y1, y2, a1, a2, a1_v, a2_v, col;


  doublePendule (float r1b, float r2b, float m1b, float m2b, float x1b, float x2b, float y1b, float y2b, float a1b, float a2b, float a1_vb, float a2_vb, float colb ) {  
    r1 = r1b;  
    r2 = r2b;  
    m1 = m1b;  
    m2 = m2b;
    x1 = x1b;
    x2 = x2b;
    y1 = y1b;
    y2 = y2b;
    a1 = a1b;
    a2 = a2b;
    a1_v = a1_vb;
    a2_v = a2_vb;
    col = colb;
  }

  void update() {
    float num1 = -g * (2 * m1 + m2) * sin(a1);

    float num2 = -m2 * g * sin(a1-2*a2);

    float num3 = -2*sin(a1-a2)*m2;

    float num4 = a2_v*a2_v*r2+a1_v*a1_v*r1*cos(a1-a2);

    float den = r1 * (2*m1+m2-m2*cos(2*a1-2*a2));

    float a1_a = (num1 + num2 + num3*num4) / den;


    num1 = 2 * sin(a1-a2);

    num2 = (a1_v*a1_v*r1*(m1+m2));

    num3 = g * (m1 + m2) * cos(a1);

    num4 = a2_v*a2_v*r2*m2*cos(a1-a2);

    den = r2 * (2*m1+m2-m2*cos(2*a1-2*a2));

    float a2_a = (num1*(num2+num3+num4)) / den;
    x1 = r1 * sin(a1);

    y1 = r1 * cos(a1);


    x2 = x1 + r2 * sin(a2);

    y2 = y1 + r2 * cos(a2);

    a1_v += a1_a;

    a2_v += a2_a;

    a1 += a1_v;

    a2 += a2_v;

    float gravity = 0.999;

    a1_v *= gravity;

    a2_v *= gravity;
  }

  void show() {

    translate(cx, cy);

    stroke(0,100);
    fill(0,100);
    line(0, 0, x1, y1);
    ellipse(x1, y1, m1/5, m1/5);
    line(x1, y1, x2, y2);
    ellipse(x2, y2, m2/5, m2/5); 
    
    translate(-cx, -cy);
  }
}
