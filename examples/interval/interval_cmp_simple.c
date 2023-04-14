/*
 * Cours "Sémantique et Application à la Vérification de programmes"
 *
 * Josselin Giet 2021
 * Ecole normale supérieure, Paris, France / CNRS / INRIA
 */

void main(){
  int i = rand(-2, 42);
  assert(i <= 42);
  assert(i >= -2);
  assert(i != 42); //@KO
  assert(i != -2); //@KO
}