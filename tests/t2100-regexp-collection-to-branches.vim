" Test conversion of simple collections to branches in a group.

set completefunc=PatternBranchComplete#PatternBranchComplete
call PatternBranchComplete#Expr()   " Initialize script variables.

source ../../vim-CompleteHelper/tests/helpers/completetest.vim

call vimtest#StartTap()
call vimtap#Plan(2)

let @/ = 'fo[ox]b[ei]r'
call IsMatchesInIsolatedLine('f', ['foober', 'foxber', 'foobir', 'foxbir'], 'matches for f convert two simple collections')

let @/ = 'fo[oxy]\[[bB]ar\]'
call IsMatchesInIsolatedLine('f', ['foo[bar]', 'fox[bar]', 'foy[bar]', 'foo[Bar]', 'fox[Bar]', 'foy[Bar]'], 'matches for f do not convert escaped []')

call vimtest#Quit()
