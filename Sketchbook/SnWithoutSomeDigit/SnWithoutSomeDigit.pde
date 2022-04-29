int N = 9;
char notAllowed1 = '1';
char notAllowed2 = '2';
char notAllowed3 = '3';
char notAllowed4 = '4';
char notAllowed5 = '5';
char notAllowed6 = '6';
float Sn = 0;
int tot = 0;
float totKept = 0;
float proportion;
void setup() {

  for (int j = 1; j <= N; j++) {
    for (int i = 1; i < pow(10, j); i++) {
      tot ++;
      if (!gotIt(i, notAllowed1) && !gotIt(i, notAllowed2) && !gotIt(i, notAllowed3) && !gotIt(i, notAllowed4) && !gotIt(i, notAllowed5) && !gotIt(i, notAllowed6)){
        totKept ++;
        Sn += 1.0/i;
      }
    }
    proportion = totKept/tot;
    println(j, Sn, proportion);
    Sn = 0;
    tot = 0;
    totKept = 0;
  }
  println("fin");
}

boolean gotIt(int k, char c) {
  String kS = str(k);
  for (int i = 0; i < kS.length(); i++) {
    if (kS.charAt(i) == c) return true;
  }
  //println(kS);

  return false;
}
