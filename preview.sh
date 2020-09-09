#!/bin/bash

curpathWithoutLines=$( echo $1 | cut -d ":" -f1 )
echo -e $(echo $1 | rev | cut -d "/" -f1-2 | rev) "\n"
curpath="${curpathWithoutLines/#\~/$HOME}"

if [ -f "$curpath" ]; then
  $MYVIMDIR/plugged/fzf.vim/bin/preview.sh $1
elif [ -d "$curpath" ]; then
  tree -L 1 "$curpath"
else
  echo "Unsupported file " "$curpath"
fi
