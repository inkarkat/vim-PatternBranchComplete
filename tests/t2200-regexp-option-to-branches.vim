" Test conversion of simple optional match to branches in a group.

scriptencoding utf-8

set completefunc=PatternBranchComplete#PatternBranchComplete
call PatternBranchComplete#Expr()   " Initialize script variables.

source ../../vim-CompleteHelper/tests/helpers/completetest.vim

call vimtest#StartTap()
call vimtap#Plan(3)

let @/ = 'foo\?bar\?'
call IsMatchesInIsolatedLine('f', ['foba', 'fooba', 'fobar', 'foobar'], 'matches for f convert two options')

let @/ = 'foo\=\s\?\%(bar\)\?'
call IsMatchesInIsolatedLine('f', ['fo𝑠bar', 'foo𝑠bar'], 'matches for f converts character class and removes grouping')

let @/ = 'foo[[:digit:]]\?'
call IsMatchesInIsolatedLine('f', ['foo𝑑'], 'match for f converts complex collection')

call vimtest#Quit()
