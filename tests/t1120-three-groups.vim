" Test completion of branches within three sequential groups.
" Tests that all combinations are offered.

set completefunc=PatternBranchComplete#PatternBranchComplete
call PatternBranchComplete#Expr()   " Initialize script variables.

source ../../vim-CompleteHelper/tests/helpers/completetest.vim
let @/ = '\(b\|c\)\(a\|e\|i\|o\)ll\(y\|ies\)'

call vimtest#StartTap()
call vimtap#Plan(2)

call IsMatchesInIsolatedLine('b', ['bally', 'belly', 'billy', 'bolly', 'ballies', 'bellies', 'billies', 'bollies'], 'matches for b')
call IsMatchesInIsolatedLine('ll', ['bally', 'belly', 'billy', 'bolly', 'ballies', 'bellies', 'billies', 'bollies', 'cally', 'celly', 'cilly', 'colly', 'callies', 'cellies', 'cillies', 'collies'], 'matches for ll')

call vimtest#Quit()
