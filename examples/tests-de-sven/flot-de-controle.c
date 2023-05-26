void main() {
  int x = rand(1 , 100);
  int y = rand(1 , 100);
  if (x > y) {
    x = 1/0;
  }
  else {
    y = 1/0;
  }
  assert(false); //@OK
}
