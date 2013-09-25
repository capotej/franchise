if [[ ! -o interactive ]]; then
    return
fi

compctl -K _franchise franchise

_franchise() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(franchise commands)"
  else
    completions="$(franchise completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
