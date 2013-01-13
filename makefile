LATEX = pdflatex
INDEX = makeindex
COMMON = DenebClass.cls
IMAGES = $(wildcard MEP/*.eps)

all: force DenebKaitos.pdf

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

DenebKaitos.pdf: DenebKaitos.tex

clean:
	rm -rf *.aux *.log *.toc *.out
	rm -rf *.idx *.ilg *.ind

mrproper: clean
	rm *.pdf

