/*
 * Cours "Sémantique et Application à la Vérification de programmes"
 *
 * Josselin Giet 2021
 * Ecole normale supérieure, Paris, France / CNRS / INRIA
 */

void main(){
  int i = 9;
  int j = -2;
  int x = i / j; // We follow towards zero convention
  assert(x == -4);
}