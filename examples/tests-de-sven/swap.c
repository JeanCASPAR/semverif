void main()
{
	int a = rand(1 , 100);
	int b = rand(1, 10);
	int a_init = a;
	int b_init = b;
	int c = b;
	b = a;
	a = c;
	assert(b == a_init && a == b_init);

}
