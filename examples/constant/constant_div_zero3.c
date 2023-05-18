void main() {
  int x = 0;
  if (x == 1/x)
    assert(false); // @OK
}
