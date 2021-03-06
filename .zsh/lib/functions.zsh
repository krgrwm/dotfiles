function zsh_stats() {
  history | awk '{print $2}' | sort | uniq -c | sort -rn | head
}

function uninstall_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/uninstall.sh
}

function upgrade_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
}

function take() {
  mkdir -p $1
  cd $1
}

# sheet
compdef _sheets sheet
function _sheets {
  local -a cmds
  _files -W  ~/.sheets/ -P '~/.sheets/'
 
  cmds=('list' 'edit' 'copy')
  _describe -t commands "subcommand" cmds
 
  return 1;
}

chpwd() {
    ls_abbrev
}

ls_abbrev() {
    if [[ ! -r $PWD ]]; then
        return
    fi
    # -a : Do not ignore entries starting with ..
    # -C : Force multi-column output.
    # -F : Append indicator (one of */=>@|) to entries.
    local cmd_ls='ls'
    local -a opt_ls
    opt_ls=('-CF' '--color=always')
    case "${OSTYPE}" in
        freebsd*|darwin*)
            if type gls > /dev/null 2>&1; then
                cmd_ls='gls'
            else
                # -G : Enable colorized output.
                opt_ls=('-aCFG')
            fi
            ;;
    esac

    local ls_result
    ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]} | sed $'/^\e\[[0-9;]*m$/d')

    local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')

    if [ $ls_lines -gt 10 ]; then
        echo "$ls_result" | head -n 5
        echo '...'
        echo "$ls_result" | tail -n 5
        echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
    else
        echo "$ls_result"
    fi
}


function peco-snippets() {
    BUFFER=$(cat <(echo "") <(grep "" ~/.sheets/*) | awk '{FS="sheets/"; print $2}' | $PECO --query "$LBUFFER" |
    cut -d ":" -f 2- |
    perl -wnl -e '@l=split(/#/,$_); print join("#", @l[0..$#l-1])'
#    cut -d "#" -f 1
    )
    #zle accept-line
    #zle clear-screen
    zle beginning-of-line
}

function subs-snippet()
{
    export MARKER="%%"
    local AT
    AT=$(echo $RBUFFER | perl -wnl -e '/$ENV{MARKER}/g and print pos')
    if [[ $AT -ne 0 ]]; then
        CURSOR=$((CURSOR+AT-$#MARKER))
        for i in {1..$#MARKER}; do
            zle delete-char-or-list
        done
        zle kill-word
    else
        zle end-of-line
    fi
}

function peco-history() {
    LINES=150
    BUFFER=$( fc -l -n 1 | tail -n $LINES | tac | $PECO --query "$LBUFFER")
    zle accept-line
}

file_basename()
{
    cat - | perl -wnl -MFile::Basename -e 'printf("%-33s %s\n", basename($_), $_)'
}


function peco-autojump-list() {

    DIRS=$(dirs | perl -wnl -e 's/ /\n/g and print')
    AUTOJ=$(cat ~/.local/share/autojump/autojump.txt | sort -nr | cut -f2)
    TMP=$(cat <(echo $DIRS) <(echo $AUTOJ) | file_basename)
    echo $TMP
}

function peco-autojump() {
    BUFFER="$(peco-autojump-list | perl -wnl -e 's/$ENV{"HOME"}/~/g and print' \
         | $PECO | perl -wla -e 'print $F[1]')"
    zle accept-line
}

function dest() {
    echo $(peco-autojump-list  | $PECO | perl -wla -e 'print $F[1]')
}

function peco-bookmark() {
    BUFFER=$(cat ~/.bookmark_dirs | $PECO --query "$LBUFFER" |
    perl -wla -e 'print $F[1]')
    zle accept-line
}
zle -N peco-bookmark

function peco-cd() {

# yarizurai cara hutuuni cd
    BUFFER=$(ls --color=none -d */ | $PECO --query "$LBUFFER")
#    pushln 'cd '
    zle accept-line
}
function cddown_dir(){
    com='$SHELL -c "ls -AF . | grep / "'
    while [ $? = 0 ] # $?: the exit status of the last command, failed-> not zero
    do
        cdir=`eval $com | $PECO --query ''`
        if [ $? = 0 ];then # check the exit status of cdir=...
            cd $cdir # $? is zero
            eval $com # for while check. if there is no dir, $? is not zero
        else
            break
        fi
    done
    zle reset-prompt
}

function peco-commands() {
    BUFFER=$(cat <(commands) <(alias | cut -d= -f1) | $PECO --query '^')
    zle end-of-line
    zle magic-space
}

function peco-select() {
    IFS='\ '
    RES=$(ls --color=none | $PECO | tr -d '\r')
    if [[ -n $RES ]]; then
        LBUFFER+=" \"${RES}\" "
    fi
    zle reset-prompt
}

function peco-open() {
    IFS='\ '
#    RES=$(ls --color=none | $PECO | tr -d '\r')
    RES=$(find | $PECO | tr -d '\r')
    if [[ -n $RES ]]; then
        LBUFFER+="${RES}"
    fi
    zle accept-line
    zle reset-prompt
    zle accept-line
}
zle -N peco-open

function bind-ls() {
    echo
    no
    zle accept-line
}

function do-enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls_abbrev
    zle reset-prompt
    return 0
}
zle -N do-enter

