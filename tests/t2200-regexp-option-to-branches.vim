" Test conversion of simple optional match to branches in a group.

set completefunc=PatternBranchComplete#PatternBranchComplete
call PatternBranchComplete#Expr()   " Initialize script variables.

source ../../vim-CompleteHelper/tests/helpers/completetest.vim

call vimtest#StartTap()
call vimtap#Plan(3)

let @/ = 'foo\?bar\?'
call IsMatchesInIsolatedLine('f', ['foba', 'fooba', 'fobar', 'foobar'], 'matches for f convert two options')

let @/ = 'foo\=\s\?\%(bar\)\?'
call IsMatchesInIsolatedLine('f', ['fo\sbar', 'foo\sbar'], 'matches for f do not convert non-literal and group options')

let @/ = 'foo[[:digit:]]\?'
call IsMatchesInIsolatedLine('f', ['foo[[:digit:]]'], 'match for f does not convert complex collection')

call vimtest#Quit()
