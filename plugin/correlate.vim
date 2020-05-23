 

function! SExpand(input,col) 
	if len(a:input) == a:col
		let forSimpleExpand=a:input[0:a:col]	
	else
		let forSimpleExpand=a:input[0:a:col-1]	
	endif
	let part =Part(forSimpleExpand)
	if part==''
		return [a:input,a:col]
	endif
	if len(split(part,','))>2
		return [a:input,a:col]
	endif

	if split(part,',')[0]>split(part,',')[1]
		return [a:input,a:col]
	endif

	let sufix=a:input[a:col:]
	let firstpart = SimpleExpand(forSimpleExpand,part)
	let result =firstpart.sufix
	
	if sufix==''
		let a=1
	else
		let a=0
	endif
	return [result,len(firstpart),a]
endfunction  


function! ExcuteExpansion()
	
	let line = getline('.')
	let col = col('.')
	let cursor_pos = getpos('.')
	let expanded  =SExpand(line,col)
	let result =expanded[0]
	
	silent normal cc
	exe 'normal! '.'a'.result
	let cursor_pos[2]=expanded[1]+1
	call setpos('.',cursor_pos)
	if expanded[2]==1
		startinsert!
	else
		startinsert
	endif
endfunction


function! SimpleExpand(input,part)
	let prefix=a:input[0:-1*len(a:part)-1]
        let comand=a:part
	let start = split(comand,',')[-2]
	let end = split(comand,',')[-1]
	let result= join(range(start,end),',')
	return prefix.result
endfunction
	
function! Part(line)

	let cont =len(a:line)-1
	let result=''
	while cont>-1
		let c = strpart(a:line, cont, 1)
		let result=result.c
		if !IsNumberOrComa(c)
			break
		endif
		let cont=cont-1	
	endwhile
	let result=join(reverse(split(result, '.\zs')), '')
	if  IsNumberOrComa(result[0])
		return result
	else
		return result[1:]
	endif

endfunction

function! IsNumberOrComa(toTest)
	return index(['1','2','3','4','5','6','7','8','9','0',','],a:toTest)!=-1
endfunction
