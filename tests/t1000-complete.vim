" Test completion of simple branches.

set completefunc=PatternBranchComplete#PatternBranchComplete
call PatternBranchComplete#Expr()   " Initialize script variables.

source ../../vim-CompleteHelper/tests/helpers/completetest.vim
let @/ = 'foobar\|foxyness\|hallo\|hollow\|follow through'

call vimtest#StartTap()
call vimtap#Plan(3)
call IsMatchesInIsolatedLine('doesnotexist', [], 'no matches for doesnotexist')
call IsMatchesInIsolatedLine('hal', ['hallo'], 'match for hal')
call IsMatchesInIsolatedLine('fo', ['foobar', 'foxyness', 'follow through'], 'matches for fo')
call vimtest#Quit()
