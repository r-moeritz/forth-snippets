( binary search routine )

0 variable lowr ( lower address )
0 variable uppr ( upper address )

: seek ( v l u --- n f /search for value in sorted byte array )
  uppr ! lowr !
  begin lowr @ uppr @ 2dup > dup >r
	if drop
	else 0 swap 0 d+ 2 um/mod swap drop
	     2dup c@ 2dup =
	then r> swap over or 0=
  while drop > if 1+ lowr !
	       else 1- uppr ! then
  repeat if false
	 else 2drop swap drop true then ;
