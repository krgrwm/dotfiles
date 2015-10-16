# completion

setopt   auto_list auto_param_slash list_packed rec_exact
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on succesive tab press
setopt always_to_end

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' remote-access false
zstyle ':completion:*' completer _oldlist _expand _complete _prefix _list _history

zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"



## 補完方法毎にグループ化する。
### 補完方法の表示方法
###   %B...%b: 「...」を太字にする。
###   %d: 補完方法のラベル
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''

## 補完候補がなければより曖昧に候補を探す。
### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'

## 詳細な情報を使う。
zstyle ':completion:*' verbose yes

## カーソル位置で補完する。
setopt complete_in_word
## globを展開しないで候補の一覧から補完する。
setopt glob_complete
## 補完時にヒストリを自動的に展開する。
setopt hist_expand
## 補完候補がないときなどにビープ音を鳴らさない。
setopt no_beep
## 辞書順ではなく数字順に並べる。
setopt numeric_glob_sort

# --prefix=~/localというように「=」の後でも
## 「~」や「=コマンド」などのファイル名展開を行う。
setopt magic_equal_subst


## 「/」も単語区切りとみなす。
WORDCHARS=${WORDCHARS:s,/,,}
WORDCHARS=${WORDCHARS:s,-,,}
WORDCHARS=${WORDCHARS:s,_,,}

zmodload -i zsh/complist

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
cdpath=(.)

# use /etc/hosts and known_hosts for hostname completion
[ -r /etc/ssh/ssh_known_hosts ] && _global_ssh_hosts=(${${${${(f)"$(</etc/ssh/ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
hosts=(
  "$_global_ssh_hosts[@]"
  "$_ssh_hosts[@]"
  "$_etc_hosts[@]"
  "$HOST"
  localhost
)
zstyle ':completion:*:hosts' hosts $hosts

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path /tmp/zsh/cache/

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
        dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
        hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
        mailman mailnull mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
        operator pcap postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs

# ... unless we really want to.
zstyle '*' single-ignored show

if [ "x$COMPLETION_WAITING_DOTS" = "xtrue" ]; then
  expand-or-complete-with-dots() {
    echo -n "\e[31m......\e[0m"
    zle expand-or-complete
    zle redisplay
  }
  zle -N expand-or-complete-with-dots
  bindkey "^I" expand-or-complete-with-dots
fi


zstyle ':completion:*:manuals' separate-sections true

if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi











# incremental completion
function () { # precompile
    local A
    A=~/.zsh/modules/auto-fu/auto-fu.zsh
    [[ -e "${A:r}.zwc" ]] && [[ "$A" -ot "${A:r}.zwc" ]] ||
        zsh -c "source $A; auto-fu-zcompile $A ${A:h}" >/dev/null 2>&1
}


#source ~/.zsh/auto-fu.zsh/auto-fu.zsh
{ . ~/.zsh/auto-fu; auto-fu-install; }

zstyle ':auto-fu:highlight' input bold
zstyle ':auto-fu:highlight' completion fg=white,dim
zstyle ':auto-fu:highlight' completion/one fg=green,dim
#zstyle ':auto-fu:var' postdisplay ''
zstyle ':auto-fu:var' track-keymap-skip opp

zstyle ':completion:*"' use-cache true

function zle-line-init () { auto-fu-init }; zle -N zle-line-init
zle -N zle-keymap-select auto-fu-zle-keymap-select

function afu+cancel () {
    afu-clearing-maybe
    ((afu_in_p == 1)) && { afu_in_p=0; BUFFER="$buffer_cur"; }
}
zle -N afu+cancel

function bindkey-advice-before () {
    local key="$1"
    local advice="$2"
    local widget="$3"
    [[ -z "$widget" ]] && {
        local -a bind
        bind=(`bindkey -M main "$key"`)
        widget=$bind[2]
    }
    local fun="$advice"
if [[ "$widget" != "undefined-key" ]]; then
    local code=${"$(<=(cat <<"EOT"
    function $advice-$widget () {
    zle $advice
    zle $widget
}
fun="$advice-$widget"
EOT
))"}

eval "${${${code//\$widget/$widget}//\$key/$key}//\$advice/$advice}"
        fi
        zle -N "$fun"
        bindkey -M afu "$key" "$fun"
    }
    bindkey-advice-before "^G" afu+cancel
    bindkey-advice-before "^[" afu+cancel
    bindkey-advice-before "^J" afu+cancel afu+accept-line

    # delete unambiguous prefix when accepting line
    function afu+delete-unambiguous-prefix () {
    afu-clearing-maybe
    local buf; buf="$BUFFER"
    local bufc; bufc="$buffer_cur"
    [[ -z "$cursor_new" ]] && cursor_new=-1
    [[ "$buf[$cursor_new]" == ' ' ]] && return
    [[ "$buf[$cursor_new]" == '/' ]] && return
    ((afu_in_p == 1)) && [[ "$buf" != "$bufc" ]] && {
    # there are more than one completion candidates
    zle afu+complete-word
    [[ "$buf" == "$BUFFER" ]] && {
    # the completion suffix was an unambiguous prefix
    afu_in_p=0; buf="$bufc"
}
BUFFER="$buf"
buffer_cur="$bufc"
        }
    }
    zle -N afu+delete-unambiguous-prefix
    function afu-ad-delete-unambiguous-prefix () {
    local afufun="$1"
    local code; code=$functions[$afufun]
    eval "function $afufun () { zle afu+delete-unambiguous-prefix; $code }"
}
afu-ad-delete-unambiguous-prefix afu+accept-line
afu-ad-delete-unambiguous-prefix afu+accept-line-and-down-history
afu-ad-delete-unambiguous-prefix afu+accept-and-hold
