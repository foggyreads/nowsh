#/usr/bin

nowpath='/home/'$(whoami)'/Now';

Now()
{

  # Load all main.sh from lib/{Command} - the main.sh will handle the main methods calls.
  find $nowpath/lib -maxdepth 2 -type f -name "main.sh" -print \
    | while read f; do source "$f"; done;


  # Completion
  if [ -d $nowpath/lib/Completion ]; then
    fpath=($fpath $nowpath/lib/Completion);

    # Next line is needed to avoid having Now completion pop up as insecure directories.
    # @see https://stackoverflow.com/questions/13762280/zsh-compinit-insecure-directories
    #KNOW# xargs will not execute on empty input if flag -r is provided.
    compaudit | xargs -r chown -R "$(whoami)" ; compaudit | xargs -r chmod go-w;

    compinit;
  fi;


}

Now
