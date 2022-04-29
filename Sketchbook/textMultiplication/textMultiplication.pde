// time taken in seconds : 20*n^2/(4.1*10^9) with n : number of digits

PrintWriter output;

int nbIntBoucle = 1, intBoucle = 1;

int state = 1;

int ai = 0, bi = 0, intSum = 0;

int[] A = {}; 


int[] B = {}; 

int[] Sum = new int[0];
int digits = 1000;

String txtA, txtB, txtResult;

void setup() {
  int t1 = millis();
  output = createWriter("result.txt"); 

  //background(0);

  for (int z = 0; z < digits; z++) {
    A = append(A, int(random(0, 9)));
    B = append(B, int(random(0, 9)));
  }
 txtA = createString(A);
 txtB = createString(B);
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
  
 txtResult = createString(Sum);
 
  println(Sum);
  
  output.println(txtA);
  output.println("    *    ");
  output.println(txtB);
  output.println("    =    ");
  output.println(txtResult);
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  println("text finished in " + str(millis() - t1) + " ms");
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

String createString(int[] L) {
  String txt = "";
  for( int i = 0 ; i < L.length ; i++){
    txt+=str(L[i]);
  }
  return txt;
}

int[] listFromText(String source){
String[] Lstr = loadStrings(source);
int[] L = {};
for(int i = 0 ; i < Lstr.length ; i++){
  L = append(L, int(Lstr[i]));
}

return L;
}
