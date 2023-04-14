/*
 * Cours "Sémantique et Application à la Vérification de programmes"
 *
 * Josselin Giet 2021
 * Ecole normale supérieure, Paris, France / CNRS / INRIA
 */

void main(){
  int i = 0;
  int j = rand(1, 2);
  int x = i * j;
  assert(x == 0);
}