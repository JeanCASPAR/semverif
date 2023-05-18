void main()
{
	int x = 10;
	int y = 100;
	while (x != 0)
	{
		x = x - 1;
		y = y + 10;
	}
	assert (x == 0 && y == 200);
}
