VERSION=0.3
LANG1=es
LANG2=an
PREFIX1=$(LANG1)-$(LANG2)
PREFIX2=$(LANG2)-$(LANG1)
BASENAME=apertium-$(PREFIX1)

VAR1=std # Aragonés cheneral
VAR2=rib # Aragonés ribagorzano
VAR3=chi # Aragonés chistabín
PREFVAR1=#dejar en blanco
PREFVAR2=rib-
PREFVAR3=chi-
TARGETS_COMMON = $(PREFIX1).automorf.bin $(PREFIX1).autobil.bin $(PREFIX1).autogen.bin \
	$(PREFIX1).autopgen.bin $(PREFIX2).automorf.bin $(PREFIX2).autobil.bin \
	$(PREFIX2).autogen.bin $(PREFIX2).autopgen.bin

TARGETS = $(TARGETS_COMMON) $(PREFIX1).t1x.bin $(PREFIX2).t1x.bin 


.deps/commonbil.dix: $(BASENAME).$(PREFIX1).dix
	xsltproc --stringparam alt $(VAR1) alt.xsl $< >$@

.deps/$(PREFVAR1)$(LANG1).dix: $(BASENAME).$(LANG1).dix
	xsltproc --stringparam alt $(VAR1) alt.xsl $< >$@

.deps/$(PREFVAR2)$(LANG1).dix: $(BASENAME).$(LANG1).dix
	xsltproc --stringparam alt $(VAR2) alt.xsl $< >$@

.deps/$(PREFVAR3)$(LANG1).dix: $(BASENAME).$(LANG1).dix
	xsltproc --stringparam alt $(VAR3) alt.xsl $< >$@

.deps/$(PREFVAR1)$(LANG2).dix: $(BASENAME).$(LANG2).dix
	xsltproc --stringparam alt $(VAR1) alt.xsl $< >$@

.deps/$(PREFVAR2)$(LANG2).dix: $(BASENAME).$(LANG2).dix
	xsltproc --stringparam alt $(VAR2) alt.xsl $< >$@

.deps/common-$(PREFIX1).dix: $(BASENAME).$(PREFIX1).dix
	xsltproc translate-to-default-equivalent.xsl $< >$@

.deps/$(PREFVAR1)$(PREFIX1).dix: .deps/common-$(PREFIX1).dix
	xsltproc --stringparam alt $(VAR1) alt.xsl $< >$@

.deps/$(PREFVAR2)$(PREFIX1).dix: .deps/common-$(PREFIX1).dix
	xsltproc --stringparam alt $(VAR2) alt.xsl $< >$@

$(PREFVAR1)$(PREFIX1).automorf.bin: .deps/$(PREFVAR1)$(LANG1).dix $(BASENAME).$(LANG1).acx
	apertium-validate-acx $(BASENAME).$(LANG1).acx
	apertium-validate-dictionary $<
	lt-comp lr $< $@ $(BASENAME).$(LANG1).acx

$(PREFVAR1)$(PREFIX1).autobil.bin: .deps/$(PREFVAR1)$(PREFIX1).dix
	apertium-validate-dictionary $<
	lt-comp lr $< $@

$(PREFVAR1)$(PREFIX1).autogen.bin: .deps/$(PREFVAR1)$(LANG2).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@

$(PREFIX1).autopgen.bin: $(BASENAME).post-$(LANG2).dix
	apertium-validate-dictionary $<
	lt-comp lr $< $@

$(PREFVAR1)$(PREFIX2).automorf.bin: .deps/$(PREFVAR1)$(LANG2).dix $(BASENAME).$(LANG2).acx
	apertium-validate-acx $(BASENAME).$(LANG2).acx
	apertium-validate-dictionary $<
	lt-comp lr $< $@ $(BASENAME).$(LANG2).acx

$(PREFVAR1)$(PREFIX2).autobil.bin: .deps/$(PREFVAR1)$(PREFIX1).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@

$(PREFVAR1)$(PREFIX2).autogen.bin: .deps/$(PREFVAR1)$(LANG1).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@

$(PREFVAR1)$(PREFIX2).autopgen.bin: $(BASENAME).post-$(LANG1).dix
	apertium-validate-dictionary $<
	lt-comp lr $< $@

$(PREFVAR2)$(PREFIX1).automorf.bin: .deps/$(PREFVAR2)$(LANG1).dix $(BASENAME).$(LANG1).acx
	apertium-validate-acx $(BASENAME).$(LANG1).acx
	apertium-validate-dictionary $<
	lt-comp lr $< $@ $(BASENAME).$(LANG1).acx

