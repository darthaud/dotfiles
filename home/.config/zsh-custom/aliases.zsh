alias cls='printf "\033c"'
alias ccat='pygmentize -g -O style=monokai -f console256 -g'
alias vi='vim'
alias server='python3 -m http.server'
alias h='homesick'
alias find-trailing='find . -type f -exec grep -E -l " +$" {} \;'
alias file-sizes='sudo find -mindepth 1 -maxdepth 1 -exec du -hs {} \; | sort -hr'

# Docker
alias d='docker'
alias dc='docker-compose'
alias fig='echo "Use docker-compose"'
alias dup='docker-compose up -d'
alias drun='docker-compose run --rm'
alias dstop='docker-compose stop'
alias druns='docker-compose run --rm --service-ports'
alias dkill='docker-compose kill'
alias drm='docker-compose rm'
alias dps='docker-compose ps'
alias dlogs='docker-compose logs'
alias drunb='docker-compose run --rm web bash'
alias drunsb='docker-compose run --rm --service-ports web bash'
alias docker-clean='docker ps -qa --filter status=exited --filter status=created | xargs -r docker rm'
alias docker-clean-images='docker images -q --filter="dangling=true" | xargs -r docker rmi'
alias docker-clean-volumes='docker volume ls -qf dangling=true | xargs -r docker volume rm'

# ssh
alias s='ssh'

# Git
alias gcln='git clone'

# Vagrant
alias v='vagrant'
alias vdestroy='vagrant destroy'
alias vhalt='vagrant halt'
alias vprovision='vagrant provision'
alias vreload='vagrant reload'
alias vssh='vagrant ssh'
alias vst='vagrant status'
alias vup='vagrant up'
