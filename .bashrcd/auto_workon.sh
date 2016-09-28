has_virtualenv() {
    if [ -e .venv ]; then
        _VENV_TO_ACTIVATE=`cat .venv`
        _CURRENT_VENV=${VIRTUAL_ENV##*/}
        if [ "$_VENV_TO_ACTIVATE" != "$_CURRENT_VENV" ]; then
            workon `cat .venv`
        fi
    fi
}
venv_cd () {
    cd "$@" && has_virtualenv
}
has_pre_commit() {
    if [ -e pre-commit.sh ]; then
        source pre-commit.sh
    fi
}
alias cd="venv_cd"
