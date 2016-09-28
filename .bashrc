#!/bin/bash
_SDIR=~/.bashrcd/; for f in `ls $_SDIR/*.sh`; do source $f; done; unset _SDIR; unset f
source /usr/local/bin/virtualenvwrapper.sh

# load prompt
if [ -f ~/.bashprompt ]; then
    . ~/.bashprompt
fi
