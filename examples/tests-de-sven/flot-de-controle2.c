void main() {
  if (rand(0,1)==1) {
    int x = 1/0;
  } else {
    if (rand(0,1)==1) {
      if (1/0==1);
    } else {
      int y = 1/0;
    }
  }
  assert(false);//@OK
}
