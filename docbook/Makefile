DOC = case-for-file-swapping

UPLOAD_PATH = $${HOMEPAGE_SSH_PATH}/philosophy/case-for-file-swapping/revision-2/


MORE_FILES = Summary.txt

DOCMAKE_PARAMS = --stringparam "chunk.section.depth=2"

DOCMAKE = docmake -v $(DOCMAKE_PARAMS)

FILES_TO_UPLOAD += $(MORE_FILES)

all: xhtml

XHTML_OTHER_FILES = $(addprefix $(XHTML_DEST)/,style.css)
XHTML_DEST = file-swapping
XHTML_DEST_FILE =$(XHTML_DEST)/index.html

DOCBOOK_XML_SOURCE = $(DOC).xml

fo: $(DOC).fo

pdf: $(DOC).pdf

xhtml: $(XHTML_DEST_FILE) $(XHTML_OTHER_FILES)

rtf: $(DOC).rtf

$(DOC).fo: $(DOCBOOK_XML_SOURCE)
	$(DOCMAKE) -o $@ fo $<

$(DOC).pdf: $(DOCBOOK_XML_SOURCE)
	$(DOCMAKE) -o $@ pdf $<

$(XHTML_DEST_FILE): $(DOCBOOK_XML_SOURCE)
	$(DOCMAKE) -x /home/shlomi/progs/perl/cpan/App/Docmake/trunk/share/sgml/docbook-shlomif/xsl-stylesheets/shlomif-essays-xhtml-onechunk.xsl -o $(XHTML_DEST) xhtml $<

$(XHTML_DEST)/style.css: style.css
	cp -f $< $@

$(DOC).rtf: $(DOCBOOK_XML_SOURCE)
	$(DOCMAKE) -o $@ rtf $<

upload: xhtml
	rsync -v --progress -a $(XHTML_DEST) $(DOC).xml $(DOC).pdf $(DOC).rtf $(UPLOAD_PATH)

konq:
	kfmclient openURL $(XHTML_DEST)/index.html

upload_all: pdf rtf upload
