
this plugin allows u to autocompleate consecutive numbers in insertmode



## Usage:

	   
	   append this in your vimrc(vim) or init.vim(neo vim) 
	   
	   imap  coll<space> <esc>:call ExcuteExpansion()<cr>
 
	   u can replace coll for whatever string u want to use as exapnsion
	   
	   for example if u write 1,4coll then space it will expand to 1,2,3,4
	   
	   other examples
	   
	   
	   1,4coll(space)          =1,2,3,4
	   
	   aaa 1,3coll(space)      =aaa 1,2,3
	    
       abcde 1,4coll(space)    =abcde 1,2,3,4
	   
	   ###examples with numbers in center
	   
	   dont write [cursor] or [space]
	   
	   stepts
	   1 abcde 1,4 cde[cursor]
       2 abcde 1,4[cursor] cde
	   3 abcde 1,4coll[space][cursor] cde
       enjoy expansion
	   abcde 1,2,3,4 cde

 
