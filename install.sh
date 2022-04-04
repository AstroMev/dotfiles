#!/usr/bin/env bash

# https://qiita.com/yutkat/items/c6c7584d9795799ee164

set -ue

helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}

backup_dotfiles() {
  local bkup="$HOME/.dotbackup"
  command echo "backup old dotfiles to $bkup ..."
  if [ ! -d "$bkup" ];then
    command mkdir "$bkup"
  fi

  for df in $(command ls -A ./files/); do
    if [ -f "$HOME/$df" ]; then
      command echo "backup $df"
      command cp "$HOME/$df" "$bkup/"
    fi
  done
}

link_to_homedir() {
  for df in $(command ls -A ./files/); do
    command echo "create symlink for $df"
    command rm -f "$HOME/$df"
    command ln -snf "$(command pwd)/files/$df" "$HOME"
  done
}

# Main

while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      helpmsg
      exit 1
      ;;
    *)
      ;;
  esac
  shift
done

backup_dotfiles
link_to_homedir
command echo -e "\e[1;36m Install completed!!!! \e[m"
