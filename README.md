PATTERN BRANCH COMPLETE
===============================================================================
_by Ingo Karkat_

DESCRIPTION
------------------------------------------------------------------------------

Some workflows gather several alternative (often mostly literal) pattern
branches as the current search pattern, for example to refactor / rename a
constant, class, and corresponding getters in one go. During this, it can be
useful to quickly recall words from the individual search alternatives in
insert mode completion, e.g. when writing / adapting corresponding API
documentation.

This plugin offers quick access to literal strings from the regular expression
branches of the current search pattern (quote/) via an alternative insert
mode completion.

### SEE ALSO

- The SearchAlternatives.vim plugin ([vimscript #4146](http://www.vim.org/scripts/script.php?script_id=4146)) offers mappings and
  commands to quickly add alternative branches to the current search pattern,
  facilitating a workflow that then also benefits from the completion source
  offered by this plugin.
- Check out the CompleteHelper.vim plugin page ([vimscript #3914](http://www.vim.org/scripts/script.php?script_id=3914)) for a full
  list of insert mode completions powered by it.

USAGE
------------------------------------------------------------------------------

    In insert mode, invoke the pattern branch completion via CTRL-X \ |.
    You can then search forward and backward via CTRL-N / CTRL-P, as usual.

    CTRL-X \ |              Split the current search pattern (quote/) into
                            toplevel branches (/foo\|bar/ -> foo, bar), remove
                            regular expression artifacts like position atoms
                            (/ordinary-atom) and |/multi|s, and unescape special
                            characters. In those branches that now (depending on
                            the pattern complexity) resemble mostly normal text,
                            find branches whose contents match the keyword before
                            the cursor. First, a match at the beginning is tried;
                            if that returns no results, it may match anywhere.

INSTALLATION
------------------------------------------------------------------------------

The code is hosted in a Git repo at
    https://github.com/inkarkat/vim-PatternBranchComplete
You can use your favorite plugin manager, or "git clone" into a directory used
for Vim packages. Releases are on the "stable" branch, the latest unstable
development snapshot on "master".

This script is also packaged as a vimball. If you have the "gunzip"
decompressor in your PATH, simply edit the \*.vmb.gz package in Vim; otherwise,
decompress the archive first, e.g. using WinZip. Inside Vim, install by
sourcing the vimball or via the :UseVimball command.

    vim PatternBranchComplete*.vmb.gz
    :so %

To uninstall, use the :RmVimball command.

### DEPENDENCIES

- Requires Vim 7.0 or higher.
- Requires the ingo-library.vim plugin ([vimscript #4433](http://www.vim.org/scripts/script.php?script_id=4433)), version 1.035 or
  higher.
- Requires the CompleteHelper.vim plugin ([vimscript #3914](http://www.vim.org/scripts/script.php?script_id=3914)), version 1.11 or
  higher.

CONFIGURATION
------------------------------------------------------------------------------

For a permanent configuration, put the following commands into your vimrc:
configvar

If you want to use a different mapping, map your keys to the
<Plug>(PatternBranchComplete) mapping target _before_ sourcing the script
(e.g. in your vimrc):

    imap <C-x><Bslash><Bar> <Plug>(PatternBranchComplete)

CONTRIBUTING
------------------------------------------------------------------------------

Report any bugs, send patches, or suggest features via the issue tracker at
https://github.com/inkarkat/vim-PatternBranchComplete/issues or email (address
below).

HISTORY
------------------------------------------------------------------------------

##### GOAL
First published version.

##### 0.01    13-Aug-2018
- Started development.

------------------------------------------------------------------------------
Copyright: (C) 2018-2019 Ingo Karkat -
The [VIM LICENSE](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license) applies to this plugin.

Maintainer:     Ingo Karkat <ingo@karkat.de>
