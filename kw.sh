#!/bin/bash

# Listar de av mina anteckningsfiler som innehåller
# angivet nyckelord i nyckelordsraden.

for p in "$@";
do
	# Med fin rubrik och i färg:

    #echo "";
    #echo "### $p ###";
    #grep -lr --color=auto ^Keywords:.*"$p".*$ /home/johan/notes/*.txt;

	# Utan krimskrams:
	grep -lr ^Keywords:.*"$p".*$ /home/johan/notes/*.txt;
done;
