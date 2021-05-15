function! s:Random ()
  return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:])
endfunction

let s:splash_strings = '~/.config/nvim/viml/dashboard-splash-strings.txt'

let s:header = [
	\ '                                                  ',
	\ '                                                  ',
	\ '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
	\ '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
	\ '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
	\ '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
	\ '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
	\ '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
	\ '                                                  ',
\]

let s:string = system('shuf -n 1 ' . s:splash_strings . ' | tr "\n" "!"')
let s:space = ' '

let s:i = 0
let s:len = (strlen(s:header[0]) - strlen(s:string)) / 2 - 4

while s:i < s:len
	let s:space = s:space . ' '
	let s:i += 1
endwhile

let s:header = add(s:header, s:space . ' [ ' . s:string . ' ]' . s:space)
let s:header = add(s:header, s:header[0])
let s:header = add(s:header, s:header[0])

let g:dashboard_custom_header = s:header
