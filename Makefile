.PHONY: clean

manuel.pdf: manuel.tex chap*.tex cfg.tex pkg.tex fig/fig-*.tex
	lualatex manuel.tex

clean:
	rm -f *.log *.nav *.aux *.out *.snm *.toc *.ent *.run.xml *.blg *.bcf
