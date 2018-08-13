" Test completion of branches within a group.

set completefunc=PatternBranchComplete#PatternBranchComplete
call PatternBranchComplete#Expr()   " Initialize script variables.

source ../../vim-CompleteHelper/tests/helpers/completetest.vim
let @/ = 'my\%(Foo\|Bar\|Fox\)Trott'

call vimtest#StartTap()
call vimtap#Plan(2)
call IsMatchesInIsolatedLine('myB', ['myBarTrott'], 'match for myB')
call IsMatchesInIsolatedLine('myF', ['myFooTrott', 'myFoxTrott'], 'matches for myF')
call vimtest#Quit()
