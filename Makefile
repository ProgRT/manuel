LTX = lualatex --shell-escape
INCCHAP = -e '1i \\\includeonly{chap/chap$*}' 
NOIDX = -e '/makeindex/d'

.PHONY: clean title

manuel.pdf: manuel.tex chap/*.tex pkg.tex fig/fig-*.tex titlepage2.sty
	${LTX} manuel.tex

titletest.pdf: titletest.tex titlepage2.tex framedtitle.tex
	${LTX} titletest

chap%.pdf:
	sed ${INCCHAP} ${NOIDX} manuel.tex > manuelChap$*.tex

	${LTX} -interaction nonstopmode --jobname chap$* manuelChap$*
	
clean:
	rm -f *.log *.nav *.aux *.out *.snm *.toc *.ent *.run.xml *.blg *.bcf *.idx *.bbl *.ilg chap/*.aux *.auxlock
