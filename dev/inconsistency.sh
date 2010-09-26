TMPDIR=/tmp
PAIR=es-an
DIX=/home/fran/source/apertium/incubator/apertium-es-an/apertium-es-an.an.dix

lt-expand $DIX | grep -e ':<:' -e '\w:\w' | sed 's/:<:/%/g' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/$PAIR.tmp_testvoc1.txt |
        apertium-pretransfer|
        apertium-transfer ../apertium-es-an.trules-an-es.xml  ../trules-an-es.bin  ../an-es.autobil.bin |
        lt-proc -d ../an-es.autogen.bin > $TMPDIR/$PAIR.tmp_testvoc3.txt
paste -d _ $TMPDIR/$PAIR.tmp_testvoc1.txt $TMPDIR/$PAIR.tmp_testvoc2.txt $TMPDIR/$PAIR.tmp_testvoc3.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g'
