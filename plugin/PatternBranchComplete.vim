" PatternBranchComplete.vim: Insert mode completion for branches in the current search pattern.
"
" DEPENDENCIES:
"   - Requires Vim 7.0 or higher.
"   - PatternBranchComplete.vim autoload script
"
" Copyright: (C) 2018 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_PatternBranchComplete') || (v:version < 700)
    finish
endif
let g:loaded_PatternBranchComplete = 1

inoremap <silent> <expr> <Plug>(PatternBranchComplete) PatternBranchComplete#Expr()
if ! hasmapto('<Plug>(PatternBranchComplete)', 'i')
    imap <C-x><Bslash><Bar> <Plug>(PatternBranchComplete)
endif

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
