void main() {
  int x = rand(-5, 5);
  int y = 3;
  if (2*x+y == 10)
    assert(false); // @OK
}