function show-buffer-stack(){
    POSTDISPLAY="
    stack: $LBUFFER"
    zle push-line
}

zle -N peco-snippets
zle -N subs-snippet
zle -N peco-history
zle -N peco-autojump
zle -N peco-cd
zle -N cddown_dir
zle -N peco-commands
zle -N peco-select
zle -N bind-ls
zle -N show-buffer-stack


function key-binds() {
    ag -A 100 "Custom" ~/.oh-my-zsh/lib/key-bindings.zsh
    zle accept-line
}
zle -N key-binds


function peco-anamnesis(){
# \047 = '
    BUFFER=$(anamnesis -l 200 | tail --lines=+3 | perl -wnl -e '/u\047(.*)\\n/ and print $1' | $PECO )
}
zle -N peco-anamnesis

function kill-clipboard(){
    zle kill-line
    if [[ ! "$(uname)" == "FreeBSD" ]] ; then
        echo $CUTBUFFER | xsel -i -b
    fi
}
zle -N kill-clipboard

function agvim() {
vim $(ag $@ | $PECO | awk -F : '{print "-c " $2 " "$1}')
}

function peco-dfind() {
    local current_buffer=$BUFFER
    # .git$B7O$J$IIT2D;k%U%)%k%@$O=|30(B
    local selected_dir="$(find . -maxdepth 5 -type d ! -path "*/.*"| $PECO)"
    if [ -d "$selected_dir" ]; then
        BUFFER="${current_buffer} \"${selected_dir}\""
        CURSOR=$#BUFFER
        # $B"-7hDj;~$K$=$N$^$^<B9T$9$k$J$i(B
        #zle accept-line
    fi
    zle clear-screen
    zle accept-line
}
zle -N peco-dfind

# alias of perl
p()
{
    if [[ $ARGC -eq 1 ]]; then
        perl -w -e $1
    elif [ $ARGC -eq 2 ]; then
        perl -w $1 -e $2
    else
        perl -w $1 -e $2 $argv[3,-1]
    fi
}

vim_RO()
{
    cat - | vim -R -c 'set nolist nomod noma' -
}

# http://blog.b4b4r07.com/entry/2015/11/08/013526
mru() {
    local -a f
    f=(
    /tmp/neomru/file(N)
    ~/.vim_mru_files(N)
    ~/.unite/file_mru(N)
    ~/.cache/ctrlp/mru/cache.txt(N)
    ~/.frill(N)
    )
    if [[ $#f -eq 0 ]]; then
        echo "There is no available MRU Vim plugins" >&2
        return 1
    fi

    local cmd q k res
    local line ok make_dir i arr
    local get_styles styles style
    while : ${make_dir:=0}; ok=("${ok[@]:-dummy_$RANDOM}"); cmd="$(
        cat <$f \
            | while read line; do [ -e "$line" ] && echo "$line"; done \
            | while read line; do [ "$make_dir" -eq 1 ] && echo "${line:h}/" || echo "$line"; done \
            | awk '!a[$0]++' \
            | perl -pe 's/^(\/.*\/)(.*)$/\033[34m$1\033[m$2/' \
            | fzf --ansi --multi --query="$q" \
            --no-sort --exit-0 --prompt="MRU> " \
            --print-query --expect=ctrl-v,ctrl-x,ctrl-l,ctrl-q,ctrl-r,"?"
            )"; do
        q="$(head -1 <<< "$cmd")"
        k="$(head -2 <<< "$cmd" | tail -1)"
        res="$(sed '1,2d;/^$/d' <<< "$cmd")"
        [ -z "$res" ] && continue
        case "$k" in
            "?")
                cat <<HELP > /dev/tty
usage: vim_mru_files
    list up most recently files
keybind:
  ctrl-v  vim files under the cursor
  ctrl-r  change view type
HELP
                return 1
                ;;
            ctrl-r)
                if [ $make_dir -eq 1 ]; then
                    make_dir=0
                else
                    make_dir=1
                fi
                continue
                ;;
            ctrl-v)
                vim -p "${(@f)res}" < /dev/tty > /dev/tty
                ;;
            *)
                echo "${(@f)res}"
                break
                ;;
        esac
    done
}
