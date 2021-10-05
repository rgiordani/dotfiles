#!/bin/bash
# sortdir [-s] [<dir>]
# Ordina fisicamente i file di una directory
#
# -s ordinamento casuale

usage='USO: sortdir [-s] [<dir>]'

# parsing parametri
opt="$1"
until [ "${opt:0:1}" != "-" ]; do
   if [ "$1" = "-s" ]; then
      shuffle=1
   else
      echo "opzione sconosciuta $opt"
      echo "$usage"
      exit 1
   fi

   shift
   opt="$1"
done

if [ $# -eq 0 ]; then
   dir="$(pwd)"
elif [ $# -eq 1 ]; then
   dir="$1"
   if [ ! -d "$dir" ]; then
      echo "$dir non è una directory"
      exit 1
   fi
elif [ $# -gt 1 ]; then
   echo "$usage"
   exit 1
fi

# estrazione e ordinamento elenco file
cd "$dir"
tmp_ls="$(mktemp)"

if [ "$shuffle" ]; then
   ls -A | shuf > "$tmp_ls"
else
   ls -A | sort > "$tmp_ls"
fi

# cartella di lavoro
tmp_dir="$(mktemp -d -p .)"

# spostamento dei file nella cartella di lavoro e indietro
cat "$tmp_ls" | while read f; do
   mv "$f" "$tmp_dir/"
done
cat "$tmp_ls" | while read f; do
   mv "$tmp_dir/$f" .
done

# eliminazione file e cartella di lavoro
rm "$tmp_ls"
rmdir "$tmp_dir"
