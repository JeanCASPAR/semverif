void geq3(int x) {
  assert(x >= 3); //@OK
}

void main() {
  int x = rand(0, 10);
  int y = rand(3, 6);
  if (x+y >= 9)
    geq3(x);
}
