#!/bin/bash

echo -e $1 "\n"
curpathWithoutLines=$( echo $1 | cut -d ":" -f1 )
curpath="${curpathWithoutLines/#\~/$HOME}"

if [ -f "$curpath" ]; then
  $MYVIMDIR/plugged/fzf.vim/bin/preview.sh $1
elif [ -d "$curpath" ]; then
  tree -L 1 "$curpath"
else
  echo "Unsupported file " "$curpath"
fi
