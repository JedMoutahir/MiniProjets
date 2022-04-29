import processing.pdf.*;



int nbIntBoucle = 1, intBoucle = 1;

int state = 1;

int ai = 0, bi = 0, intSum = 0;

int[] A = {6}; 


int[] B = {1}; 

int[] Sum = new int[0];

void setup() {
  int digits = 100000;
  size(1000, 1000, PDF, "multiply_array_Book.pdf");
  
  PGraphicsPDF pdf = (PGraphicsPDF) g;  // Get the renderer
  
  int cols = 100;
  int rows = 100;
  float w = float(width)/cols;
  float h = float(height)/rows;
  int index = 0;
  int totalPages = (digits * 2) / (cols*rows);
  println(totalPages);
  background(0);
  
  for (int z = 0; z < digits; z++) {
    A = append(A, int(random(0, 9)));
    B = append(B, int(random(0, 9)));
  }

  for (int i = 0; i < 2 * A.length - 1; i++) {

    intBoucle = 1;

    calcIntBoucle();

    for (int j = 0; j < nbIntBoucle; j++) {

      indice();

      intSum += A[ai] * B[bi];

      intBoucle ++;
    }
    Sum = append(Sum, intSum);

    intSum = 0;

    state++;
  }


  clear_sum();

  println(Sum);
  
  for (int i = 0; i < totalPages; i++) {
    for (float y = 0; y < height; y += h) {
      for (float x = 0; x < width; x += w) {
        int digit = Sum[index];
        textAlign(CENTER,CENTER);
        text(digit,x+w/2,y+h/2);
        index++;
        if (index >= Sum.length) {
          index = Sum.length - 1;
        }
      }
    }
    println("Page " + i + " complete!");
    pdf.nextPage();
  }
  println("Finished");
  exit();
  
  
  
  //save_result(Sum, 0);
  //display_result(A, 100, 100);
  //display_result(B, 100, height/4);
  //display_result(Sum, 100, height/2);
  //int time = millis();
  //textSize(20);
  //text(time, 100, height-100);
}

void display_result(int[] Array, int xt, int yt) {

  fill(255);
  textSize(10);
  for (int k = 0; k < Array.length; k++) {
    text(Array[k], xt, yt);
    xt += 13;
    if (xt > width) {
      xt = 100;
      yt += 15;
    }
  }
}

void save_result(int[] Array, int place) {
  textSize(20);
  int xA = 20, yA = 30, digitArray = 0;
  for (int j = 0; j < height - 50; j += 30) {
    for (int i = 0; i < width - 50; i += 25) {
      text(Array[place], xA, yA);
      place ++;
      xA += 25;
      digitArray ++;
    }
    xA = 20;
    yA += 30;
  }
  //save_result(Array, digitArray);
}
void update_sum() {

  Sum = append(Sum, intSum);
}


void clear_sum() {

  for (int b = 0; b<10; b++) {

    for (int a = 1; a < Sum.length; a++) {

      if (Sum[a] >= 10) {

        Sum[a-1] += int(Sum[a]/10);

        Sum[a] -= int(Sum[a]/10)*10;
      }
    }
  }
}


void calcIntBoucle() {

  if (state <= A.length) {

    nbIntBoucle = state;
  } else {

    nbIntBoucle = 2 * A.length - state;
  }
}


void indice() {

  if (state <= A.length) {

    ai = intBoucle - 1;

    bi = state - intBoucle;
  } else {

    ai = state - A.length + intBoucle - 1;

    bi = A.length - intBoucle;
  }
}
