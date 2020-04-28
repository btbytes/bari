NOTES=$(wildcard 2*.md)
HTML=$(patsubst %.md, %.html, $(NOTES))
SPSOURCES=$(wildcard *.md)
SPHTML=$(patsubst %.md, %.html, $(SPSOURCES))
PANDOC=pandoc --standalone -A inc.after -B inc.before --template=template.htm --css=style.css --quiet
all: $(HTML) archive.html index.html

archive.md: $(NOTES) bari
	python3 bari archive

index.md: $(NOTES) bari
	python3 bari index

# if you want author add: --metadata author=Yourname
%.html: %.md Makefile template.htm inc.after inc.before
	tail -n+2 $< | $(PANDOC) -f markdown \
	--metadata title="$(shell head -n 1 $<)" \
	--metadata date="$(shell echo $< | head -c 10)" \
	-o $@

index.html: index.md Makefile template.htm inc.after inc.before $(NOTES)
	$(PANDOC) $< -o $@

archive.html: archive.md Makefile template.htm inc.after inc.before $(NOTES)
	$(PANDOC) --metadata title=Archive $< -o $@

.PHONY:
clean:
	rm -f $(HTML)
	rm -f $(SPSOURCES)
	rm -f $(SPHTML)
