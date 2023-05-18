void main()
{
	int x = rand(1 , 10000);
	int y = rand(1 , 10000);
	int z = x;
	if (y > z) z = y;
	if (z < 0) z = 0;
	assert (z >= x && z >= y && z >= 0);
}
