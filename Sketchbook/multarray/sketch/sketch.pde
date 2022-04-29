int nbIntBoucle = 1, intBoucle = 1;

int state = 1;

int ai = 0, bi = 0, intSum = 0;

int[] A = {5,6,4,5,7,7,5,4,4,3,4,6,7,6,5,4,3,7,7,6,5,4,4,3,2,4,6,7,8,8,8,7,5,4,3,1,2,5,5,8,5,5,5,5,5,5,5,2,1,2,2,6,2,3,6,8,8,5,4,3,3,4,6,7,7,7,5,4,3,3,4,6,7,8,0,0,9,6,5,3,2,1,1,4,5,6,6,5,2,2,5,5,3,3,3,2,5,8,5,5,2,1,1,4,4,5,8,8,5,5,2,2,1,1,4,5,2,2,2,2,5,8,5,2,2,5,5,5,2,5,5,5,8,3,9,6,3,5,8,2,8,2,3,9,6,1,0,4,7,2,8,0,2,1,6,5,3,3,2,5,8,2,2,6,8,5,2,2,8,2,8,2,8,5,2,2,2,8,1,1,7,5,3,6,9,0,2,5,6,9,8,0,2,2,5,5,8,6,6,4,5,7,7,5,4,4,3,4,6,7,6,5,4,3,7,7,6,5,4,4,3,2,4,6,7};

int[] B = {3,9,2,5,6,7,8,8,8,6,5,4,4,7,8,8,8,6,3,2,8,0,5,4,4,4,1,2,6,0,8,2,3,5,5,2,5,8,5,2,2,2,5,8,4,4,2,2,5,8,5,1,2,3,2,7,4,4,2,5,8,4,1,2,5,8,5,3,2,5,5,2,2,4,4,5,5,8,8,8,2,1,2,5,5,5,5,2,2,1,9,3,3,2,2,5,5,8,8,8,5,1,1,4,4,5,2,3,6,6,6,6,3,3,6,5,5,2,6,8,5,2,5,5,2,5,5,2,2,5,5,7,5,8,4,1,2,3,6,9,8,2,1,4,5,8,0,4,7,2,2,5,9,3,2,5,5,2,2,5,5,8,5,2,1,5,0,6,7,3,2,9,8,2,1,4,6,0,2,1,8,2,5,5,2,1,8,5,8,2,1,4,2,3,9,8,0,2,2,9,8,2,1,4,6,0,2,1,8,2,5,5,2,1,8,5,8,2,1,4,2,3,9,8,2};

int[] Sum = new int[0];


void setup() {
  
  size(1700, 2000);
  
  background(0);
  
  //  for(int z = 0 ; z < 2000 ; z++){
  //  A = append(A, int(random(0,9)));
  //  B = append(B, int(random(0,9)));
  //  }

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
  
  int tTakenClear = millis();
  clear_sum();
  println("time taken clearing" + (millis()-tTakenClear));
  //println(Sum);
  
  display_result(A, 100, 100);
  display_result(B, 100, height/4);
  display_result(Sum, 100, height/2);
  int time = millis();
  textSize(20);
  text(time, 100, height-100);
}

void display_result(int[] Array, int xt, int yt){
  
  fill(255);
  textSize(10);
  for(int k = 0 ; k < Array.length ; k++){
    text(Array[k], xt, yt);
    xt += 11;
    if(xt > width){
      xt = 100;
      yt += 12;
    }
  }
  
}

void update_sum() {

  Sum = append(Sum, intSum);

}


void clear_sum() {
  int clearBoucle = 0;
  for (int b = 0; b < 10; b++) {

    for (int a = 1; a < Sum.length; a++) {
      clearBoucle++;
      if (Sum[a] >= 10) {

        Sum[a-1] += int(Sum[a]/10);
        
        Sum[a] -= int(Sum[a]/10)*10;

      }

    }

  }
  println("nb bcl clear" + clearBoucle);
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

