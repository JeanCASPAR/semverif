void main() {
  if (1 == 1/0) {
    assert(false); // @OK
  }
}
