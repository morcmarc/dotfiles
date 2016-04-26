function fish_prompt
  set -l code     $status
  set -l cyan     (set_color -o cyan)
  set -l yellow   (set_color -o yellow)
  set -l red      (set_color -o red)
  set -l blue     (set_color -o blue)
  set -l green    (set_color -o green)
  set -l normal   (set_color normal)

	z --add "$PWD"

  echo -n -s (begin
    test $code = 0
      and echo "$green λ"
      or echo "$red λ"
  end) " $cyan"(basename (prompt_pwd)) (begin
    echo "$blue git:("$normal(git_branch_name)"$blue)"
    git_is_touched; and echo "$yellow✗"
  end)"$normal "
end
