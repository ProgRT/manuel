LTX = lualatex --shell-escape
INCCHAP = -e '1i \\\includeonly{chap/chap$*}' 
NOIDX = -e '/makeindex/d'

.PHONY: clean title

manuel.pdf: manuel.tex chap/*.tex pkg.tex fig/fig-*.tex pkg/titlepage2.sty manuel.bbl
	${LTX} manuel.tex

titletest.pdf: titletest.tex titlepage2.tex framedtitle.tex
	${LTX} titletest

chap%.pdf:
	sed ${INCCHAP} ${NOIDX} manuel.tex > manuelChap$*.tex

	${LTX} -interaction nonstopmode --jobname chap$* manuelChap$*
	
clean:
	latexmk -c -silent
	cd chap && latexmk -c -silent

cleanall: clean
	rm -f *.auxlock *.bbl *.run.xml
