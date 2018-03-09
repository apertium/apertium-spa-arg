TMPDIR=tmp

if [[ $1 = "an-es" ]]; then
   
lt-expand ../apertium-es-an.an.dix | grep -v REGEX | grep -v '<prn><enc>' | sed 's/:>:/%/g' | grep -v ':<:' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |
        apertium-pretransfer|
        apertium-transfer ../apertium-es-an.an-es.t1x  ../an-es.t1x.bin  ../an-es.autobil.bin | tee $TMPDIR/tmp_testvoc2.txt |
        lt-proc -d ../an-es.autogen.bin > $TMPDIR/tmp_testvoc3.txt
paste -d _ $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc3.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g'

elif [[ $1 = "es-an" ]]; then

lt-expand ../apertium-es-an.es.dix | grep -v REGEX | grep -v '<prn><enc>' | sed 's/:>:/%/g' | grep -v ':<:' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |\
        apertium-pretransfer|\
        apertium-transfer ../apertium-es-an.es-an.t1x ../es-an.t1x.bin  ../es-an.autobil.bin | tee $TMPDIR/tmp_testvoc2.txt |\
        lt-proc -d ../es-an.autogen.bin > $TMPDIR/tmp_testvoc3.txt
paste -d _ $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc3.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g'


else
	echo "sh inconsistency.sh <direction>";
fi
