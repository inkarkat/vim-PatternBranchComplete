" Test completion of branches within two sequential groups.
" Tests that all combinations are offered.

set completefunc=PatternBranchComplete#PatternBranchComplete
call PatternBranchComplete#Expr()   " Initialize script variables.

source ../../vim-CompleteHelper/tests/helpers/completetest.vim
let @/ = 'my\%(Foo\|Bar\|Fox\)In\(Our\|Their\)Trott'

call vimtest#StartTap()
call vimtap#Plan(2)

call IsMatchesInIsolatedLine('myB', ['myBarInOurTrott', 'myBarInTheirTrott'], 'matches for myB')
call IsMatchesInIsolatedLine('myF', ['myFooInOurTrott', 'myFoxInOurTrott', 'myFooInTheirTrott', 'myFoxInTheirTrott'], 'matches for myF')

call vimtest#Quit()
