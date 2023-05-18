void main()
{
	int x = 2;
	int i = 0;
	while (i < 10)
	{
		if (rand(0 , 1) == 0)
			x = x + 2;
		else
			x = x - 3;
		i = i + 1;
	}
	assert (i == 10 && x <= 22 && x >= -28);
}
