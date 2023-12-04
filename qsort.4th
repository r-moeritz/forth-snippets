( quick sort - sort a byte array )

0 variable middle

: exchange ( a1 a2 --- /swap bytes at a1 & a2 )
  2dup c@ swap c@ rot c! swap c! ;

: sort ( l u --- /sort a byte array )
  2dup 2dup over - 2/ + c@ middle ! ( pick middle one )
  begin swap begin dup c@ middle @ < while 1+ repeat
	swap begin dup c@ middle @ > while 1- repeat
	2dup > 0= if 2dup exchange 1 -1 d+ then
	2dup > ( until partitions cross )
  until swap rot ( sort both pieces )
  2over 2over - -rot - < if 2swap then
  2dup < if recurse else 2drop then
  2dup < if recurse else 2drop then ;

( example program 

hex

create numbers ff c, 0 c, 20 c, a c, 3 c, 2 c, 80 c, 10 c, 6 c, 1 c,

numbers a dump

numbers numbers 9 + sort

numbers a dump
)
