TMPDIR=tmp

if [[ $1 = "arg-spa" ]]; then
   
lt-expand ../../../languages/apertium-arg/apertium-arg.arg.dix | grep -v REGEX | grep -v '<prn><enc>' | sed 's/:>:/%/g' | grep -v ':<:' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |\
        apertium-pretransfer|\
	lt-proc -b ../arg-spa.autobil.bin |lrx-proc ../arg-spa.autolex.bin |apertium-transfer -b ../apertium-spa-arg.arg-spa.t1x  ../arg-spa.t1x.bin | tee $TMPDIR/tmp_testvoc2.txt |\
        lt-proc -d ../../../languages/apertium-spa/spa.autogen.bin > $TMPDIR/tmp_testvoc3.txt
paste -d _ $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc3.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g'


elif [[ $1 = "spa-arg" ]]; then

lt-expand ../../../languages/apertium-spa/apertium-spa.spa.dix | grep -v REGEX | grep -v '<prn><enc>' | sed 's/:>:/%/g' | grep -v ':<:' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |\
        apertium-pretransfer|\
        lt-proc -b ../spa-arg.autobil.bin |lrx-proc ../spa-arg.autolex.bin |apertium-transfer -b ../apertium-spa-arg.spa-arg.t1x  ../spa-arg.t1x.bin | tee $TMPDIR/tmp_testvoc2.txt |\
        lt-proc -d ../../../languages/apertium-arg/arg.autogen.bin > $TMPDIR/tmp_testvoc3.txt
paste -d _ $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc3.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g'


else
	echo "sh inconsistency.sh <direction>";
fi
