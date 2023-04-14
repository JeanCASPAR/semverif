/*
 * Cours "Sémantique et Application à la Vérification de programmes"
 *
 * Josselin Giet 2021
 * Ecole normale supérieure, Paris, France / CNRS / INRIA
 */

void main(){
  int i = 0;
  for(i = 0; i < 10; i++);
  assert(i >= 10);
}