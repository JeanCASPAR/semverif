int add(int x , int y)
{
	return x + y;
}

void main() {
	int x = rand(1 , 10);
	int y = 3;
	if (add(x , y) == 6)
	{
		assert(x == 3); //@OK
	}
	int z = add(x , add(x , y));
	if (z == 10)
	{
		assert(false); //@OK
	}
}
