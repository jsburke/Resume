#############################
#                           #
# Project Files             #
#                           #
#############################

FILE     ?= John_Burke_Resume
SRC       = $(addsuffix .tex, $(FILE))
PDF       = $(addsuffix .pdf, $(FILE))

#############################
#                           #
# Build controls            #
#                           #
#############################

TEX        = lualatex
VIEW       = evince

#############################
#                           #
# Targets                   #
#                           #
#############################

.PHONY: default
default: show

.PHONY: pdf
pdf: $(PDF)

$(PDF): *.tex 
	make build
	make clean

.PHONY: show
show: $(PDF)
	$(VIEW) $(PDF) &

.PHONY: build
build: 
	$(TEX) $(TEX_FLAGS) $(SRC)

.PHONY: rebuild
rebuild:
	make purge
	make pdf

.PHONY: reshow
reshow: rebuild
	make show

.PHONY: clean
clean:
	rm -rf *.log *.aux *.dvi *.lof *.lot *.out *.toc

.PHONY: purge
purge: 
	make clean
	rm -rf *.pdf

