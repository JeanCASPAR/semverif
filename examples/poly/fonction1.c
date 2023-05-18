int add(int x, int y) {
  return x+y;
}

void main() {
  int x = rand(0, 10);
  if (add(x, 3) == 10)
    assert(x == 7); // @OK
}
