" Test cleanup of regular expression atoms, multis etc.

set completefunc=PatternBranchComplete#PatternBranchComplete
call PatternBranchComplete#Expr()   " Initialize script variables.

source ../../vim-CompleteHelper/tests/helpers/completetest.vim
let @/ = '^\%>2l\<my\%(Fo\+\|Ba*r\|Fox\)\?Trott\>$'

call vimtest#StartTap()
call vimtap#Plan(2)

call IsMatchesInIsolatedLine('myB', ['myBarTrott'], 'match for myB')
call IsMatchesInIsolatedLine('myF', ['myFoTrott', 'myFoxTrott'], 'matches for myF')

call vimtest#Quit()
