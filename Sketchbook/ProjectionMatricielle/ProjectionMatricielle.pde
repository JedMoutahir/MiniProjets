float[][] pos = new float[3][1];
float[][] proj= new float[2][3];
float[][] posP = new float[1][2] ;
float ax,ay,az;

void setup() {
  ax = HALF_PI;
  ay = HALF_PI;
  az = 0;
  pos[0][0] = 3;
  pos[1][0] = 4;
  pos[2][0] = 5;
  proj[0][0] = sin(ax);
  proj[0][1] = -cos(ax);
  proj[0][2] = 0;
  proj[1][0] = cos(ay)*cos(ax);
  proj[1][1] = cos(ay)*sin(ax);
  proj[1][2] = -sin(ay);
  posP = dotP(proj,pos);
  for (int i = 0; i < posP.length; i++) {
    printArray(posP[i]);
  }
}

float[][] dotP(float[][] A, float[][] B) {
  float[][] C = new float[A.length][B[0].length];
  for (int i=0; i<A.length; i++) {
    for (int j=0; j<B[0].length; j++) {
      for (int k=0; k<A[0].length; k++) {
        C[i][j]+= A[i][k] * B[k][j];
      }
    }
  }
  return C;
}
