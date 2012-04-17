#!/bin/bash

# Listar de av mina anteckningsfiler som innehåller
# angivet nyckelord i nyckelordsraden eller titeln.

for p in "$@";
do
	# Med fin rubrik och i färg:

    #echo "";
    #echo "### $p ###";
    #grep -lr --color=auto ^Keywords:.*"$p".*$ /home/johan/notes/*.txt;

	# Utan krimskrams:
	grep -lr -e ^Keywords:.*"$p".*$ -e ^Title:.*"$p".*$ /home/johan/notes/*.txt;
done;
