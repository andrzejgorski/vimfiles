run_pre_commit() {
    if [ -e pre-commit.sh ]; then
        source pre-commit.sh
    fi
}

pythtest () {
    nosetests "$@"
}
alias ns='pythtest'
