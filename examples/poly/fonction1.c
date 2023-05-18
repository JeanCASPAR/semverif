int add(int x, int y) {
  return x+y;
}

void main() {
  int x = rand(0, 10);
  if (add(x, 3) == 10)
    assert(x == 7); //@OK
  else
    // Ça ne peut pas marcher parce que `x` pourrait appartenir à deux intervals disjoints.
    assert(x != 7); //@KO

  if (add(x, 3) == 13)
    assert(x == 10); //@OK
  else
    assert(x < 10); //@OK
}
