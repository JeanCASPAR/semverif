int main()
{
	int x = rand(1 , 10);
	int y = 3;
	if (x + y == 6)
	{
		assert(x <= 3 && x >= 3); //@OK
	}
	int z = 2 * x + y;
	if (z== 10)
	{
		assert (false); //@OK
	}
}
