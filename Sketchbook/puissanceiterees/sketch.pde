// import java.lang.Math
float puissance_iterees_de_knuth(long nombre1, long nombre2, int nombre_fleche ){
  float result1 = nombre1;
  for(int j = 0; j<nombre2; j++){
      result1 = pow(result1, nombre1);
      println("boucle");
    }float fleche = result1;
    float result = nombre1;
  for(int i = 1; i<fleche; i++){
    result = pow(result, nombre1);
      println("boucle");
  }
  println("fini");
  return result;
}

float Knuth(int rang; float a, int b){

if (rang == 1){
   float R = pow(a, b);
}
else { 
   R = 1 (* élément neutre pour l'exponentielle*) 
(* Application b fois de l'opérateur à gauche "a Knuth(rang-1)" *) 
for compteur:=1 to b do 
R:=Knuth(rang-1,a,R) 
end 
return R 
end.
}
void setup(){
  size(1000,1000);
  background(0);
  fill(255);
  textSize(50);
  text(puissance_iterees_de_knuth(2,2,2), 20, height/2);
}