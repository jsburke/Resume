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

.PHONY: show
show: $(PDF)
	$(VIEW) $(PDF) &

$(PDF): *.tex 
	make clean
	$(TEX) $(TEX_FLAGS) $(SRC)

.PHONY: clean
clean:
	rm -rf *.log *.aux *.dvi *.lof *.lot *.out *.toc *.pdf