#$(PREFVAR2)$(PREFIX1).automorf.bin: .deps/$(PREFVAR2)$(LANG1).dix $(BASENAME).$(LANG1).acx
#	apertium-validate-acx $(BASENAME).$(LANG1).acx
#	apertium-validate-dictionary $<
#	lt-comp lr $< $@ $(BASENAME).$(LANG1).acx
#
#$(PREFVAR2)$(PREFIX1).autobil.bin: .deps/$(PREFVAR2)$(PREFIX1).dix
#	apertium-validate-dictionary $<
#	lt-comp lr $< $@
#
#$(PREFVAR2)$(PREFIX1).autogen.bin: .deps/$(PREFVAR2)$(LANG2).dix
#	apertium-validate-dictionary $<
#	lt-comp rl $< $@
#
#$(PREFVAR2)$(PREFIX2).automorf.bin: .deps/$(PREFVAR2)$(LANG2).dix $(BASENAME).$(LANG2).acx
#	apertium-validate-acx $(BASENAME).$(LANG2).acx
#	apertium-validate-dictionary $<
#	lt-comp lr $< $@ $(BASENAME).$(LANG2).acx
#
#$(PREFVAR2)$(PREFIX2).autobil.bin: .deps/$(PREFVAR2)$(PREFIX1).dix
#	apertium-validate-dictionary $<
#	lt-comp rl $< $@
#
#$(PREFVAR2)$(PREFIX2).autogen.bin: .deps/$(PREFVAR2)$(LANG1).dix
#	apertium-validate-dictionary $<
#	lt-comp rl $< $@
#
$(PREFVAR2)$(PREFIX1).autobil.bin: .deps/$(PREFVAR2)$(PREFIX1).dix
	apertium-validate-dictionary $<
	lt-comp lr $< $@

$(PREFVAR2)$(PREFIX1).autogen.bin: .deps/$(PREFVAR2)$(LANG2).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@

$(PREFVAR2)$(PREFIX2).automorf.bin: .deps/$(PREFVAR2)$(LANG2).dix $(BASENAME).$(LANG2).acx
	apertium-validate-acx $(BASENAME).$(LANG2).acx
	apertium-validate-dictionary $<
	lt-comp lr $< $@ $(BASENAME).$(LANG2).acx

$(PREFVAR2)$(PREFIX2).autobil.bin: .deps/$(PREFVAR2)$(PREFIX1).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@

$(PREFVAR2)$(PREFIX2).autogen.bin: .deps/$(PREFVAR2)$(LANG1).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@

$(PREFIX1).t1x.bin: $(BASENAME).$(PREFIX1).t1x
	apertium-validate-transfer $(BASENAME).$(PREFIX1).t1x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t1x \
	                             $(PREFIX1).t1x.bin

$(PREFIX2).t1x.bin: $(BASENAME).$(PREFIX2).t1x
	apertium-validate-transfer $(BASENAME).$(PREFIX2).t1x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX2).t1x \
	                             $(PREFIX2).t1x.bin

EXTRA_DIST=$(BASENAME).$(LANG1).dix $(BASENAME).$(PREFIX1).dix \
           $(BASENAME).post-$(LANG1).dix $(BASENAME).post-$(LANG2).dix \
           $(BASENAME).$(LANG2).dix $(BASENAME).$(LANG1).tsx \
           $(BASENAME).$(PREFIX2).t1x $(BASENAME).$(PREFIX1).t1x $(PREFIX1).prob $(PREFIX2).prob \
           modes.xml translate-to-default-equivalent.xsl alt.xsl filter.xsl filter.sh \
           $(BASENAME).$(LANG1).acx $(BASENAME).$(LANG2).acx


apertium_es_andir=$(prefix)/share/apertium/apertium-$(PREFIX1)/
apertium_es_modesdir=$(prefix)/share/apertium/modes/

modes/$(PREFIX1).mode: modes.xml 
	apertium-validate-modes modes.xml
	apertium-gen-modes modes.xml
	cp *.mode modes/

# All modes are created by the same goal, listing several will just give problems with make -j2
noinst_DATA=modes/$(PREFIX1).mode

apertium_es_an_DATA=$(PREFVAR1)$(PREFIX1).automorf.bin $(PREFVAR1)$(PREFIX2).automorf.bin \
	$(PREFVAR1)$(PREFIX1).autobil.bin $(PREFVAR1)$(PREFIX2).autobil.bin \
	$(PREFVAR1)$(PREFIX1).autogen.bin $(PREFVAR1)$(PREFIX2).autogen.bin \
	$(PREFIX1).autopgen.bin $(PREFIX2).autopgen.bin \
	$(PREFIX1).prob $(PREFIX2).prob \
	$(BASENAME).$(PREFIX2).t1x  \
	$(PREFIX2).t1x.bin \
	$(BASENAME).$(PREFIX1).t1x  \
	$(PREFIX1).t1x.bin

install-data-local:
	mv modes modes.bak
	apertium-gen-modes modes.xml apertium-$(PREFIX1)
	rm -rf modes
	mv modes.bak modes
	test -d $(DESTDIR)$(apertium_es_modesdir) || mkdir $(DESTDIR)$(apertium_es_modesdir)
	$(INSTALL_DATA) $(PREFVAR1)$(PREFIX2).mode $(DESTDIR)$(apertium_es_modesdir)
	$(INSTALL_DATA) $(PREFIX1).mode $(DESTDIR)$(apertium_es_modesdir)
	$(INSTALL_DATA) $(BASENAME).$(PREFIX1).t1x $(DESTDIR)$(apertium_es_andir)
	$(INSTALL_DATA) $(BASENAME).$(PREFIX2).t1x $(DESTDIR)$(apertium_es_andir)

CLEANFILES = -rf $(TARGETS) modes .deps/ 

