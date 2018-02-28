# Modular exponentation for b power e modulo m
# works with long integers but too slow
function pow(b,e,m,	c,e_prime)
{
	c = 1
	e_prime = 0
	do {
		e_prime += 1
		c = (b*c) % m }
	while (e_prime < e)
	return c
}

BEGIN{
	a = 2988348162058574136915891421498819466320163312926952423791023078876139
	b = 2351399303373464486466122544523690094744975233415544072992656881240319
	m = 100 ** 800
	print(m)
	print(pow(a,b,m))
}
