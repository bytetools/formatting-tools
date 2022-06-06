" This is a function to format a sentence in Markdown.
" It will put one sentence on one line, and put a newline after the period
" character.
" It currently doesn't work with colons or question marks on the same line.

function! FormatSentence()
	" save line
	let fline = line(".")
	" go to next [.:?]
	execute "normal! /[\\.:?]\<cr>"
	" save line
	let sline = line(".")
	" if on another line
	if fline != sline
		" line selection mode
		execute "normal! V"
		" go back to initial line
		execute fline
		" join lines
		execute "normal! J"
	endif
	execute "normal! ^"

	" save current line
	let fline = line(".")
	" go to next period with another sentence after it
	execute "normal! /\\. [a-zA-Z]\\+\<cr>"
	" save current line
	let sline = line(".")
	
	" if period is on same line
	if fline == sline
		" Replace period that has an additional paragraph after it with a newline
		s/\. /.\r&/
		" Go to next line and remove first period and space
		s/^\. //
	else
		" go back to initial line, go to next line
		execute fline
		execute "normal! j"
	endif
	" go to beginning of line
	execute "normal! ^"
endfunction
