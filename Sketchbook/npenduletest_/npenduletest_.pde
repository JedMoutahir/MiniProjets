import pallav.Matrix.*;
int n = 4;
float r = 30;
int speed = 100;
float m = 1;
float g = 9.81;
float dt = 0.001;
float[][] acc, vit, ang, A, B, e;
float[] X, Y, M, R;

void setup() {
  size(800, 800);
  background(0);
  stroke(255);
  fill(255);
  acc = new float[n][1];
  vit = new float[n][1];
  ang = new float[n][1];
  e = new float[n][1];
  X = new float[n];
  Y = new float[n];
  M = new float[n];
  R = new float[n];
  //float[][] test = new float[][]{ {3, 1, 2, 2, 2}, {2, 1 ,-2, 4, 5}, {2, 4, 5, 1 ,-2}, {2, 1 ,-2, 4, 5}, {1, 1, 1, 1, 1} };
  //printM(dot(test,test));
  //float[][] invtest = Matrix.inverse(test);
  //printM(invtest);
  for (int i = 0; i < M.length; i++) {
    M[i] = m;
  }
  for (int i = 0; i < e.length; i++) {
    e[i][0] = -1;
  }
  for (int i = 0; i < R.length; i++) {
    R[i] = random(0.5*r, 1.5*r);
  }
  for (int i = 0; i < R.length; i++) {
    ang[i][0] = random(PI/2, 3*PI/4);
  }
}

void draw() {
  background(0);
  //println(frameRate);
  translate(width/2, height/2);
  for (int n = 0; n < speed; n++) {
    update();
    ellipse(X[0], -Y[0], 10, 10);
    for (int i = 1; i < X.length; i++) {
      ellipse(X[i], -Y[i], 10, 10);
      //line(X[i-1], -Y[i-1], X[i], -Y[i]);
    }
  }
}

void update() {
  A = calcA(ang, M, R);
  B = calcB(ang, vit, M, R);
  float[][] invA = Matrix.inverse(A);
  acc = Matrix.Multiply(Matrix.Multiply(invA, B), e);
  for (int i = 0; i < vit.length; i++) {
    vit[i][0] += dt*acc[i][0];
  }

  for (int i = 0; i < ang.length; i++) {
    ang[i][0] += dt*vit[i][0];
  }

  for (int i = 0; i < X.length; i++) {
    float s = 0;
    for (int j = 0; j < i; j++) {
      s += R[j]*sin(ang[j][0]);
    }
    X[i] = s;
  }
  for (int i = 0; i < Y.length; i++) {
    float s = 0;
    for (int j = 0; j < i; j++) {
      s += -R[j]*cos(ang[j][0]);
    }
    Y[i] = s;
  }
}

float[][] calcA(float[][] T, float[] m, float[] r) {
  float[][] result = new float[n][n];
  for (int i = 0; i < result.length; i++) {
    for (int j = 0; j < result[0].length; j++) {
      int max = max(i, j);
      float Sm = 0;
      for (int k = max; k < n; k++) {
        Sm += m[k];
      }
      result[i][j] = R[j]*cos(T[i][0] - T[j][0])*Sm;
    }
  }
  return result;
}

float[][] calcB(float[][] T, float[][] Tp, float[] m, float[] r) {
  float[][] result = new float[n][n];
  for (int i = 0; i < result.length; i++) {
    for (int j = 0; j < result[0].length; j++) {
      int max = max(i, j);
      float Sm = 0;
      for (int k = max; k < n; k++) {
        Sm += m[k];
      }
      float S = 0;
      for (int k = i; k < n; k++) {
        S += m[k];
      }
      if (i == j) {
        result[i][j] = g*sin(T[i][0])*S;
      } else {
        result[i][j] = R[j]*Tp[j][0]*Tp[j][0]*sin(T[i][0] - T[j][0])*Sm;
      }
    }
  }
  return result;
}

float[][] add(float[][] A, float[][] B) {
  float[][] C = new float[A.length][A[0].length];
  for (int i = 0; i < C.length; i++) {
    for (int j = 0; j < C[0].length; j++) {
      C[i][j] = A[i][j] + B[i][j];
    }
  }
  return C;
}

int maxi(float[] L, int r) {
  float m = L[0];
  int ind = r+1;
  for (int i = 0; i < L.length; i++) {
    if (L[i] > m && i > r) {
      m = L[i];
      ind = i;
    }
  }
  return ind;
}
