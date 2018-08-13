" PatternBranchComplete.vim: Insert mode completion for branches in the current search pattern.
"
" DEPENDENCIES:
"   - CompleteHelper/Abbreviate.vim autoload script
"   - ingo/regexp/magic.vim autoload script
"   - ingo/regexp/split.vim autoload script
"
" Copyright: (C) 2018 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
let s:save_cpo = &cpo
set cpo&vim

function! PatternBranchComplete#Expr()
    set completefunc=PatternBranchComplete#PatternBranchComplete
    return "\<C-x>\<C-u>"
endfunction

function! PatternBranchComplete#FindMatches( branches, pattern )
    return
    \   map(
    \       filter(
    \           copy(a:branches),
    \           'v:val =~ a:pattern'
    \       ),
    \       'CompleteHelper#Abbreviate#Word({"word": v:val})'
    \   )
endfunction

function! s:ParseBranches( pattern )
    let l:splits = ingo#regexp#split#PrefixGroupsSuffix(ingo#regexp#magic#Normalize(@/))

    if len(l:splits) == 1
	" No toplevel branches.
	return ingo#regexp#split#TopLevelBranches(l:splits[0])
    elseif len(l:splits) == 3
	" Put the common prefix / suffix around each branch.
	return map(ingo#regexp#split#TopLevelBranches(l:splits[1]), 'l:splits[0] . v:val . l:splits[2]')
    else
	return []   " TODO: Implement.
    endif
endfunction

function! PatternBranchComplete#PatternBranchComplete( findstart, base )
    if a:findstart
	" Locate the start of the WORD.
	let l:startCol = searchpos('\S*\%#', 'bn', line('.'))[1]
	if l:startCol == 0
	    let l:startCol = col('.')
	endif
	return l:startCol - 1 " Return byte index, not column.
    else
	" Split the current search pattern into (toplevel) branches.
	let l:branches = s:ParseBranches(@/)

	" Find matches starting with (after optional non-keyword characters) a:base.
	let l:matches = PatternBranchComplete#FindMatches(l:branches, '^\%(\k\@!.\)*\V' . escape(a:base, '\'))
	if empty(l:matches)
	    " Find matches containing a:base.
	    let l:matches = PatternBranchComplete#FindMatches(l:branches, '\V' . escape(a:base, '\'))
	endif
	return l:matches
    endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
