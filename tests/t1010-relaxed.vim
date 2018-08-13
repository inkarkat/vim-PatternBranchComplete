" Test relaxed completion of simple branches.

set completefunc=PatternBranchComplete#PatternBranchComplete
call PatternBranchComplete#Expr()   " Initialize script variables.

source ../../vim-CompleteHelper/tests/helpers/completetest.vim
let @/ = 'foobar\|foxyness\|hallo\|hollow\|follow through'

call vimtest#StartTap()
call vimtap#Plan(3)
call IsMatchesInIsolatedLine('xy', ['foxyness'], 'relaxed match for xy')
call IsMatchesInIsolatedLine('gh', ['follow through'], 'relaxed match for gh')
call IsMatchesInIsolatedLine('low', ['hollow', 'follow through'], 'relaxed matches for low')
call vimtest#Quit()
