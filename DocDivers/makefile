LATEX = pdflatex
INDEX = makeindex
COMMON = DenebClass.cls
IMAGES = $(wildcard MEP/*.eps)

all: force Ssigar.pdf Exemple.pdf Bitkeeva.pdf CR.pdf

force:
	touch *.tex

%.pdf: %.tex %.aux
	${LATEX} $<
	${LATEX} $<

%.aux %.idx: %.tex
	${LATEX} $<
	${LATEX} $<

%.ind: %.idx %.tex
	$(INDEX) $<
	${INDEX} $<

Exemple.pdf: Exemple.tex

Ssigar.pdf: Ssigar.tex

Bitkeeva.pdf: Bitkeeva.tex

CR.pdf: CR.tex

clean:
	rm -rf *.aux *.log *.toc *.out
	rm -rf *.idx *.ilg *.ind
	mv -f *.pdf pdf/

mrproper: clean
	rm *.pdf

